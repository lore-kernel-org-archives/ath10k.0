Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZC4A-0008GM-GU
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 07:44:28 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add support for controlling tx power to a
 station
Date: Thu, 2 Feb 2017 07:44:00 +0000
Message-ID: <877f59ox56.fsf@kamboji.qca.qualcomm.com>
References: <201702010556.QVNevZKo%fengguang.wu@intel.com>
In-Reply-To: <201702010556.QVNevZKo%fengguang.wu@intel.com> (kbuild test
 robot's message of "Wed, 1 Feb 2017 05:54:43 +0800")
Content-Language: en-US
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "arnagara@codeaurora.org" <arnagara@codeaurora.org>, "Nagarajan,
 Ashok Raj" <arnagara@qti.qualcomm.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

kbuild test robot <lkp@intel.com> writes:

> Hi Ashok,
>
> [auto build test WARNING on ath6kl/ath-next]
> [also build test WARNING on v4.10-rc6 next-20170131]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Ashok-Raj-Nagarajan/ath10k-add-support-for-controlling-tx-power-to-a-station/20170201-032529
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: m68k-allyesconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=m68k 
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_set_txpwr':
>    drivers/net/wireless/ath/ath10k/mac.c:5997:13: error: 'struct ieee80211_sta' has no member named 'txpwr'
>      txpwr = sta->txpwr;
>                 ^
>    drivers/net/wireless/ath/ath10k/mac.c: At top level:
>    drivers/net/wireless/ath/ath10k/mac.c:7581:2: error: unknown field 'sta_set_txpwr' specified in initializer
>      .sta_set_txpwr   = ath10k_sta_set_txpwr,
>      ^

This is expected as this patch depends on a mac80211 feature not yet
applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
