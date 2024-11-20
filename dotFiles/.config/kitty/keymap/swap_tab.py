import re, os

from kittens.tui.handler import result_handler
from kitty.key_encoding import KeyEvent, parse_shortcut


def is_window_vim(window, vim_id):
    fp = window.child.foreground_processes
    return any(re.search(vim_id, p['cmdline'][0] if len(p['cmdline']) else '', re.I) for p in fp)
def is_running_in_tmux():
    return "TMUX" in os.environ


def encode_key_mapping(window, key_mapping):
    mods, key = parse_shortcut(key_mapping)
    # if key.isalpha() and (mods & 2) and (mods & 1):
    #     mods = mods & ~1
    #     key = key.upper()
    event = KeyEvent(
        mods=mods,
        key=key,
        shift=bool(mods & 1),
        alt=bool(mods & 2),
        ctrl=bool(mods & 4),
        super=bool(mods & 8),
        hyper=bool(mods & 16),
        meta=bool(mods & 32),
    ).as_window_system_event()

    return window.encoded_key(event)


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    window = boss.window_id_map.get(target_window_id)
    if window is None:
        return

    direction = args[1]
    vim_id = args[3] if len(args) > 3 else "n?vim"
    # cmd = window.child.foreground_cmdline[0]
    # if cmd == 'tmux':
    if is_window_vim(window, vim_id) or is_window_vim(window, "ssh") or is_running_in_tmux():
        keymaps = args[2]
        for keymap in keymaps.split(">"):
            encoded = encode_key_mapping(window, keymap)
            window.write_to_child(encoded)
    else:
        if direction == "move_tab_backward":
            boss.move_tab_backward()
        elif direction == "move_tab_forward":
            boss.move_tab_forward()

