import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/livro.dart';
import 'package:gtapp/view/biblia/tabs/bibliatabs.dart';

class TabLivros extends StatefulWidget {
  @override
  State<TabLivros> createState() => _TabLivrosState();
}

class _TabLivrosState extends State<TabLivros> {
  List<Livro> livrosList = [];

  _TabLivrosState() {
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
      body: ListView.separated(
          separatorBuilder: (context, i) => Divider(),
          itemCount: livrosList.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(livrosList[i].name),
              onTap: () {
                setState(() {
                  POG.livro = livrosList[i].book_reference_id;
                });

                DefaultTabController.of(context).animateTo(1);
              },
            );
          }),
    );
  }
}
