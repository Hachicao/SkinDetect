class APIConstants {
  static const String baseUrl =
      "https://9a1c-2402-800-6311-639a-c965-678c-5b9d-8111.ngrok-free.app";
  static final Uri loginUrl = Uri.parse('$baseUrl/loginMobile');
  static final Uri registerUrl = Uri.parse('$baseUrl/registerMobile');
  static final Uri updateUrl = Uri.parse('$baseUrl/updateMobile');
  static final Uri getImageUrl = Uri.parse('$baseUrl/getimage');
  static final Uri getHistoryUrl = Uri.parse('$baseUrl/getHistory');
  static final Uri getDetailUrl = Uri.parse('$baseUrl/getDetail');
}
