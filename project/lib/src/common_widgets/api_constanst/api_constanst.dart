class APIConstants {
  static const String baseUrl = "https://dade-103-17-88-39.ngrok-free.app";
  // static const String baseUrl = "http://10.0.2.2:5000";

  static final Uri loginUrl = Uri.parse('$baseUrl/loginMobile');
  static final Uri registerUrl = Uri.parse('$baseUrl/registerMobile');
  static final Uri updateUrl = Uri.parse('$baseUrl/updateMobile');
  static const String getImageUrl = '$baseUrl/getimage';
}
