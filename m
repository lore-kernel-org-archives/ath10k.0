Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TTG-0003z3-47
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 09:03:47 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix recent bandwidth conversion bug
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1520684438-9233-1-git-send-email-akolli@codeaurora.org>
References: <1520684438-9233-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20180329090335.C459560C66@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 09:03:35 +0000 (UTC)
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

> The commit "cfg80211: make RATE_INFO_BW_20 the default" changed
> the index of RATE_INFO_BW_20, but the updates to ath10k missed
> the special bandwidth calculation case in
> ath10k_update_per_peer_tx_stats().
> 
> This will fix below warning,
> 
>  WARNING: CPU: 0 PID: 609 at net/wireless/util.c:1254
>  cfg80211_calculate_bitrate+0x174/0x220
>  invalid rate bw=1, mcs=9, nss=2
> 
>  (unwind_backtrace) from
>  (cfg80211_calculate_bitrate+0x174/0x220)
>  (cfg80211_calculate_bitrate) from
>  (nl80211_put_sta_rate+0x44/0x1dc)from
>  (nl80211_put_sta_rate) from
>  (nl80211_send_station+0x388/0xaf0)
>  (nl80211_get_station+0xa8/0xec)
>  [ end trace da8257d6a850e91a ]
> 
> Fixes: 842be75c77cb ("cfg80211: make RATE_INFO_BW_20 the default")
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

91493e8e10f0 ath10k: fix recent bandwidth conversion bug

-- 
https://patchwork.kernel.org/patch/10273445/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
