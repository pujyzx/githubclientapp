import 'package:githubclientapp/generated/json/base/json_convert_content.dart';
import 'package:githubclientapp/generated/json/base/json_filed.dart';
import 'package:githubclientapp/model/user_entity.dart';

class RepoEntity with JsonConvert<RepoEntity> {
	int id;
	String name;
	@JSONField(name: "full_name")
	String fullName;
	UserEntity owner;
	String parent;
	bool private;
	String description;
	bool fork;
	String language;
	@JSONField(name: "forks_count")
	int forksCount;
	@JSONField(name: "stargazers_count")
	int stargazersCount;
	int size;
	@JSONField(name: "default_branch")
	String defaultBranch;
	@JSONField(name: "open_issues_count")
	int openIssuesCount;
	@JSONField(name: "pushed_at")
	String pushedAt;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "subscribers_count")
	int subscribersCount;
	RepoLicense license;
}

class RepoLicense with JsonConvert<RepoLicense> {
	String key;
	String name;
	@JSONField(name: "spdx_id")
	String spdxId;
	String url;
	@JSONField(name: "node_id")
	String nodeId;
}
