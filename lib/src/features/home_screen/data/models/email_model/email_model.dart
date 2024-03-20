class EmailModel {
   String? toName;
   String? pickUp;
   String? dropOff;
   String? date;
   String? type;
  
  EmailModel({
    this.toName,
    this.pickUp,
    this.dropOff,
    this.date,
    this.type
  });

  EmailModel copyWith({
    String? toName,
    String? pickUp,
    String? dropOff,
    String? date,
    String? type,
  }) {
    return EmailModel(
      toName: toName ?? this.toName,
      pickUp: pickUp ?? this.pickUp,
      dropOff: dropOff ?? this.dropOff,
      date: date ?? this.date,
      type: type ?? this.type
    );
  }

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      toName: json["toName"] as String? ?? "",
      pickUp: json["pickUp"] as String? ?? "",
      dropOff: json["dropOff"] as String? ?? "",
      date: json["date"] as String? ?? "",
      type: json["type"] as String? ?? ""
    );
  }

  Map<String, dynamic> toJson() => {
    "toName": toName,
    "pickUp": pickUp,
    "dropOff": dropOff,
    "date": date,
    "type": type
  };

  @override
  String toString() {
    return '''
        toName: $toName,
        pickUp: $pickUp,
        dropOff: $dropOff,
        date: $date,
        type: $type
    ''';
  }
}
