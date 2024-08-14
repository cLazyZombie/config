@echo off

doskey ls=lsd $*
doskey ll=lsd -a -l $*
doskey ct=cargo nextest run --workspace --status-level fail
doskey cy=cargo clippy --workspace --all-targets --all-features -- -D warnings
doskey cr=cargo run
