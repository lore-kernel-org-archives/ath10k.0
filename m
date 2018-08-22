Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsNYa-0007yE-9w
 for ath10k@lists.infradead.org; Wed, 22 Aug 2018 07:27:57 +0000
Message-ID: <1534922856.25523.60.camel@sipsolutions.net>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 22 Aug 2018 09:27:36 +0200
In-Reply-To: <7999c366492a4523456227fb49329bf2@codeaurora.org>
References: <7999c366492a4523456227fb49329bf2@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 2018-08-21 at 15:08 -0700, Pradeep Kumar Chitrapu wrote:

> > Right. However, I guess we could allow updating/changing this setting 
> > on
> > the fly through nl80211_set_beacon() which already allows changing 
> > other
> > non-beacon parameters (like the probe or assoc response templates), and
> > then we can use your approach. Basically changing "SET_BEACON" to be a
> > bit like "CHANGE_AP".
> 
> Agree. ( ftm_responder param will have to be added in 
> cfg80211_beacon_data
> instead of cfg80211_ap_settings)

Right. I'm not even sure that all devices can disable it though, so we
may be in a bind here? I think ours (Intel) can't, for example, disable
FTM responder without disabling the AP (at least momentarily)...

Should we just ignore that? Or perhaps add a separate capability for it?

Maybe there's even hardware that cannot change the elements (LCI/Civic
location) on the fly?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
