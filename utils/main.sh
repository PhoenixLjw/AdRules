#!/bin/sh
LC_ALL='C'

cd ./rules
rm *.txt
rm -rf md5 tmp
# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
# uBlock Origin规则
ublock=(
  # uBlock filters
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
  # uBlock filters – Badware risks
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt"
  # uBlock filters – Privacy
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
  # uBlock filters – Quick fixes
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt"
  # uBlock filters – Resource abuse
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt"
  # uBlock filters – Unbreak
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt"
  # uBlock filters – Annoyances
  "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
)

# Adguard For Android 规则
adguard=(
  # 基础过滤器
  "https://filters.adtidy.org/android/filters/2_optimized.txt"
  # 移动设备过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt"
  # 防跟踪保护过滤器
  "https://filters.adtidy.org/android/filters/3_optimized.txt"
  # URL跟踪过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"
  # 社交媒体过滤器
  "https://filters.adtidy.org/android/filters/4_optimized.txt"
  # 恼人广告过滤器
  "https://filters.adtidy.org/android/filters/14_optimized.txt"
  # 中文过滤器
  "https://filters.adtidy.org/android/filters/224_optimized.txt"
  # 实验性过滤器
  "https://filters.adtidy.org/android/filters/5_optimized.txt"
)

# Adguard For uBlock Origin 规则
adguard_ubo=(
  # 基础过滤器
  "https://filters.adtidy.org/extension/ublock/filters/2.txt"
  # 移动设备过滤器
  "https://filters.adtidy.org/extension/ublock/filters/11.txt"
  # 防跟踪保护过滤器
  "https://filters.adtidy.org/extension/ublock/filters/3.txt"
  # URL跟踪过滤器
  "https://filters.adtidy.org/extension/ublock/filters/17.txt"
  # 社交媒体过滤器
  "https://filters.adtidy.org/extension/ublock/filters/4.txt"
  # 恼人广告过滤器
  "https://filters.adtidy.org/extension/ublock/filters/14.txt"
  # 中文过滤器
  "https://filters.adtidy.org/extension/ublock/filters/224.txt"
  # 实验性过滤器
  "https://filters.adtidy.org/extension/ublock/filters/5.txt"
)

# Adguard For PC 规则
adguard_full=(
  # 基础过滤器
  "https://filters.adtidy.org/windows/filters/2.txt"
  # 移动设备过滤器
  "https://filters.adtidy.org/windows/filters/11.txt"
  # 防跟踪保护过滤器
  "https://filters.adtidy.org/windows/filters/3.txt"
  # URL跟踪过滤器
  "https://filters.adtidy.org/windows/filters/17.txt"
  # 社交媒体过滤器
  "https://filters.adtidy.org/windows/filters/4.txt"
  # 恼人广告过滤器
  "https://filters.adtidy.org/windows/filters/14.txt"
  # 中文过滤器
  "https://filters.adtidy.org/windows/filters/224.txt"
  # 实验性过滤器
  "https://filters.adtidy.org/windows/filters/5.txt"
)

# 元素过滤规则
adblock=(
  # Cats-Team 自定义元素过滤规则
  "https://raw.githubusercontent.com/Cats-Team/AdRules/main/mod/rules/adblock-rules.txt"
  # I don't care about cookies
  "https://www.i-dont-care-about-cookies.eu/abp/"
  # Adblock Warning Removal List
  "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
  # Anti-Adblock Killer
  "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
  # Anti-AD for Adguard
  "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-adguard.txt"
  # 乘风通用过滤规则，适用于UBO或ADG
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt"
  # 乘风视频过滤规则，适用于UBO或ADG
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt"
  # EasyList (反广告主规则列表。主要面向英文网站，包含大量通用规则)
  "https://easylist-downloads.adblockplus.org/easylist.txt"
  # Easylist China (反广告主规则列表的补充。主要面向中文网站)
  "https://easylist-downloads.adblockplus.org/easylistchina.txt"
  # EasyPrivacy (防隐私跟踪挖矿规则列表)
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  # CJX's Annoyance List (反自我推广,移除anti adblock,防跟踪规则列表)
  "https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-annoyance.txt"
)

# 元素过滤规则(mobile)
adblock_lite=(
  # NEO DEV HOST - Lite version (Without Dead Domain inside) 精简版（不包含过期域名）
  "https://raw.githubusercontent.com/neodevpro/neodevhost/master/lite_adblocker"
  # 主要去除手机盗版网站广告 @酷安：大萌主
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
  # 去 APP 下载广告规则
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt"
  # adgk规则 @坂本大佬
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"
  # 百度超级净化 @坂本大佬
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt"
  # 1Hosts(Lite)
  # "https://raw.githubusercontent.com/badmojr/1Hosts/master/Lite/adblock.txt"
  # ADFILT
  # "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
  # ADFILT
  # "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt"
  # Fanboy's Notifications Blocking List
  # "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
)

