# Saltstack tips and tricks

<b>Manage files</b>

```yaml
vim:
  pkg.installed

/etc/vimrc:
  file.managed:
    - source: salt://edit/vimrc
    - mode: 644
    - user: root
    - group: root
```