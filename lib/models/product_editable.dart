import 'package:bloc_project/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductEditable{
  int id;
  String title;
  String description;
  num price;
  XFile? imageFile;
  String imageUrl;
  num total;
  bool isIncludedTax;
  num quantity;
  num taxPercentage;


  ProductEditable({required this.id,
  required this.title,
  required this.description,
  required this.price,
  this.imageFile,
  required this.imageUrl,
  required this.total,
  required this.isIncludedTax,
  this.quantity=0,
  this.taxPercentage=0
  });

  factory ProductEditable.fromDefault(){
    return ProductEditable(id: 0, title: '', description: '', price: 0, imageUrl: '', total: 0, isIncludedTax: false);
  }

  factory ProductEditable.fromModel(Product  product){
    return ProductEditable(id: product.id, title: product.title, description: product.description, price: product.price, imageUrl: product.images.first, total: 0, isIncludedTax: false);
  }

  ProductEditable copy(){
    return ProductEditable(
      id: id, 
      title: title, 
      description: description, 
      price: price, 
      imageUrl: imageUrl, 
      imageFile: imageFile, 
      total: total, 
      isIncludedTax: isIncludedTax,
      quantity: quantity,
      taxPercentage: taxPercentage);
  }

}