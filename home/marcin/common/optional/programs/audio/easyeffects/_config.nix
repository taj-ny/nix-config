# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/github/wwmm/easyeffects" = {
      bypass = false;
      last-used-input-preset = "Presets";
      last-used-output-preset = "Presets";
      meters-update-interval = 10;
      use-cubic-volumes = false;
      window-fullscreen = true;
      window-height = 538;
      window-maximized = false;
      window-width = 640;
    };

    "com/github/wwmm/easyeffects/spectrum" = {
      color = mkTuple [ 1.0 1.0 1.0 1.0 ];
      color-axis-labels = mkTuple [ 1.0 1.0 1.0 1.0 ];
    };

    "com/github/wwmm/easyeffects/streaminputs" = {
      input-device = "alsa_output.pci-0000_00_1f.3.analog-stereo.7";
    };

    "com/github/wwmm/easyeffects/streamoutputs" = {
      output-device = "alsa_output.pci-0000_00_1f.3.analog-stereo.7";
      plugins = [ "equalizer#0" "equalizer#2" "bass_enhancer#0" "crystalizer#0" "crossfeed#0" ];
    };

    "com/github/wwmm/easyeffects/streamoutputs/bassenhancer/0" = {
      amount = 5.0000000000000036;
      blend = 0.0;
      bypass = false;
      input-gain = 0.0;
      listen = false;
      output-gain = 0.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/bassloudness/0" = {
      loudness = -2.3;
    };

    "com/github/wwmm/easyeffects/streamoutputs/compressor/0" = {
      sidechain-input-device = "alsa_input.pci-0000_00_1f.3.analog-stereo";
    };

    "com/github/wwmm/easyeffects/streamoutputs/convolver/0" = {
      bypass = false;
    };

    "com/github/wwmm/easyeffects/streamoutputs/crossfeed/0" = {
      bypass = false;
      fcut = 700;
      feed = 4.5;
      output-gain = 0.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/crystalizer/0" = {
      bypass = false;
    };

    "com/github/wwmm/easyeffects/streamoutputs/crystalizer/1" = {
      bypass = true;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0" = {
      bypass = false;
      input-gain = 0.0;
      mode = "IIR";
      num-bands = 10;
      pitch-left = -0.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0/leftchannel" = {
      band0-frequency = 25.848899841308594;
      band0-gain = 0.0;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 2.209709882736206;
      band0-type = "Bell";
      band0-width = 4.0;
      band1-frequency = 40.96780014038086;
      band1-gain = 0.0;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 2.209709882736206;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-type = "Off";
      band11-type = "Off";
      band12-type = "Off";
      band13-type = "Off";
      band14-type = "Off";
      band15-type = "Off";
      band16-type = "Off";
      band17-type = "Off";
      band18-type = "Off";
      band19-type = "Off";
      band2-frequency = 64.92960357666016;
      band2-gain = 0.0;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 2.209709882736206;
      band2-type = "Bell";
      band2-width = 4.0;
      band20-type = "Off";
      band21-type = "Off";
      band22-type = "Off";
      band23-type = "Off";
      band24-type = "Off";
      band25-type = "Off";
      band26-type = "Off";
      band27-type = "Off";
      band28-type = "Off";
      band29-type = "Off";
      band3-frequency = 102.90599822998047;
      band3-gain = 0.0;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 2.209709882736206;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-type = "Off";
      band31-type = "Off";
      band4-frequency = 163.0959930419922;
      band4-gain = -8.029999732971191;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 2.209709882736206;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 258.489013671875;
      band5-gain = -8.029999732971191;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 2.209709882736206;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 409.6780090332031;
      band6-gain = -12.180000305175781;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 2.209709882736206;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 649.2960205078125;
      band7-gain = -5.139999866485596;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 2.209709882736206;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 1029.06005859375;
      band8-gain = -4.78000020980835;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 2.209709882736206;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 1630.9599609375;
      band9-gain = 0.0;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 2.209709882736206;
      band9-type = "Bell";
      band9-width = 4.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/0/rightchannel" = {
      band0-frequency = 25.848899841308594;
      band0-gain = 0.0;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 2.209709882736206;
      band0-slope = "x1";
      band0-solo = false;
      band0-type = "Bell";
      band0-width = 4.0;
      band1-frequency = 40.96780014038086;
      band1-gain = 0.0;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 2.209709882736206;
      band1-slope = "x1";
      band1-solo = false;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-frequency = 194.06;
      band10-gain = 0.0;
      band10-mode = "RLC (BT)";
      band10-mute = false;
      band10-q = 4.36;
      band10-slope = "x1";
      band10-solo = false;
      band10-type = "Off";
      band10-width = 4.0;
      band11-frequency = 240.81;
      band11-gain = 0.0;
      band11-mode = "RLC (BT)";
      band11-mute = false;
      band11-q = 4.36;
      band11-slope = "x1";
      band11-solo = false;
      band11-type = "Off";
      band11-width = 4.0;
      band12-frequency = 298.834;
      band12-gain = 0.0;
      band12-mode = "RLC (BT)";
      band12-mute = false;
      band12-q = 4.36;
      band12-slope = "x1";
      band12-solo = false;
      band12-type = "Off";
      band12-width = 4.0;
      band13-frequency = 370.834;
      band13-gain = 0.0;
      band13-mode = "RLC (BT)";
      band13-mute = false;
      band13-q = 4.36;
      band13-slope = "x1";
      band13-solo = false;
      band13-type = "Off";
      band13-width = 4.0;
      band14-frequency = 460.182;
      band14-gain = 0.0;
      band14-mode = "RLC (BT)";
      band14-mute = false;
      band14-q = 4.36;
      band14-slope = "x1";
      band14-solo = false;
      band14-type = "Off";
      band14-width = 4.0;
      band15-frequency = 571.057;
      band15-gain = 0.0;
      band15-mode = "RLC (BT)";
      band15-mute = false;
      band15-q = 4.36;
      band15-slope = "x1";
      band15-solo = false;
      band15-type = "Off";
      band15-width = 4.0;
      band16-frequency = 708.647;
      band16-gain = 0.0;
      band16-mode = "RLC (BT)";
      band16-mute = false;
      band16-q = 4.36;
      band16-slope = "x1";
      band16-solo = false;
      band16-type = "Off";
      band16-width = 4.0;
      band17-frequency = 879.387;
      band17-gain = 0.0;
      band17-mode = "RLC (BT)";
      band17-mute = false;
      band17-q = 4.36;
      band17-slope = "x1";
      band17-solo = false;
      band17-type = "Off";
      band17-width = 4.0;
      band18-frequency = 1091.26;
      band18-gain = 0.0;
      band18-mode = "RLC (BT)";
      band18-mute = false;
      band18-q = 4.36;
      band18-slope = "x1";
      band18-solo = false;
      band18-type = "Off";
      band18-width = 4.0;
      band19-frequency = 1354.19;
      band19-gain = 0.0;
      band19-mode = "RLC (BT)";
      band19-mute = false;
      band19-q = 4.36;
      band19-slope = "x1";
      band19-solo = false;
      band19-type = "Off";
      band19-width = 4.0;
      band2-frequency = 64.92960357666016;
      band2-gain = 0.0;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 2.209709882736206;
      band2-slope = "x1";
      band2-solo = false;
      band2-type = "Bell";
      band2-width = 4.0;
      band20-frequency = 1680.47;
      band20-gain = 0.0;
      band20-mode = "RLC (BT)";
      band20-mute = false;
      band20-q = 4.36;
      band20-slope = "x1";
      band20-solo = false;
      band20-type = "Off";
      band20-width = 4.0;
      band21-frequency = 2085.35;
      band21-gain = 0.0;
      band21-mode = "RLC (BT)";
      band21-mute = false;
      band21-q = 4.36;
      band21-slope = "x1";
      band21-solo = false;
      band21-type = "Off";
      band21-width = 4.0;
      band22-frequency = 2587.79;
      band22-gain = 0.0;
      band22-mode = "RLC (BT)";
      band22-mute = false;
      band22-q = 4.36;
      band22-slope = "x1";
      band22-solo = false;
      band22-type = "Off";
      band22-width = 4.0;
      band23-frequency = 3211.29;
      band23-gain = 0.0;
      band23-mode = "RLC (BT)";
      band23-mute = false;
      band23-q = 4.36;
      band23-slope = "x1";
      band23-solo = false;
      band23-type = "Off";
      band23-width = 4.0;
      band24-frequency = 3985.01;
      band24-gain = 0.0;
      band24-mode = "RLC (BT)";
      band24-mute = false;
      band24-q = 4.36;
      band24-slope = "x1";
      band24-solo = false;
      band24-type = "Off";
      band24-width = 4.0;
      band25-frequency = 4945.15;
      band25-gain = 0.0;
      band25-mode = "RLC (BT)";
      band25-mute = false;
      band25-q = 4.36;
      band25-slope = "x1";
      band25-solo = false;
      band25-type = "Off";
      band25-width = 4.0;
      band26-frequency = 6136.63;
      band26-gain = 0.0;
      band26-mode = "RLC (BT)";
      band26-mute = false;
      band26-q = 4.36;
      band26-slope = "x1";
      band26-solo = false;
      band26-type = "Off";
      band26-width = 4.0;
      band27-frequency = 7615.17;
      band27-gain = 0.0;
      band27-mode = "RLC (BT)";
      band27-mute = false;
      band27-q = 4.36;
      band27-slope = "x1";
      band27-solo = false;
      band27-type = "Off";
      band27-width = 4.0;
      band28-frequency = 9449.96;
      band28-gain = 0.0;
      band28-mode = "RLC (BT)";
      band28-mute = false;
      band28-q = 4.36;
      band28-slope = "x1";
      band28-solo = false;
      band28-type = "Off";
      band28-width = 4.0;
      band29-frequency = 11726.8;
      band29-gain = 0.0;
      band29-mode = "RLC (BT)";
      band29-mute = false;
      band29-q = 4.36;
      band29-slope = "x1";
      band29-solo = false;
      band29-type = "Off";
      band29-width = 4.0;
      band3-frequency = 102.90599822998047;
      band3-gain = 0.0;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 2.209709882736206;
      band3-slope = "x1";
      band3-solo = false;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-frequency = 14552.2;
      band30-gain = 0.0;
      band30-mode = "RLC (BT)";
      band30-mute = false;
      band30-q = 4.36;
      band30-slope = "x1";
      band30-solo = false;
      band30-type = "Off";
      band30-width = 4.0;
      band31-frequency = 18058.4;
      band31-gain = 0.0;
      band31-mode = "RLC (BT)";
      band31-mute = false;
      band31-q = 4.36;
      band31-slope = "x1";
      band31-solo = false;
      band31-type = "Off";
      band31-width = 4.0;
      band4-frequency = 163.0959930419922;
      band4-gain = -8.029999732971191;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 2.209709882736206;
      band4-slope = "x1";
      band4-solo = false;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 258.489013671875;
      band5-gain = -8.029999732971191;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 2.209709882736206;
      band5-slope = "x1";
      band5-solo = false;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 409.6780090332031;
      band6-gain = -12.180000305175781;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 2.209709882736206;
      band6-slope = "x1";
      band6-solo = false;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 649.2960205078125;
      band7-gain = -5.139999866485596;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 2.209709882736206;
      band7-slope = "x1";
      band7-solo = false;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 1029.06005859375;
      band8-gain = -4.78000020980835;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 2.209709882736206;
      band8-slope = "x1";
      band8-solo = false;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 1630.9599609375;
      band9-gain = 0.0;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 2.209709882736206;
      band9-slope = "x1";
      band9-solo = false;
      band9-type = "Bell";
      band9-width = 4.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/1" = {
      bypass = false;
      input-gain = -0.45;
      num-bands = 10;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/1/leftchannel" = {
      band0-frequency = 105.0;
      band0-gain = -6.5;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 0.7;
      band0-type = "Lo-shelf";
      band0-width = 4.0;
      band1-frequency = 22.200001;
      band1-gain = 0.8;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 3.18;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-type = "Off";
      band11-type = "Off";
      band12-type = "Off";
      band13-type = "Off";
      band14-type = "Off";
      band15-type = "Off";
      band16-type = "Off";
      band17-type = "Off";
      band18-type = "Off";
      band19-type = "Off";
      band2-frequency = 32.200001;
      band2-gain = 0.8;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 1.78;
      band2-type = "Bell";
      band2-width = 4.0;
      band20-type = "Off";
      band21-type = "Off";
      band22-type = "Off";
      band23-type = "Off";
      band24-type = "Off";
      band25-type = "Off";
      band26-type = "Off";
      band27-type = "Off";
      band28-type = "Off";
      band29-type = "Off";
      band3-frequency = 71.300003;
      band3-gain = -0.3;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 1.91;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-type = "Off";
      band31-type = "Off";
      band4-frequency = 136.199997;
      band4-gain = -4.7;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 0.87;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 193.600006;
      band5-gain = -6.59;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 3.24;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 355.399994;
      band6-gain = -12.0;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 1.15;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 7347.200195;
      band7-gain = -1.2;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 6.0;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 9022.400391;
      band8-gain = -2.9;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 3.07;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 10000.0;
      band9-gain = 0.4;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 0.7;
      band9-type = "Hi-shelf";
      band9-width = 4.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/1/rightchannel" = {
      band0-frequency = 105.0;
      band0-gain = -6.5;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 0.7;
      band0-type = "Lo-shelf";
      band0-width = 4.0;
      band1-frequency = 22.200001;
      band1-gain = 0.8;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 3.18;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-type = "Off";
      band10-width = 4.0;
      band11-type = "Off";
      band11-width = 4.0;
      band12-type = "Off";
      band12-width = 4.0;
      band13-type = "Off";
      band13-width = 4.0;
      band14-type = "Off";
      band14-width = 4.0;
      band15-type = "Off";
      band15-width = 4.0;
      band16-type = "Off";
      band16-width = 4.0;
      band17-type = "Off";
      band17-width = 4.0;
      band18-type = "Off";
      band18-width = 4.0;
      band19-type = "Off";
      band19-width = 4.0;
      band2-frequency = 32.200001;
      band2-gain = 0.8;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 1.78;
      band2-type = "Bell";
      band2-width = 4.0;
      band20-type = "Off";
      band20-width = 4.0;
      band21-type = "Off";
      band21-width = 4.0;
      band22-type = "Off";
      band22-width = 4.0;
      band23-type = "Off";
      band23-width = 4.0;
      band24-type = "Off";
      band24-width = 4.0;
      band25-type = "Off";
      band25-width = 4.0;
      band26-type = "Off";
      band26-width = 4.0;
      band27-type = "Off";
      band27-width = 4.0;
      band28-type = "Off";
      band28-width = 4.0;
      band29-type = "Off";
      band29-width = 4.0;
      band3-frequency = 71.300003;
      band3-gain = -0.3;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 1.91;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-type = "Off";
      band30-width = 4.0;
      band31-type = "Off";
      band31-width = 4.0;
      band4-frequency = 136.199997;
      band4-gain = -4.7;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 0.87;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 193.600006;
      band5-gain = -6.59;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 3.24;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 355.399994;
      band6-gain = -12.0;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 1.15;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 7347.200195;
      band7-gain = -1.2;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 6.0;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 9022.400391;
      band8-gain = -2.9;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 3.07;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 10000.0;
      band9-gain = 0.4;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 0.7;
      band9-type = "Hi-shelf";
      band9-width = 4.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/2" = {
      bypass = false;
      input-gain = 0.0;
      num-bands = 10;
      output-gain = 0.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/2/leftchannel" = {
      band0-frequency = 105.0;
      band0-gain = -6.5;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 0.7;
      band0-type = "Lo-shelf";
      band1-frequency = 22.200001;
      band1-gain = 1.8;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 3.18;
      band1-type = "Bell";
      band10-type = "Off";
      band11-type = "Off";
      band12-type = "Off";
      band13-type = "Off";
      band14-type = "Off";
      band15-type = "Off";
      band16-type = "Off";
      band17-type = "Off";
      band18-type = "Off";
      band19-type = "Off";
      band2-frequency = 32.200001;
      band2-gain = 0.8;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 1.78;
      band2-type = "Bell";
      band20-type = "Off";
      band21-type = "Off";
      band22-type = "Off";
      band23-type = "Off";
      band24-type = "Off";
      band25-type = "Off";
      band26-type = "Off";
      band27-type = "Off";
      band28-type = "Off";
      band29-type = "Off";
      band3-frequency = 71.300003;
      band3-gain = -0.3;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 1.91;
      band3-type = "Bell";
      band30-type = "Off";
      band31-type = "Off";
      band4-frequency = 136.199997;
      band4-gain = -4.7;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 0.87;
      band4-type = "Bell";
      band5-frequency = 193.600006;
      band5-gain = -0.5;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 3.24;
      band5-type = "Bell";
      band6-frequency = 355.399994;
      band6-gain = 0.9;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 1.15;
      band6-type = "Bell";
      band7-frequency = 7347.200195;
      band7-gain = -1.2;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 6.0;
      band7-type = "Bell";
      band8-frequency = 9022.400391;
      band8-gain = -2.9;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 3.07;
      band8-type = "Bell";
      band9-frequency = 10000.0;
      band9-gain = 0.4;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 0.7;
      band9-type = "Hi-shelf";
    };

    "com/github/wwmm/easyeffects/streamoutputs/equalizer/2/rightchannel" = {
      band0-frequency = 105.0;
      band0-gain = -6.5;
      band0-mode = "APO (DR)";
      band0-mute = false;
      band0-q = 0.7;
      band0-slope = "x1";
      band0-solo = false;
      band0-type = "Lo-shelf";
      band0-width = 4.0;
      band1-frequency = 22.200001;
      band1-gain = 1.8;
      band1-mode = "APO (DR)";
      band1-mute = false;
      band1-q = 3.18;
      band1-slope = "x1";
      band1-solo = false;
      band1-type = "Bell";
      band1-width = 4.0;
      band10-frequency = 194.06;
      band10-gain = 0.0;
      band10-mode = "RLC (BT)";
      band10-mute = false;
      band10-q = 4.36;
      band10-slope = "x1";
      band10-solo = false;
      band10-type = "Off";
      band10-width = 4.0;
      band11-frequency = 240.81;
      band11-gain = 0.0;
      band11-mode = "RLC (BT)";
      band11-mute = false;
      band11-q = 4.36;
      band11-slope = "x1";
      band11-solo = false;
      band11-type = "Off";
      band11-width = 4.0;
      band12-frequency = 298.834;
      band12-gain = 0.0;
      band12-mode = "RLC (BT)";
      band12-mute = false;
      band12-q = 4.36;
      band12-slope = "x1";
      band12-solo = false;
      band12-type = "Off";
      band12-width = 4.0;
      band13-frequency = 370.834;
      band13-gain = 0.0;
      band13-mode = "RLC (BT)";
      band13-mute = false;
      band13-q = 4.36;
      band13-slope = "x1";
      band13-solo = false;
      band13-type = "Off";
      band13-width = 4.0;
      band14-frequency = 460.182;
      band14-gain = 0.0;
      band14-mode = "RLC (BT)";
      band14-mute = false;
      band14-q = 4.36;
      band14-slope = "x1";
      band14-solo = false;
      band14-type = "Off";
      band14-width = 4.0;
      band15-frequency = 571.057;
      band15-gain = 0.0;
      band15-mode = "RLC (BT)";
      band15-mute = false;
      band15-q = 4.36;
      band15-slope = "x1";
      band15-solo = false;
      band15-type = "Off";
      band15-width = 4.0;
      band16-frequency = 708.647;
      band16-gain = 0.0;
      band16-mode = "RLC (BT)";
      band16-mute = false;
      band16-q = 4.36;
      band16-slope = "x1";
      band16-solo = false;
      band16-type = "Off";
      band16-width = 4.0;
      band17-frequency = 879.387;
      band17-gain = 0.0;
      band17-mode = "RLC (BT)";
      band17-mute = false;
      band17-q = 4.36;
      band17-slope = "x1";
      band17-solo = false;
      band17-type = "Off";
      band17-width = 4.0;
      band18-frequency = 1091.26;
      band18-gain = 0.0;
      band18-mode = "RLC (BT)";
      band18-mute = false;
      band18-q = 4.36;
      band18-slope = "x1";
      band18-solo = false;
      band18-type = "Off";
      band18-width = 4.0;
      band19-frequency = 1354.19;
      band19-gain = 0.0;
      band19-mode = "RLC (BT)";
      band19-mute = false;
      band19-q = 4.36;
      band19-slope = "x1";
      band19-solo = false;
      band19-type = "Off";
      band19-width = 4.0;
      band2-frequency = 32.200001;
      band2-gain = 0.8;
      band2-mode = "APO (DR)";
      band2-mute = false;
      band2-q = 1.78;
      band2-slope = "x1";
      band2-solo = false;
      band2-type = "Bell";
      band2-width = 4.0;
      band20-frequency = 1680.47;
      band20-gain = 0.0;
      band20-mode = "RLC (BT)";
      band20-mute = false;
      band20-q = 4.36;
      band20-slope = "x1";
      band20-solo = false;
      band20-type = "Off";
      band20-width = 4.0;
      band21-frequency = 2085.35;
      band21-gain = 0.0;
      band21-mode = "RLC (BT)";
      band21-mute = false;
      band21-q = 4.36;
      band21-slope = "x1";
      band21-solo = false;
      band21-type = "Off";
      band21-width = 4.0;
      band22-frequency = 2587.79;
      band22-gain = 0.0;
      band22-mode = "RLC (BT)";
      band22-mute = false;
      band22-q = 4.36;
      band22-slope = "x1";
      band22-solo = false;
      band22-type = "Off";
      band22-width = 4.0;
      band23-frequency = 3211.29;
      band23-gain = 0.0;
      band23-mode = "RLC (BT)";
      band23-mute = false;
      band23-q = 4.36;
      band23-slope = "x1";
      band23-solo = false;
      band23-type = "Off";
      band23-width = 4.0;
      band24-frequency = 3985.01;
      band24-gain = 0.0;
      band24-mode = "RLC (BT)";
      band24-mute = false;
      band24-q = 4.36;
      band24-slope = "x1";
      band24-solo = false;
      band24-type = "Off";
      band24-width = 4.0;
      band25-frequency = 4945.15;
      band25-gain = 0.0;
      band25-mode = "RLC (BT)";
      band25-mute = false;
      band25-q = 4.36;
      band25-slope = "x1";
      band25-solo = false;
      band25-type = "Off";
      band25-width = 4.0;
      band26-frequency = 6136.63;
      band26-gain = 0.0;
      band26-mode = "RLC (BT)";
      band26-mute = false;
      band26-q = 4.36;
      band26-slope = "x1";
      band26-solo = false;
      band26-type = "Off";
      band26-width = 4.0;
      band27-frequency = 7615.17;
      band27-gain = 0.0;
      band27-mode = "RLC (BT)";
      band27-mute = false;
      band27-q = 4.36;
      band27-slope = "x1";
      band27-solo = false;
      band27-type = "Off";
      band27-width = 4.0;
      band28-frequency = 9449.96;
      band28-gain = 0.0;
      band28-mode = "RLC (BT)";
      band28-mute = false;
      band28-q = 4.36;
      band28-slope = "x1";
      band28-solo = false;
      band28-type = "Off";
      band28-width = 4.0;
      band29-frequency = 11726.8;
      band29-gain = 0.0;
      band29-mode = "RLC (BT)";
      band29-mute = false;
      band29-q = 4.36;
      band29-slope = "x1";
      band29-solo = false;
      band29-type = "Off";
      band29-width = 4.0;
      band3-frequency = 71.300003;
      band3-gain = -0.3;
      band3-mode = "APO (DR)";
      band3-mute = false;
      band3-q = 1.91;
      band3-slope = "x1";
      band3-solo = false;
      band3-type = "Bell";
      band3-width = 4.0;
      band30-frequency = 14552.2;
      band30-gain = 0.0;
      band30-mode = "RLC (BT)";
      band30-mute = false;
      band30-q = 4.36;
      band30-slope = "x1";
      band30-solo = false;
      band30-type = "Off";
      band30-width = 4.0;
      band31-frequency = 18058.4;
      band31-gain = 0.0;
      band31-mode = "RLC (BT)";
      band31-mute = false;
      band31-q = 4.36;
      band31-slope = "x1";
      band31-solo = false;
      band31-type = "Off";
      band31-width = 4.0;
      band4-frequency = 136.199997;
      band4-gain = -4.7;
      band4-mode = "APO (DR)";
      band4-mute = false;
      band4-q = 0.87;
      band4-slope = "x1";
      band4-solo = false;
      band4-type = "Bell";
      band4-width = 4.0;
      band5-frequency = 193.600006;
      band5-gain = -0.5;
      band5-mode = "APO (DR)";
      band5-mute = false;
      band5-q = 3.24;
      band5-slope = "x1";
      band5-solo = false;
      band5-type = "Bell";
      band5-width = 4.0;
      band6-frequency = 355.399994;
      band6-gain = 0.9;
      band6-mode = "APO (DR)";
      band6-mute = false;
      band6-q = 1.15;
      band6-slope = "x1";
      band6-solo = false;
      band6-type = "Bell";
      band6-width = 4.0;
      band7-frequency = 7347.200195;
      band7-gain = -1.2;
      band7-mode = "APO (DR)";
      band7-mute = false;
      band7-q = 6.0;
      band7-slope = "x1";
      band7-solo = false;
      band7-type = "Bell";
      band7-width = 4.0;
      band8-frequency = 9022.400391;
      band8-gain = -2.9;
      band8-mode = "APO (DR)";
      band8-mute = false;
      band8-q = 3.07;
      band8-slope = "x1";
      band8-solo = false;
      band8-type = "Bell";
      band8-width = 4.0;
      band9-frequency = 10000.0;
      band9-gain = 0.4;
      band9-mode = "APO (DR)";
      band9-mute = false;
      band9-q = 0.7;
      band9-slope = "x1";
      band9-solo = false;
      band9-type = "Hi-shelf";
      band9-width = 4.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/expander/0" = {
      sidechain-input-device = "alsa_input.pci-0000_00_1f.3.analog-stereo";
    };

    "com/github/wwmm/easyeffects/streamoutputs/limiter/0" = {
      sidechain-input-device = "alsa_input.pci-0000_00_1f.3.analog-stereo";
    };

    "com/github/wwmm/easyeffects/streamoutputs/loudness/0" = {
      bypass = true;
      volume = -40.0;
    };

    "com/github/wwmm/easyeffects/streamoutputs/multibandcompressor/0" = {
      sidechain-input-device = "alsa_input.pci-0000_00_1f.3.analog-stereo";
    };

  };
}
