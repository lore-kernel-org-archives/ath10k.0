Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1DIB-0005SA-9p
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 15:47:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath10k: Add tx ack signal support for management frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1519883841-4117-1-git-send-email-vnaralas@codeaurora.org>
References: <1519883841-4117-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20180328154705.05B9560AFB@smtp.codeaurora.org>
Date: Wed, 28 Mar 2018 15:47:04 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> This patch add support to get RSSI from acknowledgment
> frames for transmitted management frames.
> 
> hardware_used: QCA4019, QCA9984.
> firmware version: 10.4-3.5.3-00052.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This adds new ath10k-check warnings:

drivers/net/wireless/ath/ath10k/htt_rx.c:2733:52: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/htt_rx.c:2730: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/htt_rx.c:2733: line over 90 characters
drivers/net/wireless/ath/ath10k/htt_rx.c:2734: line over 90 characters

-- 
https://patchwork.kernel.org/patch/10250443/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
