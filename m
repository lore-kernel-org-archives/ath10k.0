Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsXmW-0007Hb-OO
 for ath10k@lists.infradead.org; Wed, 22 Aug 2018 18:23:02 +0000
MIME-Version: 1.0
Date: Wed, 22 Aug 2018 11:22:49 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
In-Reply-To: <1534922856.25523.60.camel@sipsolutions.net>
References: <7999c366492a4523456227fb49329bf2@codeaurora.org>
 <1534922856.25523.60.camel@sipsolutions.net>
Message-ID: <4fb78fad97704c8b3b1433085355180c@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-08-22 00:27, Johannes Berg wrote:
> On Tue, 2018-08-21 at 15:08 -0700, Pradeep Kumar Chitrapu wrote:
> 
>> > Right. However, I guess we could allow updating/changing this setting
>> > on
>> > the fly through () which already allows changing
>> > other
>> > non-beacon parameters (like the probe or assoc response templates), and
>> > then we can use your approach. Basically changing "SET_BEACON" to be a
>> > bit like "CHANGE_AP".
>> 
>> Agree. ( ftm_responder param will have to be added in
>> cfg80211_beacon_data
>> instead of cfg80211_ap_settings)
> 
> Right. I'm not even sure that all devices can disable it though, so we
> may be in a bind here? I think ours (Intel) can't, for example, disable
> FTM responder without disabling the AP (at least momentarily)...
> 
> Should we just ignore that? Or perhaps add a separate capability for 
> it?

Yes, even we behave the same. In that case, we can go ahead now with the
capability to only enable FTM responder. If the driver wants to support
disabling option in future, at which point, the new capability can be 
added.

However, changes to nl80211_set_beacon to support enabling FTM responder
may still be needed along with start_ap, assuming that ap start will be 
issued
by different android api than enableResponder api.

Please let me know your suggestion.

> 
> Maybe there's even hardware that cannot change the elements (LCI/Civic
> location) on the fly?
> 
> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
