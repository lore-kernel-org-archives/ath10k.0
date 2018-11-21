Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp127.iad3a.emailsrvr.com ([173.203.187.127])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPUDG-0003pj-H0
 for ath10k@lists.infradead.org; Wed, 21 Nov 2018 15:14:49 +0000
Date: Wed, 21 Nov 2018 10:14:30 -0500 (EST)
Subject: RE: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add
 airtimeaccounting and scheduling to TXQs
From: "David P. Reed" <dpreed@deepplum.com>
MIME-Version: 1.0
Message-ID: <1542813270.991216057@apps.rackspace.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, Simon Barber <simon@superduper.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

This requires a license to operate. The license comes from your Cellular Pr=
ovider, only.

It is a gap filler for the Small Cell business concept of 5G, a repeater. =


LTE requires repeaters, too. The MIT Media Lab put in repeaters for each Ce=
llar provider because the Architect specified a shading system for the wind=
ows that acts likea Faraday Cage(!). Not the glass, but a fine lattice of h=
orizontal metal bars a few inches from the windows designed to reflect sunl=
ight, but allow view downward - Venetian blinds on the outside.

Not discovered as a problem until occupied! =


But here's the business issue. The Cellcos have to grant spectrum licenses =
to the Media Lab, it's their "property" even inside buildings! Okay, but wh=
at you don't know is that each provider charges a significant fee per month=
 to use "its spectrum" via a repeater. As well as its authorization of the =
equipment used.

This extends to Small Cells! Just like you can buy a phone, but don't own t=
he right to transmit with it, these repeaters can be bought, but will get t=
heir license from a provider (via an eSIMcard, like the new Google Pixel 3 =
does). Same for these repeaters. =


This is the opposite of what I fought for, along with others, in the Open S=
pectrum movement I helped start 18 years ago. And what Apple fought for, st=
arting in 1990 in the Part 15 license-by-rule and equipment certification r=
egime.

But I am now retired, from public pro Bono service. We lost. Totally. Both =
Democrats and Republicans joined to strengthen the Monopoly property rights=
 regime. So did the major parties in the UK and Europe. =


So this equipment will be out of your reach. It's patents extend the Monopo=
ly - they will sue you if you violate the patents, and their cellco custome=
rs will demand that these devices be sold only to them, not you, or at leas=
t not in a form you can legally operate.

You won't be able to sell any software modifiable repeater in any band. Gov=
t certification of software radios is limited to licensed exclusive bands.

For example, the FCC just ordered a whole range of handheld terminals (walk=
ie talkies) that were intended for Amateur Radio use be pulled from the mar=
ket because one could transmit outside the Amateur bands. Not that hams wou=
ld choose to, but because they might! Hams are licensed to design and build=
 any kind of transmitter, self-certifying their own designs, and operating =
them any way they want, inside the Ham bands. By law they are seriously lia=
ble, with fines of 10,000+ dollars for any operation outside those bands. =

But the FCC prevents *sales* of devices to Hams that can transmit outside t=
hose bands.

So software radios are illegal, the



-----Original Message-----
From: "Dave Taht" <dave.taht@gmail.com>
Sent: Mon, Nov 19, 2018 at 8:04 pm
To: "Simon Barber" <simon@superduper.net>
Cc: "Simon Barber" <simon@superduper.net>, "Rajkumar Manoharan" <rmanohar@c=
odeaurora.org>, "Make-Wifi-fast" <make-wifi-fast@lists.bufferbloat.net>, "l=
inux-wireless" <linux-wireless@vger.kernel.org>, "ath10k" <ath10k@lists.inf=
radead.org>, "Ben Greear" <greearb@candelatech.com>, "Felix Fietkau" <nbd@n=
bd.name>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtimeaccountin=
g and scheduling to TXQs

On Mon, Nov 19, 2018 at 4:52 PM Simon Barber  wrote:
>
> Low-e glass, it=E2=80=99s a thin metallic film used to reflect infra-red =
to keep heat in or out. Totally blocks/reflects RF.

