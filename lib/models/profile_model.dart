class Profile {
  final String? fullName;
  final String? nik;
  final String? phoneNumber;
  final String? address;
  final DateTime? dateOfBirth;

  Profile({
    required this.fullName,
    required this.nik,
    required this.phoneNumber,
    required this.address,
    required this.dateOfBirth,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return Profile(
      fullName: data['fullName'] ?? '',
      nik: data['nik'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      address: data['address'] ?? '',
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.parse(data['dateOfBirth'])
          : null,
    );
  }
}
