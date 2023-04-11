function fish_user_key_bindings
    # Load fuzzy finder key bindings
    cat "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.fish" | source
end
