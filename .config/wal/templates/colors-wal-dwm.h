static const char norm_fg[] = "{foreground}";
static const char norm_bg[] = "{background}";
static const char norm_border[] = "{color8}";

static const char sel_fg[] = "{color15}";
static const char sel_bg[] = "{color4}";
static const char sel_border[] = "{color4}";

static const char urg_fg[] = "{color15}";
static const char urg_bg[] = "{color1}";
static const char urg_border[] = "{color1}";

static const char col_gray1[] = "{background}";
static const char col_gray2[] = "{color8}";
static const char col_gray3[] = "{foreground}";
static const char col_gray4[] = "{color15}";
static const char col_cyan[] = "{color4}";

static const char *colors[3][3] = {{
    {{ norm_fg, norm_bg, norm_border }},
    {{ sel_fg, sel_bg, sel_border }},
    {{ urg_fg, urg_bg, urg_border }},
}};
