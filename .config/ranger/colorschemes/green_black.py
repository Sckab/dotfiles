from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class MyColorscheme(ColorScheme):
    progress_bar_color = 12

    def use(self, context):
        default_colors = (7, 0, 0)

        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.selected:
                if context.file:
                    fg = 2  # verde chiaro
                    bg = 8  # grigio scuro
                else:
                    fg = 2
                    bg = 0
            else:
                if context.directory:
                    fg = 2
                    bg = 0
                elif context.file:
                    fg = 7
                    bg = 0

        return fg, bg, attr
