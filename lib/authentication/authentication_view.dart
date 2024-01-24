import 'package:app/authentication/signin/signin.dart';
import 'package:app/authentication/signup/signup.dart';
import 'package:app/widgets/animations/slide_fade_switcher.dart';
import 'package:app/widgets/auth_switch_buttton/auth_switch_buttton.dart';
import 'package:app/widgets/responsive_layout_widget/responsive_layout_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true;
  @override
  Widget build(BuildContext context) {
    // EdgeInsets edgeInsets = MediaQuery.of(context).viewInsets;
    // EdgeInsets padding = MediaQuery.of(context).padding;
    return ResponsiveLayoutWidget(
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                250,
                16,
                0,
              ),
              child: SlideFadeSwitcher(
                  child: _showSignIn ? const SignIn() : const SignUp()),
            ),
            AuthSwitchButton(
                showSignIn: _showSignIn,
                onTap: () {
                  setState(() {
                    _showSignIn = !_showSignIn;
                  });
                })
          ],
        ),
      ),
      webAndDesktop: Scaffold(
        // resizeToAvoidBottomInset: false,
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        body: _showSignIn ? const SignIn() : const SignUp(),
      ),
    );
  }
}
