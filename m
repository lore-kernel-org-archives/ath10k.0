Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwlFE-0001K0-Mh
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 09:34:15 +0000
Message-ID: <1535967225.3437.27.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/3] mac80211: support FTM responder
 configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 03 Sep 2018 11:33:45 +0200
In-Reply-To: <1535745418-31336-3-git-send-email-pradeepc@codeaurora.org>
References: <1535745418-31336-1-git-send-email-pradeepc@codeaurora.org>
 <1535745418-31336-3-git-send-email-pradeepc@codeaurora.org>
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

On Fri, 2018-08-31 at 12:56 -0700, Pradeep Kumar Chitrapu wrote:
> 
> + * @ftm_responder: whether to enable fine timing measurement FTM functionality

missing "responder" somewhere there :)

> + * @ftmr_params: configurable lci/civic parameter when enabling FTM responder.

Perhaps the *existence* of ftmr_params could indicate that it's enabled?

> @@ -865,6 +899,20 @@ static int ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
>  	if (err == 0)
>  		changed |= BSS_CHANGED_AP_PROBE_RESP;
>  
> +	if (params->ftm_responder) {

Here you immediately have the problem I talked about in the earlier
patch ... yes, we don't have drivers that allow disabling it (so should
probably reject that now), but without it you can *enable* it on the
fly, but you cannot *disable*, in fact we assume saying "disable" means
"no change" which is rather confusing.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
