import 'package:coco_mobile_explorer/src/features/home/data/repo/home_repo_impl.dart';
import 'package:coco_mobile_explorer/src/features/home/data/sources/remote/home_source.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/repo/home_repo.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/usecases/search_coco_case.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/home/presentation/bloc/home_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies (Sources)
  injector.registerSingleton<HomeSource>(HomeSource(injector()));
  injector.registerSingleton<HomeRepo>(HomeRepoImpl(injector()));

  // UseCases
  injector.registerSingleton<SearchCocoCase>(
      SearchCocoCase(injector()));

  //BLoC
  injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
}
