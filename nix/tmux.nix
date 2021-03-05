{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 1;
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-q";
    resizeAmount = 5;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    extraConfig = ''
      ## set status bar ##
      # status line を更新する間隔を 1 秒にする
      set-option -g status-interval 1
      # window-status を中央揃えで配置する
      set-option -g status-justify "centre"
      # status line の背景色を指定する。
      set-option -g status-bg "colour238"
      # status line の文字色を指定する。
      set-option -g status-fg "colour255"
      # status-left の最大の長さを指定する。
      set-option -g status-left-length 20
      # status-left のフォーマットを指定する。
      set-option -g status-left "#[fg=colour255,bg=colour241]Session: #S #[default]"
      # status-right の最大の長さを指定する。
      set-option -g status-right-length 60
      # status-right のフォーマットを指定する。
      set-option -g status-right "#[fg=colour255,bg=colour241] | %m/%d %H:%M:%S#[default]"
      # window-status のフォーマットを指定する。
      set-window-option -g window-status-format " #I: #W "
      # カレントウィンドウの window-status のフォーマットを指定する
      set-window-option -g window-status-current-format "#[fg=colour255,bg=colour27,bold] #I: #W #[default]"

      # | でペインを縦分割する
      bind | split-window -h
      # - でペインを縦分割する
      bind - split-window -v

      # コピーモードを設定する
      # コピーモードでvimキーバインドを使う
      setw -g mode-keys vi

      # 'v' で選択を始める
      bind -T copy-mode-vi v send -X begin-selection
      # 'V' で行選択
      bind -T copy-mode-vi V send -X select-line
      # 'C-v' で矩形選択
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      # 'y' でヤンク
      bind -T copy-mode-vi y send -X copy-selection
      # 'Y' で行ヤンク
      bind -T copy-mode-vi Y send -X copy-line
      # 'C-p'でペースト
      bind-key C-p paste-buffer
    '';
  };
}
