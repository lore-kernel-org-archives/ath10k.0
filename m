Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCLL-00081Z-LP
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 17:52:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Disable bundle mgmt tx completion event
 support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1530177537-18487-2-git-send-email-pillair@codeaurora.org>
References: <1530177537-18487-2-git-send-email-pillair@codeaurora.org>
Message-Id: <20180730175217.51E2862249@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 17:52:17 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The tx completion of multiple mgmt frames can be bundled
> in a single event and sent by the firmware to host, if this
> capability is not disabled explicitly by the host. If the host
> cannot handle the bundled mgmt tx completion, this capability
> support needs to be disabled in the wmi init cmd, sent to the firmware.
> 
> Add the host capability indication flag in the wmi ready command,
> to let firmware know the features supported by the host driver.
> This field is ignored if it is not supported by firmware.
> 
> Set the host capability indication flag(i.e. host_capab) to zero,
> for disabling the support of bundle mgmt tx completion. This will
> indicate the firmware to send completion event for every mgmt tx
> completion, instead of bundling them together and sending in a single
> event.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

673bc519c558 ath10k: disable bundle mgmt tx completion event support
dc405152bb64 ath10k: handle mgmt tx completion event

-- 
https://patchwork.kernel.org/patch/10493381/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
