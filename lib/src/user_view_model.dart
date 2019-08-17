import 'package:holder_arch/src/common/base_holder.dart';
import 'package:holder_arch/src/common/model/user.dart';
import 'package:holder_arch/src/user_repository.dart';

class UserViewModel {
  ImmutableHolder<User> user;
  UserRepository _userRepository;

  UserViewModel(this.user, this._userRepository);

  void signInWith(String email, String password) {
    _userRepository.signInWith(email, password);
  }
}
