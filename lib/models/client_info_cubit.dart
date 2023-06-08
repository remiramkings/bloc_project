import 'package:bloc_project/models/client_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientInfoCubit extends Cubit<ClientInfoModel>{
  ClientInfoCubit() : super(ClientInfoModel(region: '', branch: ''));
  addRegion(String value){
    state.region = value;
    emit(state.copy());
  }
  
  addBranch(String value){
    state.branch = value;
    emit(state.copy());
  }
}

