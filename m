Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJ7G-0007N1-3H
 for ath10k@lists.infradead.org; Sat, 07 Nov 2020 07:58:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: cancel rx worker in hif_stop for SDIO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604558036-4056-1-git-send-email-wgong@codeaurora.org>
References: <1604558036-4056-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20201107075820.BE2C8C433CB@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 07:58:20 +0000 (UTC)
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

> The rx worker of SDIO should be cancelled after disable interrupt, and
> release rx sk_buff in queue, otherwise the rx worker maybe still run
> after hif_stop. And it should be cancelled before napi_synchronize in
> hif_stop, because the rx worker of SDIO will call napi_schedule, it
> should have no napi_schedule before napi_synchronize, otherwise it
> lead napi_synchronize wait untill napi_complete.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9501bc2b16b5 ath10k: cancel rx worker in hif_stop for SDIO

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604558036-4056-1-git-send-email-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
