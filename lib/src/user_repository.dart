import 'package:holder_arch/src/user_remote_data_source.dart';

class UserRepository {
  UserRemoteDataSource _remoteSource;

  UserRepository(this._remoteSource);

  void signInWith(String email, String password) {
    _remoteSource.doSignInWith(email, password);
  }
}
