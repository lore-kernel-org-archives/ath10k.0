Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNXs-0005xp-JG
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:17:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Set probe request oui during driver start
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1538503393-17543-1-git-send-email-pillair@codeaurora.org>
References: <1538503393-17543-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20181013171734.516A160C55@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:17:34 +0000 (UTC)
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

> Currently the wmi command for setting probe request
> oui, needed for mac randomization, is sent during
> the mac register. At this time, during the driver
> init the wmi has already been detached. This can
> cause unexpected behavior since the firmware is
> already down and the wmi has been detached.
> 
> Send the wmi command for setting probe request
> oui during the driver start. This will make sure
> that the firmware is started and wmi is initialized
> before we send this command.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Fixes: 60e1d0fb290197fe505dff6e4e3b7e4d258dbf60
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f1157695c527 ath10k: set probe request oui during driver start

-- 
https://patchwork.kernel.org/patch/10623963/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
