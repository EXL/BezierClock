Bezier Clock
=============

Port Processing.js [Bezier Clock by Jack Frigaard](http://frigaardj.github.io/bezier-clock/) to QtQuick/QML for KDE Plasma 5 Live Wallpaper.

![Bezier Clock Animation](https://raw.github.com/EXL/BezierClock/master/images/Bezier_clock_animation.gif)

Repository contains code of Bezier Clock Live Wallpaper with settings window (right click on Desktop -> Desktop Settings):

![Bezier Clock Settings](https://raw.github.com/EXL/BezierClock/master/images/Screenshot_settings.png)

And simple standalone QtQuick/QML Application:

![Bezier Clock Application on MS Windows 10](https://raw.github.com/EXL/BezierClock/master/images/Screenshot_app.png)

Video demonstration:

[Bezier Clock on YouTube](http://youtu.be/S5bH2YC9VdM)

## Get sources

* Clone repository into deploy directory:

```sh
cd ~/Deploy/
git clone https://github.com/EXL/BezierClock
```

## Build and Install TAR.XZ-package

* Build the TAR.XZ-package into deploy directory:

```sh
cd ~/Deploy/BezierClock/utils/
./createDistPackage.sh
```

* Install TAR.XZ-package in your KDE Plasma 5 workspace (~/.local/share/plasma/wallpapers):

```sh
cd ~/Deploy/BezierClock/utils/
./installDistPackage.sh
```

## Build and Install Arch Linux package

* Build the Arch Linux package into deploy directory:

```sh
cd ~/Deploy/BezierClock/utils/
makepkg -cf
```

* Install Arch Linux package in your system:

```sh
cd ~/Deploy/BezierClock/utils/
sudo pacman -U bezier-clock-v1.0-1-any.pkg.tar.xz
```

## Build standalone QtQuick/QML-application

* Build and run Bezier Clock executable into deploy directory:

```sh
cd ~/Deploy/BezierClock/
qmake BezierClock.pro
make -j9
./BezierClock
```

## Removing package

* If you installed TAR.XZ-package in your home directory:

```sh
cd ~/Deploy/BezierClock/utils/
./uninstallDistPackage.sh
```

* If you installed Arch Linux package with your package manager:

```sh
sudo pacman -R bezier-clock
```

Run Bezier Clock, experiment with options and enjoy!

## More information

Please read [Porting Guide (In Russian)](http://exlmoto.ru/bezier-clock) for more info about porting Bezier Clock to KDE Plasma 5 Live Wallpaper.
