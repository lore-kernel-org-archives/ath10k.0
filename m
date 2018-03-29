Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TSA-0003WY-Kn
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 09:02:41 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Advertize beacon_int_min_gcd
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1520428356-2762-1-git-send-email-akolli@codeaurora.org>
References: <1520428356-2762-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20180329090228.572B060C64@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 09:02:28 +0000 (UTC)
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
To: akolli@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@codeaurora.org wrote:

> This patch fixes regression caused by 0c317a02ca98
> ("cfg80211: support virtual interfaces with different beacon intervals"),
> with this change cfg80211 expects the driver to advertize
> 'beacon_int_min_gcd' to support different beacon intervals in multivap
> scenario. This support is added for, QCA988X/QCA99X0/QCA9984/QCA4019.
> 
> Verifed AP + mesh bring up on QCA9984 with beacon interval 100msec and
> 1000msec respectively.
> Frimware: firmware-5.bin_10.4-3.5.3-00053
> 
> Fixes: 0c317a02ca98 ("cfg80211: support virtual interfaces with different beacon intervals")
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8ebee73b574a ath10k: advertize beacon_int_min_gcd

-- 
https://patchwork.kernel.org/patch/10263995/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
