class APIConstants {
  static const String baseUrl =
      "https://b85b-2402-800-6311-2b02-818d-cb65-4382-323.ngrok-free.app";
  static final Uri loginUrl = Uri.parse('$baseUrl/loginMobile');
  static final Uri registerUrl = Uri.parse('$baseUrl/registerMobile');
  static final Uri updateUrl = Uri.parse('$baseUrl/updateMobile');
  static final Uri getImageUrl = Uri.parse('$baseUrl/getimage');
  static final Uri getHistoryUrl = Uri.parse('$baseUrl/getHistory');
  static final Uri getDetailUrl = Uri.parse('$baseUrl/getDetail');
  static final Uri getListDetailUrl = Uri.parse('$baseUrl/getListDetail');
  static final Uri getSaveDataUrl = Uri.parse('$baseUrl/saveImage');
  static final Uri getHistoryByDateAsc =
      Uri.parse('$baseUrl/getHistoryByDateAsc');
  static final Uri getHistoryByScore = Uri.parse('$baseUrl/getHistoryByScore');
  static final Uri deleteImageUrl = Uri.parse('$baseUrl/deleteImage');
  static final Uri googleOauth = Uri.parse('$baseUrl/authenticate_user');
}
