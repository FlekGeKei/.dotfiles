# REMINDER: Periodically clean ~/.cache
if (not (($nu.cache-dir) | path exists)) {
  mkdir ($nu.cache-dir)
}

$env.CARAPACE_BRIDGES = 'fish,bash'
if (not (($nu.cache-dir)/carapace.nu | path exists)) {
  carapace _carapace nushell | save --force ($nu.cache-dir)/carapace.nu
}
