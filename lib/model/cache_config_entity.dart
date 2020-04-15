import 'package:githubclientapp/generated/json/base/json_convert_content.dart';

class CacheConfigEntity with JsonConvert<CacheConfigEntity> {
	bool enable;
	int maxAge;
	int maxCount;
}
