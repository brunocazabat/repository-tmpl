echo -e "\nPasting the .editorconfig, .vscode/settings.json and .gitignore files in the current directory:"
pwd
cp /mnt/c/Users/bcazabat/Desktop/REPOS/editorconfigtpl/.editorconfig .
mkdir -p .vscode
cp /mnt/c/Users/bcazabat/Desktop/REPOS/editorconfigtpl/.vscode/settings.json .vscode/settings.json
if [ -f .gitignore ]; then
    echo -e "\nAppending the .gitignore file in the current directory with new rules:"
    if grep -q "# Automatic editorconfig + autoformat on save file for Visual Studio Code" .gitignore; then
        echo -e "\n.gitignore rules already present in the .gitignore file. Skipping."
    else
        echo -e "\n.gitignore rules not present in the .gitignore file. Appending it."
        cat /mnt/c/Users/bcazabat/Desktop/REPOS/editorconfigtpl/.gitignore >> .gitignore
    fi
else
    echo -e "\nPasting the .gitignore file in the current directory:"
    cp /mnt/c/Users/bcazabat/Desktop/REPOS/editorconfigtpl/.gitignore .
fi
echo -e "\nDone.\n"
