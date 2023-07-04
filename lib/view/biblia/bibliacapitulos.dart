import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/view/biblia/bibliaversiculos.dart';

class BibliaCapitulos extends StatelessWidget {
  var capitulos = new List<int>.generate(30, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulos'),
      ),
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(
          capitulos.length,
          (index) => TextButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BibliaVersiculos()));
            },
            child: Text(capitulos[index].toString()),
          ),
        ),
      ),
    );
  }
}
