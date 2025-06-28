{
  # File opener
  open = ''
    ''${{
      case $(file --mime-type "$f" -bL) in
        text/*) nvim "$f" ;;
        image/*) lf -remote "send $id multifile feh";;
        application/x-iso9660-image) udisksctl loop-setup --file "$f";;
        application/x-executable) lf -remote "send $id echo 'not allowed'";;
        video/*) lf -remote "send $id multifile mpv";;
        *) xdg-open "$f" &>/dev/null & ;;
      esac
    }}
  '';

  # Multiple file handler
  multifile = ''
    &{{
      eval "$1 $(echo -e "$fx" | xargs -i echo "\\'{}\\'" | xargs echo)"
    }}
  '';

  # Create directory
  mkdir = ''
    ''${{
      printf "Directory Name: "
      read name
      if [ ! -z "$name" ]; then
        mkdir "$name"
      fi
    }}
  '';

  # Create file
  touch = ''
    ''${{
      printf "File Name: "
      read name
      if [ ! -z "$name" ]; then
        $EDITOR "$name"
      fi
    }}
  '';

  # Bulk rename (requires renameutils)
  bulkrename = ''
    ''${{
      eval "qmv -f do $(echo -e "$fx" | xargs -i echo "\\'{}\\'" | xargs echo)"
    }}
  '';

  # Fuzzy finder
  fzf_select = ''
    ''${{
      res="$(find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m)"
      if [ -d "$res" ]; then
        cmd="cd"
      else 
        cmd="select"
      fi
      lf -remote "send $id $cmd \"$res\""
    }}
  '';

  # Print mimetype
  mimetype = ''
    &{{
      mim=$(file --mime-type -bL "$f")
      lf -remote "send $id echomsg 'mimetype : $mim'" &
    }}
  '';

  # Extract archives
  extract = ''
    ''${{
      set -f
      case "$f" in
        *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf "$f";;
        *.tar.gz|*.tgz) tar xzvf "$f";;
        *.tar.xz|*.txz) tar xJvf "$f";;
        *.zip) unzip "$f";;
        *.rar) unrar x "$f";;
        *.7z) 7z x "$f";;
      esac
    }}
  '';
}
