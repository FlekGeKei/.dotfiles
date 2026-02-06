export-env {
	$env.PROMPT_COMMAND = {||
		$"(current_dir)(git_stat)(ansi reset)\n"
	}

	$env.PROMPT_COMMAND_RIGHT = {||
		# create a right prompt in magenta with green separators and am/pm underlined
		let time_segment = ([
			(ansi reset)
			(ansi magenta)
			(date now | format date '%X') # try to respect user's locale
		] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
			str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

		let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
			(ansi rb)
			($env.LAST_EXIT_CODE)
		] | str join)
		} else { "" }

		([$last_exit_code, (char space), $time_segment] | str join)
	}

	$env.PROMPT_INDICATOR = "❯ "
	$env.PROMPT_INDICATOR_VI_NORMAL = "❮ "
	$env.PROMPT_INDICATOR_VI_INSERT = "❯ "
	$env.PROMPT_MULTILINE_INDICATOR = "|>"

	$env.TRANSIENT_PROMPT_COMMAND = "❯ "
	$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = ""
	$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = ""
	$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = ""
	$env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| 
		(history | last 1 | get duration).0
	}
}

def current_dir [] {
	let dir = match (do -i { $env.PWD | path relative-to $nu.home-dir }) {
		null => $env.PWD
		'' => '~'
		$relative_pwd => ([~ $relative_pwd] | path join)
	}

	let path_color = (if (is-admin) { ansi red_bold } else { ansi blue_bold })
	let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_blue_bold })
	let path_segment = $"($path_color)($dir)"

	$path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def git_stat_ints [ansi: string, prefix: string, int: int] {
	if $int < 1 {
		return ""
	}

	$" ($ansi)($prefix)($int)"
}

def git_stat [] {
	let gitstat = gstat

	let added_staged = $gitstat | get idx_added_staged

	if ($added_staged == -1) {
		return ""
	}

	let branch = $"(ansi green)($gitstat | get branch)"

	let state = do {
		let state = $gitstat | get state

		if $state == "clean" {
			return ""
		}

		$" (ansi yellow_bold)($state)"
	}

	let idx_added_staged = git_stat_ints (ansi green) "" $added_staged
	let idx_modified_staged = git_stat_ints (ansi green) "+" (($gitstat | get idx_modified_staged) + $added_staged)
	let idx_deleted_staged = git_stat_ints (ansi green) "-" ($gitstat | get idx_deleted_staged)
	let wt_untracked = git_stat_ints (ansi yellow) "?" ($gitstat | get wt_untracked)
	let wt_modified = git_stat_ints (ansi yellow) "!" ($gitstat | get wt_modified) 
	let wt_deleted = git_stat_ints (ansi yellow) "-" ($gitstat | get wt_deleted)
	let ahead = git_stat_ints (ansi blue) "?" ($gitstat | get ahead)
	
	return $" ($branch)($state)($idx_added_staged)($idx_modified_staged)($idx_deleted_staged)($wt_untracked)($wt_modified)($wt_deleted)($ahead)"
}
