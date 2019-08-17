import 'package:holder_arch/src/common/base_holder.dart';
import 'package:holder_arch/src/common/model/user.dart';

class UserRemoteDataSource {
  Holder<User> _userHolder;
  UserRemoteDataSource(this._userHolder);

  void doSignInWith(String email, String password) async {
    _userHolder.isLoading = true;
    try {
      //Simulate fetching user data
      await Future.delayed(Duration(seconds: 10));

      _userHolder.value = User("Teddy", "Random", "random@teddy.com");
    } catch (error) {
      _userHolder.errorMsg = error.message;
    }
  }
}
