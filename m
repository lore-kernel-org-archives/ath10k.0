Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT0aJ-000811-GF
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 09:29:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: add large size for BMI download data for SDIO
References: <20191107100809.17982-1-wgong@codeaurora.org>
Date: Fri, 08 Nov 2019 11:29:31 +0200
In-Reply-To: <20191107100809.17982-1-wgong@codeaurora.org> (Wen Gong's message
 of "Thu, 7 Nov 2019 18:08:09 +0800")
Message-ID: <877e4awwas.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> Download firmware time cost of SDIO is too long, it is about 480ms,
> add large size 2048 bytes for BMI download for SDIO chip, its time
> cost will reduced to 240ms.
>
> This will optimize the download firmware time cost.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> +int ath10k_bmi_large_size_lz_data(struct ath10k *ar, const void *buffer, u32 length)

You are calling this only from bmi.c so in the pending branch I made
this static and renamed to ath10k_bmi_lz_data_large().

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
