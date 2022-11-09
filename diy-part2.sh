#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# File name: diy-part2.sh
# Description: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-argon）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.250/g' package/base-files/files/bin/config_generate

# 移除不用软件包
rm -rf package/helloworld

# 添加额外软件包
# git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
# git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# svn co https://github.com/fw876/helloworld/trunk/xray-core package/helloworld/xray-core
# svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/helloworld/simple-obfs
# svn co https://github.com/fw876/helloworld/trunk/trojan package/helloworld/trojan
# svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/helloworld/xray-plugin
# svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/helloworld/shadowsocks-rust
# svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/helloworld/v2ray-plugin
# svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/helloworld/v2ray-core
# svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/helloworld/shadowsocksr-libev
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/helloworld/luci-app-ssr-plus
# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

# docker
sed -i 's/PKG_VERSION:=20.10.17/PKG_VERSION:=20.10.21/g' feeds/packages/utils/docker/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/utils/docker/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=f0f62ca1c80e8fd5b9e140ca64ef3e75dc7cf7a28040b3d10b260307128946e8/g' feeds/packages/utils/docker/Makefile
sed -i 's/PKG_GIT_SHORT_COMMIT:=100c701/PKG_GIT_SHORT_COMMIT:=baeda1f/g' feeds/packages/utils/docker/Makefile

# dockerd
sed -i 's/PKG_VERSION:=20.10.17/PKG_VERSION:=20.10.21/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=61f4c3a2d0426e1bbbda1b0e5dd33ec203776f7d99d1a61522c77c04c4ed09fe/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/PKG_GIT_SHORT_COMMIT:=a89b842/PKG_GIT_SHORT_COMMIT:=3056208/g' feeds/packages/utils/dockerd/Makefile
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

# docker-compose
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.12.2/g' feeds/packages/utils/docker-compose/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=311131c5d930fdb1f5e86de19ea2ad1705d23e5745b780c0b10b2eb3f964fc69/g' feeds/packages/utils/docker-compose/

# zerotier
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.10.2/g' feeds/packages/net/zerotier/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9f98b1670785f42294b9858068d42c6b8c2fdee6402e871a36562b47559e74e7/g' feeds/packages/net/zerotier/Makefile
#rm -rf feeds/packages/net/zerotier
#cp -rf $GITHUB_WORKSPACE/general/zerotier feeds/packages/net

# luci-theme-argon
rm -rf package/lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# luci-theme-neobird
rm -rf package/lean/luci-theme-neobird  
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
