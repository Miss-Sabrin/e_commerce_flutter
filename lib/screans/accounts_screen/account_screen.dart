import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shouper/provider/app_provider.dart';
import 'package:shouper/widgets/primaray_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(
  context
);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('account')),
      ),
      body: Column(
        children: [
          Expanded(
            child: 
          
              Column(
                children: [
                  Center(
                    child: 
                      // appProvider.getUserInfromation.image==null

                    const Icon(
                      Icons.person,

                    size: 120,
                    )
                    //  :Image.network(appProvider.getUserInfromation.image!)


                  ),
                  
                  Text(appProvider.getUserInfromation.name,
                  style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold),),
                   Text(appProvider.getUserInfromation.email,
                ),
                SizedBox(height: 12,),
                SizedBox(
                  width: 150,
                  child: PrimarayButton(
                    
                    title: 'Edit profile',
                    onPressed: (){},
                    ),
                    
                    )

                ],
              ),
            
          ),  

          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                     onTap: (){},

                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text('your owders'),
                ),
                ListTile(
                   onTap: (){},

                  leading: Icon(Icons.favorite),
                  title: Text('Favoraites'),
                ),
                ListTile(
                   onTap: (){},

                  leading: Icon(Icons.info_outline),
                  title: Text('about us'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.support_outlined),
                  title: Text('support'),
                ),
                ListTile(
                  onTap: (){
                    FirebaseAuthHelper.instance.signOut();
                    setState(() {
                      
                    });
                      
                  },
                  leading: Icon(Icons.logout),
                  title: Text('logout'),
                ),
                
                SizedBox(height: 12,),
                ListTile(
                  title: Center(child: Text('version 1.0.0')),
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}