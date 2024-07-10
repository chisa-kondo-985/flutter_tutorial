class CompanyModel {
  final String companyName;
  final String catchPhrase;
  final String business;

  CompanyModel({required this.companyName, required this.catchPhrase, required this.business});

  CompanyModel.fromJson(Map<String, dynamic> json)
      : companyName = json['name'] as String,
        catchPhrase = json['catchPhrase'] as String,
        business = json['bs'] as String;
}
