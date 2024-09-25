#!/bin/bash

project_path=$1
# elixir_version=$(grep elixir: "$project_path/mix.exs" | tr -dc '0-9.' | grep -Eo '[0-9]+\.[0-9]+')
bn=$(basename "$project_path")
container="nvim-elixirls-$bn"

#/bin/bash -c "run $container /app/mason/bin/elixir-ls"
docker exec "$container" mix format "$2"
  #-v "/home/retzs64/.elixir_builds/$bn/mix:/.mix" \
