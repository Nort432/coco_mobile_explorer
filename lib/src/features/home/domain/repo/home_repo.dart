import 'package:coco_mobile_explorer/src/core/states/data_state.dart';

import '../entities/home_temp_entity.dart';

abstract class HomeRepo {
  Future<DataState<HomeTempEntity>> searchCocoExplorer(String params);
}