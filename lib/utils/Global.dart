import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubclientapp/generated/json/base/json_convert_content.dart';
import 'package:githubclientapp/model/CacheObject.dart';
import 'package:githubclientapp/model/profile_entity.dart';
import 'package:githubclientapp/utils/Git.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences _prefs;
  static NetCache netCache=new NetCache();
  static List<MaterialColor> get themes => _themes;
  static ProfileEntity profile = ProfileEntity();
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    _prefs=await SharedPreferences.getInstance();
    var _profile=_prefs.getString("profile");
    if (_profile != null) {
      try {
        profile =JsonConvert.fromJsonAsT<ProfileEntity>(jsonDecode(_profile)) ;
      } catch (e) {
        print(e);
      }
    }
    profile.cache=profile.cache??ProfileCache()
    ..enable=true
    ..maxAge=3600
    ..maxCount=100;
    Git.init();
  }
  static saveProfile()=>
      _prefs.setString("profie",jsonEncode(profile.toJson()));
}
