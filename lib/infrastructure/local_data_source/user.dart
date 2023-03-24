import 'package:flutter/material.dart';

class UserDetailsLocal {
  static String storageBaseUrl = 'https://pgsedu.com/EduPro/public/storage/';
  static String apiToken = '';
  static String userId = '';
  static String userName = '';
  static String userEmail = '';
  static String userMobile = '';
  static String userDob = '';
  static String type ='';
  static String userAddress = '';
  static String userImageUrl = '';

  static ValueNotifier userImageUrlValueNotifier = ValueNotifier("");

  static void set(
      String token,
      String id,
      String name,
      String email,
      String mobile,
      String dob,
      String type,
      String address,
      String imageUrl,

      ) {
    apiToken = token;
    userId = id;
    userName = name;
    userEmail = email;
    userMobile = mobile;
    userDob = dob;
    type = type;
    userAddress = address;
    userImageUrl = imageUrl;
  }

  static void setImageUrl(String value) {
    userImageUrl = value;
  }
}