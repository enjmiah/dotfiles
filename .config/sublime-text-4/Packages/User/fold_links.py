import sublime
import sublime_plugin


class MarkdownFoldLinksCommand(sublime_plugin.TextCommand):
    def run(self, _edit):
        self.view.fold(self.view.find_by_selector("meta.link.inline markup.underline.link"))

    def description(self):
        return 'Fold all links'

    def is_enabled(self):
        return self.view.match_selector(0, "text.html.markdown")


class MarkdownLinkFolder(sublime_plugin.ViewEventListener):
    @classmethod
    def is_applicable(cls, settings):
        return settings.get("syntax").endswith("Markdown.sublime-syntax")

    def on_load(self):
        self.view.run_command("markdown_fold_links")

    on_post_save = on_load
