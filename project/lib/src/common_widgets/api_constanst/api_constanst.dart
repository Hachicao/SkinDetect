class APIConstants {
  static const String baseUrl = "https://c645-103-17-88-39.ngrok-free.app";
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
}
