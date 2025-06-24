class PaymentFrequencyRequest {
  int? id;
  String name;
  String description;
  int recommendedPercentage;
  int monthlyInstallments;
  int daysInstallment;

  PaymentFrequencyRequest({
    this.id,
    required this.name,
    required this.description,
    required this.recommendedPercentage,
    required this.monthlyInstallments,
    required this.daysInstallment,
  });

  factory PaymentFrequencyRequest.fromJson(Map<String, dynamic> json) =>
      PaymentFrequencyRequest(
          id: json['id'],
          name: json['name'],
          description: json['description'],
          recommendedPercentage: json['recommended_percentage'],
          monthlyInstallments: json['monthly_installments'],
          daysInstallment: json['days_installment']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'recommended_percentage': recommendedPercentage,
        'monthly_installments': monthlyInstallments,
        'days_installment': daysInstallment,
      };
}
