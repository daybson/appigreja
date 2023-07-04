import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/view/home.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENTRAR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(decoration: InputDecoration(hintText: 'Telefone'), keyboardType: TextInputType.number),
          TextFormField(decoration: InputDecoration(hintText: 'Código SMS'), keyboardType: TextInputType.number),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Confirmar')),
        ],
      ),
    );
  }
}
