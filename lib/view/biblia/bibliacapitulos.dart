import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/livro.dart';
import 'package:gtapp/view/biblia/bibliaversiculos.dart';

class BibliaCapitulos extends StatefulWidget {
  Livro livro;

  BibliaCapitulos(this.livro) {}

  @override
  State<BibliaCapitulos> createState() => _BibliaCapitulosState();
}

class _BibliaCapitulosState extends State<BibliaCapitulos> {
  List<int> capitulos = [];

  _BibliaCapitulosState() {
    countCapitulos();
  }

  countCapitulos() async {
    var db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(
        "SELECT MAX(DISTINCT chapter) AS QtdCapitulos FROM verse WHERE book_id = ${widget.livro.book_reference_id}");

    setState(() {
      capitulos = new List<int>.generate(
          result.first['QtdCapitulos'] as int, (i) => i + 1);
    });
  }

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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BibliaVersiculos(widget.livro.book_reference_id, index+1)));
            },
            child: Text(capitulos[index].toString()),
          ),
        ),
      ),
    );
  }
}
