Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6zNb-0002fR-VY
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 14:41:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: management tx ack rssi capability check
References: <1536560670-4292-1-git-send-email-bpothuno@codeaurora.org>
 <201809111249.14EbLF2t%fengguang.wu@intel.com>
Date: Mon, 01 Oct 2018 17:40:44 +0300
In-Reply-To: <201809111249.14EbLF2t%fengguang.wu@intel.com> (kbuild test
 robot's message of "Tue, 11 Sep 2018 12:05:12 +0800")
Message-ID: <87sh1pk9w3.fsf@kamboji.qca.qualcomm.com>
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
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

kbuild test robot <lkp@intel.com> writes:

> Hi Balaji,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on ath6kl/ath-next]
> [cannot apply to v4.19-rc3 next-20180910]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Balaji-Pothunoori/ath10k-management-tx-ack-rssi-capability-check/20180911-105502
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: xtensa-allmodconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 8.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=8.1.0 make.cross ARCH=xtensa 
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_register':
>>> drivers/net/wireless/ath/ath10k/mac.c:8485:11: error:
>> 'NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT' undeclared (first use in
>> this function); did you mean
>> 'NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT'?
>               NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>               NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT
>    drivers/net/wireless/ath/ath10k/mac.c:8485:11: note: each undeclared identifier is reported only once for each function it appears in

This is expected as this depends on a cfg80211 patch not yet in my
ath.git tree:

9c06602b1b92 cfg80211: clarify frames covered by average ACK signal report

Currently in net-next.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
