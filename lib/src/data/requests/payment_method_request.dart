/*{'id': frecuenciaSeleccionada?.id.toString(),
        'name': name,
        'description': description,
        'recommended_percentage': recommendedPercentage,
        'monthly_installments': monthlyInstallments,
        'days_installment': daysInstallment,} */
class PaymentMethodRequest {
  int? id;
  String name;
  String description;

  PaymentMethodRequest({
    this.id,
    required this.name,
    required this.description,
  });

  factory PaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      PaymentMethodRequest(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
