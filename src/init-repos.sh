#! /bin/bash
set -e

skip='false'

if [ "$1" == "skip-download" ]; then
    skip='true'
fi

if [ "${GIT_METHOD}" = 'ssh' ]; then
  method='ssh'
else
  echo "Using http protocol by default... Set GIT_METHOD=ssh if you want to use ssh"
  method='http'
fi

if [ $method = 'ssh' ]; then
  git_repo_prefix="git@github.com:ISeeTheSea"
else
  git_repo_prefix="https://github.com/ISeeTheSea"
fi

if [ $skip == 'false' ]; then
    echo "Initialazing repo"
    # Clone main repository
    git clone "${git_repo_prefix}/ApiStockAndFabrication.git" apisf

    cd ..
else
    echo "directory apisf already exists...Skipping"
fi

echo "Setup finished for repo"
