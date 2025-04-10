
return {

    color_scheme = 'oxocarbon',

    -- backend
    max_fps = 120,
    front_end = 'WebGpu',
    webgpu_power_preference = 'HighPerformance',

    -- cursor
    animation_fps = 120,
    cursor_blink_ease_in = 'EaseOut',
    cursor_blink_ease_out = 'EaseOut',
    default_cursor_style = 'BlinkingBlock',
    cursor_blink_rate = 650,

    -- tab bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = true,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,

    -- opacity
    window_background_opacity = 0.90,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },


}
