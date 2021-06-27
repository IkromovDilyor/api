class Post {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  // String profileImage;

  Post(
      {
        this.employeeName,
        this.employeeSalary,
        this.employeeAge,
        // this.profileImage
      });

  Post.fromJson(Map<String, dynamic> json)
      :
        employeeName = json["employee_name"],
        employeeSalary = json["employee_salary"],
        employeeAge = json["employee_age"];
  // profileImage = json["profile_image"];

  Map<String, dynamic> toJson() => {

    "name": employeeName,
    "salary": employeeSalary,
    "age": employeeAge,
    // "profile_image": profileImage,
  };
}