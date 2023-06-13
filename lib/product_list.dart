import 'package:bloc_project/models/product_cubit.dart';
import 'package:bloc_project/models/product_model.dart';
import 'package:bloc_project/product_edit.dart';
import 'package:bloc_project/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: BlocBuilder<ProductCubit, List<Product>>(
                builder: (productCubitContext, productCubitstate) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: productCubitstate.length,
                      itemBuilder: (productListContext, index) {
                        return ProductItem(
                            product: productCubitstate[index],
                            onSelect: (product) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductEdit(
                                          product: product,
                                        )),
                              );
                            });
                      });
                },
              ),
            ),
          ],
        ));
  }
}