# 元素过滤规则(PC)
adblock_full=(
  # (ubo专用) CJX's uBlock list (CJX's Annoyance List的补充。)
  "https://raw.githubusercontent.com/cjx82630/cjxlist/master/cjx-ublock.txt"
  # (ABP专用) chinese.txt (CJX's Annoyance List的补充。)
  # "https://raw.githubusercontent.com/cjx82630/cjxlist/master/chinese.txt"
  # NEO DEV HOST - Full version (With Dead Domain inside) 完整版（包含过期域名）
  "https://raw.githubusercontent.com/neodevpro/neodevhost/master/adblocker"
  # BarbBlock For uBlock Origin
  "https://paulgb.github.io/BarbBlock/blacklists/ublock-origin.txt"
  # url过滤器 by Hacamer
  "https://raw.githubusercontent.com/Cats-Team/AdRule/main/url-filter.txt"
)

# DNS过滤规则
dns=(
  # Cats-Team 自定义DNS过滤规则
  "https://raw.githubusercontent.com/Cats-Team/AdRules/main/mod/rules/dns-rules.txt"
  # AdGuard DNS filter
  "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
  # 1Hosts(Lite)
  # "https://raw.githubusercontent.com/badmojr/1Hosts/master/lite/adblock.txt"
  # Anti-AD for AdGuardHome（DNS过滤）
  "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-easylist.txt"
  # Online Malicious URL Blocklist (AdGuard Home)
  "https://curben.gitlab.io/malware-filter/urlhaus-filter-agh-online.txt"
  # Adblock Warning Removal List
  "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
  # Fanboy's Annoyance List
  "https://easylist.to/easylist/fanboy-annoyance.txt"
  # Abp rule (Adblocker syntax)
  "https://abp.oisd.nl/basic/"
  # LWJ's black list
  "https://raw.githubusercontent.com/liwenjie119/adg-rules/master/black.txt"
  # Spam404
  "https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
  # ADFILT
  # "https://raw.githubusercontent.com/DandlionSprout/adfilt/master/AdGuard%20Home%20Compilation%20List/AdGuardHomeCompilationList-Notifications.txt"
)

# HOSTS过滤
hosts=(
  # 大圣净化规则
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
  # neoHosts - 包含全部数据，仅推荐强迫症使用。广告域名会被定向至 127.0.0.1 而不是 0.0.0.0，兼容性更好。
  "https://cdn.jsdelivr.net/gh/neoFelhz/neohosts@gh-pages/127.0.0.1/full/hosts"
  # AdAway
  "https://adaway.org/hosts.txt"
  # NEO DEV HOST - Lite version (Without Dead Domain inside) 精简版（不包含过期域名）
  "https://raw.githubusercontent.com/neodevpro/neodevhost/master/lite_host"
  # BarbBlock
  "https://paulgb.github.io/BarbBlock/blacklists/hosts-file.txt"
  # NoCoin adblock list
  "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt"
  # Abp rule
  "https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/hosts.txt"
)

allow=(
  # LWJ's white list
  "https://raw.githubusercontent.com/liwenjie119/adg-rules/master/white.txt"
  # AdGuard Chinese Filters whitelist
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/whitelist.txt"
  # AdGuard Spyware Filters whitelist
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/whitelist.txt"
)


