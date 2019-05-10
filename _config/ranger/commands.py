from __future__ import (absolute_import, division, print_function)

import subprocess
import os

from ranger.api.commands import Command

class kselect(Command):
  def ksend(self, args):
    subprocess.run("send \"" + args + "\""
      , shell=True
      , stdout=subprocess.DEVNULL
      , stderr=subprocess.DEVNULL)
    
  def execute(self):
    cmd = self.arg(1)
    reg = self.arg(2)

    # get kak pwd
    self.ksend("echo -to-file /tmp/.rsel.kak %sh{ echo $PWD }")

    kak_pwd_file = open("/tmp/.rsel.kak", "r")
    kak_pwd = kak_pwd_file.read()
    kak_pwd_file.close()

    if reg == "":
      reg = "r"

    output_file = open("/tmp/.rsel", "w")

    if cmd == "absolute":
      for selected_file in self.fm.thistab.get_selection():
        output_file.write(selected_file.path + "\n")
    elif cmd == "relative":
      for selected_file in self.fm.thistab.get_selection():
        output_file.write(os.path.relpath(selected_file.path, kak_pwd) + "\n")
    else:
      return

    output_file.close()

    self.ksend("edit /tmp/.rsel ; exec '%\\\"" + reg + "y' ; db")

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

