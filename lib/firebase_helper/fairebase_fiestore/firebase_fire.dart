import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/models/catrgoy_model.dart';
import 'package:shouper/models/product_model.dart';

class FirebaseFireHelper{
  static FirebaseFireHelper instance= FirebaseFireHelper();


   final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

   Future<List<CategoriestModel>> getCategories() async{
    try{
      QuerySnapshot<Map<String, dynamic  >>querySnapshot= await
      _firebaseFirestore.collection('categories').get();
    List<CategoriestModel> categoryList=  querySnapshot.docs
    .map((e) => CategoriestModel.fromJson(e.data()))
    .toList();

    return categoryList;
      


    }catch(e){
      showMessage(e.toString());
        return [];
    }
   }


   // todo type product

    Future<List<ProductModel>> getBestProduct() async{
    try{
      QuerySnapshot<Map<String, dynamic  >>querySnapshot= await
      _firebaseFirestore.collectionGroup('products').get();

      // //todo for check code

      // for( var element in  querySnapshot.docs){
      //   print(element.data());
      // }

    List<ProductModel> producModeltList=  querySnapshot.docs
    .map((e) => ProductModel.fromJson(e.data()))
    .toList();

    return producModeltList;
    ///todo for check  code foreach
    //return[];
      


    }catch(e){
      showMessage(e.toString());
        return [];
    }
   }




}