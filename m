Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMgn-0003Nn-ET
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 09:38:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next] ath10k: fix possible memory leak in
 ath10k_bmi_lz_data_large()
References: <20200427104348.13570-1-weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 12:37:47 +0300
In-Reply-To: <20200427104348.13570-1-weiyongjun1@huawei.com> (Wei Yongjun's
 message of "Mon, 27 Apr 2020 10:43:48 +0000")
Message-ID: <87ftcoeys4.fsf@kamboji.qca.qualcomm.com>
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
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Wei Yongjun <weiyongjun1@huawei.com> writes:

> 'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
>
> Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/bmi.c | 1 +
>  1 file changed, 1 insertion(+)

Please don't add "net-next" to wireless-driver patches (ath10k, ath11k
etc), because we use different trees. You can add "-next" or
"wireless-driver-next" if you want, but even that is not necessary as I
apply patches to -next by default.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
