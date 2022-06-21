import 'package:coco_mobile_explorer/src/config/mixins/image_properties_mixin.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/coco_image_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_segmentation_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/error/home_error_widget.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/loading/my_loading_widget.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/segmentation/home_segmentation.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget with ImagePropertiesMixin {
  const HomeBodyWidget(this.homeTemp, {Key? key}) : super(key: key);

  final HomeTempEntity homeTemp;

  // final List<CocoImageEntity> _loadedImages;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        homeTemp.images == null
            ? []
            : [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${homeTemp.images!.length} results',
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: List.generate(
                    100,
                    (index) {
                      final int id = homeTemp.images![index].id;
                      final String url = homeTemp.images![index].url;
                      final List<HomeSegmentationEntity> points = homeTemp.images![index].points;

                      return FutureBuilder<SizedImage>(
                        future: getImageOriginalSize(url),
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: snapshot.data == null ||
                                          !snapshot.hasData
                                          ? const MyLoadingWidget()
                                          : CustomPaint(
                                        foregroundPainter: SegmentationsPainter(
                                          segmentations: points,
                                          originalSize:
                                          snapshot.data?.originalSize,
                                        ),
                                        child:
                                        Image(image: snapshot.data!.image),
                                      ),
                                    ),
                                    if (snapshot.data == null || !snapshot.hasData)
                                      const SizedBox(),
                                      // const MyLoadingWidget(),
                                    if (snapshot.hasError)
                                      const HomeErrorWidget('errorMessage'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
      ),
    );
  }
}
