import 'package:flutter/material.dart';
import 'package:githubclientapp/i10n/localization_intl.dart';
import 'package:githubclientapp/model/user_entity.dart';
import 'package:githubclientapp/states/ProfileChangeNotifier.dart';
import 'package:githubclientapp/utils/Git.dart';
import 'package:githubclientapp/utils/Global.dart';
import 'package:githubclientapp/utils/funs.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _usernameController.text = Global.profile.lastLogin;
    if (_usernameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(gm.login)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Wrap(children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                    autofocus: _nameAutoFocus,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: gm.userName,
                      hintText: gm.userName,
                      prefixIcon: Icon(Icons.person),
                    ),
                    // 校验用户名（不能为空）
                    validator: (v) {
                      return v.trim().isNotEmpty ? null : gm.userNameRequired;
                    }),
                TextFormField(
                  controller: _pwdController,
                  autofocus: !_nameAutoFocus,
                  decoration: InputDecoration(
                      labelText: gm.password,
                      hintText: gm.password,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        },
                      )),
                  obscureText: !pwdShow,
                  //校验密码（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : gm.passwordRequired;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: _onLogin,
                      textColor: Colors.white,
                      child: Text(gm.login),
                    ),
                  ),
                ),
              ],
            ),
          ],)

        ),
      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
      UserEntity user;
      try {
        user = await Git(context).login(_usernameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
//        print("login error===>"+e.toString());
        //登录失败则提示
        if (e.response?.statusCode == 401) {
          showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
        } else {
          showToast(e.toString());
        }
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
//      print("user is-->"+user.toJson().toString());
      if (user != null) {
        // 返回
        Navigator.of(context).pop();
      }
    }
  }
}