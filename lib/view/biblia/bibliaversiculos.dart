import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/versiculo.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';

class BibliaVersiculos extends StatefulWidget {
  int capitulo;
  int livro;
  String livroNome;

  BibliaVersiculos(this.livro, this.capitulo, this.livroNome);

  @override
  State<BibliaVersiculos> createState() => _BibliaVersiculosState();
}

class _BibliaVersiculosState extends State<BibliaVersiculos> {
  List<Versiculo> versiculos = [];

  _BibliaVersiculosState() {
    loadVersiculos();
  }

  loadVersiculos() async {
    var db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(
        "SELECT * FROM verse WHERE book_id = ${widget
            .livro} AND chapter = ${widget.capitulo}");

    setState(() {
      result.forEach((element) {
        versiculos.add(Versiculo(id: element["id"] as int,
            book_id: element["book_id"] as int,
            chapter:  element["chapter"] as int,
            verse:  element["verse"] as int,
            text:  element["text"] as String)
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.livroNome}: ${widget.capitulo}'),
      ),
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