Very cool. I imagine it's hell on cell too?

I can see this stuff becoming very popular in places where keeping the
good wifi in is important. Could cover floors and ceilings with it to.
Cars could be tempest rated...

/me goes looking for stock to buy

> Simon
>
> On Nov 19, 2018, at 4:20 PM, Ben Greear  wrote:
>
> On 11/19/2018 04:13 PM, Dave Taht wrote:
>
> On Mon, Nov 19, 2018 at 3:56 PM Ben Greear  wrote:
>
>
> On 11/19/2018 03:47 PM, Dave Taht wrote:
>
> On Mon, Nov 19, 2018 at 3:30 PM Simon Barber  wrote:
>
>
>
>
> On Nov 19, 2018, at 2:44 PM, Toke H=C3=B8iland-J=C3=B8rgensen  wrote:
>
> Dave Taht  writes:
>
> Toke H=C3=B8iland-J=C3=B8rgensen  writes:
>
> Felix Fietkau  writes:
>
> On 2018-11-14 18:40, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>
> This part doesn't really make much sense to me, but maybe I'm
> misunderstanding how the code works.
> Let's assume we have a driver like ath9k or mt76, which tries to keep a
>
> =E2=80=A6.
>
>
> Well, there's going to be a BQL-like queue limit (but for airtime) on
> top, which drivers can opt-in to if the hardware has too much queueing.
>
>
> Very happy to read this - I first talked to Dave Taht about the need for =
Time Queue Limits more than 5 years ago!
>
>
> Michal faked up a dql estimator 3 (?) years ago. it worked.
>
> http://blog.cerowrt.org/post/dql_on_wifi_2/
>
> As a side note, in *any* real world working mu-mimo situation at any
> scale, on any equipment, does anyone have any stats on how often the
> feature is actually used and useful?
>
> My personal guess, from looking at the standard, was in home
> scenarios, usage would be about... 0, and in a controlled environment
> in a football stadium, quite a lot.
>
> In a office or apartment complex, I figured interference and so forth
> would make it a negative benefit due to retransmits.
>
> I felt when that part of the standard rolled around... that mu-mimo
> was an idea that should never have escaped the lab. I can be convinced
> by data, that we can aim for a higher goal here. But it would be
> comforting to have a measured non-lab, real-world, at real world
> rates, result for it, on some platform, of it actually being useful.
>
>
> We're working on building a lab with 20 or 30 mixed 'real' devices
> using various different /AC NICs (QCA wave2 on OpenWRT, Fedora, realtek U=
SB 8812au on OpenWRT, Fedora,
> and some Intel NICs in NUCs on Windows, and maybe more).  I'm not actuall=
y sure if that realtek
>  or the NUCs can do MU-MIMO or not, but the QCA NICs will be able to.  It=
 should be at least somewhat similar
> to a classroom environment or coffee shop.
>
>
> In the last 3 coffee shops I went to, I could hear over 30 APs on
> competing SSIDs, running G, N, and AC,
> occupying every available channel.
>
>
> I especially like when someone uses channel 3 because, I guess, they
> think it is un-used :)
>
> I'm not sure if this was a fluke or not, but at Starbucks recently I sat =
outside,
> right next to their window, and could not scan their AP at all.  Previous=
ly, I sat
> inside, 3 feet away through the glass, and got great signal.  I wonder wh=
at that was
> all about!  Maybe special tinting that blocks RF?  Or just dumb luck of s=
ome sort.
>
> Thanks,
> Ben
>
>
> --
> Ben Greear =

> Candela Technologies Inc  http://www.candelatech.com
>
>


-- =


Dave T=C3=A4ht
CTO, TekLibre, LLC
http://www.teklibre.com
Tel: 1-831-205-9740
_______________________________________________
Make-wifi-fast mailing list
Make-wifi-fast@lists.bufferbloat.net
https://lists.bufferbloat.net/listinfo/make-wifi-fast


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
