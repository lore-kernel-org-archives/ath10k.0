Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVzEe-0002nG-Fl
 for ath10k@lists.infradead.org; Tue, 24 Jan 2017 11:26:03 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: ath9k/ath10k DFS testing / certification
Date: Tue, 24 Jan 2017 12:16:46 +0100
Message-ID: <11515104.ikeaahra59@prime>
In-Reply-To: <CAJ-VmokegH87gnsJ8Rp57OPnNUo_C=_7V0b9AD4-NcaYtLxJHw@mail.gmail.com>
References: <CAJ-Vmo=_apPFE1LQmXj6pn9g1c0bvzAS-gk86Hi7-CX+KuZtrw@mail.gmail.com>
 <002c01d26fe0$2a664ab0$7f32e010$@acksys.fr>
 <CAJ-VmokegH87gnsJ8Rp57OPnNUo_C=_7V0b9AD4-NcaYtLxJHw@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4350179981073348199=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Jean-Pierre Tosoni <jp.tosoni@acksys.fr>, Adrian Chadd <adrian@freebsd.org>, Cedric VONCKEN <cedric.voncken@acksys.fr>

--===============4350179981073348199==
Content-Type: multipart/signed; boundary="nextPart4395737.YiaLQILjyl"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4395737.YiaLQILjyl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Adrian,

I've been doing DFS pre-tests back in December 2016. We did AP tests for a=
=20
9880 based AP for ETSI and FCC region. We had two small patches for making =
the=20
tests less painful (in hostapd and mac80211):=20

 * disable CSA on incoming radar, that is keep on staying on the operating=
=20
channels. That makes continouos testing of radar signals much easier (usual=
ly=20
you test like 10 radars in a row), since we don't had to reboot the device =
all=20
the time.
 * shorten CAC to 3 seconds, because waiting 60 seconds is also taking some=
=20
time

All FCC tests pass, at least from the radar detection point. ETSI had a=20
problem with one of the patterns. We used iperf UDP tests to generate load,=
=20
but will probably switch to another tool in the next round (or tune it), si=
nce=20
it seems to send packets too bursty, which could be the cause for the faile=
d=20
ETSI test.

Thanks for the info on the scan bug, we discovered that too, but thought we=
=20
could fix it in mac80211 (but never really followed up). Please keep me in =
the=20
loop when this is fixed. :)

Cheers,
     Simon

