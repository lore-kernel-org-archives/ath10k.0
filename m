Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCPJU-0005F7-VD
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 11:14:05 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: Fix soft lockup during firmware crash/hw-restart
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <f957e5d085a347b59d9eae0d2c794d1e@euamsexm01a.eu.qualcomm.com>
Date: Thu, 1 Dec 2016 12:13:36 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> During firmware crash (or) user requested manual restart
> the system gets into a soft lock up state because of the
> below root cause.
> 
> During user requested hardware restart / firmware crash
> the system goes into a soft lockup state as 'napi_synchronize'
> is called after 'napi_disable' (which sets 'NAPI_STATE_SCHED'
> bit) and it sleeps into infinite loop as it waits for
> 'NAPI_STATE_SCHED' to be cleared. This condition is hit because
> 'ath10k_hif_stop' is called twice as below (resulting in calling
> 'napi_synchronize' after 'napi_disable')
> 
> 'ath10k_core_restart' -> 'ath10k_hif_stop' (ATH10K_STATE_ON) ->
> -> 'ieee80211_restart_hw' -> 'ath10k_start' -> 'ath10k_halt' ->
> 'ath10k_core_stop' -> 'ath10k_hif_stop' (ATH10K_STATE_RESTARTING)
> 
> Fix this by calling 'ath10k_halt' in ath10k_core_restart itself
> as it makes more sense before informing mac80211 to restart h/w
> Also remove 'ath10k_halt' in ath10k_start for the state of 'restarting'
> 
> Fixes: 3c97f5de1f28 ("ath10k: implement NAPI support")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

c2cac2f74ab4 ath10k: fix soft lockup during firmware crash/hw-restart

-- 
https://patchwork.kernel.org/patch/9453609/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
