Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grko4-00062D-5D
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:37:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath10k: Handle bundled tx completion for
 management frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548389402-10083-2-git-send-email-pillair@codeaurora.org>
References: <1548389402-10083-2-git-send-email-pillair@codeaurora.org>
Message-Id: <20190207143735.C0D3660131@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:37:35 +0000 (UTC)
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

> WCN3990 supports sending tx completion for multiple
> management frames bundled together in a single event.
> 
> Add support to handle the bundled tx completion
> event for WCN3990.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

cc123fac978f ath10k: Handle bundled tx completion for management frames
543271334483 ath10k: Enable bundle tx compl for management frames in WCN3990

-- 
https://patchwork.kernel.org/patch/10780541/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
