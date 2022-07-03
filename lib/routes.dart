import 'package:flutter/widgets.dart';
import 'package:b_sure/home_nav.dart';
import 'package:b_sure/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:b_sure/screens/details/details_screen.dart';
import 'package:b_sure/screens/forgot_password/forgot_password_screen.dart';
import 'package:b_sure/screens/home/home_screen.dart';
import 'package:b_sure/screens/otp/otp_screen.dart';
import 'package:b_sure/screens/profile/profile_screen.dart';
import 'package:b_sure/screens/sign_in/sign_in_screen.dart';
import 'package:b_sure/screens/sign_up/sign_up_screen.dart';
import 'package:b_sure/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: ((context) => const SplashScreen()),
  SignInScreen.routeName: ((context) => const SignInScreen()),
  ForgotPasswordScreen.routeName: ((context) => const ForgotPasswordScreen()),
  SignUpScreen.routeName: ((context) => const SignUpScreen()),
  CompleteProfileScreen.routeName: ((context) => const CompleteProfileScreen()),
  OtpScreen.routeName: ((context) => const OtpScreen()),
  HomeScreen.routeName: ((context) => const HomeScreen()),
  DetailsScreen.routeName: ((context) => const DetailsScreen()),
  ProfileScreen.routeName: ((context) => const ProfileScreen()),
  HomeNavScreen.routeName: ((context) => const HomeNavScreen()),
};
