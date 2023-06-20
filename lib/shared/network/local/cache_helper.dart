import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences? sharedPreferences;
  // de tare2t t3ref al shared preferences
  static init()async
  {
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({ // astd3eha mkan ma bdos 3la al zorar
    required bool value,
    required String key,
})async
  {
     return await sharedPreferences!.setBool(key, value);
  }

      static bool? getBoolean({
      required String key,
    })
    {
      return sharedPreferences!.getBool(key);
    }

}