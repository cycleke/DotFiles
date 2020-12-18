#!/usr/bin/env fish
set script_dir (realpath (dirname (status --current-filename)))
set bass_data $XDG_DATA_HOME/.config/fish/functions/bass.fish
set bax_data $XDG_DATA_HOME/.config/fish/functions/bax.fish

function _is_bass_baz
    if not test -e $bass_data; and not test -e $bax_data
        return 1
    else
        return 0
    end
    
end
echo $script_dir/extract
function extract
    if not _is_bass_baz
        echo ' '
        echo 'edc/bass or jorgebucaran/bax.fish must be installed'
        echo ' '
        echo 'run '
        echo ' '
        echo 'fisher install edc/bass'
        echo ' '
        echo 'or'
        echo ' '
        echo 'fisher install jorgebucaran/bax.fish'
        return 1
    end
    bass source $script_dir/extract
end
