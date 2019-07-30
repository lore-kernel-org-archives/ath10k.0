Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsNg3-00082o-QU
 for ath10k@lists.infradead.org; Tue, 30 Jul 2019 08:40:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix channel info parsing for non tlv target
References: <1552044366-9186-1-git-send-email-pillair@codeaurora.org>
Date: Tue, 30 Jul 2019 11:40:06 +0300
In-Reply-To: <1552044366-9186-1-git-send-email-pillair@codeaurora.org> (Rakesh
 Pillai's message of "Fri, 8 Mar 2019 16:56:06 +0530")
Message-ID: <87ftmnncex.fsf@codeaurora.org>
MIME-Version: 1.0
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

Rakesh Pillai <pillair@codeaurora.org> writes:

> The tlv targets such as WCN3990 send more data in
> the chan info event, which is not sent by the non tlv
> targets. There is a minimum size check in the wmi event for
> non-tlv targets and hence we cannot update the common
> channel info structure.
>
> If the common channel info structure is updated, the
> size check for chan info event for non-tlv targets
> will fail and return -EPROTO and we see the below
> error messages
>
>    ath10k_pci 0000:01:00.0: failed to parse chan info event: -71
>
> Add tlv specific channel info structure and restore the
> original size of the common channel info structure to
> mitigate this issue.
>
> Tested HW: WCN3990
> 	   QCA9887
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 	   10.2.4-1.0-00037
>
> Fixes: 13104929d2ec ("ath10k: fill the channel survey results for WCN3990 correctly")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

I'll queue this v5.3, and also for stable v5.0 and later.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
