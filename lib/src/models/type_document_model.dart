// To parse this JSON data, do
//
//     final typeDocumentModel = typeDocumentModelFromJson(jsonString);

import 'dart:convert';

List<TypeDocumentModel> typeDocumentModelFromJson(String str) =>
    List<TypeDocumentModel>.from(
        json.decode(str).map((x) => TypeDocumentModel.fromJson(x)));

String typeDocumentModelToJson(List<TypeDocumentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeDocumentModel {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  TypeDocumentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TypeDocumentModel.fromJson(Map<String, dynamic> json) =>
      TypeDocumentModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
