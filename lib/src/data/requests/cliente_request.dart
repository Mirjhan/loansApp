class ClienteRequest {
  int? id;
  String name;
  String lastName;
  String address;
  String longitude;
  String latitude;
  int idTypeDocument;
  String document;

  ClienteRequest({
    this.id,
    required this.name,
    required this.lastName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.idTypeDocument,
    required this.document,
  });

  factory ClienteRequest.fromJson(Map<String, dynamic> json) => ClienteRequest(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      address: json['address'],
      latitude: json['latitude '],
      longitude: json['longitude'],
      idTypeDocument: json['id_type_document'],
      document: json['document']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'id_type_document': idTypeDocument,
        'document': document,
      };
}
