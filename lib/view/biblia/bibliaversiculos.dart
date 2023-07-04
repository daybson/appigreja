import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';

class BibliaVersiculos extends StatefulWidget {
  int capitulo;
  int livro;

  BibliaVersiculos(this.livro, this.capitulo);

  @override
  State<BibliaVersiculos> createState() => _BibliaVersiculosState();
}

class _BibliaVersiculosState extends State<BibliaVersiculos> {
  List<String> versiculos = [];

  _BibliaVersiculosState() {
    loadVersiculos();
  }

  loadVersiculos() async {
    var db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(
        "SELECT verse, text FROM verse WHERE book_id = ${widget.livro} AND chapter = ${widget.capitulo}");

    setState(() {
      result.forEach((element) {
        versiculos.add(
            element["verse"].toString() + " " + element["text"].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Versículos'),
      ),
      body: ListView.builder(
          itemCount: versiculos.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(versiculos[i]!),
              dense: true,
              onTap: () {},
            );
          }),
    );
  }
}
