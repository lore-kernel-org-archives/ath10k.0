Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7do-0008FL-P3
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:34:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix __le32 warning in
 ath10k_wmi_tlv_op_gen_request_peer_stats_info()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588747649-18051-1-git-send-email-kvalo@codeaurora.org>
References: <1588747649-18051-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200511123439.2CDE0C43636@smtp.codeaurora.org>
Date: Mon, 11 May 2020 12:34:39 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Sparse warned:
> 
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34: warning: incorrect
> type in assignment (different base types)
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    expected
> restricted __le32 [usertype] reset_after_request
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    got unsigned int
> [usertype] reset
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
> 
> Fixes: 0f7cb26830a6 ("ath10k: add rx bitrate report for SDIO")
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e47210f72a68 ath10k: fix __le32 warning in ath10k_wmi_tlv_op_gen_request_peer_stats_info()

-- 
https://patchwork.kernel.org/patch/11530437/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
