Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6j9U-0002gL-EX
 for ath10k@lists.infradead.org; Wed, 09 Dec 2015 18:07:46 +0000
Received: from smtp03.msg.oleane.net (smtp03.mail.priv [172.17.20.112]) 
 by smtp-out03.msg.oleane.net with ESMTP id tB9HkDlQ027401
 for <ath10k@lists.infradead.org>; Wed, 9 Dec 2015 18:46:13 +0100
From: "voncken" <cedric.voncken@acksys.fr>
References: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
 <566849DB.9040901@candelatech.com>
In-Reply-To: <566849DB.9040901@candelatech.com>
Subject: RE: ATH10K VLAN firmware issue
Date: Wed, 9 Dec 2015 18:24:43 +0100
Message-ID: <079401d132a6$7e7e2050$7b7a60f0$@acksys.fr>
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
To: 'Ben Greear' <greearb@candelatech.com>, ath10k@lists.infradead.org, 'linux-wireless' <linux-wireless@vger.kernel.org>



> -----Message d'origine-----
> De=A0: Ben Greear [mailto:greearb@candelatech.com]
> Envoy=E9=A0: mercredi 9 d=E9cembre 2015 16:34
> =C0=A0: Cedric VONCKEN; ath10k@lists.infradead.org; linux-wireless
> Objet=A0: Re: ATH10K VLAN firmware issue
> =

> This only happens when you use STA  + WDS, or is .1q broken for you in
> other cases as well?

No, this issue occurs in all modes (STA, STA + WDS, AP).

Thanks

Cedric.

> =

> Thanks,
> Ben
> =

> On 12/08/2015 06:29 AM, Cedric VONCKEN wrote:
> > 	I'm testing to transmit frame with 802.1q tag (VLAN).
> >
> > 	My client is set in STA + WDS and the netdev is bridged with eth0.
> > 	I have a computer with vlan configuration set connected to the STA
> > eth0.
> >
> > 	If I try to transmit frames with 802.1q tag, the frames are not
sent.
> > 	I checked with wireless sniffer, and I don't see the frame with VLAN
> > tag (the frames without VLAN tag are sent).
> >
> > 	I tested with firmware 10.2.4.70.14-2 from kale github,
> > 10.1.467-ct-com-full-015 from candelatech and 10.2.4.70-2 from
> > openwrt, and in all cases I have the same issue.
> >
> > 	Thanks for your help.
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-wireless" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> =

> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
