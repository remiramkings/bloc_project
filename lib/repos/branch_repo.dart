import 'dart:convert';

import 'package:bloc_project/models/branch_model.dart';
import 'package:http/http.dart';

class BranchRepo{
  Client get client{
    return Client();
  }

  List<dynamic> getList(Response response){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
  bool isSuccess(Response response){
    return (response.statusCode>=200 && response.statusCode<300);
  }
  Future<List<BranchModel>> loadBranches() async {
    Uri url = Uri.http('crm.todomor.com', '/api/getBranchLists/6');
    Response response = await client.get(url);

  if(!isSuccess(response)){
    return [];
  }  

  List<dynamic> branchList = getList(response);

  return branchList
    .map((e) => BranchModel.fromMap(e as Map<String, dynamic>))
    .toList();    
  }
}