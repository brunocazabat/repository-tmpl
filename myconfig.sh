scriptpath=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
currentpath=$(pwd)
if [ "$scriptpath" != "$currentpath" ]; then
    echo -e "Pasting the .editorconfig, .vscode/settings.json and .gitignore files in the current directory:"
    pwd
    cp "$scriptpath"/.editorconfig .
    mkdir -p .vscode
    cp "$scriptpath"/.vscode/settings.json .vscode/settings.json
    if [ -f .gitignore ]; then
        echo -e "\nAppending the .gitignore file in the current directory with new rules:"
        if grep -q "# Automatic editorconfig + autoformat on save file for Visual Studio Code" .gitignore; then
            echo -e "\n.gitignore rules already present in the .gitignore file. Skipping."
        else
            echo -e "\n.gitignore rules not present in the .gitignore file. Appending it."
            cat "$scriptpath"/.gitignore >> .gitignore
        fi
    else
        echo -e "\nPasting the .gitignore file in the current directory:"
        cp "$scriptpath"/.gitignore .
    fi
    echo -e "\nDone.\n"
else
    echo -e "You´re executing the init in the script repository itself, not intended.\n"
fi
