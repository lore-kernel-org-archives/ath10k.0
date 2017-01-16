Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cT4r8-0000iv-NB
 for ath10k@lists.infradead.org; Mon, 16 Jan 2017 10:49:45 +0000
From: "Jean-Pierre Tosoni" <jp.tosoni@acksys.fr>
References: <CAJ-Vmo=_apPFE1LQmXj6pn9g1c0bvzAS-gk86Hi7-CX+KuZtrw@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=_apPFE1LQmXj6pn9g1c0bvzAS-gk86Hi7-CX+KuZtrw@mail.gmail.com>
Subject: RE: ath9k/ath10k DFS testing / certification
Date: Mon, 16 Jan 2017 11:06:11 +0100
Message-ID: <002c01d26fe0$2a664ab0$7f32e010$@acksys.fr>
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
To: 'Adrian Chadd' <adrian@freebsd.org>, ath10k@lists.infradead.org
Cc: Cedric VONCKEN <cedric.voncken@acksys.fr>

Hi Adrian,

> -----Message d'origine-----
> De : ath10k [mailto:ath10k-bounces@lists.infradead.org] De la part de
> Adrian Chadd
> Envoy=E9 : dimanche 15 janvier 2017 22:17
> =C0 : ath9k-devel; ath10k@lists.infradead.org
> Objet : ath9k/ath10k DFS testing / certification
> =

> hiya,
> =

> I'm working on a set of things that will involve DFS certification for
> ath9k/ath10k. Initially it'll be for FCC but I'll branch out to the other
> regions shortly afterwards.
> =

> I'd love to hear from anyone else who has done this and what their
> challenges were, including whether they have any local patches / tools
> that haven't yet been upstreamed.
> =

> Thanks!
> =

> =

> -adrian

For the record, a summary of our discussion last month.

We went to an independent lab with wpa_supplicant+ath10k+Compex WLE900VX
(QCA988x) for ETSI certification.
We passed for the most part, but we were rejected because the supplicant
sends probes on DFS channels.
We applied the following patch that did solve the issue at hand, but made
another issue appear:
=3D> the QCA firmware believes any rogue system that sends out beacons on a
DFS channel, so that
the firmware active-scans that channel, without checking for radar
signatures on its own.

So the patch solves only part of the issue.

Patch:

Process NO_IR and RADAR flags in the same manner. Do this only when channels
are prepared for a scan, in order to avoid side effects.
---
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5679,6 +5679,9 @@ ath10k_wmi_op_gen_scan_chan_list(struct
 		ci =3D &cmd->chan_info[i];
 =

 		ath10k_wmi_put_wmi_channel(ci, ch);
+
+		if (ch->chan_radar)
+			ci->flags |=3D __cpu_to_le32(WMI_CHAN_FLAG_PASSIVE);
 	}
 =

 	return skb;
-- =

1.7.2.5

Jouni Malinen suggested an equivalent, more general, form of the above,
which seems to work as well:

diff --git a/drivers/net/wireless/ath/ath10k/mac.c
b/drivers/net/wireless/ath/ath10k/mac.c
index aa545a1..758dbbd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2973,7 +2973,8 @@ static int ath10k_update_channel_list(struct ath10k
*ar)
 			ch->chan_radar =3D
 				!!(channel->flags & IEEE80211_CHAN_RADAR);
 =

-			passive =3D channel->flags & IEEE80211_CHAN_NO_IR;
+			passive =3D channel->flags & (IEEE80211_CHAN_NO_IR |
+						    IEEE80211_CHAN_RADAR);
 			ch->passive =3D passive;
 =

 			ch->freq =3D channel->center_freq;

-- =

(by Jouni Malinen)

> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
