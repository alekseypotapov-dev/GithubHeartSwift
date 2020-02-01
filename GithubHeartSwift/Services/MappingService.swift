import Foundation

struct MappingService {
    private let decoder = JSONDecoder()

    func mapRepositoriesJSON(data: Data) -> Result<[RepositoryItem], CustomError>  {
        do {
            let repositories = try decoder.decode(RepositoriesItem.self, from: data)
            return .success(repositories.items)
        } catch {
            return .failure(.decodeIssue)
        }
    }

    func mapContributorsJSON(data: Data) -> Result<[ContributorItem], CustomError>  {
        do {
            let contributors = try decoder.decode([ContributorItem].self, from: data)
            return .success(contributors)
        } catch {
            return .failure(.decodeIssue)
        }
    }
}

// mock??
func repositoryListJsonData() -> Data {
    return """
    {
      "total_count": 656645,
      "incomplete_results": false,
      "items": [
        {
          "id": 21700699,
          "node_id": "MDEwOlJlcG9zaXRvcnkyMTcwMDY5OQ==",
          "name": "awesome-ios",
          "full_name": "vsouza/awesome-ios",
          "private": false,
          "owner": {
            "login": "vsouza",
            "id": 484656,
            "node_id": "MDQ6VXNlcjQ4NDY1Ng==",
            "avatar_url": "https://avatars2.githubusercontent.com/u/484656?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/vsouza",
            "html_url": "https://github.com/vsouza",
            "followers_url": "https://api.github.com/users/vsouza/followers",
            "following_url": "https://api.github.com/users/vsouza/following{/other_user}",
            "gists_url": "https://api.github.com/users/vsouza/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/vsouza/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/vsouza/subscriptions",
            "organizations_url": "https://api.github.com/users/vsouza/orgs",
            "repos_url": "https://api.github.com/users/vsouza/repos",
            "events_url": "https://api.github.com/users/vsouza/events{/privacy}",
            "received_events_url": "https://api.github.com/users/vsouza/received_events",
            "type": "User",
            "site_admin": false
          },
          "html_url": "https://github.com/vsouza/awesome-ios",
          "description": "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects ",
          "fork": false,
          "url": "https://api.github.com/repos/vsouza/awesome-ios",
          "forks_url": "https://api.github.com/repos/vsouza/awesome-ios/forks",
          "keys_url": "https://api.github.com/repos/vsouza/awesome-ios/keys{/key_id}",
          "collaborators_url": "https://api.github.com/repos/vsouza/awesome-ios/collaborators{/collaborator}",
          "teams_url": "https://api.github.com/repos/vsouza/awesome-ios/teams",
          "hooks_url": "https://api.github.com/repos/vsouza/awesome-ios/hooks",
          "issue_events_url": "https://api.github.com/repos/vsouza/awesome-ios/issues/events{/number}",
          "events_url": "https://api.github.com/repos/vsouza/awesome-ios/events",
          "assignees_url": "https://api.github.com/repos/vsouza/awesome-ios/assignees{/user}",
          "branches_url": "https://api.github.com/repos/vsouza/awesome-ios/branches{/branch}",
          "tags_url": "https://api.github.com/repos/vsouza/awesome-ios/tags",
          "blobs_url": "https://api.github.com/repos/vsouza/awesome-ios/git/blobs{/sha}",
          "git_tags_url": "https://api.github.com/repos/vsouza/awesome-ios/git/tags{/sha}",
          "git_refs_url": "https://api.github.com/repos/vsouza/awesome-ios/git/refs{/sha}",
          "trees_url": "https://api.github.com/repos/vsouza/awesome-ios/git/trees{/sha}",
          "statuses_url": "https://api.github.com/repos/vsouza/awesome-ios/statuses/{sha}",
          "languages_url": "https://api.github.com/repos/vsouza/awesome-ios/languages",
          "stargazers_url": "https://api.github.com/repos/vsouza/awesome-ios/stargazers",
          "contributors_url": "https://api.github.com/repos/vsouza/awesome-ios/contributors",
          "subscribers_url": "https://api.github.com/repos/vsouza/awesome-ios/subscribers",
          "subscription_url": "https://api.github.com/repos/vsouza/awesome-ios/subscription",
          "commits_url": "https://api.github.com/repos/vsouza/awesome-ios/commits{/sha}",
          "git_commits_url": "https://api.github.com/repos/vsouza/awesome-ios/git/commits{/sha}",
          "comments_url": "https://api.github.com/repos/vsouza/awesome-ios/comments{/number}",
          "issue_comment_url": "https://api.github.com/repos/vsouza/awesome-ios/issues/comments{/number}",
          "contents_url": "https://api.github.com/repos/vsouza/awesome-ios/contents/{+path}",
          "compare_url": "https://api.github.com/repos/vsouza/awesome-ios/compare/{base}...{head}",
          "merges_url": "https://api.github.com/repos/vsouza/awesome-ios/merges",
          "archive_url": "https://api.github.com/repos/vsouza/awesome-ios/{archive_format}{/ref}",
          "downloads_url": "https://api.github.com/repos/vsouza/awesome-ios/downloads",
          "issues_url": "https://api.github.com/repos/vsouza/awesome-ios/issues{/number}",
          "pulls_url": "https://api.github.com/repos/vsouza/awesome-ios/pulls{/number}",
          "milestones_url": "https://api.github.com/repos/vsouza/awesome-ios/milestones{/number}",
          "notifications_url": "https://api.github.com/repos/vsouza/awesome-ios/notifications{?since,all,participating}",
          "labels_url": "https://api.github.com/repos/vsouza/awesome-ios/labels{/name}",
          "releases_url": "https://api.github.com/repos/vsouza/awesome-ios/releases{/id}",
          "deployments_url": "https://api.github.com/repos/vsouza/awesome-ios/deployments",
          "created_at": "2014-07-10T16:03:45Z",
          "updated_at": "2020-01-30T18:24:31Z",
          "pushed_at": "2020-01-29T21:55:06Z",
          "git_url": "git://github.com/vsouza/awesome-ios.git",
          "ssh_url": "git@github.com:vsouza/awesome-ios.git",
          "clone_url": "https://github.com/vsouza/awesome-ios.git",
          "svn_url": "https://github.com/vsouza/awesome-ios",
          "homepage": "http://awesomeios.com",
          "size": 10948,
          "stargazers_count": 33984,
          "watchers_count": 33984,
          "language": "Swift",
          "has_issues": true,
          "has_projects": false,
          "has_downloads": true,
          "has_wiki": false,
          "has_pages": false,
          "forks_count": 5740,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 14,
          "license": {
            "key": "mit",
            "name": "MIT License",
            "spdx_id": "MIT",
            "url": "https://api.github.com/licenses/mit",
            "node_id": "MDc6TGljZW5zZTEz"
          },
          "forks": 5740,
          "open_issues": 14,
          "watchers": 33984,
          "default_branch": "master",
          "score": 1.0
        },
        {
          "id": 22458259,
          "node_id": "MDEwOlJlcG9zaXRvcnkyMjQ1ODI1OQ==",
          "name": "Alamofire",
          "full_name": "Alamofire/Alamofire",
          "private": false,
          "owner": {
            "login": "Alamofire",
            "id": 7774181,
            "node_id": "MDEyOk9yZ2FuaXphdGlvbjc3NzQxODE=",
            "avatar_url": "https://avatars3.githubusercontent.com/u/7774181?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/Alamofire",
            "html_url": "https://github.com/Alamofire",
            "followers_url": "https://api.github.com/users/Alamofire/followers",
            "following_url": "https://api.github.com/users/Alamofire/following{/other_user}",
            "gists_url": "https://api.github.com/users/Alamofire/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/Alamofire/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/Alamofire/subscriptions",
            "organizations_url": "https://api.github.com/users/Alamofire/orgs",
            "repos_url": "https://api.github.com/users/Alamofire/repos",
            "events_url": "https://api.github.com/users/Alamofire/events{/privacy}",
            "received_events_url": "https://api.github.com/users/Alamofire/received_events",
            "type": "Organization",
            "site_admin": false
          },
          "html_url": "https://github.com/Alamofire/Alamofire",
          "description": "Elegant HTTP Networking in Swift",
          "fork": false,
          "url": "https://api.github.com/repos/Alamofire/Alamofire",
          "forks_url": "https://api.github.com/repos/Alamofire/Alamofire/forks",
          "keys_url": "https://api.github.com/repos/Alamofire/Alamofire/keys{/key_id}",
          "collaborators_url": "https://api.github.com/repos/Alamofire/Alamofire/collaborators{/collaborator}",
          "teams_url": "https://api.github.com/repos/Alamofire/Alamofire/teams",
          "hooks_url": "https://api.github.com/repos/Alamofire/Alamofire/hooks",
          "issue_events_url": "https://api.github.com/repos/Alamofire/Alamofire/issues/events{/number}",
          "events_url": "https://api.github.com/repos/Alamofire/Alamofire/events",
          "assignees_url": "https://api.github.com/repos/Alamofire/Alamofire/assignees{/user}",
          "branches_url": "https://api.github.com/repos/Alamofire/Alamofire/branches{/branch}",
          "tags_url": "https://api.github.com/repos/Alamofire/Alamofire/tags",
          "blobs_url": "https://api.github.com/repos/Alamofire/Alamofire/git/blobs{/sha}",
          "git_tags_url": "https://api.github.com/repos/Alamofire/Alamofire/git/tags{/sha}",
          "git_refs_url": "https://api.github.com/repos/Alamofire/Alamofire/git/refs{/sha}",
          "trees_url": "https://api.github.com/repos/Alamofire/Alamofire/git/trees{/sha}",
          "statuses_url": "https://api.github.com/repos/Alamofire/Alamofire/statuses/{sha}",
          "languages_url": "https://api.github.com/repos/Alamofire/Alamofire/languages",
          "stargazers_url": "https://api.github.com/repos/Alamofire/Alamofire/stargazers",
          "contributors_url": "https://api.github.com/repos/Alamofire/Alamofire/contributors",
          "subscribers_url": "https://api.github.com/repos/Alamofire/Alamofire/subscribers",
          "subscription_url": "https://api.github.com/repos/Alamofire/Alamofire/subscription",
          "commits_url": "https://api.github.com/repos/Alamofire/Alamofire/commits{/sha}",
          "git_commits_url": "https://api.github.com/repos/Alamofire/Alamofire/git/commits{/sha}",
          "comments_url": "https://api.github.com/repos/Alamofire/Alamofire/comments{/number}",
          "issue_comment_url": "https://api.github.com/repos/Alamofire/Alamofire/issues/comments{/number}",
          "contents_url": "https://api.github.com/repos/Alamofire/Alamofire/contents/{+path}",
          "compare_url": "https://api.github.com/repos/Alamofire/Alamofire/compare/{base}...{head}",
          "merges_url": "https://api.github.com/repos/Alamofire/Alamofire/merges",
          "archive_url": "https://api.github.com/repos/Alamofire/Alamofire/{archive_format}{/ref}",
          "downloads_url": "https://api.github.com/repos/Alamofire/Alamofire/downloads",
          "issues_url": "https://api.github.com/repos/Alamofire/Alamofire/issues{/number}",
          "pulls_url": "https://api.github.com/repos/Alamofire/Alamofire/pulls{/number}",
          "milestones_url": "https://api.github.com/repos/Alamofire/Alamofire/milestones{/number}",
          "notifications_url": "https://api.github.com/repos/Alamofire/Alamofire/notifications{?since,all,participating}",
          "labels_url": "https://api.github.com/repos/Alamofire/Alamofire/labels{/name}",
          "releases_url": "https://api.github.com/repos/Alamofire/Alamofire/releases{/id}",
          "deployments_url": "https://api.github.com/repos/Alamofire/Alamofire/deployments",
          "created_at": "2014-07-31T05:56:19Z",
          "updated_at": "2020-01-30T12:20:35Z",
          "pushed_at": "2020-01-30T01:25:06Z",
          "git_url": "git://github.com/Alamofire/Alamofire.git",
          "ssh_url": "git@github.com:Alamofire/Alamofire.git",
          "clone_url": "https://github.com/Alamofire/Alamofire.git",
          "svn_url": "https://github.com/Alamofire/Alamofire",
          "homepage": "",
          "size": 13361,
          "stargazers_count": 32769,
          "watchers_count": 32769,
          "language": "Swift",
          "has_issues": true,
          "has_projects": true,
          "has_downloads": true,
          "has_wiki": false,
          "has_pages": true,
          "forks_count": 5984,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 34,
          "license": {
            "key": "mit",
            "name": "MIT License",
            "spdx_id": "MIT",
            "url": "https://api.github.com/licenses/mit",
            "node_id": "MDc6TGljZW5zZTEz"
          },
          "forks": 5984,
          "open_issues": 34,
          "watchers": 32769,
          "default_branch": "master",
          "score": 1.0
        }
      ]
    }
    """.data(using: .utf8)!
}

