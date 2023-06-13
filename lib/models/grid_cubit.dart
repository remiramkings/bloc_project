import 'package:bloc_project/models/grid_tile_data.dart';
import 'package:bloc_project/repos/grid_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridCubit extends Cubit<List<GridTileData>>{
  GridDataRepo gridDataRepo;

  GridCubit({required this.gridDataRepo}):super([]);

  loadGridItems(){
    emit(gridDataRepo.getGridData());
  }
} 