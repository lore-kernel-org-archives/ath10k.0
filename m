Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0Ub-0001oi-25
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:50:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix encoding for protected management frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1554208970-16527-1-git-send-email-pillair@codeaurora.org>
References: <1554208970-16527-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190507135048.6B8C960DB6@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:50:48 +0000 (UTC)
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

> Currently the protected management frames are
> not appended with the MIC_LEN which results in
> the protected management frames being encoded
> incorrectly.
> 
> Add the extra space at the end of the protected
> management frames to fix this encoding error for
> the protected management frames.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

42f1bc43e6a9 ath10k: Fix encoding for protected management frames

-- 
https://patchwork.kernel.org/patch/10881571/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
