Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFDcZ-0007gD-FY
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 07:30:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [GIT] Networking
References: <20181023.202921.1185045750138652543.davem@davemloft.net>
 <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
Date: Wed, 24 Oct 2018 10:30:09 +0300
In-Reply-To: <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
 (Linus Torvalds's message of "Wed, 24 Oct 2018 07:01:31 +0100")
Message-ID: <87pnvzu7i6.fsf@codeaurora.org>
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Brown <david.brown@linaro.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Niklas Cassel <niklas.cassel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, davem@davemloft.net

+ linux-wireless, ath10k, niklas, jeff, andy, david

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Oct 24, 2018 at 4:30 AM David Miller <davem@davemloft.net> wrote:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
>
> Hmm. Tentatively pulled, but there's something wrong with the Kconfig rules.
>
> Doing "make allmodconfig" (not even the build itself, just the config
> phase), I get
>
>   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
>     Depends on [n]: ARCH_QCOM && NET [=y]
>     Selected by [m]:
>     - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] &&
> WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM || COMPILE_TEST
> [=y])
>
> because I'm obviously not building on ARCH_QCOM.
>
> I suspect that QCOM_QMI_HELPERS needs to have
>
>         depends on (ARCH_QCOM || COMPILE_TEST) && NET
>
> or similar. I'll see if this builds for me at all despite the Kconfig warning.

I had missed this warning, sorry about that. Jeff reported the same
problem while I was on vacation and according to Niklas[1] it should be
fixed by this commit in linux-next:

ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")

I'm hoping you will get the commit during this merge window but not sure
about that and via which tree it would come. Adding Andy and David who
hopefully know more.

[1] http://lists.infradead.org/pipermail/ath10k/2018-October/012330.html

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
