Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycKn-0003iq-94
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 12:59:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Enhance logging for vdev pdev & peer set param
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550216886-23045-1-git-send-email-pillair@codeaurora.org>
References: <1550216886-23045-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190226125944.840686132B@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 12:59:44 +0000 (UTC)
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

> Currently after enabling the WMI debug logging,
> there is no detail printed about the param id
> and the param value for the pdev, vdev and
> peer params which are set.
> 
> Enhance the WMI logging to print the param id
> and the param value for pdev, vdev and peer set
> param wmi commands.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 		WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1c136e41fb77 ath10k: enhance logging for vdev pdev & peer set param

-- 
https://patchwork.kernel.org/patch/10814285/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
