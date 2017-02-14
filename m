Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdegF-0007Ib-IQ
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 15:06:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: add support for controlling tx power to a
 station
Date: Tue, 14 Feb 2017 15:05:45 +0000
Message-ID: <87zihoq0ce.fsf@kamboji.qca.qualcomm.com>
References: <201702120825.pCIZZp0b%fengguang.wu@intel.com>
In-Reply-To: <201702120825.pCIZZp0b%fengguang.wu@intel.com> (kbuild test
 robot's message of "Sun, 12 Feb 2017 08:17:48 +0800")
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
> [auto build test ERROR on v4.9-rc8]
> [cannot apply to ath6kl/ath-next next-20170210]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Ashok-Raj-Nagarajan/ath10k-add-support-for-controlling-tx-power-to-a-station/20170208-203305
> config: x86_64-randconfig-in0-02120025 (attached as .config)
> compiler: gcc-4.6 (Debian 4.6.4-7) 4.6.4
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_set_txpwr':
>>> drivers/net/wireless/ath/ath10k/mac.c:5900:10: error: 'struct
>>> ieee80211_sta' has no member named 'txpwr'
>    drivers/net/wireless/ath/ath10k/mac.c: At top level:
>>> drivers/net/wireless/ath/ath10k/mac.c:7469:2: error: unknown field
>>> 'sta_set_txpwr' specified in initializer
>    drivers/net/wireless/ath/ath10k/mac.c:7469:2: warning:
> initialization from incompatible pointer type [enabled by default]
>    drivers/net/wireless/ath/ath10k/mac.c:7469:2: warning: (near
> initialization for 'ath10k_ops.sta_pre_rcu_remove') [enabled by
> default]
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_register':
>>> drivers/net/wireless/ath/ath10k/mac.c:8008:11: error:
>>> 'NL80211_EXT_FEATURE_STA_TX_PWR' undeclared (first use in this
>>> function)

These are expected as this depends on cfg80211 patch not yet applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
