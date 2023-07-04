import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/view/biblia/biblialivros.dart';
import 'package:gtapp/view/biblia/tabs/bibliatabs.dart';
import 'package:gtapp/view/eventos.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GTapp'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background(3).jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventosView()));
              },
              child: Text('Eventos'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Agendar horário'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BibliaLivros()));
              },
              child: Text('Bíblia'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
