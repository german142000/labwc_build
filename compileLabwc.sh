apt update &&
apt -y install git gcc build-essential pkg-config cmake libwayland-dev libdrm-dev libxkbcommon-dev libpixman-1-dev wayland-protocols libegl-dev libgbm-dev libgles-dev libvulkan-dev glslang-tools liblcms2-dev libudev-dev libseat-dev hwdata libdisplay-info-dev libliftoff-dev libinput-dev libxcb1-dev xwayland libxcb-composite0-dev libcairo2-dev libxcb-ewmh-dev libxcb-dri3-dev libxcb-present-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-render-util0-dev libxcb-xinput-dev libxcb-errors-dev librsvg2-dev gettext scdoc &&
git clone https://gitlab.freedesktop.org/wlroots/wlroots.git -b 0.18 &&
apt -y install python3-full &&
mkdir pythonenv &&
python3 -m venv /root/pythonenv &&
export PATH=$PATH:/root/pythonenv/bin &&
cd /root/pythonenv/bin &&
pip install meson &&
pip install ninja &&
cd /root/wlroots &&
meson setup build/ &&
ninja -C build/ &&
ninja -C build/ install &&
cd .. &&
git clone https://github.com/labwc/labwc.git &&
cd /root/labwc &&
meson setup build/ &&
meson compile -C build/ &&
cp build/labwc /bin &&
cd .. &&
rm -rf pythonenv &&
rm -rf labwc &&
rm -rf wlroots &&
apt -y remove python3-full gcc cmake pkg-config hwdata wayland-protocols &&
apt -y autoremove && apt clean &&
apt -y remove libwayland-dev libdrm-dev libxkbcommon-dev libpixman-1-dev libegl-dev libgbm-dev libgles-dev libvulkan-dev liblcms2-dev libudev-dev libseat-dev libdisplay-info-dev libliftoff-dev libxcb1-dev libxcb-composite0-dev libcairo2-dev librsvg2-dev &&
apt -y autoremove && apt clean &&
apt -y install libwayland-client0 libwayland-egl1 libwayland-cursor0 libwayland-server0 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-nouveau2 libdrm-radeon1 libdrm-radeon1 libdrm2 libxkbcommon0 libpixman-1-0 libegl1 libgbm1 libgles1 libgles2 libvulkan1 liblcms2-2 libudev1 libseat1 libdisplay-info2 libliftoff0 libcairo2 librsvg2-common
