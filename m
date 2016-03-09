Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adh9c-0001fw-GI
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 16:40:09 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v1 1/2] ath10k: Add support for ath10k_sta_statistics
 support
Date: Wed, 9 Mar 2016 16:39:30 +0000
Message-ID: <87oaanr4g7.fsf@kamboji.qca.qualcomm.com>
References: <201603091546.RFfnsS0y%fengguang.wu@intel.com>
In-Reply-To: <201603091546.RFfnsS0y%fengguang.wu@intel.com> (kbuild test
 robot's message of "Wed, 9 Mar 2016 15:42:40 +0800")
Content-Language: en-US
Content-ID: <CDDDE0EDD69B6F448C8737C7A5B15FC5@qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kbuild test robot <lkp@intel.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

kbuild test robot <lkp@intel.com> writes:

> Hi Mohammed,
>
> [auto build test ERROR on wireless-drivers-next/master]
> [also build test ERROR on next-20160309]
> [cannot apply to v4.5-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>
> url:    https://github.com/0day-ci/linux/commits/Mohammed-Shafi-Shajakhan/ath10k-Add-support-for-ath10k_sta_statistics-support/20160309-153522
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
> config: sparc64-allmodconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=sparc64 
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/debugfs_sta.c: In function 'ath10k_sta_statistics':
>>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:51:2: error: implicit declaration of function 'ath10k_peer_stats_enabled' [-Werror=implicit-function-declaration]
>      if (!ath10k_peer_stats_enabled(ar))
>      ^
>>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:54:7: error: 'struct station_info' has no member named 'rx_duration'
>      sinfo->rx_duration = arsta->rx_duration;
>           ^
>>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:55:27: error: 'NL80211_STA_INFO_RX_DURATION' undeclared (first use in this function)
>      sinfo->filled |= 1ULL << NL80211_STA_INFO_RX_DURATION;
>                               ^
>    drivers/net/wireless/ath/ath10k/debugfs_sta.c:55:27: note: each undeclared identifier is reported only once for each function it appears in
>    cc1: some warnings being treated as errors

This is expected as the patches depend on mac80211 patches.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
