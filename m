Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hflGN-0001gx-49
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:13:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add peer delete response event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550673001-8779-1-git-send-email-pillair@codeaurora.org>
References: <1550673001-8779-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190625131330.13D96616D3@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:13:29 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Dundi Raviteja <dundi@codeaurora.org>

Rakesh Pillai <pillair@codeaurora.org> wrote:

> Peer creation in firmware fails if last peer deletion is still
> in progress.
> 
> The firmware sends a peer delete response event if it advertises
> the service WMI_SERVICE_SYNC_DELETE_CMDS. This peer delete response
> event is used to synchronize the peer deletion.
> 
> Add peer delete response event and wait for the event after
> deleting every peer from host driver to synchronize with firmware.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c6f537a11b81 ath10k: Add peer delete response event

-- 
https://patchwork.kernel.org/patch/10822207/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
