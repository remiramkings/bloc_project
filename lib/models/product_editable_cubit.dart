import 'package:bloc_project/models/product_editable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProductEditableCubit extends Cubit<ProductEditable> {
  ProductEditableCubit(ProductEditable productEditable)
      : super(productEditable);

  setImage(XFile image) {
    state.imageFile = image;
    emit(state.copy());
  }

  setProductTitle(String title) {
    state.title = title;
    emit(state.copy());
  }

  setIsIncludedTax(bool val) {
    state.isIncludedTax = val;
    state.total = calculateTotal();
    emit(state.copy());
  }

  setPrice(num price) {
    state.price = price;
    state.total = calculateTotal();
    emit(state.copy());
  }

  setQuantity(num quantity) {
    state.quantity = quantity;
    state.total = calculateTotal();
    emit(state.copy());
  }

  setTaxPercentage(num taxPercentage) {
    state.taxPercentage = taxPercentage;
    state.total = calculateTotal();
    emit(state.copy());
  }

  num calculateTotal() {
    var gross = state.price * state.quantity;
    return gross +
        (state.isIncludedTax ? (gross * state.taxPercentage) / 100 : 0);
  }
}
