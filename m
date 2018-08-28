Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuZb5-0007Je-6r
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 08:43:37 +0000
Message-ID: <1535445791.5895.0.camel@sipsolutions.net>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 28 Aug 2018 10:43:11 +0200
In-Reply-To: <4fb78fad97704c8b3b1433085355180c@codeaurora.org>
References: <7999c366492a4523456227fb49329bf2@codeaurora.org>
 <1534922856.25523.60.camel@sipsolutions.net>
 <4fb78fad97704c8b3b1433085355180c@codeaurora.org>
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

On Wed, 2018-08-22 at 11:22 -0700, Pradeep Kumar Chitrapu wrote:

> > Should we just ignore that? Or perhaps add a separate capability for 
> > it?
> 
> Yes, even we behave the same. In that case, we can go ahead now with the
> capability to only enable FTM responder. If the driver wants to support
> disabling option in future, at which point, the new capability can be 
> added.

True.

> However, changes to nl80211_set_beacon to support enabling FTM responder
> may still be needed along with start_ap, assuming that ap start will be 
> issued by different android api than enableResponder api.

Yes, I guess that's still needed to be able to support the Android API,
which seems useful.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
