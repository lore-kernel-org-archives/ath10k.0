Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCRYl-0005tb-5B
 for ath10k@lists.infradead.org; Mon, 13 Jun 2016 13:05:44 +0000
Received: by mail-qg0-x22d.google.com with SMTP id l44so66295766qgd.0
 for <ath10k@lists.infradead.org>; Mon, 13 Jun 2016 06:05:22 -0700 (PDT)
Date: Mon, 13 Jun 2016 09:05:07 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
Message-ID: <20160613130507.GA11074@localhost>
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
 <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 <1465808939.2434.1.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1465808939.2434.1.camel@sipsolutions.net>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jun 13, 2016 at 11:08:59AM +0200, Johannes Berg wrote:
> On Mon, 2016-06-13 at 07:39 +0200, Michal Kazior wrote:
> >=A0
> > FWIW all of these are false positives. I think this was already
> > pointed out some time ago. The drv_priv stuff is merely an offset
> > (see how ieee80211_vif and ieee80211_sta are defined) and the
> > according structure is always checked beforehand.

OK, fair enough, sorry for the noise.  I'm daily running sparse / smatch
on wireless-testing; although these had been around for a while they
showed up as new "errors" because of some line number changes, but I'll
squelch them going forward.

> IIRC, doing something like that can (sometimes?) still get you into
> undefined behaviour territory, so the compiler could potentially
> "optimize" away the later NULL check.

So I did just go and check the generated code for each of these cases
and gcc didn't elide the subsequent if-test, at least on x86-64 and my
compiler / build config.  Given http://lwn.net/Articles/342330, it seems
possible, though.

-- =

Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
