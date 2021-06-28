import 'package:flutter/material.dart';
import 'package:network/model/emp_model.dart';
import 'package:network/services/http_services.dart';



class DetailPage extends StatefulWidget {

  static final String id = 'detail_page';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(1);
  }

  Employee employee;

  String name;
  int age;
  int salary;

  void _apiEmpOne(int i) {
    Network.GET(Network.API_LIST2 + i.toString(), Network.paramsEmpty()).then((response) => {
      _showResponseOne(response)
    });
  }

  void _showResponseOne(String response) {
    setState(() {
      employee = Network.parseEmpOne(response).data;
      name = employee.employee_name;
      age = employee.employee_age;
      salary = employee.employee_salary;
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$name($age)', style: TextStyle(fontSize: 22),),
            Text('$salary \$', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}