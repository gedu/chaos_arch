import 'package:holder_arch/src/common/base_holder.dart';
import 'package:holder_arch/src/common/model/user.dart';
import 'package:holder_arch/src/user_remote_data_source.dart';
import 'package:holder_arch/src/user_repository.dart';
import 'package:holder_arch/src/user_view_model.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...bridgeServices,
  ...dependentServices,
  ...uiProviders,
];

//When gets bigger split into many files

List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider<Holder<User>>(builder: (_) => Holder<User>()),
];

List<SingleChildCloneableWidget> bridgeServices = [
  ProxyProvider<Holder<User>, UserRemoteDataSource>(
    builder: (context, userHolder, remoteSource) =>
        UserRemoteDataSource(userHolder),
  ),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<UserRemoteDataSource, UserRepository>(
    builder: (context, remoteSource, repository) =>
        UserRepository(remoteSource),
  ),
];

List<SingleChildCloneableWidget> uiProviders = [
  ProxyProvider2<Holder<User>, UserRepository, UserViewModel>(
    builder: (context, userHolder, repository, viewModel) =>
        UserViewModel(userHolder, repository),
  ),
];
