import os
from datetime import datetime

import sublime
import sublime_plugin


class OpenJournalEntry(sublime_plugin.WindowCommand):
    def run(self):
        root = os.path.dirname(self.window.project_file_name())
        relpath = datetime.today().strftime('journal/%Y/%m/%d.md')
        file_path = os.path.join(root, relpath)
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        self.window.open_file(file_path)

    def is_enabled(self):
        return bool(self.window.project_file_name())
