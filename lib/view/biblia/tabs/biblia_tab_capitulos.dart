import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/livro.dart';
import 'package:gtapp/view/biblia/bibliaversiculos.dart';
import 'package:gtapp/view/biblia/tabs/bibliatabs.dart';

class TabCapitulos extends StatefulWidget {
  @override
  State<TabCapitulos> createState() => _TabCapitulosState();
}

class _TabCapitulosState extends State<TabCapitulos> {
  List<int> capitulos = [];

  _TabCapitulosState() {
    countCapitulos();
  }

  countCapitulos() async {
    var db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(
        "SELECT MAX(DISTINCT chapter) AS QtdCapitulos FROM verse WHERE book_id = ${POG.livro}");

    setState(() {
      capitulos = new List<int>.generate(
          result.first['QtdCapitulos'] as int, (i) => i + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(
          capitulos.length,
          (index) => TextButton(
            onPressed: () {
              POG.capitulo = index + 1;
              DefaultTabController.of(context).animateTo(2);
            },
            child: Text(capitulos[index].toString()),
          ),
        ),
      ),
    );
  }
}
