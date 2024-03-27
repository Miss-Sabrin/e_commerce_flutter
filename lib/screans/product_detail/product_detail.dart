import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/constants/routes.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/provider/app_provider.dart';
import 'package:shouper/screans/cart_screen.dart/cart_screen.dart';
import 'package:shouper/screans/favrote_screen/favroite_screen.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetail({super.key,required this.singleProduct});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
   AppProvider appProvider=Provider.of<AppProvider>(context);

    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Routes.instance.push(widget: CartScreen(), context: context);
            },
             icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Image.network(widget.singleProduct.image,
          height: 300,
          width: 400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.singleProduct.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),

              IconButton(onPressed: (){
                setState(() {
                  widget.singleProduct.isFavrite=
                  !widget.singleProduct.isFavrite;
                  
                });
                if(widget.singleProduct.isFavrite){
                  appProvider.addFavoriteProduct(widget.singleProduct);
                  
                }else{
                appProvider.removeFavoriteProduct(widget.singleProduct);


                }
              },
               icon: Icon(appProvider.getFavoriteProductList.contains(widget.singleProduct)
                
              ? Icons.favorite
              :Icons.favorite_border,
              color: Colors.red,

              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.singleProduct.description,
            style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              CupertinoButton(
                onPressed: (){
                  if(qty>=1){
                    setState(() {
                        qty--;

                      
                    });
                  }
                },
                padding: EdgeInsets.zero,
                
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  
                  child: Icon(Icons.remove,  color: Colors.white))),
                SizedBox(width: 12,),
              Text(qty.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(width: 10,),
              CupertinoButton(
                onPressed: (){
                  setState(() {
                    qty++;
                  });
                },
                padding: EdgeInsets.zero,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.add,color: Colors.white,)))
            ],
          ),
         // const Spacer(),
         SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: (){
                  //todo this onle dowm aa icreament cardn 
                   ProductModel productModel=
                  widget.singleProduct.copyWith(qty: qty);
                  //todo end increament code
                  appProvider.addCartProduct(productModel);
                  showMessage("added to cart");


                },
               child: const Text("ADD TO CART")),
               SizedBox(width: 24,),
                SizedBox(height: 38,
               width: 140,
               child: ElevatedButton(
                onPressed: (){
                  Routes.instance.push(widget: FavroiteScreen(), context: context);
                },
                 child: Text('BUY')),
               )
            ],
          ),
          SizedBox(height: 14,),


        ],
      ),
    );
  }
}