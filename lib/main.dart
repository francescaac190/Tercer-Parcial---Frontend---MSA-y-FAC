import 'package:covid_prueba/Animation/FadeAnimation.dart';
import 'package:covid_prueba/Registrar.dart';
import 'package:covid_prueba/persona.dart';
import 'package:covid_prueba/service.dart';
import 'package:flutter/material.dart';

import 'DetallePaciente.dart';
import 'lista_vista.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  TextEditingController _admin = TextEditingController();
  TextEditingController _password = TextEditingController();
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/coka-project-covid19-blog-image-940.jpg'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Covid-19 SCZ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100]!,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _admin,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nombre de usuario",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Contraseña",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      ElevatedButton(
                        onPressed: () {
                          if (_admin.text.toString() == "admin" &&
                              _password.text.toString() == "12345") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonasList(),
                              ),
                            );
                          }
                        },
                        child: const Text('Ingresar'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                2,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registrarse(),
                      ),
                    );
                  },
                  child: const Text('Registrarse'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade600,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.5,
                Text(
                  "*Si es paciente, apretar el boton de registrarse",
                  style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
