import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/provider/app_provider.dart';

class SingleFavoriteItem extends StatefulWidget {
   final ProductModel singleProduct;

   SingleFavoriteItem({super.key,required this.singleProduct});

  @override
  State<SingleFavoriteItem> createState() => _SingleFavoriteItemState();
}

class _SingleFavoriteItemState extends State<SingleFavoriteItem> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red ,width: 3)
            ),
            child: Row(children: [
              Expanded(
                child: Container(
                  height: 140,
                  child: Image.network(widget.singleProduct.image
                    ),
                
                  color: Colors.red.withOpacity(0.5),
                ),
              ),
               Expanded(
                flex: 2,
                child: Container(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children:[ 
                        
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            Text(widget.singleProduct.name,style: 
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                            
                                ///
                               
                                      CupertinoButton(
                onPressed: (){
                  AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                  appProvider.removeFavoriteProduct(widget.singleProduct);
                  showMessage("remove  wishlist");
                },


               


              
  
                                  padding: EdgeInsets.zero,
                                  child: Text('remove to wishlist',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),),
                                )
                          ],
                        ),
                        Text(' \$${widget.singleProduct.price.toString()}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),)
                      ],),



                      
                     
                      ]
                    ),
                  ),
                
                ),
              )
            ],),
          );



  }
}