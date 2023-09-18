class APIConstants {
  static const String baseUrl =
      "https://f435-2402-800-6327-304c-dd1e-51f2-fa2b-a096.ngrok-free.app";
  static final Uri loginUrl = Uri.parse('$baseUrl/loginMobile');
  static final Uri registerUrl = Uri.parse('$baseUrl/registerMobile');
  static final Uri updateUrl = Uri.parse('$baseUrl/updateMobile');
  static final Uri getImageUrl = Uri.parse('$baseUrl/getimage');
  static final Uri getHistoryUrl = Uri.parse('$baseUrl/getHistory');
}
