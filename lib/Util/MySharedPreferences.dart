import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static void saveIP(String ip) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', ip);
  }

  static Future<String> getIP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ip') ?? 'Nenhum endereço setado';
  }
}
