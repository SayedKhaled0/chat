import 'dart:convert';
class Myuser{
  static const String COLLECTIONNAME="Users";
  String id;
  String firName;
  String userName;
  String email;
  Myuser({ required this.id, required this.email, required this.firName, required
  this.userName});
  Myuser.fromJson(Map<String,dynamic>json):this(
    id: json["id"],
    firName: json["firName"],
    userName: json["userName"],
    email: json["email"],
  );
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "firName":firName,
      "userName":userName,
      "email":email,
    };

  }
}