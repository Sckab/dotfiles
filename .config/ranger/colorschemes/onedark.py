from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class OneDark(ColorScheme):
    progress_bar_color = blue

    def use(self, context):
        fg, bg, attr = default_colors
        if context.reset:
            return default_colors

        if context.in_browser:
            fg = white
            if context.selected:
                attr = reverse
            if context.directory:
                fg = cyan
            if context.executable and not context.directory:
                fg = green
            if context.link:
                fg = magenta
            if context.media:
                fg = yellow

        return fg, bg, attr
