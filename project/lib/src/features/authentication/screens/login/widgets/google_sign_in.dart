import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(scopes: ['email', 'openid']);

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<void> logout() async {
    await _googleSignIn.disconnect();
  }

  static Future<void> doAuthenticateUser() async {
    final UserController userController = Get.find<UserController>();
    final result = await _googleSignIn.signIn();
    if (result != null) {
      final ggAuth = await result.authentication;
      if (ggAuth != null) {
        await userController.authenticateUser(_googleSignIn);
        // Now you should be able to access the ID token
        print("ID Token: ${ggAuth.idToken}");
        print("Access Token: ${ggAuth.accessToken}");
        print("Display Name: ${result.displayName}");
        print("Email: ${result.email}");
        print("ID: ${result.id}");
        print("Photo URL: ${result.photoUrl}");
        return;
      }
    }
    print("Authentication failed or user cancelled");
  }
}
