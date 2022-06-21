import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/error/home_error_widget.dart';
import 'package:coco_mobile_explorer/src/features/home/presentation/widgets/loading/my_loading_widget.dart';
import 'package:coco_mobile_explorer/src/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => injector<HomeBloc>()..add(const HomeInitEvent()),
      child: blocBuilder(context),
    );
  }

  Widget blocBuilder(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const MyLoadingWidget();
        }

        if (state is HomeLoaded) {
          return HomeBody(state.homeTemp);
        }

        if (state is HomeError) {
          return HomeErrorWidget(state.errorMessage);
        }

        return const SizedBox();
      },
    );
  }
}
