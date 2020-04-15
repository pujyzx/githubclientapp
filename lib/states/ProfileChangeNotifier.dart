import 'package:flutter/material.dart';
import 'package:githubclientapp/model/profile_entity.dart';
import 'package:githubclientapp/utils/Global.dart';
import 'package:githubclientapp/model/user_entity.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  ProfileEntity get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
class LocaleModel extends ProfileChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => _profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme =>
      Global.themes
          .firstWhere((theme) => theme.value == _profile.theme,
          orElse: ()=>Colors.blue);
  set theme(ColorSwatch color){
    if(color !=theme){
      _profile.theme=color[500].value;
      notifyListeners();
    }
  }
}
class UserModel extends ProfileChangeNotifier {
  UserEntity get userBean => _profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => userBean != null;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(UserEntity userEntity) {
    if (userEntity?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = userEntity;
      notifyListeners();
    }
  }
}