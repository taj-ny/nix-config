{ pkgs, ... }:

{
  home.packages = with pkgs; [ opusTools ];

  programs.beets = {
    enable = true;
    settings = {
      directory = "~/Music/lib";
      library = "~/Music/lib.db";
 
      plugins = [
        "badfiles"
        "convert"
        "deezer"
        "embedart"
        "fetchart"
        "fromfilename" 
        "lastgenre"
        "missing"
        "replaygain"
        "scrub"
        "spotify"
        "zero"
      ];

      badfiles = {
        check_on_import = true;

        commands = {
          ogg = "${pkgs.liboggz}/bin/oggz-validate";
        };
      };

      import = {
        write = true;
        move = true;
      };

      paths = {
        default = "$albumartist/$album%aunique{}/$track - $title";
        comp = "Compilations/$album%aunique{}/$track - $title";
      };

      replaygain = {
        backend = "ffmpeg";
        r128 = ""; # Use REPLAYGAIN_* fields for opus, since some players don't support R128
      };

      convert = {
        auto = true;
        dest = "~/Music/lib";
        never_convert_lossy_files = true;
        delete_originals = true;
        format = "flac";

        formats = {
          flac = {
            command = "ffmpeg -y -i $source -c:a flac -sample_fmt s16 -ar 44100 $dest";
            extension = "flac";
          };
        };
      };
  
      fetchart = {
        maxwidth = 1024;
        quality = 90;
        enforce_ratio = true;
        cover_format = "jpeg";
      };

      zero = {
        auto = "yes";
        fields = "comments";
        update_database = true;
      };
    };
  };
}
