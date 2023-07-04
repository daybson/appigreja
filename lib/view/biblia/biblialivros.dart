import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/livro.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:path/path.dart';

class BibliaLivros extends StatefulWidget {
  BibliaLivros() {}

  @override
  State<BibliaLivros> createState() => _BibliaLivrosState();
}

class _BibliaLivrosState extends State<BibliaLivros> {
  List<Livro> livrosList = [];

  _BibliaLivrosState() {
    loaddata();
  }

  void loaddata() async {
    livrosList = [];
    var db = await DatabaseHelper.instance.database;
    var list = await db.query('book');
    list.forEach((element) {
      var l = Livro.fromMap(element);
      livrosList.add(l);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, i) => Divider(),
          itemCount: livrosList.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(livrosList[i].name),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BibliaCapitulos(livrosList[i])));
              },
            );
          }),
    );
  }
}
