import 'package:flutter/material.dart';
import 'package:shouper/firebase_helper/fairebase_fiestore/firebase_fire.dart';
import 'package:shouper/models/catrgoy_model.dart';
import 'package:shouper/models/product_model.dart';
import 'package:shouper/widgets/top_title/top_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading=false;
  List<CategoriestModel> categoryList=[];
    List<ProductModel> producModeltList=[];

  @override
  void initState() {

    // TODO: implement initState
    getCategories();
    super.initState();
  }


  void getCategories()async{
    setState(() {
      isLoading=true;
    });
    categoryList=await FirebaseFireHelper.instance.getCategories();
    producModeltList=await FirebaseFireHelper.instance.getBestProduct();

    setState(() {
      isLoading=false;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading
      ?Center(
        child: 
        Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      )
      
      
      
       :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopTitle(subtitle: "", title: "E Commerce"),
                  TextField(
        
              decoration: InputDecoration(
                
                      hintText: 'search'
                    ),
                  ),
                  SizedBox(height: 12,),
                   Text('catecories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
                ],
              ),
            ),
            categoryList.isEmpty
            ?Center(child: 
            Text('categories is empty'),
            )
            
        
           : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryList
                .map(
                  (e) =>  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(e.image)
                      ),
                    ),
                  ),
                ).toList(),
              
              ),
            ),

            
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Best Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
             ),
             SizedBox(height: 10,),

             //todo type product check if has data
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
                   mainAxisSpacing:20,
                   crossAxisSpacing: 20
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
                      Image.network(
                        singleProduct.image,
                        scale: 10,
                        height: 60,
                        width: 60,
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
                          onPressed: (){}, 
                          
                          child: Text("Bay")),
                      )
               
                      
               
                    ],),
               
                   );
                 },
               ),
             ),
        
        
          
               
          
           
          ],
        ),
      ),
    );
  }
}



// List<String> catecories=[
// "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHkN7Vmt6npOPVvfPoCtSkpjYe_Rz1vM5UR1nbI6Cn5mXxXy8J-GbP-_g5Ff9qv-njWzM&usqp=CAU",

// 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS5cwfZnYgV5LXKoMI3J8YDnN8QL4icDzXJhiozLIU1rpmuExAy9YlVzcrYbRkddjDWiw&usqp=CAU',

// 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv-EObvEnnMWpEl0VTgL2br4SAvXW2qSp4_dk0yS5eu-6hOR4Okw7yrZV-oJnTFTPvM9s&usqp=CAU',
//  "https://image.similarpng.com/very-thumbnail/2020/08/Delicious-fast-food-design-vector-PNG.png", 





// ];


// List<ProductModel> bestProduct=[
//   ProductModel(
//     id: "1",
//     name: "tomato",
//     description: "tomato is the best fruit",
//     isFavrite: false,
//     price: "12", 
//     status: "pending",
//     images: "https://i.pinimg.com/564x/93/8b/75/938b755d4ef0576ba354c094c4bf4c97.jpg",
//   ),


//      ProductModel(
//     id: "2",
//     name: "panano",
//     description: "panan is the best fruit ",
//     isFavrite: false,
//     price: "2", 
//     status: "pending",
// images: "https://freesvg.org/img/Bananas-icon-1.png"),
//      ProductModel(
//     id: "3",
//     name: "apple",
//     description: "apple is the best fruit",
//     isFavrite: false,
//     price: "12", 
//     status: "pending",
// images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaJQkz_B9WhjoQUT0UojGNlvyPdX7jwGymOQ&usqp=CAU",


//      ),
//      ProductModel(
//     id: "1",
//     name: "mango",
//     description: "mango is the best fruit",
//     isFavrite: false,
//     price: "12", 
//     status: "pending",
// images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD-Ii9ub9fCV29IH55evP-W-lv478Db3Og07cz8CPa4FhZv-_O_ABQanW7PQ1k5vaAGu4&usqp=CAU",





//      ),





// ];