class ClientInfoModel{
  
  String region;
  String branch;
  ClientInfoModel({
  
    required this.region,
    required this.branch
  });

  ClientInfoModel copy(){
    return ClientInfoModel(region: region, branch: branch);
  }
}