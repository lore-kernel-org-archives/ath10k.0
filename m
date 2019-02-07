Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkuu-0008RS-4x
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:44:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix dma unmap direction for management frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548390066-12305-1-git-send-email-pillair@codeaurora.org>
References: <1548390066-12305-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190207144439.DC55960131@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:44:39 +0000 (UTC)
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

> The management frames transmitted are dma mapped with
> direction TO_DEVICE, but incorrectly mapped with
> direction FROM_DEVICE during tx complete and error cases.
> 
> Fix the direction of dma during dma unmap of the
> transmitted management frames.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Fixes: 38a1390e02b7 ("ath10k: dma unmap mgmt tx buffer if wmi cmd send fails")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6e8a8991e210 ath10k: fix dma unmap direction for management frames

-- 
https://patchwork.kernel.org/patch/10780549/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
