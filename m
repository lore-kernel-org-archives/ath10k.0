Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cLVAs-0002oM-MR
 for ath10k@lists.infradead.org; Mon, 26 Dec 2016 13:18:48 +0000
Received: from smtp29.msg.oleane.net ([172.17.20.151]) 
 by smtp-out06.msg.oleane.net with ESMTP id uBQBaSNZ025783
 for <ath10k@lists.infradead.org>; Mon, 26 Dec 2016 12:36:29 +0100
From: "Jean-Pierre Tosoni" <jp.tosoni@acksys.fr>
References: <004a01d24fe2$94da8dc0$be8fa940$@acksys.fr>
 <20161214195805.GA15022@w1.fi> <00f501d256e7$0f8d5380$2ea7fa80$@acksys.fr>
 <5852C5AC.6090408@candelatech.com>
 <00fd01d256fc$2f780db0$8e682910$@acksys.fr> <20161215225827.GB24883@w1.fi>
In-Reply-To: <20161215225827.GB24883@w1.fi>
Subject: RE: ath10k firmware sends probes on DFS channels without radar
 detection
Date: Mon, 26 Dec 2016 12:15:02 +0100
Message-ID: <012001d25f69$4df62ef0$e9e28cd0$@acksys.fr>
MIME-Version: 1.0
Content-Language: fr
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
To: 'Jouni Malinen' <j@w1.fi>
Cc: 'Ben Greear' <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

> -----Message d'origine-----
> De=A0: Jouni Malinen [mailto:j@w1.fi]
> Envoy=E9=A0: jeudi 15 d=E9cembre 2016 23:58
> =C0=A0: Jean-Pierre Tosoni
> Cc=A0: 'Ben Greear'; linux-wireless@vger.kernel.org;
> ath10k@lists.infradead.org
> Objet=A0: Re: ath10k firmware sends probes on DFS channels without radar
> detection
> =

> On Thu, Dec 15, 2016 at 06:53:47PM +0100, Jean-Pierre Tosoni wrote:
> > > > Thanks for the suggestion, I already tried something like this in
> > > > wmi.c, with the same result:
> > > >
> > > > - Before patching the firmware scans DFS channels actively (with
> > > probes).
> > > >
> > > > - After patching, the firmware scans DFS channels passively
> > > > *until* any beacon is received on the DFS channel. When *any*
> > > > beacon is seen, the firmware decides to scan actively on its own,
> > > > without any new IR/RADAR info from the driver.
> > > >
> > > > So, your patch is required but not sufficient.
> > > >
> > > > Somehow I was able to overcome this by reloading the regulation
> > > > domain in the radio card before each scan request:
> =

> Interesting.. I'm not completely sure what could have changed the behavior
> based on beacon hint. I thought it was cfg80211, but if the simple change
> for doing NO_IR | RADAR is not sufficient, it would seem to imply that
> something else can do this. Some more debugging to do, I guess.

After some debugging I think the card firmware does this, probably due to
the lack of precise definition of NO_IR, see below.

> =

> > The distinction between NO_IR and CHAN_RADAR is not very clear to me.
> > NO_IR appears only in the world regulatory domain so it's not relevant
> here.
> =

> NO_IR is a combination of not allowing AP, IBSS, or active scanning
> without having somehow been enabled by another device. RADAR has that same
> impact and in addition, requirement for doing radar detection and DFS by a
> master device.

Ah, thanks. But then, NO_IR does not define the way for the "other device"
to enable the local device? So, depending on the interpretation, it can
render the local device unusable. OTOH RADAR defines a way which depends on
the local regulations.

> =

> > I'd say
> >  "the CHAN_RADAR flag should always make the firmware never do IR when
> > probing"
> > ...maybe, except if the channel is the operating channel. (this should
> > exclude unassociated stations)
> =

> For most cases, I'd agree that active scanning should not be used on DFS
> channels. That said, unicast Probe Request frame to the current AP while
> associated could be a reasonable exception. In addition, WPS with PBC
> depends on Probe Request frames to allow PBC session overlap detection, so
> there might be sufficient justification to allow Probe Request frame to be
> sent out for a very short duration (couple of seconds) after seeing a
> Beacon frame on the channel for such special cases.

I agree that unicast probes to the current AP should go through. It goes
with my condition "operating channel".

For WPS, I do not know it well, but I guess probes are acceptable if
1) they are not sent repeatedly over a long period of time during
unassociated state,
2) the AP uses CAC.
And here, both seem to be true.

> =

> --
> Jouni Malinen                                            PGP id EFC895FA

Regards, Jean-Pierre


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
