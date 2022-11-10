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
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile


# Package

git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# rm -rf package/helloworld
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# svn co https://github.com/fw876/helloworld/trunk/xray-core package/helloworld/xray-core
# svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/helloworld/xray-plugin
# svn co https://github.com/fw876/helloworld/trunk/trojan package/helloworld/trojan
# svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/helloworld/simple-obfs
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/helloworld/luci-app-ssr-plus

# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2/luci-app-passwall2 package/luci-app-passwall2

# svn co https://github.com/kenzok8/small-package/trunk/luci-app-alist package/luci-app-alist

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