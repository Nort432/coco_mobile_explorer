import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/app_bar/home_app_bar_widget.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/body/home_body_widget.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(
    this.homeTemp, {
    Key? key,
  }) : super(key: key);

  final HomeTempEntity homeTemp;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding =
        EdgeInsets.symmetric(horizontal: 10, vertical: 15);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBarWidget(),
          HomeBodyWidget(homeTemp),
        ],
      ),
    );
  }
}
