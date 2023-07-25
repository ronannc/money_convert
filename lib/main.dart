import 'package:flutter/material.dart';
import 'package:money_convert/services/api_service.dart';

void main() async{
  Api api = Api();
  print( await api.getCurrency('USD-BRL'));
  runApp(MaterialApp(
    home: Home() ,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor'),
      ),
    );
  }
}



