import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/provider/app_provider.dart';
import 'package:shouper/screans/cart_screen.dart/sinle_cart.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty=0;
  @override
  Widget build(BuildContext context) {
    
AppProvider appProvider=Provider.of<AppProvider>(
  context
);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("cart screen")),
      ),
      body:appProvider.getCartProductList.isEmpty
      ?Center(child: const Text('empty'))
      
      
      :ListView.builder(
        itemCount: appProvider.getCartProductList.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (ctx,index){
          return SingleCart(singleProduct: appProvider.getCartProductList[index]);

        }) ,
    );
  }
}