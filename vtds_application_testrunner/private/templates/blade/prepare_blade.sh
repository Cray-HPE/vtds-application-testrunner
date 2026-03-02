#! /usr/bin/bash
#
# MIT License
#
# (C) Copyright 2026 Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
set -e -o pipefail
function error_handler() {
    local filename="${1}"; shift
    local lineno="${1}"; shift
    local exitval="${1}"; shift
    echo "exiting on error [${exitval}] from ${filename}:${lineno}" >&2
    exit ${exitval}
}
trap 'error_handler "${BASH_SOURCE[0]}" "${LINENO}" "${?}"' ERR

function fail() {
    local message="${*:-"failing for no specified reason"}"
    echo "${BASH_SOURCE[1]}:${BASH_LINENO[0]}:[${FUNCNAME[1]}]: ${message}" >&2
    return 1
}

function usage() {
    local msg="{$*}"
    if [ -n "${msg}" ]; then
        echo "${msg}" >&2
    fi
    echo "Usage: prepare_blade.sh <blade-class> <blade-instance>" >&2
    exit 1
}

# Pick off the blade class and instance from the arguments
BLADE_CLASS=${1}; shift || usage "missing blade class parameter"
BLADE_INSTANCE=${1}; shift || usage "missing blade instance parameter"
