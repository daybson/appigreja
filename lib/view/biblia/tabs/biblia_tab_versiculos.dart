import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/versiculo.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';
import 'package:gtapp/view/biblia/tabs/bibliatabs.dart';

class TabVersiculos extends StatefulWidget {

  @override
  State<TabVersiculos> createState() => _TabVersiculosState();
}

class _TabVersiculosState extends State<TabVersiculos> {
  List<Versiculo> versiculos = [];

  _TabVersiculosState() {
    loadVersiculos();
  }

  loadVersiculos() async {
    var db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(
        "SELECT * FROM verse WHERE book_id = ${POG.livro} AND chapter = ${POG.capitulo}");

    setState(() {
      result.forEach((element) {
        versiculos.add(Versiculo(
            id: element["id"] as int,
            book_id: element["book_id"] as int,
            chapter: element["chapter"] as int,
            verse: element["verse"] as int,
            text: element["text"] as String));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: versiculos.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text("${versiculos[i].verse} ${versiculos[i].text}"),
              dense: true,
              onTap: () {},
            );
          }),
    );
  }
}
