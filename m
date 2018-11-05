Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJbsJ-0007dl-6C
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 10:12:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath10k: fix copy-paste error in
 ath10k_qmi_setup_msa_resources()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
References: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
Message-Id: <20181105101240.D6A03601DA@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 10:12:40 +0000 (UTC)
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
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> The return value from devm_memremap() is not checked correctly.
> The test is done against a wrong variable. This patch fix it.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4ab7fd955e47 ath10k: fix copy-paste error in ath10k_qmi_setup_msa_resources()

-- 
https://patchwork.kernel.org/patch/10642589/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
