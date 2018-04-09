import sublime
import sublime_plugin


class ToggleWhitespace(sublime_plugin.WindowCommand):
    def run(self):
        prefs = sublime.load_settings('Preferences.sublime-settings')
        state = prefs.get('draw_white_space')

        if state == 'all':
            prefs.set('draw_white_space', 'selection')
        else:
            prefs.set('draw_white_space', 'all')
        sublime.save_settings('Preferences.sublime-settings')
