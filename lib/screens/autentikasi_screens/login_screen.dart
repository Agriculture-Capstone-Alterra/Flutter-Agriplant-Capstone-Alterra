import 'package:capstone_project/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/autentikasi_widgets/login_screen/form_login_input.dart';
import '../../widgets/autentikasi_widgets/login_screen/login_button.dart';
import '../../widgets/autentikasi_widgets/login_screen/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  // void initState() {
  //   Provider.of<AuthProvider>(context, listen: false).splashScreenIsChanged();
  //   Provider.of<AuthProvider>(context, listen: false).splashScreenDone();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context){
    // Provider.of<AuthProvider>(context).splashScreenIsChanged();
    // Provider.of<AuthProvider>(context).splashScreenDone();
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: authProvider.mainColor,
            ),
          ),
          body:
          Center(
            child: ListView(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children :[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Image.asset(
                    authProvider.logoApkDiHalamanLogin,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                const SizedBox(height: 76,),

                //input username or email
                FormLoginInput(
                  formLabel: 'input username or email',
                  formController: authProvider.usernameContorller,
                  hintText: authProvider.usernameOrEmailHint,
                  obscureText: authProvider.usernameObscureText,
                  suffixIcon: authProvider.usernameSuffixIcon,
                  onChangedSuffixIcon: (){},
                ),

                const SizedBox(height: 12,),

                //input password
                FormLoginInput(
                  formLabel: 'input password',
                  formController: authProvider.passwordController,
                  hintText: authProvider.passwordHint,
                  obscureText: authProvider.visiblePassword==false?
                  authProvider.passwordObscureTextTrue :
                  authProvider.passwordObscureTextFalse,
                  suffixIcon: authProvider.visiblePassword==false?
                  authProvider.passwordSuffixIconOff :
                  authProvider.passwordSuffixIconOn,
                  onChangedSuffixIcon: (){authProvider.showPassword();},
                ),

                const SizedBox(height: 20,),

                LoginButton(
                  textLoginButton: authProvider.textLoginButton,
                  buttonColor: authProvider.mainColor,
                  onTap: (){authProvider.postLogin(context);},
                ),

                const SizedBox(height: 20,),

                Registration(
                  question: authProvider.haveNoAccount,
                  textRegist: authProvider.textRegist,
                  textRegistColor: authProvider.textRegistColor,
                  onTap: (){
                    authProvider.onRegist(context);
                  },
                ),
              ]
            ),
          ),
        );
      },
    );
  }
}