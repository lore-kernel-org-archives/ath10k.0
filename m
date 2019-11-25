Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCwo-0004yi-VU
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 11:54:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add large size for BMI download data for SDIO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191107100809.17982-1-wgong@codeaurora.org>
References: <20191107100809.17982-1-wgong@codeaurora.org>
Message-ID: <0101016ea269b8df-d13c2173-799f-4f69-a1e7-43709bb9a2c2-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 11:54:28 +0000
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

Wen Gong <wgong@codeaurora.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d58f466a5dee ath10k: add large size for BMI download data for SDIO

-- 
https://patchwork.kernel.org/patch/11232449/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
