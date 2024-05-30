{ pkgs, ... }:

{
  home.packages = with pkgs; [ opusTools ];

  programs.beets = {
    enable = true;
    settings = {
      plugins = [
        "deezer"
        "embedart"
        "spotify"
        "missing"
        "fromfilename"
        "scrub"
        "lastgenre"
        "convert"
        "replaygain"
        "fetchart"
        "badfiles"
        "zero"
      ];

      library = "~/Music/lib.db";
      directory = "~/Music/lib";

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
        r128 = "";
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

      badfiles = {
        check_on_import = true;
      };

      zero = {
        auto = "yes";
        fields = "comments";
        update_database = true;
      };
    };
  };
}
