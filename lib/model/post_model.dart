class Post {
  int id;
  String name;
  int salary;
  int age;
  // String profileImage;

  Post(
      {
        this.name,
        this.salary,
        this.age,
        // this.profileImage
      });

  Post.fromJson(Map<String, dynamic> json)
      :
        name = json["employee_name"],
        salary = json["employee_salary"],
        age = json["employee_age"];
  // profileImage = json["profile_image"];

  Map<String, dynamic> toJson() => {

    "name": name,
    "salary": salary,
    "age": age,
    // "profile_image": profileImage,
  };
}