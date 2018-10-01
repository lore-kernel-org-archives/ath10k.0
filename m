Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6vCb-0001yq-A4
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 10:13:23 +0000
Message-ID: <1538388776.3126.24.camel@sipsolutions.net>
Subject: Re: [PATCH v5 1/3] cfg80211: support FTM responder
 configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 01 Oct 2018 12:12:56 +0200
In-Reply-To: <1537489811-5752-2-git-send-email-pradeepc@codeaurora.org>
References: <1537489811-5752-1-git-send-email-pradeepc@codeaurora.org>
 <1537489811-5752-2-git-send-email-pradeepc@codeaurora.org>
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
> Allow userspace to enable fine timing measurement responder
> functionality with configurable lci/civic parameters in AP mode.
> This can be done at AP start or changing beacon parameters.
> 
> A new EXT_FEATURE flag is introduced for drivers to advertise
> the capability.
> 
> Also nl80211 API support for retrieving statistics is added.

I applied this, but with some changes. Notably,

>  /**
> + * cfg80211_ftm_responder_params - FTM responder parameters

I removed this struct, since it's no longer needed.

You do use it in mac80211, but since cfg80211 doesn't use it you should
declare it as ieee80211_ftm_respodner_params and use it in mac80211
only, I think.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
