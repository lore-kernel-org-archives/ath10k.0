Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxnx4-0005Va-R7
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 06:39:39 +0000
Message-ID: <1536215959.4015.1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/3] mac80211: support FTM responder
 configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 06 Sep 2018 08:39:19 +0200
In-Reply-To: <f6cb4548de9c5ca228124df1301d2aa0@codeaurora.org>
References: <1535745418-31336-1-git-send-email-pradeepc@codeaurora.org>
 <1535745418-31336-3-git-send-email-pradeepc@codeaurora.org>
 <1535967225.3437.27.camel@sipsolutions.net>
 <f6cb4548de9c5ca228124df1301d2aa0@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, David Spinadel <david.spinadel@intel.com>, ath10k@lists.infradead.org


> > Perhaps the *existence* of ftmr_params could indicate that it's 
> > enabled?
> 
> My understanding is these are only optional parameters. So, I have kept 
> ftm_responder separate from params.

Yes, they're only optional. I was just thinking that even an "empty" set
of parameters could indicate enablement, but I guess we can even avoid
the memory allocation, so perhaps it's better this way. Anyway it's only
an internal API so can change as needed.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
