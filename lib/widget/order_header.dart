import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/blocs/user_bloc.dart';

class OrderHeader extends StatelessWidget {

  final DocumentSnapshot order;

  OrderHeader(this.order);

  @override
  Widget build(BuildContext context) {

    final _userBloc = Modular.get<UserBloc>();

    final _user = _userBloc.getUser(order.data["clientId"]);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${_user["name"]}"),
              Text("${_user["address"]}")
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Produtos: R\$${order.data["productsPrice"].toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500),),
            Text("Total: R\$${order.data["totalPrice"].toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        )
      ],
    );
  }
}
