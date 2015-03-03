Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSiyX-0000jG-DT
 for ath10k@lists.infradead.org; Tue, 03 Mar 2015 09:18:50 +0000
Message-ID: <1425374299.2450.18.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for
 tdls station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 03 Mar 2015 10:18:19 +0100
In-Reply-To: <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 (sfid-20150301_092138_211960_577091EE)
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
 <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 (sfid-20150301_092138_211960_577091EE)
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
To: Arik Nemtsov <arik@wizery.com>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Arik Nemtsov <arikx.nemtsov@intel.com>

On Sun, 2015-03-01 at 10:21 +0200, Arik Nemtsov wrote:

> > Arik, you have a similar patch handling only NSS. Does this one look
> > fine to you, and would it solve the problem your other patch solved?
> 
> Well currently iwlmvm requires the NSS to be set before
> IEEE80211_STA_ASSOC (earlier), so this doesn't help directly.
> I could change mvm a bit to make it work, but I don't really see a
> good reason for it :)
> 
> The patch looks good. Shouldn't introduce new issues (at least for iwlwifi).

Ok, thanks. Do you think it would be possible to move all of this before
ASSOC?

(if not, why not, and how is it that we have valid NSS if we don't have
the remaining data valid?)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
