Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adaab-0003j6-8l
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 09:39:33 +0000
Date: Wed, 9 Mar 2016 15:08:45 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
Message-ID: <20160309093845.GA6695@atheros-ThinkPad-T61>
References: <1457508003-16700-1-git-send-email-mohammed@qca.qualcomm.com>
 <1457515803.2042.1.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1457515803.2042.1.camel@sipsolutions.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

On Wed, Mar 09, 2016 at 10:30:03AM +0100, Johannes Berg wrote:
> On Wed, 2016-03-09 at 12:50 +0530, Mohammed Shafi Shajakhan wrote:
> >=A0
> > + * @rx_duration: approximate total air time(usecs) for all the
> > frames from a
> > + *	connected client
> =

> I don't see why this should be restricted to "connected clients". The
> same value could be used for a mesh peer. Or TDLS peer. Or the AP on a
> managed connection. Or all the other types of STA.

[shafi] Please suggest if this is ok ? I will be thankful
if you can suggest a better one if this is not ok

* @rx_duration: approximate total air time(usecs) for all the
 frames from a peer

 regards,
 shafi


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
