#!/bin/bash

# Set the target directory
target_directory="$HOME/.config/nvim/pack/plugin/start/"

# Create the target directory if it doesn't exist
mkdir -p "$target_directory"

# List of repository URLs
repo_list=(
    "https://github.com/dense-analysis/ale.git"
    "https://github.com/jlanzarotta/bufexplorer.git"
    "https://github.com/github/copilot.vim.git"
    "https://github.com/ctrlpvim/ctrlp.vim.git"
    "https://github.com/preservim/nerdtree.git"
    "https://github.com/arcticicestudio/nord-vim.git"
    "https://github.com/benshuailyu/online-thesaurus-vim.git"
    "https://github.com/leafgarland/typescript-vim.git"
    "https://github.com/flazz/vim-colorschemes.git"
    "https://github.com/tpope/vim-commentary.git"
    "https://github.com/pangloss/vim-javascript.git"
    "git@github.com:MaxMEllon/vim-jsx-pretty.git"
    "https://github.com/peitalin/vim-jsx-typescript.git"
    "https://github.com/plasticboy/vim-markdown.git"
    "https://github.com/prettier/vim-prettier.git"
    "git@github.com:Shougo/vimproc.vim.git"
    "git@github.com:shmup/vim-sql-syntax.git"
    "git@github.com:tpope/vim-surround.git"
    "git@github.com:ycm-core/YouCompleteMe.git"
    "https://github.com/jnurmine/Zenburn.git"
    "git@github.com:prabirshrestha/asyncomplete.vim.git"
)

# Iterate through the repository URLs
for repo_url in "${repo_list[@]}"; do
  # Clone the repository into the target directory
  git clone "$repo_url" "$target_directory/$(basename "$repo_url" .git)"
done

pushd ./
cd $target_directory/vimproc.vim
make
popd

pushd ./
cd $target_directory/YouCompleteMe
 git submodule update --init --recursive
./install.py --all
popd
