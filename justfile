set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

alias p := push
alias t := tag
alias i := init

# This list of available targets
default:
    @just --list

# This command will create a new tag and push it to the main branch
tag +VERSION:
  Write-Host "Creating new tag and pushing it to main branch"
  git tag --sort=-v:refname
  git tag "{{VERSION}}"
  git pull origin main
  git push origin "{{VERSION}}"

# This command will initialize the repository with a distant template
init:
  Write-Host "Initializing repository with a distant template"
  @just push "Feat: Initial commit"
  Invoke-WebRequest "https://raw.githubusercontent.com/brunocazabat/repository-tmpl/main/myconfig.sh" -OutFile ./script.sh
  bash ./script.sh
  rm ./script.sh

# This command will push the changes to the main branch
push +MESSAGE:
  Write-Host "Pushing changes to main branch"
  git add .
  git commit -m "{{MESSAGE}}"
  git pull origin main
  git push origin main
