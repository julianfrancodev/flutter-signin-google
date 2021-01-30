import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;
      print(account);

      print("======= ID TOKEN ======");


      print(googleKey.idToken);

      // todo: llamar servicio al backed con el idtoken




      return account;

    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
