#!/usr/bin/env bash -e

# Check if poetry is installed
if ! type poetry &>/dev/null; then
    echo "Poetry is not installed. Please install it first."
    echo "See https://python-poetry.org/docs/#installation for more information."
    echo "curl -sSL https://install.python-poetry.org | python3 -"
    exit 1
elif [[ ! -d .venv ]]; then
    # Check if poetry environment is exist
    # If not, install it
    poetry config virtualenvs.in-project true
    poetry install
fi

# Wrap the given command in `poetry run`
# if it is in the list of wrapped commands
wrap_command() {
    local cmd="$1"
    shift
    local args=("$@")
    local wrap_commands=(
        "ansible"
        "ansible-galaxy"
        "ansible-playbook"
        )

    for wrap_cmd in "${wrap_commands[@]}"; do
        if [[ "$cmd" == "$wrap_cmd" ]]; then
            poetry run "$cmd" "${args[@]}"
            return
        fi
    done

    # If we get here, the command is not in the list of wrapped commands
    "$cmd" "${args[@]}"
}
