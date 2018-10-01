Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6yh4-00033R-Lj
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 13:57:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add support for configuring management packet rate
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1536557980-11895-1-git-send-email-srirrama@codeaurora.org>
References: <1536557980-11895-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20181001135652.6511660A98@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 13:56:52 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> By default the firmware uses 1Mbps and 6Mbps rate for management packets
> in 2G and 5G bands respectively. But when the user selects different
> basic rates from the userspace, we need to send the management
> packets at the lowest basic rate selected by the user.
> 
> This change makes use of WMI_VDEV_PARAM_MGMT_RATE param for configuring the
> management packets rate to the firmware.
> 
> Chipsets Tested : QCA988X, QCA9887, QCA9984
> FW Tested 	: 10.2.4-1.0-41, 10.4-3.6.104
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f279294e9ee2 ath10k: add support for configuring management packet rate

-- 
https://patchwork.kernel.org/patch/10593571/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
