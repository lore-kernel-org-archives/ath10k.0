Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.w1.fi ([2a01:7e00::f03c:91ff:fedb:30e2]
 helo=li674-96.members.linode.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avLax-00082m-CJ
 for ath10k@lists.infradead.org; Wed, 27 Apr 2016 09:17:20 +0000
Date: Wed, 27 Apr 2016 12:16:53 +0300
From: Jouni Malinen <j@w1.fi>
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
Message-ID: <20160427091653.GB4345@w1.fi>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com>
 <1461654272.16188.4.camel@sipsolutions.net>
 <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
 <CABPxzYL=sQg=HczxM3gdERHRD-3-KaOG455wsqjpZ6YZDkybmw@mail.gmail.com>
 <571FCB22.5000305@candelatech.com>
 <CABPxzY+UuCABUcFbV0EpdoRaSzpgGvMani_j7xvg2a=xh-Bw0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABPxzY+UuCABUcFbV0EpdoRaSzpgGvMani_j7xvg2a=xh-Bw0g@mail.gmail.com>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Apr 27, 2016 at 12:13:46PM +0530, Krishna Chaitanya wrote:
> On Wed, Apr 27, 2016 at 1:40 AM, Ben Greear <greearb@candelatech.com> wrote:
> > On 04/26/2016 01:07 PM, Krishna Chaitanya wrote:
> >> Are these Broadcom IEs documented somewhere? If yes,
> >> then its a matter of parsing them and adding support to
> >> minstrel_ht, isn't it? major work would be in minstrel.

> > The end result, as far as I can tell,
> > is you would just have to tell mac80211 to allow
> > VHT on 2.4Ghz, and revert this patch that Kalle is proposing.
> 
> Ideally as this is vendor specific it makes sense to implement this
> at Driver/FW level rather than implementing it at a common stack
> like mac80211.
> 
> > Maybe someone that actually knows about these IEs can explain why
> > they are worth using?
> 
> These IE's can be parsed in the driver without any mac80211 involvement.

Sure, these are vendor specific elements, but they are simply
encapsulating the standard VHT elements that we already handle within
mac80211 for STA functionality and hostapd for AP functionality. I don't
see why we would make this any more complex for 2.4 GHz 256-QAM support
than extending the existing locations that support the VHT elements.

The main reason for me in using these particular vendor specific
elements is in them being already supported by number of deployed
devices. There is also support for these in hostapd (vendor_vht=1 in
hostapd.conf) and as far as I know, this used to work with ath10k for AP
mode (and this patch we discuss here may break that). The main missing
functionality is for the matching STA side support with mac80211 and
that's where the changes, IMHO, would fit in nicely in mac80211 next to
the places where we handle the matching standard VHT elements in the 5
GHz band.
 
-- 
Jouni Malinen                                            PGP id EFC895FA

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
