from __future__ import (absolute_import, division, print_function)

import subprocess
import os

from ranger.api.commands import Command

class audio_preview(Command):
  def execute(self):
    cmd = self.arg(1)

    subprocess.run("killall -9 sox"
      , shell=True
      , stdout=subprocess.DEVNULL
      , stderr=subprocess.DEVNULL)

    if cmd == "stop":
      return

    if cmd == "up":
      self.fm.move(up=1)
    elif cmd == "down":
      self.fm.move(down=1)

    subprocess.run("sox '" + self.fm.thisfile.path + "' -d &"
      , shell=True
      , stdout=subprocess.DEVNULL
      , stderr=subprocess.DEVNULL)
