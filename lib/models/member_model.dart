class Member {
  final String fullName;
  final String nik;
  final String? nomorAnggota;
  final String? phoneNumber;
  final String? address;
  final DateTime? dateOfBirth;
  final int workUnitId;

  Member(
      {required this.fullName,
      required this.nik,
      required this.nomorAnggota,
      required this.phoneNumber,
      required this.address,
      required this.dateOfBirth,
      required this.workUnitId});

  factory Member.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return Member(
      fullName: data['fullName'] ?? '',
      nik: data['nik'] ?? '',
      nomorAnggota: data['memberNumber'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      address: data['address'] ?? '',
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.parse(data['dateOfBirth'])
          : null,
      workUnitId: data['workUnitId'] ?? 0,
    );
  }
}
