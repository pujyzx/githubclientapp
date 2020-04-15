import 'package:githubclientapp/model/cache_config_entity.dart';

cacheConfigEntityFromJson(CacheConfigEntity data, Map<String, dynamic> json) {
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

Map<String, dynamic> cacheConfigEntityToJson(CacheConfigEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['enable'] = entity.enable;
	data['maxAge'] = entity.maxAge;
	data['maxCount'] = entity.maxCount;
	return data;
}