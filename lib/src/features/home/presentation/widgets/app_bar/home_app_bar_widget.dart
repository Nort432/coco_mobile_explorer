import 'package:coco_mobile_explorer/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      title: Image.network(
        'https://cocodataset.org/images/coco-logo.png',
        width: MediaQuery.of(context).size.width / 2,
      ),
      bottom: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.go,
              onSubmitted: (str) {
                context.read<HomeBloc>().add(HomeSearchEvent(str));
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
