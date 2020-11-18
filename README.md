# rpi-desk
---

rpi-desk is a simple script to install a desktop environment on Raspberry Pi OS Lite.
It currently features the following desktops:

- [Budgie](https://getsol.us)
- [Mate](https://mate-desktop.org)
- [Xfce](https://xfce.org)

For all environments the default packages can also be installed.

---

The script can also install some of the more popular programs.
(Or at least the ones I usually use.)

---

Included are the following packages which are not part of the official repo:

- [Extra Geany Color Schemes](https://github.com/geany/geany-themes/)
- [PhotoGIMP](https://github.com/Diolinux/PhotoGIMP/)
- [Rhythmbox Tray Icon](https://github.com/mendhak/rhythmbox-tray-icon/)
- [Suru++ Asprómauros Icons](https://github.com/gusbemacbe/suru-plus-aspromauros/)

---

Installation:

Enter the following command in the shell (or SSH):
`curl -sSL https://raw.githubusercontent.com/EctoOne/rpi-desk/master/rpi-desk.sh | bash`

There was an issue when I tested the script directly on a RPI3. The screen randomly turned black.
So, I suggest to activate SSH with `raspi-config` and run the script over SSH.

The script currently also has no failsafe code. When, for example, some package fails to download,
it is hard to spot. Especially during one of the bigger setups. I advice to run the separate steps
at least twice. And to pay attention the second time if something goes wrong.

---

Note: I've not spend much time to sort through the default packages for Budgie and Mate.
Those could probably be optimized, but since I personally use Xfce, that's what all additional
packages are set up for. I can not guarantee that everything works fine.
