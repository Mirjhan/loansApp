import 'dart:convert';

List<PaymentMethodModel> paymentMethodModelFromJson(String str) =>
    List<PaymentMethodModel>.from(
        json.decode(str).map((x) => PaymentMethodModel.fromJson(x)));

String paymentMethodModelToJson(List<PaymentMethodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

PaymentMethodModel addPaymentMethodModelFromJson(String str) =>
    PaymentMethodModel.fromJson(json.decode(str));

String addPaymentMethodModelToJson(PaymentMethodModel data) =>
    json.encode(data.toJson());

class PaymentMethodModel {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
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
