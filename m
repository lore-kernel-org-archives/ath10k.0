Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrktk-0002TO-TW
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 09:53:05 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21615.3019.437408.992893@gargle.gargle.HOWL>
Date: Fri, 21 Nov 2014 15:24:19 +0530
Subject: Re: [RFC] ath10k: Fix shared WEP
In-Reply-To: <CA+BoTQnyf0tvg8ngLqsoux-A9-3J46cDuJdd-V=kS24wWS4Y1A@mail.gmail.com>
References: <1416492382-18058-1-git-send-email-sujith@msujith.org>
 <CA+BoTQnyf0tvg8ngLqsoux-A9-3J46cDuJdd-V=kS24wWS4Y1A@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior wrote:
> IOW This fixes a corner case when station reconnects but ath10k AP for
> some reason didn't notice it (e.g. station went out of range and came
> back before AP inactivity timer kicked in), right? Or is there another
> scenario? It might be a good idea to include this in the commit log.

The corner case is when a station changes its default key and tries
to reassociate, but does not send a deauth first.

> I don't think the above will work for mBSS, e.g. consider vdev_id=0
> being an open network and vdev_id=1 being wep-shared. Maybe it's about
> time to introduce ath10k_peer_find_by_addr(struct ath10k *ar, const u8
> *)?

Yep, I was aware of this. I think we can do this for a single BSS
now and have a FIXME to address multiple BSS later. This issue
is rarely seen in practice.

> Read access to peer->keys should be protected by either data_lock or
> conf_mutex. Obviously the latter can't be used because this function
> will be called from an atomic context leaving the data_lock. The
> entire is_peer_wep_key_set() should require data_lock to be held while
> it is called to avoid races.
> 
> Oh, and apparently this is buggy anyway because
> ath10k_install_peer_wep_keys() is oblivious to this. Oops..

I don't think it can happen, though ? ath10k_install_peer_wep_keys()
would be called only when a station transitions to ASSOC and message 3
can't be received when that happens ?

(But, I did see a lockdep splat when using WEP).

> This is getting a little messy. Did you consider to somehow unify the
> previous wep shared & pmf code with your new fix?

For shared wep, the FW delivers the first auth frame as encrypted and
subsequent auth frames as decrypted, so we need to differentiate them somehow...

I'll address the other stylistic comments and send a v2.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
