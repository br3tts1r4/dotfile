# ~/.config/git/github.inc
# Included when remote.origin.url points to github.com (any local path)

[user]
	name  = Your Name
	email = you@users.noreply.github.com
	# GPG key fingerprint (optional; remove signingkey + commit.gpgsign if unused)
	signingkey = XXXXXXXXXXXXXXXX

[commit]
	gpgsign = true

[url "git@github.com:"]
	insteadOf = https://github.com/
