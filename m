Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWqX-0000TO-Ku
 for ath10k@lists.infradead.org; Mon, 04 May 2020 08:53:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath10k: fix possible memory leak in
 ath10k_bmi_lz_data_large()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200427104348.13570-1-weiyongjun1@huawei.com>
References: <20200427104348.13570-1-weiyongjun1@huawei.com>
Message-Id: <20200504085300.17DBCC432C2@smtp.codeaurora.org>
Date: Mon,  4 May 2020 08:53:00 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> 'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
> 
> Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2326aa011967 ath10k: fix possible memory leak in ath10k_bmi_lz_data_large()

-- 
https://patchwork.kernel.org/patch/11511841/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
