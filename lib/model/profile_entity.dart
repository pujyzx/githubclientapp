import 'package:githubclientapp/generated/json/base/json_convert_content.dart';
import 'package:githubclientapp/generated/json/base/json_filed.dart';
import 'package:githubclientapp/model/user_entity.dart';

class ProfileEntity with JsonConvert<ProfileEntity> {
	UserEntity user;
	String token;
	int theme;
	ProfileCache cache;
	String lastLogin;
	String locale;
}
class ProfileCache with JsonConvert<ProfileCache> {
	bool enable;
	int maxAge;
	int maxCount;
}
