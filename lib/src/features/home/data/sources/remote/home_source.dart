import 'package:coco_mobile_explorer/src/config/app_apis/app_api.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_ids_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_image_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/models/home_segmentation_model.dart';
import 'package:coco_mobile_explorer/src/features/home/data/params/home_category_params.dart';
import 'package:coco_mobile_explorer/src/features/home/data/params/home_image_params.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'home_source.g.dart';

@RestApi(baseUrl: AppApi.urlBase)
abstract class HomeSource {
  factory HomeSource(Dio dio, {String baseUrl}) = _HomeSource;

  // @POST(AppApi.urlCoco)
  // // @Headers()
  // Future<HttpResponse<CocoSearchResultModel>> searchCocoExplorer(
  //     @Body() HomeParams homeParams,
  //     );

  @POST(AppApi.urlCoco)
  Future<HttpResponse<HomeIdsModel>> searchCocoExplorerIds(
      @Body() HomeCategoryParams homeParams,
      );

  @POST(AppApi.urlCoco)
  Future<HttpResponse<List<HomeImageModel>>> searchCocoExplorerImages(
      @Body() HomeImageParams homeParams,
      );

  @POST(AppApi.urlCoco)
  Future<HttpResponse<List<HomeSegmentationModel>>> searchCocoExplorerSegmentation(
      @Body() HomeImageParams homeParams,
      );
}


// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'home_source.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps
//
// class _HomeSource implements HomeSource {
//   _HomeSource(this._dio, {this.baseUrl}) {
//     baseUrl ??= 'https://us-central1-open-images-dataset.cloudfunctions.net';
//   }
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<HttpResponse<HomeIdsModel>> searchCocoExplorerIds(homeParams) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(homeParams.toJson());
//     final _result = await _dio.fetch(
//         _setStreamType<HttpResponse<HomeIdsModel>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, '/coco-dataset-bigquery',
//                 queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = HomeIdsModel.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }
//
//   @override
//   Future<HttpResponse<List<HomeImageModel>>> searchCocoExplorerImages(
//       homeParams) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(homeParams.toJson());
//     final _result = await _dio.fetch<List<dynamic>>(
//         _setStreamType<HttpResponse<List<HomeImageModel>>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, '/coco-dataset-bigquery',
//                 queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     var value = HomeImageModel.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }
//
//   @override
//   Future<HttpResponse<List<HomeSegmentationModel>>>
//   searchCocoExplorerSegmentation(homeParams) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(homeParams.toJson());
//     final _result = await _dio.fetch<List<dynamic>>(
//         _setStreamType<HttpResponse<List<HomeSegmentationModel>>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, '/coco-dataset-bigquery',
//                 queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     var value1 = _result.data!.map((e) => HomeSegmentationModel.fromJson(e)).toList();
//     final httpResponse = HttpResponse(value1, _result);
//     return httpResponse;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
//
