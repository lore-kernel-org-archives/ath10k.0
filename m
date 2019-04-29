Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL7RO-000414-8e
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 14:39:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath10k: add struct for high latency PN replay
 protection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556260871-2919-2-git-send-email-kvalo@codeaurora.org>
References: <1556260871-2919-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190429143933.BAD2B60863@smtp.codeaurora.org>
Date: Mon, 29 Apr 2019 14:39:33 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> wrote:

> Add the struct for PN replay protection and fragment packet
> handler.
> 
> Also fix the bitmask of HTT_RX_DESC_HL_INFO_MCAST_BCAST to match what's currently
> used by SDIO firmware. The defines are not used yet so it's safe to modify
> them. Remove the conflicting HTT_RX_DESC_HL_INFO_FRAGMENT as
> it's not either used in ath10k.
> 
> Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath-next branch of ath.git, thanks.

e1bddde9737a ath10k: add struct for high latency PN replay protection
28ce53b6cfda ath10k: add handler for HTT_T2H_MSG_TYPE_SEC_IND event
130c77495708 ath10k: add PN replay protection for high latency devices
33f9747291ff ath10k: add fragmentation handler for high latency devices
a8b10da05cbe ath10k: enable QCA6174 hw3.2 SDIO hardware

-- 
https://patchwork.kernel.org/patch/10918335/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
