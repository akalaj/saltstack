common_packages:
  pkg.installed:
    - pkgs:
      - openssh-server
      - gawk
      - socat
      - libaio1
      - libcgi-fast-perl
      - libcgi-pm-perl
      - libdbd-mysql-perl
      - libdbi-perl
      - libencode-locale-perl
      - libfcgi-perl
      - libhtml-parser-perl
      - libhtml-tagset-perl
      - libhtml-template-perl
      - libhttp-date-perl
      - libhttp-message-perl
      - libio-html-perl
      - liblwp-mediatypes-perl
      - libmysqlclient20
      - libreadline5
      - libterm-readkey-perl
      - libtimedate-perl
      - liburi-perl
      - mysql-common
      - screen

vim-tiny:
    pkg.purged:
        - version: 2:7.4.1689-3ubuntu1.2

/etc/apt/sources.list:
    file.managed:
        - source: salt://files/sources.list
        - mode:  664
        - user:  root
        - group: root
