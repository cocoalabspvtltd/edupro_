import 'package:pgs_edupro/infrastructure/remote_data/models/auth/user_login_response.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/profile/get_my_profile_response.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _preferences;
  static String spToken = 'spToken';
  static String spUserId = 'spUserId';
  static String spEmail = 'spEmail';
  static String spName = 'spName';
  static String spMobile = 'spMobile';
  static String spAddress = 'spAddress';
  static String spDob = 'spDob';
  static String spType = 'spType';
  static String spUserImageUrl = 'spUserImageUrl';
  static String spUserStatus = 'spUserStatus';
  static String spPaymentStatus = 'spPaymentStatus';
  static String spSuscriptionPeriod = 'spSuscriptionPeriod';
  static String spuserstatus ='spuserstatus';

  static init() async {
    _preferences = await SharedPreferences.getInstance();
    UserDetailsLocal.set(
        getString(spToken),
        getString(spUserId),
        getString(spName),
        getString(spEmail),
        getString(spMobile),
        getString(spDob),
        getString(spAddress),
        getString(spUserImageUrl),
        getString(spUserStatus));
  }

  static String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static Future<bool> logIn(UserLogInResponse response) async {
    if (response.user == null) return false;

    String token = response.token ?? UserDetailsLocal.apiToken;
    UserDetails userDetails = response.user!;

    await setString(spToken,token);
    await setString(spUserId, '${userDetails.id ?? ''}');
    await setString(spEmail, userDetails.email ?? '');
    await setString(spName, userDetails.name ?? '');
    await setString(spMobile, userDetails.phoneNumber ?? '');
    await setString(spAddress, userDetails.address ?? '');
    await setString(spDob, userDetails.dob ?? '');
    await setString(spUserStatus, userDetails.userStatus ?? '');
    await setString(spPaymentStatus, userDetails.paymentStatus ?? 'false');
    UserDetailsLocal.set(
        token,
      userDetails.id.toString() ?? '',
      userDetails.name ?? '',
      userDetails.email ?? '',
      userDetails.phoneNumber ?? '',
      userDetails.dob ?? '',
      userDetails.address ?? '',
      '',''
    );
    return true;
  }

  static Future<bool> setData(MyProfileResponse response) async {
   if (response.user == null) return false;


   String token = UserDetailsLocal.apiToken;

    User userDetails = response.user!;

    await setString(spToken, token);
    await setString(spUserId, '${userDetails.id ?? ''}');
    await setString(spEmail, userDetails.email ?? '');
    await setString(spName, userDetails.name ?? '');
    await setString(spMobile, userDetails.phoneNumber ?? '');
    await setString(spAddress, userDetails.description ?? '');
    await setString(spDob, userDetails.qualification ?? '');
    await setString(spUserStatus, userDetails.instituteName ?? '');
    await setString(spUserImageUrl, userDetails.profilePhoto ?? '');

    UserDetailsLocal.setData(
token,
        '${userDetails.id ?? ''}',
        userDetails.name ?? '',
        userDetails.email ?? '',
        userDetails.phoneNumber ?? '',
        userDetails.qualification ?? '',
        userDetails.instituteName ?? '',
        userDetails.profilePhoto ??"",""
    );
    return true;
  }

  static Future<bool> logOut() async {
    await _preferences.clear();
    UserDetailsLocal.set('', '', '', '', '', '', '', '',"");
    Get.offAll(() => const LogInScreen());
    return true;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }
}
