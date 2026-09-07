```
sudo apt update
sudo apt install -y \
  git meson ninja-build pkg-config bison flex check \
  libglib2.0-dev libpango1.0-dev libcairo2-dev libcairo-gobject2 \
  libgdk-pixbuf-2.0-dev libstartup-notification0-dev \
  libxkbcommon-dev libxkbcommon-x11-dev \
  libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-xinerama0-dev \
  libxcb-util-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-cursor-dev \
  libwayland-dev wayland-protocols meson ninja

git clone https://github.com/davatorium/rofi
cd rofi
meson setup build --prefix=/usr/local
ninja -C build
sudo ninja -C build install

```
