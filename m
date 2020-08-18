Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yEp-0007Yj-5b
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 09:49:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Register shutdown handler
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1593193981-30161-1-git-send-email-pillair@codeaurora.org>
References: <1593193981-30161-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20200818094901.03C7BC43387@smtp.codeaurora.org>
Date: Tue, 18 Aug 2020 09:49:01 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> As a part of device shutdown the smmu driver will be
> stopped and henceforth any IOVA address translation
> will not be done. The wlan driver, being one of the
> smmu driver consumer, should stop all the dma related
> activity as a part of shutdown, and thereby ensuring
> that no dma activity is done once the smmu driver
> shuts down.
> 
> During the device shutdown, the smmu calls shutdown
> for all its consumers in order to indicate them to
> stop all their dma activities.
> 
> Register the shutdown handler to stop the wlan
> driver and avoid any dma operations.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

caf275463d37 ath10k: Register shutdown handler

-- 
https://patchwork.kernel.org/patch/11628291/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
