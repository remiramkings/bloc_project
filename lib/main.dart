import 'package:bloc_project/home.dart';
import 'package:bloc_project/models/branch_cubit.dart';
import 'package:bloc_project/models/client_info_cubit.dart';
import 'package:bloc_project/models/region_cubit.dart';
import 'package:bloc_project/repos/branch_repo.dart';
import 'package:bloc_project/repos/region_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
        providers: [
          BlocProvider<ClientInfoCubit>(
            create: (_) => ClientInfoCubit()
          ),
          BlocProvider<BranchCubit>(
            create: (_) => BranchCubit(branchRepo: BranchRepo())
              ..loadBranches()
          ),
          BlocProvider<RegionCubit>(
            create: (_) => RegionCubit(regionRepo: RegionRepo())
              ..loadRegions()
          )
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
