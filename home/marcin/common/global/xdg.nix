{
  xdg.mimeApps = {
    enable = true;
    
    defaultApplications = {
      "application/pdf" = "okularApplication_pdf.desktop";

      "text/html" = "firefox.desktop";
      "text/plain" = "org.kde.kate.desktop";
      "text/x-patch" = "org.kde.kate.desktop";
      
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
