

import 'package:flutter/material.dart';

import 'login_native_view/login_event_handler.dart';
import 'login_native_view/login_native_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final eventHandler =YourStreamHandlers();
  return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 20,),
          StreamBuilder<String?>(builder: (context,snapshot){
            return Text("Email: ${snapshot.data??""}");
          },
          initialData: "NA",
            stream: eventHandler.emailStream,
          ),
          const SizedBox(height: 20,),
          StreamBuilder<String?>(builder: (context,snapshot){
            return Text("Password: ${snapshot.data??""}");
          },
            initialData: "NA",
            stream: eventHandler.passwordStream,
          ),
          const SizedBox(height: 20,),
          Center(
            child: SizedBox(child: NativeViewWidget(),height: 100,width: double.infinity,),
          )
        ],
      ),
    ),
  );
  }

}


