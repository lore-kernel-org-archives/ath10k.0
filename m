Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8QfQ-0006Or-SP
 for ath10k@lists.infradead.org; Thu, 12 Sep 2019 15:05:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix channel info parsing for non tlv target
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1552044366-9186-1-git-send-email-pillair@codeaurora.org>
References: <1552044366-9186-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190912150551.2BFB060595@smtp.codeaurora.org>
Date: Thu, 12 Sep 2019 15:05:51 +0000 (UTC)
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

> The tlv targets such as WCN3990 send more data in the chan info event, which is
> not sent by the non tlv targets. There is a minimum size check in the wmi event
> for non-tlv targets and hence we cannot update the common channel info
> structure as it was done in commit 13104929d2ec ("ath10k: fill the channel
> survey results for WCN3990 correctly"). This broke channel survey results on
> 10.x firmware versions.
> 
> If the common channel info structure is updated, the size check for chan info
> event for non-tlv targets will fail and return -EPROTO and we see the below
> error messages
> 
>    ath10k_pci 0000:01:00.0: failed to parse chan info event: -71
> 
> Add tlv specific channel info structure and restore the original size of the
> common channel info structure to mitigate this issue.
> 
> Tested HW: WCN3990
> 	   QCA9887
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 	   10.2.4-1.0-00037
> 
> Fixes: 13104929d2ec ("ath10k: fill the channel survey results for WCN3990 correctly")
> Cc: stable@vger.kernel.org # 5.0
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6be6c04bcc2e ath10k: fix channel info parsing for non tlv target

-- 
https://patchwork.kernel.org/patch/10844513/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
