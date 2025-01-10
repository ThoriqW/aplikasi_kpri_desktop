import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saving_route_provider.g.dart';

enum SavingMode { view, transferMember, editSimpanan }

@riverpod
class SavingModeNotifier extends _$SavingModeNotifier {
  @override
  SavingMode build() => SavingMode.view;

  void switchToView() => state = SavingMode.view;
  void switchToTransferMember() => state = SavingMode.transferMember;
  void switchToEditSimpanan() => state = SavingMode.editSimpanan;
}

@riverpod
class IdMemberSavingsNotifier extends _$IdMemberSavingsNotifier {
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
class TahunMemberSavingsNotifier extends _$TahunMemberSavingsNotifier {
  @override
  int build() => 0;

  void setTahunSimpanan(int tahun) {
    state = tahun;
  }

  int getTahunSimpanan() {
    return state;
  }
}
