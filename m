Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNafH-000729-8V
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 10:48:25 +0000
MIME-Version: 1.0
Date: Thu, 24 Oct 2019 18:48:21 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v6 2/3] ath10k: change max RX bundle size from 8 to 32 for
 sdio
In-Reply-To: <87h83ysbjy.fsf@kamboji.qca.qualcomm.com>
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-3-git-send-email-wgong@codeaurora.org>
 <87h83ysbjy.fsf@kamboji.qca.qualcomm.com>
Message-ID: <73e2d996575023b14c24665b2607a5b3@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-10-24 18:05, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:

> As you can see I also changed the macro to a function, as I prefer C
> over CPP :) And changed ATH10K_HTC_FLAG_BUNDLE_MASK to use GENMASK().
> 
yes.
> But this only compiled tested, please do properly test the patches from
> pending branch and let me know if I broke something:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=afd85ca1b086695cfd26bf484442eaf3bccb6bdd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4225b4d50a4f6a1159dc3316d068398f1b5edb57
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=911e0fc846cfc46fb4ccd1d223cb153681ff05bd

I will test the 3 patches.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
