import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/model/biblia/livro.dart';
import 'package:gtapp/view/biblia/tabs/biblia_tab_capitulos.dart';
import 'package:gtapp/view/biblia/tabs/biblia_tab_livro.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';
import 'package:gtapp/view/biblia/biblialivros.dart';
import 'package:gtapp/view/biblia/tabs/biblia_tab_versiculos.dart';

class POG {
  static int livro = 1;
  static int capitulo = 1;
  static int versiculo = 1;
}

class BibliaTabView extends StatefulWidget {
  @override
  State<BibliaTabView> createState() => _BibliaTabViewState();
}

class _BibliaTabViewState extends State<BibliaTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              print(index);
            },
            tabs: [
              Tab(text: 'Livros'),
              Tab(text: 'Capítulos'),
              Tab(text: 'Versículos')
            ],
          ),
          title: Text('Biblia NVI'),
        ),
        body: TabBarView(
          children: [
            TabLivros(),
            TabCapitulos(),
            TabVersiculos(),
          ],
        ),
      ),
    );
  }
}
