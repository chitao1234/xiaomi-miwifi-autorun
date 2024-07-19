# xiaomi-miwifi-autorun
Universal autorun for miwifi, or anything with OpenWRT firewall

# Usage
Get shell access using any means. You can check other tutorials by searching online.

Add work folder for this script to work, you can change `/data/work` here to any persistent folder on the router, but it should be consistent across the firewall and the script itself.
```shell
cd /data
mkdir work
cd work
mkdir autoruns

# The content here might no be up to date, be sure to check autorun.sh in the repo
cat>autorun.sh<<EOF
#!/bin/sh
BASEDIR="/data/work/autoruns"
echo "Running $BASEDIR" | logger -t "autoruns"
cd "$BASEDIR"
for f in `ls $BASEDIR`; do
  echo "Running $f" | logger -t "autoruns"
  ./$f | logger -t "autoruns"
done
EOF

chmod +x autorun.sh
```

Add a custom firewall rule
```shell
uci set firewall.autorun=include
uci set firewall.autorun.type='script'
uci set firewall.autorun.path='/data/work/autorun.sh'
uci set firewall.autorun.enabled='1'
uci set firewall.autorun.reload='1'
uci commit firewall
```

Done. Run `fw3 reload` to check if the script has been added correctly.

Check out (enable_ssh.sh)[autoruns/enable_ssh.sh] for example.
