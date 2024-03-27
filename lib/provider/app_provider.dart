import 'package:flutter/material.dart';
import 'package:shouper/firebase_helper/fairebase_fiestore/firebase_fire.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/models/user_models.dart';

class AppProvider with ChangeNotifier{
  //todo cart Provider
  final List<ProductModel> _cartProductList=[];
  //todo usermodel
  UserModel? _userModel;
  UserModel get getUserInfromation => _userModel!;

  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }


  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel>get getCartProductList=>_cartProductList;

  //todo favorite provider

   final List<ProductModel> _favroiteProductList=[];

  void addFavoriteProduct(ProductModel productModel){
    _favroiteProductList.add(productModel);
    notifyListeners();
  }


  void removeFavoriteProduct(ProductModel productModel){
    _favroiteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel>get getFavoriteProductList=>_favroiteProductList;



//usermodel

void getUserInfoFirebase()async{
      _userModel=await FirebaseFireHelper.instance.getUserInfromation();
      notifyListeners();
}
}