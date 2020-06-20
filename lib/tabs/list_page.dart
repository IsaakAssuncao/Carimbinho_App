import 'package:flutter/material.dart';
import 'package:flutterappstamp/consts/color_const.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<ItemPlace> items = List<ItemPlace>.generate(
    _listViewData.length,
    (i) => ItemPlace(body: _listViewData[i], sender: _listViewData[i]),
  );

  static final List<String> _listViewData = [
    "Restaurante Confiance",
    "Restaurante Barió",
    "Lanchonete Legal",
    "Sushi Vibe",
    "Grill Burger",
    "Churrascaria Ataliba"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _listViewData.length,
          padding: EdgeInsets.only(top: 10.0),
          itemBuilder: (context, index) {
            final item = items[index];
            return _createCard(
                sender: item.sender, body: item.body, index: index);
          },
        ),
      ),
    );
  }

  Widget _createCard({String sender, String body, int index}) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(sender, style: TextStyle(fontSize: 20.0),),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ((index % 2) == 0)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red[900],
                      )
                    : Icon(
                        Icons.favorite_border,
                      ),
              ],
            ),
//            subtitle: ((index % 2) == 0)
//                ? Icon(
//                    Icons.favorite,
//                    color: Colors.red[900],
//                  )
//                : Icon(
//                    Icons.favorite_border,
//                  ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star),
              Icon(Icons.star),
              ((index % 2) == 0) ? Icon(Icons.star) : Icon(Icons.star_border),
              ((index % 2) == 0) ? Icon(Icons.star) : Icon(Icons.star_border),
              Icon(Icons.star_border),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemPlace {
  final String sender;
  final String body;

  ItemPlace({this.sender, this.body});
}
