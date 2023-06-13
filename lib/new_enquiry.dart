import 'package:bloc_project/models/branch_cubit.dart';
import 'package:bloc_project/models/branch_model.dart';
import 'package:bloc_project/models/client_info_cubit.dart';
import 'package:bloc_project/models/client_info_model.dart';
import 'package:bloc_project/models/region_cubit.dart';
import 'package:bloc_project/models/region_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modal_dropdown.dart';

class NewEnquiry extends StatelessWidget {
  NewEnquiry({super.key});
  String? selectedUserType;
  String? selectedAssignedUser;
  String? selectedContactType;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text('New Client'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Name'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Primary Number'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Secondary Number'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'WhatsApp Number'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'DOB',
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'PAN'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'GST'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Exp.Closure',
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Follow Up Date',
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: BlocBuilder<ClientInfoCubit, ClientInfoModel>(
                    builder: (_, clientState) {
                      return BlocBuilder<RegionCubit, List<RegionModel>>(
                        builder: (_, regionState) {
                          List<String> regions = regionState.map((e) => e.branchName).toList();
                          return ModalDropDown(
                            label: 'Region',
                            items: regions,
                            value: clientState.region,
                            onSelected: (String selectedValue) {
                              context
                                  .read<ClientInfoCubit>()
                                  .addRegion(selectedValue);
                            },
                          );
                        },
                      );
                    },
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: BlocBuilder<ClientInfoCubit, ClientInfoModel>(
                    builder: (context, clientState) {
                      return BlocBuilder<BranchCubit, List<BranchModel>>(
                        builder: (_, branchState) {
                          List<String> branches =
                              branchState.map((e) => e.branchName).toList();
                          return ModalDropDown(
                            label: 'Branch',
                            items: branches,
                            value: '${clientState.branch}',
                            onSelected: (String selectedValue) {
                              context
                                  .read<ClientInfoCubit>()
                                  .addBranch(selectedValue);
                            },
                          );
                        },
                      );
                    },
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
