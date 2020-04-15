import 'package:githubclientapp/model/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['login'] != null) {
		data.login = json['login']?.toString();
	}
	if (json['avatar_url'] != null) {
		data.avatarUrl = json['avatar_url']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['company'] != null) {
		data.company = json['company']?.toString();
	}
	if (json['blog'] != null) {
		data.blog = json['blog']?.toString();
	}
	if (json['location'] != null) {
		data.location = json['location']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['hireable'] != null) {
		data.hireable = json['hireable'];
	}
	if (json['bio'] != null) {
		data.bio = json['bio']?.toString();
	}
	if (json['public_repos'] != null) {
		data.publicRepos = json['public_repos']?.toInt();
	}
	if (json['followers'] != null) {
		data.followers = json['followers']?.toInt();
	}
	if (json['following'] != null) {
		data.following = json['following']?.toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['total_private_repos'] != null) {
		data.totalPrivateRepos = json['total_private_repos']?.toInt();
	}
	if (json['owned_private_repos'] != null) {
		data.ownedPrivateRepos = json['owned_private_repos']?.toInt();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['login'] = entity.login;
	data['avatar_url'] = entity.avatarUrl;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['company'] = entity.company;
	data['blog'] = entity.blog;
	data['location'] = entity.location;
	data['email'] = entity.email;
	data['hireable'] = entity.hireable;
	data['bio'] = entity.bio;
	data['public_repos'] = entity.publicRepos;
	data['followers'] = entity.followers;
	data['following'] = entity.following;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['total_private_repos'] = entity.totalPrivateRepos;
	data['owned_private_repos'] = entity.ownedPrivateRepos;
	return data;
}