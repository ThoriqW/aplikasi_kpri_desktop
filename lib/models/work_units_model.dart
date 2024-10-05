class WorkUnit {
  final int id;
  final String name;

  WorkUnit({
    required this.id,
    required this.name,
  });

  factory WorkUnit.fromJson(Map<String, dynamic> json) {
    return WorkUnit(
      id: json['id'],
      name: json['name'],
    );
  }
}

class WorkUnits {
  final List<WorkUnit> data;
  final String message;

  WorkUnits({
    required this.data,
    required this.message,
  });

  factory WorkUnits.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<WorkUnit> workUnitList =
        list.map((i) => WorkUnit.fromJson(i)).toList();
    return WorkUnits(
      data: workUnitList,
      message: json['message'],
    );
  }
}
