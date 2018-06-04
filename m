Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPoDg-0001ky-Bp
 for ath10k@lists.infradead.org; Mon, 04 Jun 2018 12:04:18 +0000
Received: by mail-lf0-x242.google.com with SMTP id y72-v6so24768575lfd.2
 for <ath10k@lists.infradead.org>; Mon, 04 Jun 2018 05:04:05 -0700 (PDT)
Date: Mon, 4 Jun 2018 14:04:00 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH net-next] ath10k: make some functions static
Message-ID: <20180604120400.GA6240@centauri.lan>
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
 <87a7sazw0w.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a7sazw0w.fsf@kamboji.qca.qualcomm.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, Wei Yongjun <weiyongjun1@huawei.com>

On Mon, Jun 04, 2018 at 01:27:43PM +0300, Kalle Valo wrote:
> Wei Yongjun <weiyongjun1@huawei.com> writes:
> 
> > Fixes the following sparse warnings:
> >
> > drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
> >  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
> > drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
> >  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
> >
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> BTW this goes to my ath.git tree, not to net-next.
> 
> I had missed these as I can't enable ATH10K_SNOC on x86 and hence I
> don't test compile snoc.c at all. Bjorn&Govind, is there a way to solve
> that? IIRC we had a similar problem with wcn36xx but I don't remember
> anymore how it was fixed.
> 

Perhaps something like:

--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -42,7 +42,8 @@ config ATH10K_USB
 
 config ATH10K_SNOC
         tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
-        depends on ATH10K && ARCH_QCOM
+        depends on ATH10K
+        depends on ARCH_QCOM || COMPILE_TEST
         ---help---
           This module adds support for integrated WCN3990 chip connected
           to system NOC(SNOC). Currently work in progress and will not


Regards,
Niklas


> -- 
> Kalle Valo
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
