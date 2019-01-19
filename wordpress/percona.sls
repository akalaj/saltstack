percona:
  cmd.run:
    - name: yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm -y
  pkg.installed:
    - name: Percona-Server-server-57
  service.running:
    - name: mysql
    - enable: True
    - reload: True