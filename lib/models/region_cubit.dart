import 'package:bloc_project/models/region_model.dart';
import 'package:bloc_project/repos/region_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionCubit extends Cubit<List<RegionModel>>{
  RegionRepo regionRepo;
  
  RegionCubit({required this.regionRepo}): super([]);

  Future loadRegions() async {
    emit(await regionRepo.loadRegions());
  }

}