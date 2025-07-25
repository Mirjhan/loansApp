// To parse this JSON data, do
//
//     final prestamoModel = prestamoModelFromJson(jsonString);

import 'dart:convert';

List<PrestamoModel> prestamoModelFromJson(String str) =>
    List<PrestamoModel>.from(
        json.decode(str).map((x) => PrestamoModel.fromJson(x)));

String prestamoModelToJson(List<PrestamoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrestamoModel {
  int idCustomer;
  int idUser;
  int idPaymentFrequency;
  int amount;
  double percentage;
  DateTime startDate;
  int ganancy;
  int idPaymentMethod;
  String observation;
  int idStateLoan;
  String evidence;

  PrestamoModel({
    required this.idCustomer,
    required this.idUser,
    required this.idPaymentFrequency,
    required this.amount,
    required this.percentage,
    required this.startDate,
    required this.ganancy,
    required this.idPaymentMethod,
    required this.observation,
    required this.idStateLoan,
    required this.evidence,
  });

  factory PrestamoModel.fromJson(Map<String, dynamic> json) => PrestamoModel(
        idCustomer: json["id_customer"],
        idUser: json["id_user"],
        idPaymentFrequency: json["id_payment_frequency"],
        amount: json["amount"],
        percentage: json["percentage"]?.toDouble(),
        startDate: DateTime.parse(json["start_date"]),
        ganancy: json["ganancy"],
        idPaymentMethod: json["id_payment_method"],
        observation: json["observation"],
        idStateLoan: json["id_state_loan"],
        evidence: json["evidence"],
      );

  Map<String, dynamic> toJson() => {
        "id_customer": idCustomer,
        "id_user": idUser,
        "id_payment_frequency": idPaymentFrequency,
        "amount": amount,
        "percentage": percentage,
        "start_date": startDate.toIso8601String(),
        "ganancy": ganancy,
        "id_payment_method": idPaymentMethod,
        "observation": observation,
        "id_state_loan": idStateLoan,
        "evidence": evidence,
      };
}
