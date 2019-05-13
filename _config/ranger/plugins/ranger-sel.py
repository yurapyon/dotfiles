from __future__ import (absolute_import, division, print_function)

import os
import subprocess
import ranger.api
from ranger.api.commands import Command

_hook_ready = ranger.api.hook_ready

ranger_start_dir = ""

def hook_ready(fm):
    global ranger_start_dir
    ranger_start_dir = fm.thisdir.path
    return _hook_ready(fm)

ranger.api.hook_ready = hook_ready

class clip_sel(Command):
  def execute(self):
    cmd = self.arg(1)

    output_file = open("/tmp/.rsel", "w")

    if cmd == "absolute":
      for selected_file in self.fm.thistab.get_selection():
        output_file.write(selected_file.path + "\n")
    elif cmd == "relative":
      for selected_file in self.fm.thistab.get_selection():
        output_file.write(os.path.join(os.path.relpath(os.path.dirname(selected_file.path)
                                                       , ranger_start_dir)
                                       , os.path.basename(selected_file.path)) + "\n")
    else:
      return

    output_file.close()

    subprocess.run("xclip -selection clipboard -i /tmp/.rsel"
      , shell=True
      , stdout=subprocess.DEVNULL
      , stderr=subprocess.DEVNULL)
