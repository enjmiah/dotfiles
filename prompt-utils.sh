#
# prompt-utils.sh
#
# Author:
#     Jerry Yin / jerryyin.info
#
# License:
#     Any copyright is dedicated to the Public Domain.
#     http://creativecommons.org/publicdomain/zero/1.0/
#

function __timer_start() {
    timer=${timer:-$SECONDS}
}

function __timer_stop() {
    timer_show=$(($SECONDS - $timer))
    unset timer
}

function __last_command_runtime() {
    local RTNVAL="$?"
    if [[ ${timer_show} -gt 7 ]]; then
        printf " ${timer_show}s "
    fi
    return $RTNVAL
}

function __job_info() {
    local RTNVAL="$?"
    local lf='
'
    local lastjob="$(jobs)"
    # https://unix.stackexchange.com/questions/251868/jobs-wc-getting-weird-return-values
    local numjobs="$( ( jobs -sp ) | wc -l)"
    if [[ ! -z "${lastjob}" ]]; then
        printf "\033[34;43m "
        printf "\033[30m"
        printf "$numjobs "
        printf "\033[33;47m "
    else
        printf "\033[34;47m "
    fi
    printf '\033[30;47m'
    return $RTNVAL
}

function __custom_git_ps1() {
    local RTNVAL="$?"
    local out="$(__git_ps1)" commithash
    if [[ ! -z "${out}" ]]; then
        echo "${out}" | grep "\.\.\." &> /dev/null
        if [[ $? != 0 ]]; then
            out="${out:2:-1}"
            commithash="$(git rev-parse --short HEAD 2> /dev/null)"
            if [[ ! -z "${commithash}" ]]; then
                commithash="(${commithash})"
                out="${out} ${commithash}"
            fi
        else
            # detached HEAD state
            out="${out:3:-2}"
        fi
        out=" ${out}"
        printf "$out"
    fi
    return $RTNVAL
}

function __exit_status_ps1() {
    if [[ $? == 0 ]]; then
        printf "$"
    else
        printf '\033[31m✘\033[0m'
    fi
    return $?
}
