import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtapp/view/biblia/bibliacapitulos.dart';

class BibliaVersiculos extends StatelessWidget {
  var versiculos = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Morbi vehicula turpis vel quam tincidunt gravida.",
    "Nunc suscipit magna nec euismod volutpat.",
    "In commodo lorem et lectus auctor cursus.",
    "In bibendum risus ut odio fermentum elementum.",
    "Phasellus et erat tristique, lacinia orci sit amet, eleifend ipsum.",
    "Integer non nisi vel nisi auctor rutrum.",
    "In ac quam ac dui auctor pellentesque.",
    "Aenean ut erat non felis mollis ornare id eu arcu.",
    "Aenean porta ante ac purus semper, sit amet lacinia lorem sollicitudin.",
    "Maecenas eu leo ac sem consequat dapibus quis non risus.",
    "Donec interdum risus ac justo finibus pharetra.",
    "Proin consectetur leo quis risus pellentesque accumsan.",
    "In commodo turpis in tellus hendrerit scelerisque.",
    "Curabitur dignissim turpis non tellus cursus, et semper felis pulvinar.",
    "Nullam laoreet sapien in orci bibendum, pharetra scelerisque nisl ultrices.",
    "Suspendisse sagittis est non tincidunt iaculis.",
    "Donec blandit massa nec dolor imperdiet, at mollis risus auctor.",
    "Sed eu mauris non velit eleifend dictum eget quis odio.",
    "In quis nibh sed ante scelerisque pulvinar vel et urna.",
    "Duis a eros ut sem vehicula pulvinar id non eros.",
    "Vestibulum in justo porttitor, congue mi in, molestie sapien.",
    "Nullam ut est varius, tincidunt nulla sit amet, varius arcu.",
    "Curabitur quis dui nec tellus pellentesque feugiat vel vitae dolor.",
    "Duis tempor leo sed luctus pulvinar.",
    "Sed nec dui sit amet tellus porta pulvinar.",
    "Nunc tristique dolor eu tellus feugiat, ac dictum felis auctor.",
    "Integer posuere nibh consequat lacus congue, non eleifend ex interdum.",
    "In pellentesque nibh quis urna mattis, a consectetur lacus consequat.",
    "Cras feugiat enim eu vehicula facilisis.",
    "Nunc nec lacus nec enim eleifend imperdiet in ac erat.",
    "Praesent vel ante pharetra, tincidunt neque et, vehicula libero.",
    "Sed consectetur massa sit amet velit semper, ut dignissim arcu efficitur.",
    "Fusce volutpat ligula eu rhoncus blandit.",
  ];

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
              leading: Text(i.toString()),
              title: Text(versiculos[i]),
              dense: true,
              onTap: (){},
            );
          }),
    );
  }
}
