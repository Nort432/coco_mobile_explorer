import 'package:equatable/equatable.dart';

class HomeImageEntity extends Equatable {
  const HomeImageEntity({
    required this.id,
    required this.cocoUrl,
    required this.flickrUrl,
  });

  final int id;
  final String cocoUrl;
  final String flickrUrl;

  @override
  List<Object> get props => [
        id,
        cocoUrl,
        flickrUrl,
      ];
}
