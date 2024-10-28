@echo off

doskey ls=lsd $*
doskey ll=lsd -a -l -g $*
doskey lt=lsd --tree $*
doskey ct=cargo nextest run --workspace --status-level fail
doskey cy=cargo clippy --workspace --all-targets --all-features -- -D warnings
doskey cr=cargo run

REM coreutil
doskey rm=coreutils.exe rm $*
doskey cp=coreutils.exe cp $*
doskey mv=coreutils.exe mv $*
doskey cat=coreutils.exe cat $*
doskey touch=coreutils.exe touch $*

cmd.exe
