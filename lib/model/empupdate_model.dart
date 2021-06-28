import 'emp_model.dart';

class EmpUpdate {

  String status;
  String message;
  List<Employee> data;

  EmpUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = List<Employee>.from(json["data"].map((x) => Employee.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };

}