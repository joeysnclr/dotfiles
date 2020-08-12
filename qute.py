
# VISUALS

# window
c.window.hide_decoration = False

# change tab format
c.tabs.title.format = '{audio} {current_title}'
c.tabs.indicator.width = 0
c.tabs.title.alignment = 'center'
c.tabs.padding = {'top': 7, 'bottom': 7, 'left': 5, 'right': 5}
c.tabs.favicons.show = 'never'


# home page
home = "/Users/joe/dfm/home.html"
c.url.default_page = home
c.url.start_pages = [home]

# font
c.fonts.default_size = '14px'
c.fonts.default_family = ["JetBrains Mono"]

# statusbar
c.statusbar.padding = {'top': 7, 'bottom': 7, 'left': 5, 'right': 5}


# UTILITY/BEHAVIOR

# change default search engine
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
# close last tab
c.tabs.last_close = 'startpage'


# KEYS/COMMANDS

# bind d and u to half page scrolls
# j -> scroll down
# k -> scroll up
# h -> back
# l -> forward
# J - > half page
# K -> half page
# H -> tab left
# L -> tab right
config.unbind("h")
config.unbind("l")
config.bind("h", "back")
config.bind("l", "forward")

config.unbind("J")
config.unbind("K")
config.bind("J", "scroll-page 0 0.5")
config.bind("K", "scroll-page 0 -0.5")

config.unbind("H")
config.unbind("L")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")

# bind x to close tab
config.unbind("d")
config.bind("x", "tab-close")


config.bind(';', 'set-cmd-text :')


# THEME

config.source("nord.py")
