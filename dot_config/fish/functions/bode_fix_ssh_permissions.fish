# Translated permissions from https://superuser.com/a/1559867
function bode_fix_ssh_permissions --description "Refreshes the filepermissions in the ssh folder"
    if test -d ~/.ssh
        chmod 700 ~/.ssh
        chmod 600 ~/.ssh/*

        if [ (find $HOME/.ssh/ -type f \( -name "*.pub" \) | wc -l) -gt 0 ]
            chmod 644 ~/.ssh/*.pub
        end

        if test -f $HOME/.ssh/authorized_keys
            chmod 644 $HOME/.ssh/authorized_keys
        end

        if test -f $HOME/.ssh/allowed_signers
            chmod 644 $HOME/.ssh/allowed_signers
        end
    end
end
