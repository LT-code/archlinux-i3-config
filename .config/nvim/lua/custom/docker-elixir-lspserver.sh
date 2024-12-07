#!/bin/bash

project_path=$1
elixir_version=$(grep elixir: "$project_path/mix.exs" | tr -dc '0-9.' | grep -Eo '[0-9]+\.[0-9]+')
bn=$(basename "$project_path")
container="nvim-elixirls-$bn"

FILE="$project_path/.tool-versions"
if test -f "$FILE"; then
	source "$FILE"
fi

env_variables=""
for var in $LSP_ENV_VARS
do
  env_variables="$env_variables -e $var"
done

IMAGE_NAME="my-elixir-ls:$elixir_version"

if [[ "$(docker images -q "$IMAGE_NAME" 2> /dev/null)" == "" ]]
then
	docker build -f "/home/$USER/.config/nvim/lua/custom/Dockerfile" \
  		--build-arg ELIXIR_VER="$elixir_version" \
  		--build-arg USER="$USER" \
  		--build-arg UID="$(id -u)" \
  		--build-arg GID="$(id -g)" \
		-t "my-elixir-ls:$elixir_version" \
		"/home/$USER/.config/nvim/lua/custom/"
fi

mkdir -p "$project_path/.elixir_ls"

ADDITIONAL_PATH=""
ADDITIONAL_VOLUME_CONFIG="$project_path/.elixir_ls_docker_options"
if [ -f "$ADDITIONAL_VOLUME_CONFIG" ]; then
  while read p; do
    ADDITIONAL_PATH="$ADDITIONAL_PATH -v $project_path/$p:$project_path/$p"
  done <$ADDITIONAL_VOLUME_CONFIG
  >&2 echo ADDITIONAL_PATH = $ADDITIONAL_PATH
fi

docker run -i --rm \
  $ADDITIONAL_PATH \
  -v "$project_path:$project_path" \
  -v "/home/$USER/.mix/:/home/$USER/.mix/" \
  -v "/home/$USER/.local/share/nvim/mason:/home/$USER/.local/share/nvim/mason:ro" \
  -v "$project_path/.elixir_ls/:/home/$USER/.cache/mix/" \
  -e "MIX_BUILD_PATH=$project_path/.elixir_ls/" \
  -w "$project_path" \
  -u "$(id -u):$(id -g)" \
  $env_variables \
  -e ELIXIR_VER="$elixir_version" \
  -e PROJECT_PATH="$project_path" \
  -e USER="$USER" \
  -e UID="$(id -u)" \
  -e GID="$(id -g)" \
  --entrypoint "/home/$USER/.local/share/nvim/mason/bin/elixir-ls" \
  --name "$container" \
  "$IMAGE_NAME"
