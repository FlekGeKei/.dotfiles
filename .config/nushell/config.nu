if ($env.TMUX? == null) {
	try {
		uwsm check may-start
		uwsm select
		uwsm start default
	}
}

$env.PATH ++= [ "~/.local/bin", "~/.cargo/bin" ]

alias l = ls -la
alias y = yazi
alias t = tmux new-session -s fag
alias f = fzf --preview "fzf-preview {}"

source ($nu.default-config-dir)/themes/catppuccin_mocha.nu
source ($nu.default-config-dir)/modules/prompt.nu
source ($nu.cache-dir)/zoxide.nu

[
	nu_plugin_query
	nu_plugin_gstat
] | each { plugin add $in }

let carapace_completer = {|spans: list<string>|
	CARAPACE_LENIENT=1 carapace $spans.0 nushell ...$spans | from json
}

$env.config = {
	show_banner: false

	edit_mode: vi

	use_kitty_protocol: ( $env.KITTY_PID? | is-not-empty )

	error_style: fancy

	ls: {
		use_ls_colors: true
	}

	rm: {
		always_trash: false
	}

	table: {
		mode: light
		padding: { left: 0, right: 0 }
	}

	history: {
		max_size: 100_000
		file_format: sqlite
	}

	completions: {
		algorithm: fuzzy
		external: {
			enable: true
			completer: $carapace_completer
		}
	}
}

$env.FZF_DEFAULT_OPTS = "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#313244,label:#CDD6F4"
$env.EDITOR = "nvim"
$env.CARGO_NET_GIT_FETCH_WITH_CLI = true
$env.SSH_AGENT_PID = ""
$env.SSH_AUTH_SOCK = ($env.XDG_RUNTIME_DIR)/gnupg/S.gpg-agent.ssh

opam env --shell=powershell | parse "$env:{key} = '{val}'" | transpose -rd | load-env
