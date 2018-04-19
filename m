Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Bnf-0000fV-55
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:49:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv3] ath10k: Add tx ack signal support for management frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522316915-27518-1-git-send-email-vnaralas@codeaurora.org>
References: <1522316915-27518-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20180419154831.5584E60AE0@smtp.codeaurora.org>
Date: Thu, 19 Apr 2018 15:48:31 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> This patch add support to get RSSI from acknowledgment
> frames for transmitted management frames.
> 
> hardware_used: QCA4019, QCA9984.
> firmware version: 10.4-3.5.3-00052.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

235b9c427661 ath10k: Add tx ack signal support for management frames

-- 
https://patchwork.kernel.org/patch/10314823/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
