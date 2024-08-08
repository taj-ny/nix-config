{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ opusTools ];
  programs.beets = {
    enable = true;
    package = pkgs.beets-unstable;
    settings = {
      badfiles = {
        check_on_import = true;
        commands =
          let
            oggChecker = "${pkgs.liboggz}/bin/oggz-validate";
          in
          {
            ogg = oggChecker;
            opus = oggChecker;
          };
      };
      convert = {
        auto = "yes";
        dest = "~/Music/lib";
        max_bitrate = 0;
        never_convert_lossy_files = true;
        no_convert = "";
        delete_originals = true;
        format = "flac";
        formats = {
          flac = {
            command = "ffmpeg -y -i $source -c:a flac -sample_fmt s16 -ar 44100 $dest";
            extension = "flac";
          };
        };
      };
      directory = "~/Music/lib";
      fetchart = {
        maxwidth = 1500;
        quality = 90;
        enforce_ratio = true;
        cover_format = "jpeg";
      };
      import = {
        write = true;
        move = true;
      };
      library = "~/Music/lib.db";
      paths = {
        default = "$albumartist/$album%aunique{}/$track - $title";
        comp = "Compilations/$album%aunique{}/$track - $title";
      };
      plugins = [
        "badfiles"
        "convert"
        "deezer"
        "edit"
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
      replaygain = {
        backend = "ffmpeg";
        r128 = ""; # Use REPLAYGAIN_* fields for opus, since some players don't support R128
      };
      zero = {
        auto = "yes";
        fields = "comments";
        update_database = true;
      };
    };
  };
}
