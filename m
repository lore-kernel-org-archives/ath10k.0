Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1gB-0007ys-TU
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:00:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: report tx rate using ieee80211_tx_rate_update()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1540530438-11292-1-git-send-email-akolli@codeaurora.org>
References: <1540530438-11292-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20181220170001.7792360734@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:00:01 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Mesh path metric needs tx rate information from ieee80211_tx_status()
> call but in ath10k there is no mechanism to report tx rate information
> via ieee80211_tx_status(), the tx rate is only accessible via
> sta_statiscs() op.
> 
> Per peer tx stats has tx rate info available, Tx rate is available
> to ath10k driver after every 4 PPDU sent in the air. For each PPDU,
> ath10k driver updates rate informattion to mac80211 using
> ieee80211_tx_rate_update().
> 
> Per peer txrate information is updated through per peer statistics
> and is available for QCA9888/QCA9984/QCA4019/QCA998X only
> 
> Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
> Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9a9cf0e63f70 ath10k: report tx rate using ieee80211_tx_rate_update()

-- 
https://patchwork.kernel.org/patch/10656925/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
