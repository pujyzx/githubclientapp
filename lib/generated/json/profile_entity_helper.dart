import 'package:githubclientapp/model/profile_entity.dart';
import 'package:githubclientapp/model/user_entity.dart';

profileEntityFromJson(ProfileEntity data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = new UserEntity().fromJson(json['user']);
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['theme'] != null) {
		data.theme = json['theme']?.toInt();
	}
	if (json['cache'] != null) {
		data.cache = new ProfileCache().fromJson(json['cache']);
	}
	if (json['lastLogin'] != null) {
		data.lastLogin = json['lastLogin']?.toString();
	}
	if (json['locale'] != null) {
		data.locale = json['locale']?.toString();
	}
	return data;
}

Map<String, dynamic> profileEntityToJson(ProfileEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	data['token'] = entity.token;
	data['theme'] = entity.theme;
	if (entity.cache != null) {
		data['cache'] = entity.cache.toJson();
	}
	data['lastLogin'] = entity.lastLogin;
	data['locale'] = entity.locale;
	return data;
}

profileCacheFromJson(ProfileCache data, Map<String, dynamic> json) {
	if (json['enable'] != null) {
		data.enable = json['enable'];
	}
	if (json['maxAge'] != null) {
		data.maxAge = json['maxAge']?.toInt();
	}
	if (json['maxCount'] != null) {
		data.maxCount = json['maxCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> profileCacheToJson(ProfileCache entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['enable'] = entity.enable;
	data['maxAge'] = entity.maxAge;
	data['maxCount'] = entity.maxCount;
	return data;
}