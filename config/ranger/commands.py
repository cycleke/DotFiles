import os, re, subprocess
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader


class paste_as_root(Command):
    def execute(self):
        if self.fm.do_cut:
            self.fm.execute_console("shell sudo mv %c .")
        else:
            self.fm.execute_console("shell sudo cp -r %c .")


class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):

        if self.quantifier:
            # match only directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to file'"
        else:
            # match files and directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to filemap <C-f> fzf_select'"
        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class extract(Command):
    """:extract <paths>

    Extract archives using 7z
    """

    def execute(self):
        fail = []
        for i in self.fm.thistab.get_selection():
            path = i.path
            file = os.path.basename(path)
            shell = None
            if re.match(".*(\.tar\.gz|\.tgz)$", file):
                shell = 'tar zxvf "{0}"'.format(path)
            elif re.match(".*(\.tar\.bz2|\.tbz|\.tbz2)$", file):
                shell = 'tar xvjf "{0}"'.format(path)
            elif re.match(".*(\.tar\.xz|\.txz)$", file):
                shell = 'tar xJvf "{0}"'.format(path)
            elif re.match(".*\.tar$", file):
                shell = 'tar xvf "{0}"'.format(path)
            elif re.match(
                ".*(\.zip|\.war|\.jar|\.sublime-package|\.ipsw|\.xpi|\.apk|\.aar|\.whl)$",
                file,
            ):
                shell = 'unzip "{0}" -d "{1}"'.format(path, os.path.splitext(path)[0])
            elif re.match(".*\.rar"):
                shell = 'unrar x -ad "{0}"'.format(path)
            elif re.match(".*\.7z"):
                shell = '7za x "{0}"'.format(path)

            if not shell or os.system(shell):
                fail.append(i.path)
        if len(fail) > 0:
            self.fm.notify(
                "Fail to extract: {0}".format(" ".join(fail)), duration=10, bad=True
            )
        self.fm.redraw_window()


class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(
            args=["apack"]
            + au_flags
            + [os.path.relpath(f.path, cwd.path) for f in marked_files],
            descr=descr,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)

    def tab(self):
        """ Complete with current folder name """

        extension = [".zip", ".tar.gz", ".rar", ".7z"]
        return [
            "compress " + os.path.basename(self.fm.thisdir.path) + ext
            for ext in extension
        ]
