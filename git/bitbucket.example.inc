# ~/.config/git/bitbucket.inc
# Included when remote.origin.url points to bitbucket.org (any local path)

[user]
	name  = BitbucketUserName
	email = bitbucket-email@bitbucket.org
	signingkey = YYYYYYYYYYYYYYYY

[commit]
	gpgsign = true

[url "git@bitbucket.org:"]
	insteadOf = https://bitbucket.org/
