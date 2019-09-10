Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7g5S-0006An-1w
 for ath10k@lists.infradead.org; Tue, 10 Sep 2019 13:21:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add reorder and change PN check logic for mac80211
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1566368605-20109-1-git-send-email-wgong@codeaurora.org>
References: <1566368605-20109-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190910132137.B08056050D@smtp.codeaurora.org>
Date: Tue, 10 Sep 2019 13:21:37 +0000 (UTC)
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

> For sdio chip, if the rssi is not good, then it have some retry,
> firmware will indicate the msdu list of a ppdu with a hole, it
> means it lost the hole msdu, after the msdu retry from AP, the
> hole msdu will indicate from firmware later. The hole msdu's PN
> check will fail and the hole msdu will be dropped.
> 
> PN check fail example:
> Sequence number PN number  PN check status
>      3814         6101         success
>      3815         6102         success
>      3816         6103         success
>      3818         6105         success
>      3819         6106         success
>      3820         6107         success
>      3817         6104         fail
> 
> The correct logic is reorder the msdu list and then do PN check.
> ieee80211_rx_reorder_ampdu of mac80211 will do the reorer logic
> and then do PN check in ieee80211_rx_h_decrypt of mac80211.
> 
> example after reorder:
> Sequence number PN number  PN check status
>      3814         6101         success
>      3815         6102         success
>      3816         6103         success
>      3817         6104         success
>      3818         6105         success
>      3819         6106         success
>      3820         6107         success
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

db8deae03271 ath10k: add reorder and change PN check logic for mac80211

-- 
https://patchwork.kernel.org/patch/11105545/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
