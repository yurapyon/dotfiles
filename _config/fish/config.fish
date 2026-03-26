fish_add_path /opt/homebrew/opt/rustup/bin
fish_add_path /Users/parcel/.cargo/bin
fish_add_path /opt/homebrew/bin

if status is-interactive
  fish_config theme choose none

  alias ls="gls -1NLv --group-directories-first --color=auto"
  alias e="nvim"
end

function fish_prompt
    string join '' -- (set_color magenta) (prompt_pwd --full-length-dirs 2) (set_color normal) " \$ "
end

set -g fish_greeting
set fish_autosuggestion_enabled 0

set -x EDITOR nvim

set -x LIBRARY_PATH (brew --prefix)/lib

function _cargo_tr
  for line in $(cargo tree --depth 1 -e normal --prefix none)
    set --local pkg (string split ' ' -f1,2 $line)
    string join '' -- '-p ' $pkg[1] '@' (string trim -l -c 'v' $pkg[2])
  end
end

function cargo_doc_imm
  _cargo_tr | xargs cargo doc --no-deps --open
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/parcel/.opam/opam-init/init.fish' && source '/Users/parcel/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
