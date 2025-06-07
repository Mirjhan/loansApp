import 'dart:convert';

List<UserModel> listUserModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//Exception has occurred.
//_TypeError (type 'List<dynamic>' is not a subtype of type 'Map<String, dynamic>')
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String? email;
  String? password;
  String? name;
  String lastName;
  String phoneNumber;

  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  UserModel({
    required this.id,
    this.email,
    this.password,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
