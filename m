Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QaW-0003Nr-ER
 for ath10k@lists.infradead.org; Wed, 19 Aug 2020 16:05:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 106/110]
 drivers/net/wireless/ath/ath10k/mac.c:3033:6-25: duplicated argument to && or
 || (fwd)
References: <alpine.DEB.2.22.394.2008191259580.2481@hadrien>
Date: Wed, 19 Aug 2020 19:05:13 +0300
In-Reply-To: <alpine.DEB.2.22.394.2008191259580.2481@hadrien> (Julia Lawall's
 message of "Wed, 19 Aug 2020 13:00:59 +0200 (CEST)")
Message-ID: <87pn7mipty.fsf@codeaurora.org>
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
To: Julia Lawall <julia.lawall@inria.fr>
Cc: kbuild-all@lists.01.org, ath10k@lists.infradead.org, Tamizh Chelvam <tamizhr@codeaurora.org>

Julia Lawall <julia.lawall@inria.fr> writes:

> On line 3033 there are two occurrences of arvif->rate_ctrl[i]
>
> julia
>
> ---------- Forwarded message ----------
> Date: Wed, 19 Aug 2020 09:21:21 +0800
> From: kernel test robot <lkp@intel.com>
> To: kbuild@lists.01.org
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ath6kl:pending 106/110]
>     drivers/net/wireless/ath/ath10k/mac.c:3033:6-25: duplicated argument to &&
>     or ||
>
> CC: kbuild-all@lists.01.org
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: ath10k@lists.infradead.org
> TO: Tamizh Chelvam <tamizhr@codeaurora.org>
> CC: Kalle Valo <kvalo@codeaurora.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   45b6467afc71b6e19e4ffe264c448409add56f84
> commit: cd275e8765b99d313c06d867af6e3fcc90484cfb [106/110] ath10k: Add
> new api to support TID specific configuration
> :::::: branch date: 15 hours ago
> :::::: commit date: 15 hours ago
> config: x86_64-randconfig-c004-20200818 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>
>
> coccinelle warnings: (new ones prefixed by >>)
>
>>> drivers/net/wireless/ath/ath10k/mac.c:3033:6-25: duplicated argument to && or ||

Good catch. I fixed this in the pending branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
