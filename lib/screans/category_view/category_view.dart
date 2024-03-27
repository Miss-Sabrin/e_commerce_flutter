import 'package:flutter/material.dart';
import 'package:shouper/constants/routes.dart';
import 'package:shouper/firebase_helper/fairebase_fiestore/firebase_fire.dart';
import 'package:shouper/models/catrgoy_model.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/screans/product_detail/product_detail.dart';

class CategoriesView extends StatefulWidget {
  CategoriestModel categoriestModel;
   CategoriesView({super.key,required this.categoriestModel});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
    bool isLoading=false;
    List<ProductModel> producModeltList=[];
  
  void getCategories()async{
    setState(() {
      isLoading=true;
    });
    producModeltList=await FirebaseFireHelper.instance.getCategoryViewProduct(widget.categoriestModel.id);
    producModeltList.shuffle();

    setState(() {
      isLoading=false;
    });
    
    
  }

  @override
  void initState() {
    getCategories();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
      ?Center(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      )
      :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kTextTabBarHeight+1,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  BackButton(),
                  Text(widget.categoriestModel.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  
                  )
                 
              
                ],
              ),
            ),
          
            
        
             producModeltList.isEmpty
              ?Center(child: 
              Text('product  model is empty'),
              )
              
               :Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GridView.builder(
                  primary: false,
                  padding: EdgeInsets.zero,
                 shrinkWrap: true,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing:18,
                     crossAxisSpacing: 20,
                     childAspectRatio: 0.7,
                     
                   ),
                   itemCount: producModeltList.length,
                   itemBuilder: (BuildContext context, int index) {
                    ProductModel singleProduct=producModeltList[index];
                     return Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      // color: Colors.red.shade100,
                      child: Column(children: [
                        SizedBox(height: 12,),
                        Image.network(
                          singleProduct.image,
                          height: 100,
                          width: 100,
                          ),
                        const SizedBox(height: 12,),
                        Text(singleProduct.name,
                        style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text("price \$${singleProduct.price}"),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 45,
                          width: 100,
                          child: OutlinedButton(
                            onPressed: (){
                              Routes.instance.push(widget: ProductDetail(singleProduct: singleProduct), context: context);
        
        
                            }, 
                            
                            child: Text("Bay")),
                        )
                 
                        
                 
                      ],),
                 
                     );
                   },
                 ),
               ),
        
        
          ],
        ),
      )
      
    );
  }
}