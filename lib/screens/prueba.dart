import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<dynamic>> fetchAlbum() async {
  String url = "https://viae.ec/data.json";
  final response = await http.get(Uri.parse(url));
  List<dynamic> data = jsonDecode(response.body);
  return data;
}

/*
Future<List<Album>>fetchAlbum() async {
  final jsonurl= 'https://viae.ec/data.json';
  final response = await http
      .get(Uri.parse(jsonurl));
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    List<dynamic> datax = jsonDecode(response.body);

    final list = json.decode(response.body) as List<dynamic>;
    //return list.map((e) => Album.fromJson(jsonDecode(response.body));
    print("lo logre!");
    print(list.length);
    //return list.map((e) => Album.fromJson(e)).toList();
    return datax;
  } else {
    print("Falle");
    throw Exception('Failed to load album');
  }
}

 */

class Album{
  final int id;
  final String name;
  final String category;
  final String imageURL;
  final String oldPrice;
  final String price;

  const Album({
    required this.id,
    required this.name,
    required this.category,
    required this.imageURL,
    required this.oldPrice,
    required this.price
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['is'],
      name :json['name'],
      category : json['category'],
      imageURL : json['imageUrl'],
      oldPrice : json['oldPrice'],
      price : json['price'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Lectura de archivos JSON'),
        ),
        body: FutureBuilder(
          future: fetchAlbum(),
          builder: (context,snapshot){
            print("hasData");
            print(snapshot.hasData);
            print(snapshot.data);
            if(snapshot.hasError){
              return Center(child: Text("${snapshot.error}"));

            }else if(snapshot.hasData){
              var items =snapshot.data as List<dynamic>;

              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              child: Image(image: NetworkImage(items[index]['imageUrl'].toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(items[index]['name'].toString(),style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(items[index]['oldPrice'].toString()),)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
  }