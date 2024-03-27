import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/provider/app_provider.dart';

class SingleCart extends StatefulWidget {
   final ProductModel singleProduct;

   SingleCart({super.key,required this.singleProduct});

  @override
  State<SingleCart> createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {
  int qty=0;
  @override
  void initState() {

    // TODO: implement initState
    qty=widget.singleProduct.qty??0;
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
       AppProvider appProvider=Provider.of<AppProvider>(context);

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
                      children:[  Row(
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
                            //todo type increamnet
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
                                        maxRadius: 13,
                                        backgroundColor: Colors.red,
                                        
                                        child: Icon(Icons.remove,  color: Colors.white))),
                                      SizedBox(width: 12,),
                                    Text(qty.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                   // const SizedBox(width: 6,),
                                    CupertinoButton(
                                      onPressed: (){
                                        setState(() {
                      qty++;
                                        });
                                      },
                                      padding: EdgeInsets.zero,
                                      child: CircleAvatar(
                                        maxRadius: 13,
                      
                                        backgroundColor: Colors.red,
                                        child: Icon(Icons.add,color: Colors.white,)))
                                  ],
                                ),
                                CupertinoButton(
                                padding: EdgeInsets.zero,
                                //todo logic

                                  onPressed: (){
                                    if(!appProvider.getFavoriteProductList.contains(
                                      widget.singleProduct
                                    )){
                                      appProvider.addFavoriteProduct(widget.singleProduct);
                                    }else{
                                      appProvider.removeFavoriteProduct(
                                        widget.singleProduct
                                      );
                                    }

                                  },
                                  
                                  child: Text(
                                    appProvider.getFavoriteProductList.contains(widget.singleProduct)
                                     ?"Remove to wishlist"
                                    :'Add to wishlist',
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
                       CupertinoButton(
                onPressed: (){
                  AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                  appProvider.removeCartProduct(widget.singleProduct);
                  showMessage("remove from cart");
                },
                padding: EdgeInsets.zero,
                child: CircleAvatar(child: 
                Icon(Icons.delete,color: Colors.red,),)
              ),
                      ]
                    ),
                  ),
                
                ),
              )
            ],),
          );



  }
}