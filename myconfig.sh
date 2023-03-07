R='\033[0;31m'
G='\033[0;32m'
B='\033[0;34m'
N='\033[0m'

echo -e "\n${B}Start of the project initialisation in the current directory:"
if [ -f .editorconfig ]; then
    echo -e "\n${N}.editorconfig file already present in the current directory. ${R}Skipping."
else
    echo -e "\n${N}.editorconfig file not present in the current directory. ${G}Creating it."
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.editorconfig > .editorconfig
fi
if [ -f .gitignore ]; then
    if grep -q "# Automatic editorconfig + autoformat on save file for Visual Studio Code" .gitignore; then
        echo -e "\n${N}.gitignore rules already present in the .gitignore file. ${R}Skipping."
    else
        echo -e "\n${N}.gitignore rules not present in the .gitignore file. ${G}Appending it."
        curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.gitignore >> .gitignore
    fi
else
    echo -e "\n${N}.gitignore file not present in the current directory. ${G}Creating it."
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.gitignore > .gitignore
fi
mkdir -p .vscode
if [ -f .vscode/settings.json ]; then
    echo -e "\n${N}.vscode/settings.json file already present in the current directory. ${R}Skipping."
else
    echo -e "\n${N}.vscode/settings.json file not present in the current directory. ${G}Creating it."
    curl -s https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/.vscode/settings.json > .vscode/settings.json
fi
echo -e "\n${G}Done. Leaving this no-longer-empty place now.${N}\n"
