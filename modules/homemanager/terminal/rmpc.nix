{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    rmpc.enable =
      lib.mkEnableOption "enables rmpc";
  };
  config = lib.mkIf config.rmpc.enable {
    programs.rmpc = {
      enable = true;
      config = ''
        #![enable(implicit_some)]
        #![enable(unwrap_newtypes)]
        #![enable(unwrap_variant_newtypes)]
        (
            address: "127.0.0.1:6600",
            password: None,
            theme: None,
            cache_dir: None,
            on_song_change: None,
            volume_step: 5,
            max_fps: 30,
            scrolloff: 0,
            wrap_navigation: false,
            enable_mouse: true,
            status_update_interval_ms: 1000,
            select_current_song_on_change: false,
            album_art: (
                method: Auto,
                max_size_px: (width: 1200, height: 1200),
                disabled_protocols: ["http://", "https://"],
                vertical_align: Center,
                horizontal_align: Center,
            ),
            lyrics_dir: "/home/ryann/Music",
            keybinds: (
                global: {
                    ":":       CommandMode,
                    ",":       VolumeDown,
                    "s":       Stop,
                    ".":       VolumeUp,
                    "<Tab>":   NextTab,
                    "<S-Tab>": PreviousTab,
                    "1":       SwitchToTab("Queue"),
                    "2":       SwitchToTab("Lyrics"),
                    "3":       SwitchToTab("Directories"),
                    "4":       SwitchToTab("Artists"),
                    "5":       SwitchToTab("Album Artists"),
                    "6":       SwitchToTab("Albums"),
                    "7":       SwitchToTab("Playlists"),
                    "8":       SwitchToTab("Search"),
                    "q":       Quit,
                    ">":       NextTrack,
                    "p":       TogglePause,
                    "<":       PreviousTrack,
                    "f":       SeekForward,
                    "z":       ToggleRepeat,
                    "x":       ToggleRandom,
                    "c":       ToggleConsume,
                    "v":       ToggleSingle,
                    "b":       SeekBack,
                    "~":       ShowHelp,
                    "I":       ShowCurrentSongInfo,
                    "O":       ShowOutputs,
                    "P":       ShowDecoders,
                },
                navigation: {
                    "k":         Up,
                    "j":         Down,
                    "h":         Left,
                    "l":         Right,
                    "<Up>":      Up,
                    "<Down>":    Down,
                    "<Left>":    Left,
                    "<Right>":   Right,
                    "<C-k>":     PaneUp,
                    "<C-j>":     PaneDown,
                    "<C-h>":     PaneLeft,
                    "<C-l>":     PaneRight,
                    "<C-u>":     UpHalf,
                    "N":         PreviousResult,
                    "a":         Add,
                    "A":         AddAll,
                    "r":         Rename,
                    "n":         NextResult,
                    "g":         Top,
                    "<Space>":   Select,
                    "<C-Space>": InvertSelection,
                    "G":         Bottom,
                    "<CR>":      Confirm,
                    "i":         FocusInput,
                    "J":         MoveDown,
                    "<C-d>":     DownHalf,
                    "/":         EnterSearch,
                    "<C-c>":     Close,
                    "<Esc>":     Close,
                    "K":         MoveUp,
                    "D":         Delete,
                },
                queue: {
                    "D":       DeleteAll,
                    "<CR>":    Play,
                    "<C-s>":   Save,
                    "a":       AddToPlaylist,
                    "d":       Delete,
                    "i":       ShowInfo,
                    "C":       JumpToCurrent,
                },
            ),
            search: (
                case_sensitive: false,
                mode: Contains,
                tags: [
                    (value: "any",         label: "Any Tag"),
                    (value: "artist",      label: "Artist"),
                    (value: "album",       label: "Album"),
                    (value: "albumartist", label: "Album Artist"),
                    (value: "title",       label: "Title"),
                    (value: "filename",    label: "Filename"),
                    (value: "genre",       label: "Genre"),
                ],
            ),
            artists: (
                album_display_mode: SplitByDate,
                album_sort_by: Date,
            ),
            tabs: [
                (
                    name: "Queue",
                    pane: Split(
                        direction: Horizontal,
                        panes: [(size: "40%", pane: Pane(AlbumArt)), (size: "60%", pane: Pane(Queue))],
                    ),
                ),
                (
                    name: "Lyrics",
                    pane: Split(
                        direction: Vertical,
                        panes: [(size:"25%", pane: Pane(AlbumArt), borders: "ALL"), (size: "75%", pane: Pane(Lyrics), borders: "ALL")],
                    ),  
                ),
                (
                    name: "Directories",
                    pane: Pane(Directories),
                ),
                (
                    name: "Artists",
                    pane: Pane(Artists),
                ),
                (
                    name: "Album Artists",
                    pane: Pane(AlbumArtists),
                ),
                (
                    name: "Albums",
                    pane: Pane(Albums),
                ),
                (
                    name: "Playlists",
                    pane: Pane(Playlists),
                ),
                (
                    name: "Search",
                    pane: Pane(Search),
                ),
            ],
        )
      '';
    };
  };
}
