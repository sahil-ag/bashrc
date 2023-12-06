

function gd() {
    git diff $args
}

function gds() {
    git diff --cached --ignore-space-at-eol -b -w --ignore-blank-lines $args
}

function gdt() {
    git difftool $args
}

function gs() {
    git status $args
}

function gco() {
    git checkout $args
}

function gcom() {
    gco master $args
}

function gp() {
    git pull $args
}

function gb() {
    git branch $args
}

function gst() {
    git stash $args
}

function gstp() {
    git stash pop $args
}
