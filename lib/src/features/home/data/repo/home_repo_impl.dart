import 'dart:io';

import 'package:coco_mobile_explorer/src/config/app_consts/app_data.dart';
import 'package:coco_mobile_explorer/src/core/states/data_state.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_ids_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_image_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_segmentation_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/params/home_category_params.dart';
import 'package:coco_mobile_explorer/src/features/home/data/params/home_image_params.dart';
import 'package:coco_mobile_explorer/src/features/home/data/sources/remote/home_source.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/repo/home_repo.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl(this.homeSource);

  final HomeSource homeSource;

  @override
  Future<DataState<HomeTempEntity>> searchCocoExplorer(String params) async {
    try {
      late final HttpResponse<List<HomeImageModel>> httpImages;
      late final HomeIdsModel idsEntity;

      //#region Ids
      final int id = AppData.fetchCategoryId(params);
      if (id == 0) {
        return const DataNull();
      }

      final HttpResponse<HomeIdsModel> httpIds =
          await homeSource.searchCocoExplorerIds(
        HomeCategoryParams(
          categoryIds: [id],
          queryType: 'getImagesByCats',
        ),
      );
      if (httpIds.response.statusCode != HttpStatus.ok) {
        throw DioError(
          error: httpIds.response.statusMessage,
          response: httpIds.response,
          requestOptions: httpIds.response.requestOptions,
          type: DioErrorType.response,
        );
      }
      idsEntity = httpIds.data;
      //#endregion

      //#region Images
      httpImages = await homeSource.searchCocoExplorerImages(
        HomeImageParams(
          imageIds: idsEntity.ids,
          queryType: 'getImages',
        ),
      );
      if (httpImages.response.statusCode != HttpStatus.ok) {
        throw DioError(
          error: httpImages.response.statusMessage,
          response: httpImages.response,
          requestOptions: httpImages.response.requestOptions,
          type: DioErrorType.response,
        );
      }
      List<HomeImageModel> images = httpImages.data;
      //#endregion

      //#region Segmentation
      final HttpResponse<List<HomeSegmentationModel>> httpSegmentation =
          await homeSource.searchCocoExplorerSegmentation(
        HomeImageParams(
          imageIds: idsEntity.ids,
          queryType: 'getInstances',
        ),
      );
      if (httpSegmentation.response.statusCode != HttpStatus.ok) {
        throw DioError(
          error: httpSegmentation.response.statusMessage,
          response: httpSegmentation.response,
          requestOptions: httpSegmentation.response.requestOptions,
          type: DioErrorType.response,
        );
      }
      List<HomeSegmentationModel> segmentations = httpSegmentation.data;
      //#endregion

      final List<HomeResultImageEntity> resultImages = [];
      for (int id in idsEntity.ids) {
        resultImages.add(
          HomeResultImageEntity(
            id: id,
            url: images.firstWhere((e) => e.id == id).cocoUrl,
            points: segmentations.where((e) => e.imageId == id).toList(),
          ),
        );
      }

      final HomeTempEntity result = HomeTempEntity(images: resultImages);

      return DataSuccess(result);
    } catch (e) {
      String errorMessage = DataFailed.doMessageError(e, StackTrace.current);
      return DataFailed(errorMessage);
    }
  }
}
