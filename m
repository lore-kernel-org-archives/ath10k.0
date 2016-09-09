Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKuW-0002nk-1b
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 12:28:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: advertize hardware packet loss mechanism
Date: Fri, 9 Sep 2016 12:27:29 +0000
Message-ID: <871t0tqmvj.fsf@kamboji.qca.qualcomm.com>
References: <201609061655.E4ZdBCGt%fengguang.wu@intel.com>
In-Reply-To: <201609061655.E4ZdBCGt%fengguang.wu@intel.com> (kbuild test
 robot's message of "Tue, 6 Sep 2016 16:18:28 +0800")
Content-Language: en-US
Content-ID: <65C044165291DD418CD51A1AD05CEE86@qualcomm.com>
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
Cc: "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "kbuild-all@01.org" <kbuild-all@01.org>

kbuild test robot <lkp@intel.com> writes:

> Hi Rajkumar,
>
> [auto build test ERROR on ath6kl/ath-next]
> [also build test ERROR on v4.8-rc5 next-20160906]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
>
> url:    https://github.com/0day-ci/linux/commits/Rajkumar-Manoharan/ath10k-advertize-hardware-packet-loss-mechanism/20160906-151148
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: i386-randconfig-x008-201636 (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from drivers/net/wireless/ath/ath10k/mac.h:21:0,
>                     from drivers/net/wireless/ath/ath10k/mac.c:18:
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_register':
>>> include/net/mac80211.h:2206:57: error: 'IEEE80211_HW_REPORTS_LOW_ACK' undeclared (first use in this function)
>     #define ieee80211_hw_set(hw, flg) _ieee80211_hw_set(hw, IEEE80211_HW_##flg)
>                                                             ^
>>> drivers/net/wireless/ath/ath10k/mac.c:7884:2: note: in expansion of macro 'ieee80211_hw_set'
>      ieee80211_hw_set(ar->hw, REPORTS_LOW_ACK);
>      ^~~~~~~~~~~~~~~~
>    include/net/mac80211.h:2206:57: note: each undeclared identifier is reported only once for each function it appears in
>     #define ieee80211_hw_set(hw, flg) _ieee80211_hw_set(hw, IEEE80211_HW_##flg)
>                                                             ^
>>> drivers/net/wireless/ath/ath10k/mac.c:7884:2: note: in expansion of macro 'ieee80211_hw_set'
>      ieee80211_hw_set(ar->hw, REPORTS_LOW_ACK);
>      ^~~~~~~~~~~~~~~~

This is expected as this depends on a mac80211 patch which is not
applied yet.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
