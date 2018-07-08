vim:
    pkg.installed

/etc/vim/vimrc.local:
    file.managed:
        - source: salt://files/vimrc.local
        - mode:  664
        - user:  root
        - group: root
