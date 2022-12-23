import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _search;
  late int _offset;
  
  Future<Map> _getGifs() async{
    http.Response response;
    
    if(_search == null || (_search ?? '').isEmpty){
      Uri url = Uri.https('api.giphy.com', '/v1/gifs/trending', {'api_key':'jNCvlXsKmDQTocQ8XAT4ldpPlzwGuEgK', 'limit':'20', 'rating':'g'});
      print(url);
      response = await http.get(url);
    }else{
      Uri url = Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=jNCvlXsKmDQTocQ8XAT4ldpPlzwGuEgK&q=$_search&limit=20&offset=$_offset&rating=g&lang=pt');
      response = await http.get(url);
    }

    return convert.jsonDecode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}