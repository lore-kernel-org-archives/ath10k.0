Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCOim-0006lI-Ss
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 10:36:10 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Fix soft lockup during firmware
 crash/hw-restart
Date: Thu, 1 Dec 2016 10:35:38 +0000
Message-ID: <87inr4rl6t.fsf@kamboji.qca.qualcomm.com>
References: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Wed, 30 Nov 2016 10:59:29	+0530")
Content-Language: en-US
Content-ID: <2C4869A2CAFE0542AFF81453207D0E09@qualcomm.com>
MIME-Version: 1.0
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

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
> ---
> [v2 Added Fixes ]

I'll also add:

Cc: <stable@vger.kernel.org> # v4.9

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
