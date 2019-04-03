Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBm0j-0007ef-3h
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 19:57:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id g8so17598pgf.2
 for <ath10k@lists.infradead.org>; Wed, 03 Apr 2019 12:57:24 -0700 (PDT)
Date: Wed, 3 Apr 2019 12:57:20 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during
 system resume
Message-ID: <20190403195718.GA74723@google.com>
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
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
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>, Kalle Valo <kvalo@codeaurora.org>

+ Sriram, Pradeep, Claire

On Sun, Mar 03, 2019 at 06:24:33PM +0100, Rafael J. Wysocki wrote:

Ooh, exactly 1 month ago!

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> ath10k_mac_vif_chan() always returns an error for the given vif
> during system-wide resume which reliably triggers two WARN_ON()s
> in ath10k_bss_info_changed() and they are not particularly
> useful in that code path, so drop them.
> 

Particularly, when WOWLAN isn't enabled, we get called during resume via
ieee80211_reconfig(), where we're not associated and don't have any
channel contexts. AFAICT, we shouldn't need to communicate anything in
particular to the firmware here, and so failing the 'if' is definitely
not worth WARN-ing about.

I'd love to see this get applied with:

Fixes: cd93b83ad927 ("ath10k: support for multicast rate control")
Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")

and sent to stable. This has been bugging people since 4.19. Spurious
WARN_ON()s can trigger reports to various crash trackers, and on some
systems appear as user-visible warnings ("System problem detected").

> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: linux-pm/drivers/net/wireless/ath/ath10k/mac.c
> ===================================================================
> --- linux-pm.orig/drivers/net/wireless/ath/ath10k/mac.c
> +++ linux-pm/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5705,7 +5705,7 @@ static void ath10k_bss_info_changed(stru
>  	}
>  
>  	if (changed & BSS_CHANGED_MCAST_RATE &&
> -	    !WARN_ON(ath10k_mac_vif_chan(arvif->vif, &def))) {
> +	    !ath10k_mac_vif_chan(arvif->vif, &def)) {
>  		band = def.chan->band;
>  		rateidx = vif->bss_conf.mcast_rate[band] - 1;
>  
> @@ -5743,7 +5743,7 @@ static void ath10k_bss_info_changed(stru
>  	}
>  
>  	if (changed & BSS_CHANGED_BASIC_RATES) {
> -		if (WARN_ON(ath10k_mac_vif_chan(vif, &def))) {
> +		if (ath10k_mac_vif_chan(vif, &def)) {
>  			mutex_unlock(&ar->conf_mutex);
>  			return;
>  		}
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
