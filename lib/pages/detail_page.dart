import 'package:flutter/material.dart';
import 'package:network/model/emp_model.dart';
import 'package:network/model/empone_model.dart';
import 'package:network/services/http_services.dart';


class DetailPage extends StatefulWidget {

  static final String id = "detail_page";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Employee items;

  void _apiEmpOne(int id) {
    Network.GET(Network.API_LIST2 + id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _showResponse(String response) {
    EmpOne empOne = Network.parseEmpOne(response);
    setState(() {
      items = empOne.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Detail Page"),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return itemOfList(items);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(

        child: Container(
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
        ),
      
    );
  }
}