{
  lib,
  pkgs,
  ...
}:

# TODO Broken in tty
{
  home.file.".p10k.zsh".source = ./p10k.zsh;
  persistence.files = [ ".zsh_history" ];
  programs.zsh = {
    autosuggestion.enable = true;
    initContent = lib.mkMerge [
      (
        lib.mkOrder 500 ''
          if [[ $(tty) =~ /dev\/tty[1-6] ]]; then TMOUT=300; fi

          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
        ''
      )
      (
        lib.mkOrder 1000 ''
          bindkey "''${key[Up]}" up-line-or-search

          # Fix slow pasting https://gist.github.com/magicdude4eva/2d4748f8ef3e6bf7b1591964c201c1ab
          pasteinit() {
            OLD_SELF_INSERT=''${''${(s.:.)widgets[self-insert]}[2,3]}
            zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
          }

          pastefinish() {
            zle -N self-insert $OLD_SELF_INSERT
          }
          zstyle :bracketed-paste-magic paste-init pasteinit
          zstyle :bracketed-paste-magic paste-finish pastefinish

          if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
          fi
        ''
      )
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-autocomplete";
        src = pkgs.zsh-autocomplete;
        file = "share/zsh-autocomplete/zsh-autocomplete.plugin.zsh";
      }
    ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      colors = ''for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}''${(l:3::0:)i}%f " ''${''${(M)$((i%6)):#3}:+$'\n'}; done'';
      deemix-dl = "deemix -p /home/marcin/Music/import -b flac";
      kwin-query-window-info = "qdbus org.kde.KWin /KWin org.kde.KWin.queryWindowInfo";
      ls = "eza -lbghMUa --group-directories-first --git --git-repos";
    };
  };
}
