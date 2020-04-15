import 'package:githubclientapp/generated/json/base/json_convert_content.dart';
import 'package:githubclientapp/generated/json/base/json_filed.dart';

class UserEntity with JsonConvert<UserEntity> {
	String login;
	@JSONField(name: "avatar_url")
	String avatarUrl;
	String type;
	String name;
	String company;
	String blog;
	String location;
	String email;
	bool hireable;
	String bio;
	@JSONField(name: "public_repos")
	int publicRepos;
	int followers;
	int following;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "total_private_repos")
	int totalPrivateRepos;
	@JSONField(name: "owned_private_repos")
	int ownedPrivateRepos;
}
