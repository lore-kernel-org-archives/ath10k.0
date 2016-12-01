Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCPIe-0004gl-00
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 11:13:12 +0000
Date: Thu, 1 Dec 2016 16:42:38 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Fix soft lockup during firmware
 crash/hw-restart
Message-ID: <20161201111238.GA12384@atheros-ThinkPad-T61>
References: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
 <87inr4rl6t.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87inr4rl6t.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

On Thu, Dec 01, 2016 at 10:35:38AM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > During firmware crash (or) user requested manual restart
> > the system gets into a soft lock up state because of the
> > below root cause.
> >
> > During user requested hardware restart / firmware crash
> > the system goes into a soft lockup state as 'napi_synchronize'
> > is called after 'napi_disable' (which sets 'NAPI_STATE_SCHED'
> > bit) and it sleeps into infinite loop as it waits for
> > 'NAPI_STATE_SCHED' to be cleared. This condition is hit because
> > 'ath10k_hif_stop' is called twice as below (resulting in calling
> > 'napi_synchronize' after 'napi_disable')
> >
> > 'ath10k_core_restart' -> 'ath10k_hif_stop' (ATH10K_STATE_ON) ->
> > -> 'ieee80211_restart_hw' -> 'ath10k_start' -> 'ath10k_halt' ->
> > 'ath10k_core_stop' -> 'ath10k_hif_stop' (ATH10K_STATE_RESTARTING)
> >
> > Fix this by calling 'ath10k_halt' in ath10k_core_restart itself
> > as it makes more sense before informing mac80211 to restart h/w
> > Also remove 'ath10k_halt' in ath10k_start for the state of 'restarting'
> >
> > Fixes: 3c97f5de1f28 ("ath10k: implement NAPI support")
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > ---
> > [v2 Added Fixes ]
> 
> I'll also add:
> 
> Cc: <stable@vger.kernel.org> # v4.9
>
thank you Kalle.

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
