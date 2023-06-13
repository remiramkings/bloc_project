import 'package:bloc_project/models/product_model.dart';
import 'package:bloc_project/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<List<Product>>{
  ProductRepo productRepo;
  ProductCubit({required this.productRepo}):super([]);

  Future loadProducts() async {
    emit(await productRepo.loadProducts());
  }
  
}