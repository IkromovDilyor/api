import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/model/post_model.dart';
import 'package:network/services/http_services.dart';


class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date;


  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
  _showResponse(response),
    });
  }

  void _apiPostGet(){
    Network.GET(Network.API_LIST2, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
  void _apiCreatePost(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
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

    var post=new Post(name: "Test",salary: 123,age: 23);
    _apiCreatePost(post);


   // _apiPostList();

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
