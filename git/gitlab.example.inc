# ~/.config/git/gitlab.inc
# Included when remote.origin.url points to gitlab.com (any local path)

[user]
	name  = GitLabUserName
	email = gitlab-email@gitlab.com
	signingkey = XXXXXXXXXXXXXXXX

[commit]
	gpgsign = true

[url "git@gitlab.com:"]
	insteadOf = https://gitlab.com/
