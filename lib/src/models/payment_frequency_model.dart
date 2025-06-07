// To parse this JSON data, do
//
//     final paymentFrequencyModel = paymentFrequencyModelFromJson(jsonString);

import 'dart:convert';

List<PaymentFrequencyModel> paymentFrequencyModelFromJson(String str) =>
    List<PaymentFrequencyModel>.from(
        json.decode(str).map((x) => PaymentFrequencyModel.fromJson(x)));

String paymentFrequencyModelToJson(List<PaymentFrequencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

PaymentFrequencyModel addPaymentFrequencyModelFromJson(String str) =>
    PaymentFrequencyModel.fromJson(json.decode(str));

String addPaymentFrequencyModelToJson(PaymentFrequencyModel data) =>
    json.encode(data.toJson());

class PaymentFrequencyModel {
  int id;
  String name;
  String description;
  int recommendedPercentage;
  int monthlyInstallments;
  int daysInstallment;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentFrequencyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.recommendedPercentage,
    required this.monthlyInstallments,
    required this.daysInstallment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentFrequencyModel.fromJson(Map<String, dynamic> json) =>
      PaymentFrequencyModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        recommendedPercentage: json["recommended_percentage"],
        monthlyInstallments: json["monthly_installments"],
        daysInstallment: json["days_installment"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "recommended_percentage": recommendedPercentage,
        "monthly_installments": monthlyInstallments,
        "days_installment": daysInstallment,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
