import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/model.dart';

import 'model.dart';
import 'model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> welcome = [];



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        // using if statement for checking if were getting data or not
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: welcome.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 110,
                  color: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User id; ${welcome[index].userId}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'ID : ${welcome[index].id}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Title : ${welcome[index].title}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Body : ${welcome[index].body}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),

                    ],
                  )
              );
            },
          );
        }


    else{
            return Center(child: CircularProgressIndicator(),);
        }

      },
    );

  }
  Future<List<Welcome>> getData() async{
    final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;
    }
    else{
      return welcome;
    }
  }


}

