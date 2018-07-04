Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fafpp-0005TB-8a
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 11:20:42 +0000
Received: by mail-lf0-x241.google.com with SMTP id u14-v6so4105651lfu.0
 for <ath10k@lists.infradead.org>; Wed, 04 Jul 2018 04:20:22 -0700 (PDT)
Date: Wed, 4 Jul 2018 13:20:18 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [2/2] ath10k: allow ATH10K_SNOC with COMPILE_TEST
Message-ID: <20180704112018.GA15155@centauri.ideon.se>
References: <20180612113907.15043-2-niklas.cassel@linaro.org>
 <20180704095913.772C9606AC@smtp.codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180704095913.772C9606AC@smtp.codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

On Wed, Jul 04, 2018 at 09:59:13AM +0000, Kalle Valo wrote:
> Niklas Cassel <niklas.cassel@linaro.org> wrote:
> 
> > ATH10K_SNOC builds just fine with COMPILE_TEST, so make that possible.
> > 
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> 
> Note to myself, I see these dependencies in linux-next (but not in Linus' tree yet):
> 
> 67cd0eec5b62 rpmsg: smd: Add missing include of sizes.h
> 376e1f304fc7 firmware: qcom: scm: add a dummy qcom_scm_assign_mem()
> 
> These I don't see in linux-next yet:
> 
>   soc: qcom: smem: Add missing include of sizes.h
>   soc: qcom: smp2p: Add select IRQ_DOMAIN
>   soc: qcom: smsm: Add select IRQ_DOMAIN
>   soc: qcom: Remove depends on ARCH_QCOM

Hello Kalle,

You are correct.
I submitted a v3 of this just yesterday:
https://marc.info/?l=linux-kernel&m=153060245727472&w=2
So hopefully it will be in linux-next within 2 weeks.

Regards,
Niklas

> 
> -- 
> https://patchwork.kernel.org/patch/10460103/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
