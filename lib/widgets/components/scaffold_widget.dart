import 'package:flutter/material.dart';

class MyScaffoldWidget extends StatefulWidget {
  const MyScaffoldWidget({super.key});

  @override
  State<MyScaffoldWidget> createState() => _MyScaffoldWidgetState();
}

class _MyScaffoldWidgetState extends State<MyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Flutter Title"),
        centerTitle: true,
        actions: [Icon(Icons.menu)],
        backgroundColor: Colors.amber,
      ),
      // body: Align(
      //   alignment: Alignment.centerLeft,

      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Monika",
      //       style: TextStyle(
      //         fontSize: 40,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.red,
      //         letterSpacing: 2
      //       ),),
      //     ),
      //   ),



      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: (){
      //       print("Hello Button Pressed");
        
      //   }, 
      //   child: Text("Press Me")
      //   ),
      // ),


      body: Text("data"),
      
    ); //scaffolds
  }
}
