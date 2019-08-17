import 'package:flutter/material.dart';
import 'package:holder_arch/src/common/base_holder.dart';
import 'package:holder_arch/src/common/model/user.dart';
import 'package:holder_arch/src/common/widgets/centered_main_app_title.dart';
import 'package:holder_arch/src/user_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static final _signInformKey = GlobalKey<FormState>();

  final mailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  UserViewModel _viewModel;

  @override
  void dispose() {
    mailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of(context);

    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Form(
        key: _signInformKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CenteredMainAppTitle(),
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mail",
                    ),
                    controller: mailTextController,
                  ),
                  _space(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    controller: passwordTextController,
                  ),
                ],
              ),
//            _signInButton(),
              HolderBuilder<User>(
                holder: _viewModel.user,
                builder: (context, holder) {
                  print('ASIS> Is loading: ${holder.isLoading}');
                  if (holder.isLoading) {
                    return Text('Loading...');
                  }

                  print('ASIS> Is Value Valid: ${holder.isValueValid}');
                  if (holder.isValueValid) {
                    return Text(holder.value.email);
                  }

                  print('ASIS> hasError: ${holder.hasError}');
                  if (holder.hasError) {
                    return Text(holder.errorMsg);
                  }

                  return _signInButton();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _space() {
    return Container(
      height: 20,
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 4,
          bottom: 4,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text("Recuperar Contrasena"),
        ),
      ),
    );
  }

//  Widget _handleSignIn(User user, bool isLoading, String error) {}

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {
              print("CLICK");
              if (_signInformKey.currentState.validate()) {
                _viewModel.signInWith(
                  mailTextController.text,
                  passwordTextController.text,
                );
              }
            },
            child: Text(
              "Iniciar Sesion",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
