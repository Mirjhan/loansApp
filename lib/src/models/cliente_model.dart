// To parse this JSON data, do
//
//     final clienteModel = clienteModelFromJson(jsonString);

import 'dart:convert';

List<ClienteModel> clienteModelFromJson(String str) => List<ClienteModel>.from(
    json.decode(str).map((x) => ClienteModel.fromJson(x)));

String clienteModelToJson(List<ClienteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
ClienteModel addClienteModelFromJson(String str) =>
    ClienteModel.fromJson(json.decode(str));

class ClienteModel {
  int id;
  String name;
  String lastName;
  String address;
  dynamic latitude;
  dynamic longitude;
  String idTypeDocument;
  String document;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  ClienteModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.idTypeDocument,
    required this.document,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String get fullName => '$name $lastName';

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        idTypeDocument: json["id_type_document"],
        document: json["document"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "id_type_document": idTypeDocument,
        "document": document,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
