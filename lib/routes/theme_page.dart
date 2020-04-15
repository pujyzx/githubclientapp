
import 'package:flutter/material.dart';
import 'package:githubclientapp/i10n/localization_intl.dart';
import 'package:githubclientapp/states/ProfileChangeNotifier.dart';
import 'package:githubclientapp/utils/Global.dart';
import 'package:provider/provider.dart';

class ThemeChangeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(GmLocalizations.of(context).language)),
      body: ListView(
        children: Global.themes.map<Widget>((w){
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
              child: Container(
                color: w,
                height: 40,
              ),
            ),
            onTap: (){
//              print("tab ic===》${w.value}");
              Provider.of<ThemeModel>(context).theme = w;
            },
          );
        }).toList() //toList将map后的widgets转换成list ,
      ),
    );
  }
}
