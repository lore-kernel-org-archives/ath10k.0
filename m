Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fprkQ-0001k7-Fs
 for ath10k@lists.infradead.org; Wed, 15 Aug 2018 09:05:47 +0000
Message-ID: <1534323867.3547.30.camel@sipsolutions.net>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 15 Aug 2018 11:04:27 +0200
In-Reply-To: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
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
> Currently ftm_responder parameter in hostapd.conf is only used for fine
> timing measurement (FTM) capability advertisement and actual control of
> the functionality is with low-level device/driver. This leads to confusion
> to the user when the capability advertisement is different from actual FTM
> responder functionality.
> 
> For example, FTM responder capability advertisement is set to 'disabled',
> which would imply that AP must not respond to FTM requests, but user sees
> AP still responding to FTM requests, as the functionality is enabled in
> the driver.

All you describe above is really a driver bug - it shouldn't have
enabled it to start with?

> The patch set allows userspace to configure FTM responder functionality
> with the addition of new Netlink attribute NL80211_ATTR_FTM_RESPONDER
> and also adds extended feature flag for the drivers to advertise the
> support. Sending '0' to disable FTM responder would imply AP does not
> respond to FTM requests and sending '1' to enable FTM responder would
> imply that AP responds to all FTM requests.

This makes sense anyway. Funny you should post this within hours of me
doing the same, basically.

I have no objection to your approach, though I guess it'd be nice if you
could take a look at the statistics I have exposed and see if those
makes sense or if additional ones are desirable for you, and then we can
combine the work that way, i.e. have your configuration and our stats?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
