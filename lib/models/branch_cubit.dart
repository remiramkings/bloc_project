import 'package:bloc_project/models/branch_model.dart';
import 'package:bloc_project/repos/branch_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchCubit extends Cubit<List<BranchModel>>{
  BranchRepo branchRepo;
  
  BranchCubit({required this.branchRepo}): super([]);

  Future loadBranches() async {
    emit(await branchRepo.loadBranches());
  }

}