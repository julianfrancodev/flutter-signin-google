import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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

      // todo: llamar servicio al backed con el idtoken

      final signInWithGoogleEndpoint = Uri(
          scheme: "https",
          host: "flutter-google-signin-apple.herokuapp.com",
          path: "/google");

      final session = await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey.idToken});
      
      print(session.body);



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
