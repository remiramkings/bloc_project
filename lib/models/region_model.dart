class RegionModel {
  String branchMasterId;
  String branchName;
  String? location;
  int? regionId;
  int? currencyId;
  int? statusId;
  DateTime? createdDate;
  DateTime? lastUpdatedDate;
  int? companyId;

  RegionModel(
      {required this.branchMasterId,
      required this.branchName,
      this.location,
      this.regionId,
      this.currencyId,
      this.statusId,
      this.createdDate,
      this.lastUpdatedDate,
      this.companyId});

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    return RegionModel(
        branchMasterId: map['branch_master_id'],
        branchName: map['branch_name']);
  }
}
