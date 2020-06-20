import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterappstamp/tabs/qr_code_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _hasChanged = false;

  final fotoController = TextEditingController();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final foneController = TextEditingController();
  final membroDesdeController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    fotoController.dispose();
    nomeController.dispose();
    emailController.dispose();
    foneController.dispose();
    membroDesdeController.dispose();

    super.dispose();
  }

  StorageReference storage;
  String photo;
  final _avatar =
      "https://cdn2.iconfinder.com/data/icons/solid-glyphs-volume-2/256/user-unisex-512.png";

  @override
  Widget build(BuildContext context) {

    if (!_hasChanged) {
      fotoController.text = "";
      nomeController.text = "Isaak";
      emailController.text = "isaak@gmail.com";
      foneController.text = "48 9 9912-3456";
      membroDesdeController.text = "Janeiro 2020";
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(_avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Nome: ${nomeController.value.text}',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Membro desde: ${membroDesdeController.value.text}',
                style: TextStyle(color: Colors.red[900] ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${emailController.value.text}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.red[900]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                foneController.value.text,
                style: TextStyle(fontSize: 15.0, color: Colors.red[900]),
              ),
              const SizedBox(
                height: 30.0,
              ),
              QrCodePage(data: '${emailController.value.text  }'),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                child: Text('editar', style: TextStyle(color: Colors.red[900]),),
                onTap: () {
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}
