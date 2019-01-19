wordpress:
  pkg.installed:
    - name: wordpress
  service.running:
    - enable: True
    - reload: True