On Monday, January 16, 2017 9:42:33 AM CET Adrian Chadd wrote:
> hiya,
>=20
> Yeah - i was a part of that discussion. :) That's why I was pointing
> out that likely I'm going to bug QCA to get this fixed when the time
> is right.
>=20
> So, time is right :)
>=20
> Did you do DFS certification for AP/master devices, or just client?
>=20
>=20
>=20
> -adrian
>=20
> On 16 January 2017 at 02:06, Jean-Pierre Tosoni <jp.tosoni@acksys.fr> wro=
te:
> > Hi Adrian,
> >=20
> >> -----Message d'origine-----
> >> De : ath10k [mailto:ath10k-bounces@lists.infradead.org] De la part de
> >> Adrian Chadd
> >> Envoy=E9 : dimanche 15 janvier 2017 22:17
> >> =C0 : ath9k-devel; ath10k@lists.infradead.org
> >> Objet : ath9k/ath10k DFS testing / certification
> >>=20
> >> hiya,
> >>=20
> >> I'm working on a set of things that will involve DFS certification for
> >> ath9k/ath10k. Initially it'll be for FCC but I'll branch out to the ot=
her
> >> regions shortly afterwards.
> >>=20
> >> I'd love to hear from anyone else who has done this and what their
> >> challenges were, including whether they have any local patches / tools
> >> that haven't yet been upstreamed.
> >>=20
> >> Thanks!
> >>=20
> >>=20
> >> -adrian
> >=20
> > For the record, a summary of our discussion last month.
> >=20
> > We went to an independent lab with wpa_supplicant+ath10k+Compex WLE900VX
> > (QCA988x) for ETSI certification.
> > We passed for the most part, but we were rejected because the supplicant
> > sends probes on DFS channels.
> > We applied the following patch that did solve the issue at hand, but ma=
de
> > another issue appear:
> > =3D> the QCA firmware believes any rogue system that sends out beacons =
on a
> > DFS channel, so that
> > the firmware active-scans that channel, without checking for radar
> > signatures on its own.
> >=20
> > So the patch solves only part of the issue.
> >=20
> > Patch:
> >=20
> > Process NO_IR and RADAR flags in the same manner. Do this only when
> > channels are prepared for a scan, in order to avoid side effects.
> > ---
> > --- a/drivers/net/wireless/ath/ath10k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> > @@ -5679,6 +5679,9 @@ ath10k_wmi_op_gen_scan_chan_list(struct
> >=20
> >                 ci =3D &cmd->chan_info[i];
> >                =20
> >                 ath10k_wmi_put_wmi_channel(ci, ch);
> >=20
> > +
> > +               if (ch->chan_radar)
> > +                       ci->flags |=3D __cpu_to_le32(WMI_CHAN_FLAG_PASS=
IVE);
> >=20
> >         }
> >        =20
> >         return skb;
> >=20
> > --
> > 1.7.2.5
> >=20
> > Jouni Malinen suggested an equivalent, more general, form of the above,
> > which seems to work as well:
> >=20
> > diff --git a/drivers/net/wireless/ath/ath10k/mac.c
> > b/drivers/net/wireless/ath/ath10k/mac.c
> > index aa545a1..758dbbd 100644
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -2973,7 +2973,8 @@ static int ath10k_update_channel_list(struct ath1=
0k
> > *ar)
> >=20
> >                         ch->chan_radar =3D
> >                        =20
> >                                 !!(channel->flags & IEEE80211_CHAN_RADA=
R);
> >=20
> > -                       passive =3D channel->flags & IEEE80211_CHAN_NO_=
IR;
> > +                       passive =3D channel->flags & (IEEE80211_CHAN_NO=
_IR |
> > +                                                   IEEE80211_CHAN_RADA=
R);
> >=20
> >                         ch->passive =3D passive;
> >                        =20
> >                         ch->freq =3D channel->center_freq;
> >=20
> > --
> > (by Jouni Malinen)
> >=20
> >> _______________________________________________
> >> ath10k mailing list
> >> ath10k@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/ath10k
>=20
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


--nextPart4395737.YiaLQILjyl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE1ilQI7G+y+fdhnrfoSvjmEKSnqEFAliHN58ACgkQoSvjmEKS
nqGE/g//dXhlG5l5jCutuKD2BkI8VI4VSRiRar2ELYDK6/JtHAaIDayOhYHyShvt
rZ4W54/2aTwqmAfu1fM23V4ZRyz/sD+fa714+MuvJ2aw12LEd2vTlHCNMAodEerK
46rfxouKrbpbsUftJlDH8N/jBznkGZxdHkffzgNN6GHBoq2FODTQAkdBcAmcJz0S
/4IXXuJ3irWcpqP0PzZRh17nUMgQ1L2TF24bRgUYSGNI/E6q3M/GmST6YGTTtEw8
Rslb92AHmmaAwHRHMsQkr3OD/5ZvDGQkd2g431114aesPoPAgbtjwwso7LoxyoDE
6ZDvYD9uDx+jxiuBIQFpwMQh/jXpYLCdkME1CapK0tsakKSU2rhIE57u37KCEhNa
6ODIbcROhqp+N5SNKHDGoicgSyXGWECwgkjhxIk0tyDUAX10LGqQ6p2czOQMK/W9
7EumZ/xNLWBVZFLrlN/cY7wZxTLCh3YkTdgrEVyXXAKd8rgAMuRZ2CIcFMBonjfh
XTuQcAKM72Icd0V2XXhYBAgnKqigh8AEsNs7ze3GQ/XyCi731UvEACxnrsngEkNt
JhdSt2Qa/p2IU9++7gFao0xMhkE1uDDAXJjRvvp+pmZtjnUEDknOcOOKy3+JuAZK
ctxCiEF1rqBDv4oSG4JC2bGRLXulOVmV+XIZ0AXhf4XM8FQJjBY=
=fzD2
-----END PGP SIGNATURE-----

--nextPart4395737.YiaLQILjyl--



--===============4350179981073348199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4350179981073348199==--
