Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTOJM-0001Or-9d
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 09:13:12 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Protect ath10k_htt_rx_ring_free with rx_ring.lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1528387897-6781-1-git-send-email-greearb@candelatech.com>
References: <1528387897-6781-1-git-send-email-greearb@candelatech.com>
Message-Id: <20180614091245.8CD6E602B8@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 09:12:45 +0000 (UTC)
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> From: Ben Greear <greearb@candelatech.com>
> 
> While debugging driver crashes related to a buggy firmware
> crashing under load, I noticed that ath10k_htt_rx_ring_free
> could be called without being under lock.  I'm not sure if this
> is the root cause of the crash or not, but it seems prudent to
> protect it.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Failed to apply, please use ath.git master branch as the baseline. Also
document the tested hardware and firmware versions in the commit log.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

error: patch failed: drivers/net/wireless/ath/ath10k/htt_rx.c:282
error: drivers/net/wireless/ath/ath10k/htt_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10453105/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
