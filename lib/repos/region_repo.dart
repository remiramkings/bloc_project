import 'dart:convert';

import 'package:bloc_project/models/region_model.dart';
import 'package:http/http.dart';

class RegionRepo{
  Client get client{
    return Client();
  }

  List<dynamic> getList(Response response){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
  bool isSuccess(Response response){
    return (response.statusCode>=200 && response.statusCode<300);
  }
  Future<List<RegionModel>> loadRegions() async {
   
    Uri url = Uri.http('crm.todomor.com', '/api/getBranchLists/6');
    Response response = await client.get(url);

  if(!isSuccess(response)){
    return [];
  }  

  List<dynamic> regionList = getList(response);

  return regionList
    .map((e) => RegionModel.fromMap(e as Map<String, dynamic>))
    .toList();    
  }
}