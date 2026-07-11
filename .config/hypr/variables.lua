hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        focus_on_activate = true,
        anr_missed_pings = 5,
        vrr = 3,
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
        middle_click_paste = false,
        allow_session_lock_restore = true,
        on_focus_under_fullscreen = 2,
        enable_swallow = true,
        swallow_regex = "(kitty|alacritty|com.mitchellh.ghostty|.*wezterm)",
        swallow_exception_regex = "(glxgears|wev|noswallow).*",
    },
})

hl.config({
    dwindle = { preserve_split = true },
})

hl.config({
    master = { new_status = "master" },
})

hl.config({
    xwayland = { force_zero_scaling = true },
})

hl.config({
    ecosystem = { no_update_news = true },
})

hl.config({
    cursor = { inactive_timeout = 20 },
})

hl.config({
    binds = { scroll_event_delay = 0 },
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
        resize_on_border = true,
        no_focus_fallback = true,
        allow_tearing = true,
        snap = { enabled = true },
        col = {
            active_border = primary,
            inactive_border = outline_variant,
        },
    },
})

hl.config({
    decoration = {
        rounding = 10,
        rounding_power = 10,
        active_opacity = 0.95,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,
        blur = {
            enabled = true,
            special = false,
            xray = false,
            size = 1,
            passes = 3,
            brightness = 1,
            noise = 0.05,
            popups = true,
            popups_ignorealpha = 0.6,
        },
        shadow = { enabled = false },
        dim_inactive = true,
        dim_strength = 0.025,
        dim_special = 0.07,
    },
})

hl.config({
    group = {
        col = {
            border_active = primary,
            border_inactive = outline_variant,
        },
        groupbar = {
            col = { active = surface },
        },
    },
})
