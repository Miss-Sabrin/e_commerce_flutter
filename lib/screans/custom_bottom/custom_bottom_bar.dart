
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shouper/screans/accounts_screen/account_screen.dart';
import 'package:shouper/screans/cart_screen.dart/cart_screen.dart';
import 'package:shouper/screans/favrote_screen/favroite_screen.dart';
import 'package:shouper/screans/home/home.dart';

class CusttomBottomBar extends StatefulWidget {
  const CusttomBottomBar({final Key? key})
      : super(key: key);

  @override
  _CusttomBottomBarState createState() => _CusttomBottomBarState();
}

class _CusttomBottomBarState extends State<CusttomBottomBar> {
  PersistentTabController _controller=PersistentTabController();
  bool _hideNavBar=false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
     Home(),
     CartScreen(),
     FavroiteScreen(),
     AccountScreen(),


       
        
       
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            inactiveIcon: Icon(Icons.home_outlined),
            title: "Home",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.grey,
            ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
         inactiveIcon: Icon(Icons.shopping_cart_outlined),

          title: "cart",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
         
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
            inactiveIcon: Icon(Icons.favorite_border),

          title: "favorite",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
         
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
            inactiveIcon: Icon(Icons.person_2_outlined),

          title: "profile",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          
        ),
        
      
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
       
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
        
       
          backgroundColor: Theme.of(context).primaryColor,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
          .style1
               // Choose the nav bar style with this property
        ),
      );
}