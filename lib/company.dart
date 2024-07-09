class Company {
  final String companyName;
  final String catchPhrase;
  final String business;

  Company({required this.companyName, required this.catchPhrase, required this.business});

  Company.fromJson(Map<String, dynamic> json)
      : companyName = json['name'] as String,
        catchPhrase = json['catchPhrase'] as String,
        business = json['bs'] as String;
}
