Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faeZH-000785-Ov
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 09:59:25 +0000
MIME-Version: 1.0
Subject: Re: [2/2] ath10k: allow ATH10K_SNOC with COMPILE_TEST
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180612113907.15043-2-niklas.cassel@linaro.org>
References: <20180612113907.15043-2-niklas.cassel@linaro.org>
Message-Id: <20180704095913.772C9606AC@smtp.codeaurora.org>
Date: Wed,  4 Jul 2018 09:59:13 +0000 (UTC)
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

Niklas Cassel <niklas.cassel@linaro.org> wrote:

> ATH10K_SNOC builds just fine with COMPILE_TEST, so make that possible.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Note to myself, I see these dependencies in linux-next (but not in Linus' tree yet):

67cd0eec5b62 rpmsg: smd: Add missing include of sizes.h
376e1f304fc7 firmware: qcom: scm: add a dummy qcom_scm_assign_mem()

These I don't see in linux-next yet:

  soc: qcom: smem: Add missing include of sizes.h
  soc: qcom: smp2p: Add select IRQ_DOMAIN
  soc: qcom: smsm: Add select IRQ_DOMAIN
  soc: qcom: Remove depends on ARCH_QCOM

-- 
https://patchwork.kernel.org/patch/10460103/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
