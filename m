Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDXyK-0006Hs-AP
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 14:08:40 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for controlling tx power to a station
Date: Thu, 16 Jun 2016 14:08:13 +0000
Message-ID: <87fusdw7jn.fsf@kamboji.qca.qualcomm.com>
References: <201606150220.30TL93eZ%fengguang.wu@intel.com>
In-Reply-To: <201606150220.30TL93eZ%fengguang.wu@intel.com> (kbuild test
 robot's message of "Wed, 15 Jun 2016 02:29:54 +0800")
Content-Language: en-US
Content-ID: <805EA70182FCF34BA9E348E5EE9D854E@qualcomm.com>
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

> [auto build test ERROR on ath6kl/ath-next]
> [also build test ERROR on v4.7-rc3 next-20160614]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Ashok-Raj-Nagarajan/ath10k-add-support-for-controlling-tx-power-to-a-station/20160615-014225
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_set_txpwr':
>>> drivers/net/wireless/ath/ath10k/mac.c:5836:13: error: 'struct ieee80211_sta' has no member named 'txpwr'
>      txpwr = sta->txpwr;
>                 ^~
>    drivers/net/wireless/ath/ath10k/mac.c: At top level:
>>> drivers/net/wireless/ath/ath10k/mac.c:7399:2: error: unknown field 'sta_set_txpwr' specified in initializer
>      .sta_set_txpwr   = ath10k_sta_set_txpwr,
>      ^
>>> drivers/net/wireless/ath/ath10k/mac.c:7399:21: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      .sta_set_txpwr   = ath10k_sta_set_txpwr,
>                         ^~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath10k/mac.c:7399:21: note: (near initialization for 'ath10k_ops.sta_pre_rcu_remove')
>    cc1: some warnings being treated as errors

These errors are expected as this depends on a mac80211 patch which is
not yet applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
