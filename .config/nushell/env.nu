# REMINDER: Periodically clean ~/.cache
if (not (($nu.cache-dir) | path exists)) {
  mkdir ($nu.cache-dir)
}

if (not (($nu.cache-dir)/zoxide.nu | path exists)) {
  zoxide init --cmd cd nushell | save -f ($nu.cache-dir)/zoxide.nu
}

$env.CARAPACE_BRIDGES = 'fish,bash'
if (not (($nu.cache-dir)/carapace.nu | path exists)) {
  carapace _carapace nushell | save --force ($nu.cache-dir)/carapace.nu
}
