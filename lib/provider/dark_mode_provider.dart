import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadium/provider/base_provider.dart';

class DarkModeProvider extends BaseProvider {
  bool isDark = false;

  switchMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isDark = !isDark;
    prefs.setBool("isDark", isDark);
    notifyListeners();
  }

  getMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isDark") ?? false;
    notifyListeners();
  }
}
