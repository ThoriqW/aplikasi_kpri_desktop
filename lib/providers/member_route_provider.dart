import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_route_provider.g.dart';

enum MemberMode { view, update, add }

@riverpod
class MemberModeNotifier extends _$MemberModeNotifier {
  @override
  MemberMode build() => MemberMode.view;

  void switchToView() => state = MemberMode.view;
  void switchToUpdateUser() => state = MemberMode.update;
  void switchToAddUser() => state = MemberMode.add;
}

@riverpod
class IdMemberNotifier extends _$IdMemberNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}
