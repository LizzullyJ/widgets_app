import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 0);
//listado de color inmutable (que nunca va a cambiar)
final colorListProvider = Provider((ref) => colorList);

//un objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//se puede llamar Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //estado = nueva instancia del appTheme
  ThemeNotifier() : super(AppTheme());
  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
