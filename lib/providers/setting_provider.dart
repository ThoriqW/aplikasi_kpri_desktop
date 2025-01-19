import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

//ROUTE
enum SettingMode { view }

@riverpod
class SettingModeNotifier extends _$SettingModeNotifier {
  @override
  SettingMode build() => SettingMode.view;

  void switchToView() => state = SettingMode.view;
}
