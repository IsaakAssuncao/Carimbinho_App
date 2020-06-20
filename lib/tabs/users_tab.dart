import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/blocs/user_bloc.dart';
import 'package:flutterappstamp/widget/user_tile.dart';

class UsersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _userBloc = Modular.get<UserBloc>();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Pesquisar",
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none
            ),
            onChanged: _userBloc.onChangedSearch,
          ),
        ),
        Expanded(
          child: StreamBuilder<List>(
            stream: _userBloc.outUsers,
            builder: (context, snapshot) {
              if(!snapshot.hasData)
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                );
              else if(snapshot.data.length == 0)
                return Center(
                  child: Text("Nenhum usuário encontrado!", style: TextStyle(
                    color: Colors.pinkAccent
                  ),),
                );
              else
                return ListView.separated(
                    itemBuilder: (context, index){
                      return UserTile(snapshot.data[index]);
                    },
                    separatorBuilder: (context, index){
                      return Divider();
                    },
                    itemCount: snapshot.data.length
                );
            }
          ),
        )
      ],
    );
  }
}