class Premise {
  String? premiseNumber;

  Premise({this.premiseNumber});

  Premise.fromJson(Map<String, dynamic> json) {
    premiseNumber = json['PremiseNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PremiseNumber'] = this.premiseNumber;
    return data;
  }
}
