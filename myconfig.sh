echo -e "Pasting the .editorconfig, .vscode/settings.json and .gitignore files in the current directory:"
if [ -f .editorconfig ]; then
    echo -e "\n.editorconfig file already present in the current directory. Skipping."
else
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.editorconfig > .editorconfig
fi
if [ -f .gitignore ]; then
    echo -e "\nAppending the .gitignore file in the current directory with new rules:"
    if grep -q "# Automatic editorconfig + autoformat on save file for Visual Studio Code" .gitignore; then
        echo -e "\n.gitignore rules already present in the .gitignore file. Skipping."
    else
        echo -e "\n.gitignore rules not present in the .gitignore file. Appending it."
        curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.gitignore >> .gitignore
    fi
else
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.gitignore > .gitignore
fi
mkdir -p .vscode
if [ -f .vscode/settings.json ]; then
    echo -e "\n.vscode/settings.json file already present in the current directory. Skipping."
else
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.vscode/settings.json > .vscode/settings.json
fi
echo -e "\nDone. Leaving this no-longer-empty place now.\n"
