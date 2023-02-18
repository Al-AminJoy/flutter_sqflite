
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/SqlHelper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("SqfLite"),
      ),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{
                Map<String,dynamic> data = HashMap();
                data['name'] = "Al-Amin";
                data['name'] = "Joy";
                await SQLHelper.instance.insert(data);
              }, child: const Text("Create")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                var dbQuery = await SQLHelper.instance.read();
                print(dbQuery);
              }, child: const Text("Read")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{
                Map<String,dynamic> data = HashMap();
                data['id'] = 1;
                data['name'] = "Al-Amin Joy";
                await SQLHelper.instance.update(data);
              }, child: const Text("Update")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{
                await SQLHelper.instance.delete(1);
              }, child: const Text("Delete"))
            ],
          ),
        ),
      ),

    );
  }
}
