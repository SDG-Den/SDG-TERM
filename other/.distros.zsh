# Distro-specific aliases — sourced from ~/.zshconfig.zsh.
# Reads ID_LIKE from /etc/os-release to set appropriate package-management aliases
# for the current distribution.  Aliases that don't apply are simply not defined.

() {
  if [[ ! -r /etc/os-release ]]; then
    return
  fi

  local os_like
  os_like=$(grep -oP '(?<=^ID_LIKE=).*' /etc/os-release 2>/dev/null ||
            grep -oP '(?<=^ID=).*' /etc/os-release 2>/dev/null)
  os_like="${os_like//\"/}"

  case "$os_like" in
    *arch*)
      alias rmpkg="sudo pacman -Rsn"
      alias update="sudo pacman -Syu"
      alias cleanch="sudo pacman -Scc"
      alias fixpacman="sudo rm /var/lib/pacman/db.lck"
      alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"
      alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
      alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
      alias apt="man pacman"
      alias apt-get="man pacman"
      ;;
    *debian*|*ubuntu*)
      alias update="sudo apt update && sudo apt upgrade"
      alias rmpkg="sudo apt remove"
      alias cleanch="sudo apt autoremove && sudo apt autoclean"
      alias gitpkg='dpkg -l 2>/dev/null | grep -c "\-git" || echo 0'
      alias apt="sudo apt"
      alias apt-get="sudo apt-get"
      ;;
    *fedora*|*rhel*|*centos*)
      alias update="sudo dnf update"
      alias rmpkg="sudo dnf remove"
      alias cleanch="sudo dnf clean all"
      alias gitpkg='dnf list installed 2>/dev/null | grep -c "\-git" || echo 0'
      ;;
    *suse*)
      alias update="sudo zypper update"
      alias rmpkg="sudo zypper remove"
      alias cleanch="sudo zypper clean"
      ;;
  esac
}
