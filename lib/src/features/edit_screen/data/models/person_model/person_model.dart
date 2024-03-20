class PersonModel{
  final String name;
  final String phoneNumber;
  final String email;
  final String photoUrl;
  PersonModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.photoUrl
  });

  PersonModel copyWith({
    String? name,
    String? phoneNumber,
    String? email,
    String? photoUrl
  }) {
    return PersonModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl
    );
  }
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'] as String? ?? "",
      phoneNumber: json['phoneNumber']as String? ?? "",
      email: json['email']as String? ?? "",
      photoUrl: json['photoUrl']as String? ?? "",
    );
  }
  Map<String,dynamic>toJson()=>{
    'name':name,
    'phoneNumber':phoneNumber,
    'email':email,
    'photoUrl':photoUrl
  };
  @override
  String toString(){
    return """
    'name':$name,
    'phoneNumber':$phoneNumber,
    'email':$email,
    'photoUrl':$photoUrl
    """;
  }
}