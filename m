Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwsAe-0007pr-Gb
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 16:57:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add waiting htt tx complete before wow enable
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1535442443-22152-1-git-send-email-wgong@codeaurora.org>
References: <1535442443-22152-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20180903165737.A667460B1A@smtp.codeaurora.org>
Date: Mon,  3 Sep 2018 16:57:34 +0000 (UTC)
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

> If there are some tx packets pending in firmware, and then system
> enters suspend, firmware will fail for wow enable. This will trigger
> mac80211 to stop ath10k and download firmware again, then it is
> non-wow suspend.
> 
> After add the waiting htt tx complete, then firmware will have some
> time window to send or flush the pending tx packets.
> 
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

828853ac5826 ath10k: add waiting htt tx complete before wow enable

-- 
https://patchwork.kernel.org/patch/10578009/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
