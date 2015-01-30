Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHBLq-0000pT-FA
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 13:11:11 +0000
Message-ID: <1422623446.1919.20.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Jan 2015 14:10:46 +0100
In-Reply-To: <CA+BoTQkVuDqZVCVUB6pkDKp2tZ1sgnezju6Kg48JvnS4a_LZyA@mail.gmail.com>
 (sfid-20150130_140608_974245_7EDC71FA)
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422622694.1919.17.camel@sipsolutions.net>
 <CA+BoTQkVuDqZVCVUB6pkDKp2tZ1sgnezju6Kg48JvnS4a_LZyA@mail.gmail.com>
 (sfid-20150130_140608_974245_7EDC71FA)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, 2015-01-30 at 14:06 +0100, Michal Kazior wrote:

> I'm a bit reluctant to freely use mac80211 owned structures out of
> mac80211_ops callback context, i.e. from a tasklet fearing
> inconsistencies. Or am I worrying unnecessarily? If so I guess I'll
> redo this and use mac80211's structures directly :-)

Yeah that's a concern, we were just looking at something similar.
However, I think at least with channel contexts you should be fine since
mac80211 never really modifies them much, except for the width and # of
chains needed?

We've recently seen a similar issue with vif->bss_conf, and I'm
considering making that an RCU-protected pointer rather than the
embedded sub-struct, that way mac80211 can replace it atomically when
needed. I've yet to see if that's practical though.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
