import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/provider/app_provider.dart';
import 'package:shouper/screans/favrote_screen/single_favarite.dart';

class FavroiteScreen extends StatelessWidget {
  const FavroiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
      
AppProvider appProvider=Provider.of<AppProvider>(
  context
);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favroite screen")),
      ),
      body:appProvider.getCartProductList.isEmpty
      ?Center(child: const Text('empty'))
      
      
      :ListView.builder(
        itemCount: appProvider.getFavoriteProductList.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (ctx,index){
          return SingleFavoriteItem(singleProduct: appProvider.getFavoriteProductList[index]);


        }) ,
    );



 
  }
}