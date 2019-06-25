Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hflJG-0003Rb-OD
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:16:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add report MIC error for sdio chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559010432-1005-1-git-send-email-wgong@codeaurora.org>
References: <1559010432-1005-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190625131630.6CFFF607DE@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:16:30 +0000 (UTC)
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

> Firmware will report flag with HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR
> if MIC error, the flag will be used in mac80211.
> 
> ieee80211_rx_h_michael_mic_verify will check the flag and start TKIP
> countermeasures.
> 
> Now countermeasure tests pass both with WPA only and WPA2/WPA mixed
> mode.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

47ed1b4e5d62 ath10k: add report MIC error for sdio chip

-- 
https://patchwork.kernel.org/patch/10963647/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
