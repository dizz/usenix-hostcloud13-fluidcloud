1. define json file on smartos with right size (disc etc)
2. vmadm create < target.json
3. boot rescue image iso on both sides
4. copy using ssh commands
4.a) (on source): dd if=/dev/sda | nc <target> 6010
4.b) (on target): nc -l -p 6010 | dd=/dev/sda bs=16M
5) dd takes about ~4mins for 5.4Gb disk size
6) on target reboot