func contributorListJsonData() -> Data {
    return """
    [
        {
            "login": "lfarah",
            "id": 6511079,
            "node_id": "MDQ6VXNlcjY1MTEwNzk=",
            "avatar_url": "https://avatars0.githubusercontent.com/u/6511079?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/lfarah",
            "html_url": "https://github.com/lfarah",
            "followers_url": "https://api.github.com/users/lfarah/followers",
            "following_url": "https://api.github.com/users/lfarah/following{/other_user}",
            "gists_url": "https://api.github.com/users/lfarah/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/lfarah/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/lfarah/subscriptions",
            "organizations_url": "https://api.github.com/users/lfarah/orgs",
            "repos_url": "https://api.github.com/users/lfarah/repos",
            "events_url": "https://api.github.com/users/lfarah/events{/privacy}",
            "received_events_url": "https://api.github.com/users/lfarah/received_events",
            "type": "User",
            "site_admin": false,
            "contributions": 1896
        },
        {
            "login": "vsouza",
            "id": 484656,
            "node_id": "MDQ6VXNlcjQ4NDY1Ng==",
            "avatar_url": "https://avatars2.githubusercontent.com/u/484656?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/vsouza",
            "html_url": "https://github.com/vsouza",
            "followers_url": "https://api.github.com/users/vsouza/followers",
            "following_url": "https://api.github.com/users/vsouza/following{/other_user}",
            "gists_url": "https://api.github.com/users/vsouza/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/vsouza/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/vsouza/subscriptions",
            "organizations_url": "https://api.github.com/users/vsouza/orgs",
            "repos_url": "https://api.github.com/users/vsouza/repos",
            "events_url": "https://api.github.com/users/vsouza/events{/privacy}",
            "received_events_url": "https://api.github.com/users/vsouza/received_events",
            "type": "User",
            "site_admin": false,
            "contributions": 863
        }
    ]
    """.data(using: .utf8)!
}
