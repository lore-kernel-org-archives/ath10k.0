Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpud6-0000Fl-9N
 for ath10k@lists.infradead.org; Wed, 15 Aug 2018 12:10:26 +0000
Message-ID: <1534334948.3547.39.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] nl80211: add support to configure FTM responder
 functionality
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 15 Aug 2018 14:09:08 +0200
In-Reply-To: <1534293018-4930-2-git-send-email-pradeepc@codeaurora.org>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-2-git-send-email-pradeepc@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

On Tue, 2018-08-14 at 17:30 -0700, Pradeep Kumar Chitrapu wrote:
> 
> +	int ftm_responder;

bool

> + * @NL80211_ATTR_FTM_RESPONDER: attribute which user-space can include in
> + *	%NL80211_CMD_START_AP to enable(1) or disable(0) fine timing measurement
> + *	(FTM) responder functionality.  If not set, it means don't care and
> + *	the device will decide what to use.

Why 0/1 instead of a flag attribute?

Also, I think you need the attributes (LCI/Civic location)?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
