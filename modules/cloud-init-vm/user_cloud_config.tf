resource "proxmox_virtual_environment_file" "user_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "gryffindor"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.name}
    timezone: Europe/Stockholm
    users:
      - default
      - name: ${var.user}
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(var.ssh_keys)}
        sudo: ALL=(ALL) NOPASSWD:ALL

    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
      - git
      - ansible

    write_files:
      - path: /root/.ssh/id_rsa
        permissions: '0600'
        content: |
          ${indent(6, trimspace(var.deploy_key))}

      - path: /root/.ssh/known_hosts
        permissions: '0644'
        content: |
          github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
          github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
          github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=

      - path: /etc/systemd/system/ansible-pull.service
        permissions: '0644'
        content: |
          [Unit]
          Description=Run ansible-pull from repo
          After=network-online.target

          [Service]
          Type=oneshot
          ExecStart=/usr/bin/ansible-pull -U ${var.repo_url} playbooks/${var.playbook} --tags="update" -C main
          WorkingDirectory=/root
          StandardOutput=journal
          StandardError=journal

      - path: /etc/systemd/system/ansible-pull.timer
        permissions: '0644'
        content: |
          [Unit]
          Description=Run ansible-pull every 15 minutes

          [Timer]
          OnBootSec=5min
          OnUnitActiveSec=15min
          Persistent=true

          [Install]
          WantedBy=timers.target
    runcmd:
      - systemctl daemon-reexec
      - systemctl daemon-reload
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - systemctl enable ansible-pull.timer
      - systemctl start ansible-pull.timer
      - ansible-pull -U ${var.repo_url} playbooks/${var.playbook} --tags="install" -C main > /var/log/ansible-pull.log 2>&1 || touch /tmp/ansible-pull-failed
      - echo "Provisioning completed at $(date -Is)" > /var/log/cloud-init-confirmation.log
    EOF

    file_name = "${var.name}-user-cloud-config.yaml"
  }
}
