Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyUf-00028n-Ev
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:32:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 10/15] ERROR: "__udivdi3"
 [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
References: <201810090804.eQbqAwdi%fengguang.wu@intel.com>
Date: Fri, 12 Oct 2018 17:32:29 +0300
In-Reply-To: <201810090804.eQbqAwdi%fengguang.wu@intel.com> (kbuild test
 robot's message of "Tue, 9 Oct 2018 08:21:06 +0800")
Message-ID: <87pnwf44n6.fsf@kamboji.qca.qualcomm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, kbuild-all@01.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

+ linux-wireless, arnd

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   70aa9eaba2a46b3d53caf03060576a7615182814
> commit: 108924d7a14299b2bcced255feb14bfdde7cb9d4 [10/15] ath10k: Fill
> the channel survey results for WCN3990 correctly
> config: parisc-allmodconfig (attached as .config)
> compiler: hppa-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 108924d7a14299b2bcced255feb14bfdde7cb9d4
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=parisc 
>
> All errors (new ones prefixed by >>):
>
>>> ERROR: "__udivdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
>>> ERROR: "__divdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!

I'm not sure what this is about. The corresponding patch is here:

https://patchwork.kernel.org/patch/10624567/

I see some division in the patch but I can't immeaditely see what's
wrong. So is this a problem in the bot, in parisc architecture or with
the patch? Anyone have any good ideas? Arnd?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
