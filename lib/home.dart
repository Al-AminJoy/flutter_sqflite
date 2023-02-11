
import 'package:flutter/material.dart';

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
              ElevatedButton(onPressed: (){}, child: const Text("Create")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: const Text("Read")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: const Text("Update")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: const Text("Delete"))
            ],
          ),
        ),
      ),

    );
  }
}
