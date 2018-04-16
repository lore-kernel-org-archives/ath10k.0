Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f84PA-0005fT-Ug
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 13:42:50 +0000
MIME-Version: 1.0
Subject: Re: [2/2] ath10k: support MAC address randomization in scan
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
References: <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
Message-Id: <20180416134238.A11C3607E1@smtp.codeaurora.org>
Date: Mon, 16 Apr 2018 13:42:38 +0000 (UTC)
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> The ath10k reports the random_mac_addr capability to upper layer
> based on the service bit firmware reported. Driver sets the
> spoofed flag in scan_ctrl_flag to firmware if upper layer has
> enabled this feature in scan request.
> 
> Test with QCA6174 hw3.0 and firmware-6.bin_WLAN.RM.4.4.1-00102-QCARMSWP-1,
> but QCA9377 is also affected.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This added a new checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi-ops.h:123: Alignment should match open parenthesis

I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/patch/10316769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
