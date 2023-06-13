import 'dart:io';

import 'package:bloc_project/models/product_editable.dart';
import 'package:bloc_project/models/product_editable_cubit.dart';
import 'package:bloc_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProductEdit extends StatelessWidget {
  Product product;

  ProductEdit({super.key, required this.product});

  var items1 = <int>[8, 10, 12];

  onChangeImage(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    context.read<ProductEditableCubit>().setImage(image!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductEditableCubit>(
        create: (_) => ProductEditableCubit(ProductEditable.fromModel(product)),
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Product Edit'),
            ),
            body: BlocBuilder<ProductEditableCubit, ProductEditable>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: state.imageFile != null
                                ? Image.file(File(state.imageFile!.path))
                                : Image.network(state.imageUrl),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                onChangeImage(context);
                              },
                              child: Text('Change Image')),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: product.title,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(
                                            255, 174, 174, 174))),
                                hintText: 'Product title'),
                            onChanged: (value) {
                              context
                                  .read<ProductEditableCubit>()
                                  .setProductTitle(value);
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: TextFormField(
                                  initialValue: product.price.toString(),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: false, decimal: true),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 174, 174, 174))),
                                      hintText: 'Price'),
                                  onFieldSubmitted: (value) {
                                    context
                                        .read<ProductEditableCubit>()
                                        .setPrice(value.isEmpty
                                            ? 0
                                            : num.parse(value));
                                  },
                                ),
                              ),
                              SizedBox(width: 4),
                              SizedBox(
                                width: 90,
                                child: TextFormField(
                                  initialValue: '0',
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: false, decimal: true),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 174, 174, 174))),
                                      hintText: 'Quantity'),
                                  onFieldSubmitted: (value) {
                                    context
                                        .read<ProductEditableCubit>()
                                        .setQuantity(value.isEmpty
                                            ? 0
                                            : num.parse(value));
                                  },
                                ),
                              ),
                              SizedBox(width: 4),
                              SizedBox(
                                width: 115,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: DropdownMenu<num>(
                                    inputDecorationTheme:
                                        const InputDecorationTheme(
                                            border: UnderlineInputBorder()),
                                    dropdownMenuEntries: items1.map((num item) {
                                      return DropdownMenuEntry<num>(
                                        value: item,
                                        label: item.toString(),
                                      );
                                    }).toList(),
                                    label: const Text('Tax %'),
                                    onSelected: (value) {
                                      context
                                          .read<ProductEditableCubit>()
                                          .setTaxPercentage(value ?? 0);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: Text('Total ${state.total}'),
                                ),
                                !state.isIncludedTax
                                    ? Text('Include tax')
                                    : Text('Exclude tax'),
                                SizedBox(
                                  width: 50,
                                  child: Checkbox(
                                    value: state.isIncludedTax,
                                    onChanged: (bool? value) {
                                      context
                                          .read<ProductEditableCubit>()
                                          .setIsIncludedTax(
                                              value == null ? false : value);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: product.description,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(
                                            255, 174, 174, 174))),
                                hintText: 'Description'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ]),
                  ),
                );
              },
            )));
  }
}
