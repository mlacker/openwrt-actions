#!/bin/bash
#========================================================================================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================
 
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.250/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-neobird/g' ./feeds/luci/collections/luci/Makefile
sed -i 's/shadowsocksr/vssr/g' ./package/lean/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

# Package
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall2

# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic


# Themes
# luci-theme-argon
rm -rf package/lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# luci-theme-neobird
rm -rf package/lean/luci-theme-neobird
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird.git package/lean/luci-theme-neobird

# ./scripts/feeds update -a
# ./scripts/feeds install -a