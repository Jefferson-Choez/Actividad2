import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {

}

  Future<dynamic> _getListado() async {
    final response = await http.get("//actividad2-312ad-default-rtdb.firebaseio.com/");
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(response.body);
    } else {
      print("Error en la respuesta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Listado API"),
        ),
        body: FutureBuilder<dynamic>(
          future: _getListado(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return ListView(
                  children: listado(snapshot.data)
              );
            } else {
              print("No hay informacion");
              return Text("Sin data");
            }
          },
          initialData: Center(child: CircularProgressIndicator()),
        )
    );
  }

  List<Widget> listado(List<dynamic> info) {
    List<Widget> lista = [];
    info.forEach((element) {
      var elemento;
      lista.add(Text(elemento["name"]));
    });
    return lista;
  }

