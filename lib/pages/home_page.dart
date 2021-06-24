import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/services/http_services.dart';

class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date;
  void _apiPostList(){
    Network.Get(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
  _showResponse(response),

    });

  }
  void _showResponse(String response){
    setState(() {
      date=response;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(date!=null ?  date: "No date"),
      ),
    );
  }
}
