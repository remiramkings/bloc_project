import 'package:bloc_project/models/client_info_cubit.dart';
import 'package:bloc_project/models/client_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modal_dropdown.dart';

class NewEnquiry extends StatelessWidget {
  NewEnquiry({super.key});
  String? selectedUserType;
  String? selectedAssignedUser;
  String? selectedContactType;
  var items = [
    'End User',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var names = ['Abhiram', 'name 1', 'name 2', 'name 3'];

  var contactTypes = ['Home', 'Office', 'Personal'];

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
                    builder: (context, state) {
                      return ModalDropDown(
                        label: 'Region',
                        items: ['Kerala', 'Tamilnadu'],
                        value: state.region,
                        onSelected: (String selectedValue) {
                          context
                              .read<ClientInfoCubit>()
                              .addRegion(selectedValue);
                        },
                      );
                    },
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: BlocBuilder<ClientInfoCubit, ClientInfoModel>(
                    builder: (context, state) {
                      return ModalDropDown(
                        label: 'Branch',
                        items: ['Branch 1', 'Branch 2'],
                        value: '${state.branch}',
                        onSelected: (String selectedValue) {
                          context
                              .read<ClientInfoCubit>()
                              .addBranch(selectedValue);
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
