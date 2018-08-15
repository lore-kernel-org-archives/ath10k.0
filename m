Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpudf-0000Om-GA
 for ath10k@lists.infradead.org; Wed, 15 Aug 2018 12:11:00 +0000
Message-ID: <1534334984.3547.40.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] mac80211: Add support to notify ftm responder
 configuration to the driver
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 15 Aug 2018 14:09:44 +0200
In-Reply-To: <1534293018-4930-3-git-send-email-pradeepc@codeaurora.org>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-3-git-send-email-pradeepc@codeaurora.org>
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
> New bss param ftm_responder is used to notify the driver to
> enable or disable fine timing request (FTM) responder role in AP mode.
> 
> + * @BSS_CHANGED_FTM_RESPONDER: fime timing reasurement request responder
> + *	functionality changed for this BSS (AP mode).

You don't really need this since it can only be configured the first
time you start the AP.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
