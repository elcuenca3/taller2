import 'package:flutter/material.dart';
import 'package:tallersem2bim2/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 6000), (() {}));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Splash')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("fondo.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("logoapp.png")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Color.fromRGBO(212, 163, 115, 1)),
                          onPressed: (() =>
                              Navigator.pushNamed(context, "/inicio")),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Tutorial"),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(250, 168, 91, 1)),
                          onPressed: (() =>
                              Navigator.pushNamed(context, "/inicio")),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Omitir"),
                          )),
                    ],
                  ),
                ],
              ),
            ) // Foreground widget here
        ));
  }
}