for i in "${!ublock[@]}" "${!adguard[@]}" "${!adguard_ubo[@]}" "${!adguard_full[@]}" "${!adblock[@]}" "${!adblock_lite[@]}" "${!adblock_full[@]}" "${!dns[@]}" "${!hosts[@]}" "${!allow[@]}"
do
  curl --parallel --parallel-immediate -k -L -C - -o "ublock${i}.txt" --connect-timeout 60 -s "${ublock[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 60 -s "${adguard[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adguard_ubo${i}.txt" --connect-timeout 60 -s "${adguard_ubo[$i]}" &
  # curl --parallel --parallel-immediate -k -L -C - -o "adguard_full${i}.txt" --connect-timeout 60 -s "${adguard_full[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adblock${i}.txt" --connect-timeout 60 -s "${adblock[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adblock_lite${i}.txt" --connect-timeout 60 -s "${adblock_lite[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adblock_full${i}.txt" --connect-timeout 60 -s "${adblock_full[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 60 -s "${dns[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 60 -s "${hosts[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 60 -s "${allow[$i]}" &
  # shellcheck disable=SC2181
done
wait

curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts999.txt
curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts998.txt
echo '规则下载完成'

# # Pre Fix rules
# echo '处理规则中...'
# cat hosts*.txt | grep -v -E "^((#.*)|(\s*))$" \
#  | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
#  | sed s/127.0.0.1/0.0.0.0/g | sed s/::/0.0.0.0/g | sort \
#  | uniq >base-src-hosts.txt

# Hosts规则转ABP规则
# cat base-src-hosts.txt | grep -Ev '#|\$|@|!|/|\\|\*'\
#  | grep -v -E "^((#.*)|(\s*))$" \
#  | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
#  | sed 's/127.0.0.1 //' | sed 's/0.0.0.0 //' \
#  | sed "s/^/||&/g" |sed "s/$/&^/g"| sed '/^$/d' \
#  | grep -v '^#' | grep -v 'local' \
#  | sort -n | uniq | awk '!a[$0]++' > abp-hosts.txt

# 将允许域名转换为ABP规则
# cat allow-domains*.txt | grep -v '#' \
#  | sed "s/^/@@||&/g" | sed "s/$/&^/g"  \
#  | sort -n | uniq | awk '!a[$0]++' >> pre-allow.txt

# 将允许域名转换为ABP规则
# cat allow-domains0.txt | grep -v "#" \
#  |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n \
#  | uniq | awk '!a[$0]++' >> pre-allow1.txt

# cat *.txt |grep '^/' |grep '.\.$' \
#  |grep -v './\|.?\|.\$\|.js\|._\|.\*\|.(php|png)\|.[0-9]\|.\^\|.=\|.~\|.[A-Z]\|.-' \
#  |sort -u > l.txt

#cat l.txt


# Start Merge and Duplicate Removal
#set LC_ALL='C'
echo 开始合并
# 合并通用元素过滤规则
cat ../mod/rules/tieba.txt adblock*.txt \
 | grep -v '^!' | grep -v '.!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adblock.txt

# 合并AdKiller (PC)元素过滤规则
cat tmp-adblock.txt ublock*.txt adguard_ubo*.txt adblock_full*.txt \
 | grep -v '^!' | grep -v '.!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -n | uniq | awk '!a[$0]++' > pre-filter.txt

# 合并AdKiller (Mobile)元素过滤规则
cat tmp-adblock.txt adguard*.txt adblock_lite*.txt \
 | grep -v '^!' | grep -v '.!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -n | uniq | awk '!a[$0]++' > pre-mobile.txt

# 合并DNS过滤规则
cat dns*.txt \
 | grep -v '^!' | grep -v '.!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -n | uniq | awk '!a[$0]++' > pre-dns.txt

# 合并HOSTS过滤规则
cat hosts*.txt \
 | sed '/^$/d' |grep '^||\|^[0-9]' | grep -v '\*'\
 | grep -v './'| grep -v '^\[' | grep -v '.!' \
 | grep -v '.\$'|grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" \
 |sed 's/||/127.0.0.1 /' | sed 's/\^//' | grep -v "^|" \
 | sed 's/\^|/\^/' | sed 's/0.0.0.0/127.0.0.1/g' | sed 's/  / /g'
 |sort -n | uniq | awk '!a[$0]++' > pre-hosts.txt

# 合并Allow List
cat allow*.txt \
 | grep '^@' \
 | sort -n | uniq | awk '!a[$0]++' > pre-allow.txt

echo 规则合并完成

# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
mv ./tmp/pre-*.txt ./pre
cd ./pre
echo '移动完成'

# Python 处理重复规则
python ../../utils/deduplication.py
echo '规则去重处理完成'
# Start Add title and date
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 n=`cat $i | wc -l`
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')（北京时间） " >> tpdate.txt
 new=$(echo "$i" |sed 's/pre-//g')
 echo "! Total count: $n" > $i-tpdate.txt
 cat ../../utils/title/$i ./tpdate.txt ./$i-tpdate.txt ./$i \
 | awk '!a[$0]++' | sed '/^$/d' > ../../$new
 rm $i *tpdate.txt
done

# Add Title and MD5
# cd ../
# mkdir -p ./md5/
# diffFile="$(ls pre |sort -u)"
# for i in $diffFile; do
#  titleName=$(echo "$i" |sed 's#.txt#-title.txt#')
#  cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i
#  sed -i '/^$/d' $i
#  md5sum $i | sed "s/$i//" > ./md5/$i.md5
#  perl ./script/addchecksum.pl ./$i
#  #echo "合并${i}的标题中"
# done
echo '规则处理完成'
# Check Rules
# a=`cat dns.txt |wc -l`
# b=1000
# if [ "$a" -lt "$b" ]
# then
#  bash ./script/update-rules.sh
# else
#  echo Check PASS
# fi
cd ../
rm -rf pre
exit