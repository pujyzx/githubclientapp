import 'package:githubclientapp/model/repo_entity.dart';
import 'package:githubclientapp/model/user_entity.dart';

repoEntityFromJson(RepoEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['full_name'] != null) {
		data.fullName = json['full_name']?.toString();
	}
	if (json['owner'] != null) {
		data.owner = new UserEntity().fromJson(json['owner']);
	}
	if (json['parent'] != null) {
		data.parent = json['parent']?.toString();
	}
	if (json['private'] != null) {
		data.private = json['private'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['fork'] != null) {
		data.fork = json['fork'];
	}
	if (json['language'] != null) {
		data.language = json['language']?.toString();
	}
	if (json['forks_count'] != null) {
		data.forksCount = json['forks_count']?.toInt();
	}
	if (json['stargazers_count'] != null) {
		data.stargazersCount = json['stargazers_count']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['default_branch'] != null) {
		data.defaultBranch = json['default_branch']?.toString();
	}
	if (json['open_issues_count'] != null) {
		data.openIssuesCount = json['open_issues_count']?.toInt();
	}
	if (json['pushed_at'] != null) {
		data.pushedAt = json['pushed_at']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['subscribers_count'] != null) {
		data.subscribersCount = json['subscribers_count']?.toInt();
	}
	if (json['license'] != null) {
		data.license = new RepoLicense().fromJson(json['license']);
	}
	return data;
}

Map<String, dynamic> repoEntityToJson(RepoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['full_name'] = entity.fullName;
	if (entity.owner != null) {
		data['owner'] = entity.owner.toJson();
	}
	data['parent'] = entity.parent;
	data['private'] = entity.private;
	data['description'] = entity.description;
	data['fork'] = entity.fork;
	data['language'] = entity.language;
	data['forks_count'] = entity.forksCount;
	data['stargazers_count'] = entity.stargazersCount;
	data['size'] = entity.size;
	data['default_branch'] = entity.defaultBranch;
	data['open_issues_count'] = entity.openIssuesCount;
	data['pushed_at'] = entity.pushedAt;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['subscribers_count'] = entity.subscribersCount;
	if (entity.license != null) {
		data['license'] = entity.license.toJson();
	}
	return data;
}

repoLicenseFromJson(RepoLicense data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['spdx_id'] != null) {
		data.spdxId = json['spdx_id']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['node_id'] != null) {
		data.nodeId = json['node_id']?.toString();
	}
	return data;
}

Map<String, dynamic> repoLicenseToJson(RepoLicense entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['name'] = entity.name;
	data['spdx_id'] = entity.spdxId;
	data['url'] = entity.url;
	data['node_id'] = entity.nodeId;
	return data;
}