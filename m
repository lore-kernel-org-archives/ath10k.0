Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8jre-0005Nn-3d
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 09:58:59 +0000
Message-ID: <1524045517.3024.3.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: support MAC address randomization in scan
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Apr 2018 11:58:37 +0200
In-Reply-To: <5AD701F0.20504@broadcom.com>
 (sfid-20180418_102940_926003_EF96FC2A)
References: <1522379640-6442-1-git-send-email-cjhuang@codeaurora.org>
 <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
 <20180412205954.GA34456@rodete-desktop-imager.corp.google.com>
 <e16557d0891352ae0b83902faee97023@codeaurora.org>
 <877epbs5v7.fsf@kamboji.qca.qualcomm.com> <5AD11D7C.1030603@broadcom.com>
 <242be71eb87140c9560163c4000255b2@codeaurora.org>
 <8736zvqtcw.fsf@kamboji.qca.qualcomm.com>
 <20180417002854.GA186697@rodete-desktop-imager.corp.google.com>
 <5AD5AEB5.1040808@broadcom.com>
 <20180417160715.GA255263@rodete-desktop-imager.corp.google.com>
 <5AD66BD9.4000706@broadcom.com>
 <CA+ASDXOoxMyTq2CVnUwvN1LBWj1Y9wpsRPKuM0tVzA80sDYG-w@mail.gmail.com>
 <c4f3d20e8c16c8bf8721f0a50fb809781b30b3f7.camel@redhat.com>
 <5AD701F0.20504@broadcom.com> (sfid-20180418_102940_926003_EF96FC2A)
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Dan Williams <dcbw@redhat.com>, Brian Norris <briannorris@chromium.org>
Cc: cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


> > > Is there a problem with the "supported commands" list?
> 
> My understanding is that in general the "supported commands" list is not 
> well-maintained. Not every nl80211 command is represented in the list so 
> user-space can not know whether it is missing or not supported.
> For this particular START_SCHED_SCAN command it can be used still and 
> indeed probably for a long time. I just wanted to point out that it is 
> not recommended for new user-space functionality.

We used to do it more, but most features are more complex than "command
is supported" or are simpler than "these 5 commands are supported" (just
a single bit to indicate the whole feature is enough), so we mostly use
extended feature flags now.

> > It sometimes feels like wpa_supplicant gets treated as a static entity
> > that can never be changed.  In fact, send a patch to Jouni implementing
> > the best practice, with a fallback to preserve compat for old kernels,
> > and I'm sure he'd entertain it.  Just because the supplicant does
> > something a certain way, doesn't mean it's the *best* way, but it too
> > evolves.

You also need to consider old supplicant on new kernels though? But I
didn't really follow this part of the discussion, so you're probably
taking that into account.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
