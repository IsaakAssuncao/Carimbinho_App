import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutterappstamp/blocs/orders_bloc.dart';
import 'package:flutterappstamp/blocs/user_bloc.dart';
import 'package:flutterappstamp/consts/color_const.dart';
import 'package:flutterappstamp/tabs/list_page.dart';
import 'package:flutterappstamp/tabs/list_page_favoritos.dart';
import 'package:flutterappstamp/tabs/orders_tab.dart';
import 'package:flutterappstamp/tabs/products_tab.dart';
import 'package:flutterappstamp/tabs/profile_page.dart';
import 'package:flutterappstamp/tabs/users_tab.dart';
import 'package:flutterappstamp/widget/edit_category_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _page = 0;

  UserBloc _userBloc;
  OrdersBloc _ordersBloc;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _userBloc = UserBloc();
    _ordersBloc = OrdersBloc();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: red_color_pages,
            primaryColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white54))),
        child: BottomNavigationBar(
            currentIndex: _page,
            onTap: (p) {
              _pageController.animateToPage(p,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), title: Text("Restaurantes")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text("Favoritos")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Usuário")),
            ]),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          //children: <Widget>[UsersTab(), OrdersTab(), ProductsTab()],
          children: <Widget>[ListPage(), FavoritoPages(), ProfilePage()],
        ),
      ),
      //floatingActionButton: _buildFloating(),
    );
  }

  Widget _buildFloating() {
    switch (_page) {
      case 0:
        return null;
      case 1: return null;
//        return SpeedDial(
//          child: Icon(Icons.sort),
//          backgroundColor: Colors.pinkAccent,
//          overlayOpacity: 0.4,
//          overlayColor: Colors.black,
//          children: [
//            SpeedDialChild(
//                child: Icon(
//                  Icons.arrow_downward,
//                  color: Colors.pinkAccent,
//                ),
//                backgroundColor: Colors.white,
//                label: "Concluídos Abaixo",
//                labelStyle: TextStyle(fontSize: 14),
//                onTap: () {
//                  _ordersBloc.setOrderCriteria(SortCriteria.READY_LAST);
//                }),
//            SpeedDialChild(
//                child: Icon(
//                  Icons.arrow_upward,
//                  color: Colors.pinkAccent,
//                ),
//                backgroundColor: Colors.white,
//                label: "Concluídos Acima",
//                labelStyle: TextStyle(fontSize: 14),
//                onTap: () {
//                  _ordersBloc.setOrderCriteria(SortCriteria.READY_FIRST);
//                })
//          ],
//        );
      case 2:
        return FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            showDialog(
                context: context, builder: (context) => EditCategoryDialog());
          },
        );
    }
  }
}
