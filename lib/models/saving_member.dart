class SavingMember {
  final int id;
  final int year;
  final int month;
  final double? principal;
  final double? mandatory;
  final double? voluntary;
  final int memberProfileId;
  final int workUnitId;

  SavingMember({
    required this.id,
    required this.year,
    required this.month,
    required this.principal,
    required this.mandatory,
    required this.voluntary,
    required this.memberProfileId,
    required this.workUnitId,
  });

  factory SavingMember.fromJson(Map<String, dynamic> json) {
    return SavingMember(
      id: json['id'] ?? '',
      year: json['year'] ?? '',
      month: json['month'] ?? '',
      principal: json['principal'],
      mandatory: json['mandatory'] ?? '',
      voluntary: json['voluntary'] ?? '',
      memberProfileId: json['memberProfileId'] ?? '',
      workUnitId: json['workUnitId'] ?? '',
    );
  }
}
