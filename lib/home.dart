import 'package:bloc_project/grid_card.dart';
import 'package:bloc_project/models/grid_cubit.dart';
import 'package:bloc_project/models/grid_tile_data.dart';
import 'package:bloc_project/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_enquiry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: BlocBuilder<GridCubit, List<GridTileData>>(
          builder: (gridBlocContext, gridState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 0.7),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: gridState.length,
              itemBuilder: (gridContext, index) {
                return GridCard(gridTileData: gridState[index]);
              },
            );
          },
        ));
  }
}
