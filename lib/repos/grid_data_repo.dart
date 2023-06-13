import 'package:bloc_project/models/grid_tile_data.dart';
import 'package:bloc_project/new_enquiry.dart';
import 'package:bloc_project/product_list.dart';
import 'package:flutter/material.dart';

class GridDataRepo{
  List<GridTileData> getGridData(){
    return [
     GridTileData(title: 'New Enquiry', icon: Icons.flash_on, backgroundColor: Colors.deepPurple, navigationPage: NewEnquiry()),
     GridTileData(title: 'Product List', icon: Icons.list, backgroundColor: Colors.purple, navigationPage: ProductList())
    ];
  }
}