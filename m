Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTZU-0000sX-Ff
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:50:37 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: Protect ath10k_htt_rx_ring_free with rx_ring.lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1529006895-5105-1-git-send-email-greearb@candelatech.com>
References: <1529006895-5105-1-git-send-email-greearb@candelatech.com>
Message-Id: <20180628095026.1669360791@smtp.codeaurora.org>
Date: Thu, 28 Jun 2018 09:50:26 +0000 (UTC)
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

> While debugging driver crashes related to a buggy firmware
> crashing under load, I noticed that ath10k_htt_rx_ring_free
> could be called without being under lock.  I'm not sure if this
> is the root cause of the crash or not, but it seems prudent to
> protect it.
> 
> Originally tested on 4.16+ kernel with ath10k-ct 10.4 firmware
> running on 9984 NIC.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

168f75f11fe6 ath10k: protect ath10k_htt_rx_ring_free with rx_ring.lock

-- 
https://patchwork.kernel.org/patch/10465229/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
