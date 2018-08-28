Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueFI-00079l-A7
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 13:41:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Skip resetting rx filter for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1533566888-22221-1-git-send-email-pillair@codeaurora.org>
References: <1533566888-22221-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20180828134113.F41F86044E@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 13:41:13 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> WCN3990 has the MAC_PCU_ADDR1 configured properly
> and hence it will not send spurious ack frames
> during boot up.
> 
> Hence the reset_rx_filter workaround is not needed
> for WCN3990. Add a hw_param to indicate if hardware rx
> filter reset is needed and skip the reset_rx_filter for
> WCN3990.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

58da3b423070 ath10k: skip resetting rx filter for WCN3990

-- 
https://patchwork.kernel.org/patch/10557325/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
