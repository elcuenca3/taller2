import 'package:flutter/material.dart';
import 'package:tallersem2bim2/splash.dart';
import 'package:tallersem2bim2/screens/prueba.dart ';

void main() => runApp(MyAppa());

class MyAppa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splash(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/inicio": (BuildContext context) => MyHomePage(title: 'Flutter'),
        "/productosjson" : (BuildContext context) =>  MyApp(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Botones
    return Scaffold(
        backgroundColor: Color.fromRGBO(254, 246, 234, 1),
        body: Center(
          child: ElevatedButton(
            onPressed: (() =>
                Navigator.pushNamed(context, "/productosjson")),
            child: Text("Obtener Datos"),
          ),
        ));
  }
}