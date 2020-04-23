Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRTrL-0007uL-JP
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 04:53:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix the invalid tx/rx chainmask configuration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1587495512-29813-1-git-send-email-mkenna@codeaurora.org>
References: <1587495512-29813-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200423045259.26118C433BA@smtp.codeaurora.org>
Date: Thu, 23 Apr 2020 04:52:59 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> The driver is allowing the invalid tx/rx chainmask configuration
> (other than 1,3,7,15) set by the user. It causes the firmware
> crash due to the invalid chainmask values.
> 
> Hence, reject the invalid chainmask values in the driver by not
> sending the pdev set command to the firmware.
> 
> Tested hardware: QCA9888
> Tested firmware: 10.4-3.10-00047
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

aac392d8553f ath10k: Fix the invalid tx/rx chainmask configuration

-- 
https://patchwork.kernel.org/patch/11502099/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
