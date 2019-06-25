Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hflEV-0000jc-An
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:11:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: wait for vdev delete response from firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550411479-32253-1-git-send-email-pillair@codeaurora.org>
References: <1550411479-32253-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190625131133.0D6F661A7E@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:11:32 +0000 (UTC)
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

> When we add an interface immediately after removing
> the interface the vdev deletion in firmware might not
> have been completed. We need to synchronize the vdev creation
> with the firmware.
> 
> Wait for vdev delete response from firmware when we
> remove an interface.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fe36e70f766e ath10k: wait for vdev delete response from firmware

-- 
https://patchwork.kernel.org/patch/10817047/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
