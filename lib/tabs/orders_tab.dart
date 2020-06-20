import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/blocs/orders_bloc.dart';
import 'package:flutterappstamp/widget/order_tile.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _ordersBloc = Modular.get<OrdersBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: StreamBuilder<List>(
        stream: _ordersBloc.outOrders,
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
              ),
            );
          else if(snapshot.data.length == 0)
            return Center(
              child: Text("Nenhum pedido encontrado!",
                style: TextStyle(color: Colors.pinkAccent),),
            );

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return OrderTile(snapshot.data[index]);
            }
          );
        }
      ),
    );
  }
}
