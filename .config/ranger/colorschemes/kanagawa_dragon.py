from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class KanagawaDragon(ColorScheme):
    progress_bar_color = 108  # roninYellow

    def use(self, context):
        fg, bg, attr = default_colors
        
        if context.reset:
            return default_colors

        # Kanagawa Dragon color palette
        # Background colors
        dragonBlack0 = 234   # #0d0c0c
        dragonBlack1 = 235   # #181616
        dragonBlack2 = 236   # #201d1d
        dragonBlack3 = 237   # #282727
        dragonBlack4 = 238   # #393836
        dragonBlack5 = 239   # #625e5a
        dragonBlack6 = 240   # #a6a69c
        
        # Foreground colors
        dragonWhite = 253    # #c5c9c5
        dragonGray = 248     # #9e9b93
        dragonGray2 = 245    # #7a8382
        
        # Accent colors
        dragonGreen = 108    # #87a987
        dragonGreen2 = 107   # #8a9a7b
        dragonRed = 167      # #c4746e
        dragonOrange = 215   # #b6927b
        dragonOrange2 = 173  # #e46876
        dragonYellow = 222   # #c4b28a
        dragonBlue = 109     # #8ba4b0
        dragonBlue2 = 67     # #8ea4a2
        dragonViolet = 176   # #a292a3
        dragonPink = 175     # #b5585f
        dragonAqua = 108     # #8ea4a2
        
        # Use authentic Kanagawa Dragon green for directories
        customDirectoryGreen = 108  # #87a987 (dragonGreen)
        
        # Set default colors
        fg = dragonWhite
        bg = default
        
        if context.in_browser:
            if context.empty or context.error:
                fg = dragonGray2
            
            if context.border:
                fg = dragonBlack5
            
            if context.media:
                if context.image:
                    fg = dragonViolet
                else:
                    fg = dragonYellow
            
            if context.container:
                fg = dragonRed
            
            if context.directory:
                attr |= bold
                fg = customDirectoryGreen
            elif context.executable and not context.container:
                fg = dragonGreen
                attr |= bold
            
            # Selection should override everything else
            if context.selected:
                fg = dragonGreen  # Your gorgeous green for selected items
                bg = dragonBlack1  # Dark background for contrast
                attr |= bold  # Make it bold for better visibility
            
            if context.socket:
                fg = dragonPink
                attr |= bold
            
            if context.fifo or context.device:
                fg = dragonYellow
                if context.device:
                    attr |= bold
            
            if context.link:
                fg = dragonAqua if context.good else dragonRed
            
            if context.bad:
                fg = dragonRed
            
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (dragonRed, dragonPink):
                    fg = dragonWhite
                else:
                    fg = dragonRed
            
            if not context.selected and (context.cut or context.copied):
                fg = dragonBlack6
                attr |= bold
            
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = dragonYellow
            
            if context.badinfo:
                if attr & reverse:
                    bg = dragonRed
                else:
                    fg = dragonRed

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = dragonGreen if context.bad else dragonBlue
            elif context.directory:
                fg = customDirectoryGreen
            elif context.tab:
                if context.good:
                    fg = dragonGreen
            elif context.link:
                fg = dragonAqua

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = dragonGreen
                elif context.bad:
                    fg = dragonRed
            if context.marked:
                attr |= bold | reverse
                fg = dragonYellow
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = dragonRed
                elif context.good:
                    attr |= bold
                    fg = dragonGreen
            if context.loaded:
                bg = self.progress_bar_color
                fg = dragonBlack1

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = dragonBlue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color
                    fg = dragonBlack1

        return fg, bg, attr

