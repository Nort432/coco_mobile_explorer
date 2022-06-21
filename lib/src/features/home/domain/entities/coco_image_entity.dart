import 'package:equatable/equatable.dart';

import 'home_segmentation_entity.dart';

class CocoImageEntity extends Equatable {
  const CocoImageEntity({
    required this.id,
    required this.cocoUrl,
    required this.flickrUrl,
    required this.captions,
    required this.segmentations,
  });

  final int id;
  final String cocoUrl;
  final String flickrUrl;
  final List<String> captions;
  final List<HomeSegmentationEntity> segmentations;

  @override
  List<Object?> get props => [id, cocoUrl, flickrUrl, captions, segmentations];
}


