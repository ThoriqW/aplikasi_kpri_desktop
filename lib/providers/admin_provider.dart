import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_provider.g.dart';

//ROUTE
enum AdminMode { view, editUser, editWorkUnit, addUser, addWorkUnit }

@riverpod
class AdminModeNotifier extends _$AdminModeNotifier {
  @override
  AdminMode build() => AdminMode.view;

  void switchToView() => state = AdminMode.view;
  void switchToEditUser() => state = AdminMode.editUser;
  void switchToAddUser() => state = AdminMode.addUser;
  void switchToAddWorkUnit() => state = AdminMode.addWorkUnit;
  void switchToEditWorkUnit() => state = AdminMode.editWorkUnit;
}

@riverpod
class IdUserNotifier extends _$IdUserNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}

@riverpod
class IdWorkUnitNotifier extends _$IdWorkUnitNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}
