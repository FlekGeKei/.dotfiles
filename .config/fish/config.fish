if status is-login
	set -U fish_greeting

	if not set -q TMUX
		uwsm check may-start
		uwsm select
		uwsm start default
	end

	# PATHS
	fish_add_path ~/.local/bin
	fish_add_path ~/.cargo/binc
end

if status is-interactive
	# ENVS
	set -gx FZF_DEFAULT_OPTS "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#313244,label:#CDD6F4"
	set -gx EDITOR "nvim"
	set -gx CARGO_NET_GIT_FETCH_WITH_CLI true

	# FUNCS
	alias l="ls -la"
	alias y="yazi"
	alias f="fzf --preview 'fzf-preview {}'"

	# STARSHIP
	function starship_transient_rprompt_func
		starship module time
	end
	starship init fish | source
	enable_transience
end
