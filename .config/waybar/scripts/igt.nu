#!/bin/env nu

let data = (^intel_gpu_top -n 1 -J) | from json | get engines

let render = ($data | get "Render/3D" | get busy).0
let blitter = ($data | get "Blitter" | get busy).0
let video = ($data | get "Video" | get busy).0
let video_enhance = ($data | get "VideoEnhance" | get busy).0

let total = ($render + $blitter + $video + $video_enhance) | into int

print $"{\"text\":($total),\"tooltip\":\"Render/3D:		($render)%\\nBlitter:			($blitter)%\\nVideo:			($video)%\\nVideoEnhance:	($video_enhance)%\"}"
