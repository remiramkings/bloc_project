import 'package:bloc_project/home.dart';
import 'package:bloc_project/models/branch_cubit.dart';
import 'package:bloc_project/models/client_info_cubit.dart';
import 'package:bloc_project/models/grid_cubit.dart';
import 'package:bloc_project/models/product_cubit.dart';
import 'package:bloc_project/models/product_editable_cubit.dart';
import 'package:bloc_project/models/region_cubit.dart';
import 'package:bloc_project/repos/branch_repo.dart';
import 'package:bloc_project/repos/grid_data_repo.dart';
import 'package:bloc_project/repos/product_repo.dart';
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
          ),
          BlocProvider<GridCubit>(
            create:(_) => GridCubit(gridDataRepo: GridDataRepo())
            ..loadGridItems()
             ),
          BlocProvider<ProductCubit>(
            create: (_) => ProductCubit(productRepo: ProductRepo())
            ..loadProducts()
          ),
          
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
