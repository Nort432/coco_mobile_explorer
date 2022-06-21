import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coco_mobile_explorer/src/core/states/data_state.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/usecases/search_coco_case.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.searchCocoCase) : super(const HomeLoading()) {
    on<HomeInitEvent>(_initial);
    on<HomeSearchEvent>(_search);
  }

  SearchCocoCase searchCocoCase;

  FutureOr<void> _initial(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit( const HomeLoaded(HomeTempEntity()));
  }

  FutureOr<void> _search(
    HomeSearchEvent event,
    Emitter<HomeState> emit,
  ) async {

    emit(const HomeLoading());
    final DataState<HomeTempEntity> dsSearch = await searchCocoCase(event.search);

    if (dsSearch is DataSuccess) {
      final HomeTempEntity homeData = dsSearch.data!;
      return emit(HomeLoaded(homeData));
    }
    if (dsSearch is DataNull) {
      return emit(const HomeLoaded(HomeTempEntity()));
    }
    if (dsSearch is DataFailed) {
      return emit(HomeError(dsSearch.messageError!));
    }
  }
}
