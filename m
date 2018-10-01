Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6vET-0002Ii-1I
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 10:15:18 +0000
Message-ID: <1538388895.3126.26.camel@sipsolutions.net>
Subject: Re: [PATCH v5 2/3] mac80211: support FTM responder
 configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 01 Oct 2018 12:14:55 +0200
In-Reply-To: <1537489811-5752-3-git-send-email-pradeepc@codeaurora.org>
References: <1537489811-5752-1-git-send-email-pradeepc@codeaurora.org>
 <1537489811-5752-3-git-send-email-pradeepc@codeaurora.org>
Mime-Version: 1.0
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, David Spinadel <david.spinadel@intel.com>

On Thu, 2018-09-20 at 17:30 -0700, Pradeep Kumar Chitrapu wrote:
> New bss param ftm_responder is used to notify the driver to
> enable fine timing request (FTM) responder role in AP mode.
> 
> Plumb the new cfg80211 API for FTM responder statistics through to
> the driver API in mac80211.

This patch also doesn't apply right now, please rebase & add the struct
as previously pointed out. That also affects the driver, perhaps, so
please resend that as well.

> +	if (params->ftm_responder != -1) {
> +		sdata->vif.bss_conf.ftm_responder = params->ftm_responder;
> +		err = ieee80211_set_ftm_responder_params(sdata,
> +							 params->lci,
> +							 params->lci_len,
> +							 params->civicloc,
> +							 params->civicloc_len);
> +
> +		if (err < 0)
> +			return err;
> +
> +		changed |= BSS_CHANGED_FTM_RESPONDER;
> +	} else {
> +		sdata->vif.bss_conf.ftm_responder = -1;
> +	}

This seems wrong - you should remove the else branch entirely, afaict?

I think you may also be missing some freeing of the ftm_responder_params
in the end if it didn't get disabled again, but the interface is
removed?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
