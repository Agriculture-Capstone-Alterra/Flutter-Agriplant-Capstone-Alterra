import 'package:capstone_project/providers/auth_provider.dart';
import 'package:capstone_project/widgets/autentikasi_widgets/regist_screen/form_regist_input.dart';
import 'package:capstone_project/widgets/autentikasi_widgets/regist_screen/regist_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  @override
  void initState() {
    // final authProvider = Provider.of<AuthProvider>(context);
    // authProvider.getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios_new),
              onTap: (){authProvider.pop(context);},
            ),
            centerTitle: true,
            title: Text(
              'Daftar',
              style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //regist username
                    FormRegistInput(
                      formLabel: 'regist username',
                      formController: authProvider.usernameRegistController,
                      hintText: authProvider.usernameRegistHint,
                      obscureText: authProvider.usernameRegistObscureText,
                      suffixIcon: authProvider.usernameRegistSuffixIcon,
                      onChangedSuffixIcon: (){},
                    ),

                    const SizedBox(height: 12,),

                    //regist email
                    FormRegistInput(
                      formLabel: 'regist email',
                      formController: authProvider.emailRegistController,
                      hintText: authProvider.emailRegistHint,
                      obscureText: authProvider.emailRegistObscureText,
                      suffixIcon: authProvider.emailRegistSuffixIcon,
                      onChangedSuffixIcon: (){},
                    ),

                    const SizedBox(height: 12,),

                    //regist password
                    FormRegistInput(
                      formLabel: 'regist password',
                      formController: authProvider.passwordRegistController,
                      hintText: authProvider.passwordRegistHint,
                      obscureText: authProvider.visiblePasswordRegist==false?
                      authProvider.passwordRegistObscureTextTrue :
                      authProvider.passwordRegistObscureTextFalse,
                      suffixIcon: authProvider.visiblePasswordRegist==false?
                      authProvider.passwordRegistSuffixIconOff :
                      authProvider.passwordRegistSuffixIconOn,
                      onChangedSuffixIcon: (){authProvider.showRegistPassword();},
                    ),

                    const SizedBox(height: 12,),

                    //regist konfirmasi password
                    FormRegistInput(
                      formLabel: 'regist konfirmasi password',
                      formController: authProvider.confirmPasswordRegistController,
                      hintText: authProvider.confirmPasswordRegistHint,
                      obscureText: authProvider.visiblePasswordConfirmRegist==false?
                      authProvider.confirmPasswordRegistObscureTextTrue :
                      authProvider.confirmPasswordRegistObscureTextFalse,
                      suffixIcon: authProvider.visiblePasswordConfirmRegist==false?
                      authProvider.confirmPasswordRegistSuffixIconOff :
                      authProvider.confirmPasswordRegistSuffixIconOn,
                      onChangedSuffixIcon: (){authProvider.showRegistConfirmPassword();},
                    ),

                    const SizedBox(height: 20,),

                    RegistButton(
                      textRegistButton: authProvider.textRegistButton,
                      buttonColor: authProvider.mainColor,
                      onTap: (){authProvider.register(context);},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}