Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJbmh-0005XV-QN
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 10:07:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Add support for WCN3990 firmware crash recovery
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539323619-31358-1-git-send-email-pillair@codeaurora.org>
References: <1539323619-31358-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20181105100653.4656B60247@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 10:06:53 +0000 (UTC)
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

> Whenever the WCN3990 firmware becomes unavailable,
> the host driver receives a FW down indication, post
> which all the direct hardware register access should
> be avoided, in order to prevent improper behavior in
> the host driver.
> 
> Set the crash_flush flag when the host driver receives
> a FW_DOWN_IND via qmi, in order to stop the untimely
> hardware register access. Also handle the case, where
> we need to do core register only for the first FW_READY
> indication, which is when we initialize the host driver.
> All the subsequent FW_READY indication will be received
> in subsystem recovery case and we only need to do the
> restart work. The state of driver is maintained using
> flags to distinguish between first and subsequent FW_READY
> indication received.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0e622f67e041 ath10k: add support for WCN3990 firmware crash recovery

-- 
https://patchwork.kernel.org/patch/10637883/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
