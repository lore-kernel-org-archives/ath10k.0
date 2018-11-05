Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJcp7-0005MP-SE
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 11:13:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove set but not used variable 'tlv_len'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
References: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
Message-Id: <20181105111327.9763260600@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 11:13:27 +0000 (UTC)
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
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function 'ath10k_wmi_tlv_op_gen_config_pno_start':
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3455:6: warning:
>  variable 'tlv_len' set but not used [-Wunused-but-set-variable]
> 
> It never used since inroduction in commit
> ce834e280f2f ("ath10k: support NET_DETECT WoWLAN feature")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3468404f78e1 ath10k: remove set but not used variable 'tlv_len'

-- 
https://patchwork.kernel.org/patch/10649069/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
