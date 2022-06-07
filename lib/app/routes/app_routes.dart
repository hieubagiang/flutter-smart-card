part of 'app_pages.dart';

abstract class RouteList {
  static const welcome = '/welcome';
  static const signIn = '/login';
  static const signInWithEmail = '/login/email';
  static const signInWithPhone = '/login/phone';
  static const verifyPhoneNumberScreen = '/login/phone/verify';
  static const signUp = '/sign-up';
  static const hobby = '/hobby';
  static const main = '/main';
  static const search = '/main/feed';
  static const matches = '/main/matches';
  static const message = '/main/message';
  static const profile = '/main/profile';
  static const setting = '/main/profile/setting';
  static const edit = '/main/profile/edit';
  static const userProfile = '/main/feed/userProfile';
  static const detailMessage = '/main/message/detail';
  static const payment = '/payment';
  static const premiumInit = '/premium';
  static const admin = '/admin';
  static const connectCard = '/connect_card';
}
