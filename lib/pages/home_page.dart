import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/model/emp_listmodel.dart';
import 'package:network/model/emp_model.dart';
import 'package:network/model/post_model.dart';
import 'package:network/services/http_services.dart';

import 'detail_page.dart';


class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<Employee> items = new List();

  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiEmpOne(int id) {
    Network.GET(Network.API_LIST2 + id.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _showResponse(String response) {
    EmpList empList = Network.parseEmpList(response);
    setState(() {
      items = empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, DetailPage.id);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name+"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
