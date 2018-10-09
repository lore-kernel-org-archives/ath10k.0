Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9vq5-0000DJ-82
 for ath10k@lists.infradead.org; Tue, 09 Oct 2018 17:30:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 206-v6so2701701wmb.5
 for <ath10k@lists.infradead.org>; Tue, 09 Oct 2018 10:30:22 -0700 (PDT)
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: Update board-2.bin files in linux-firmware
Date: Tue, 09 Oct 2018 19:30:18 +0200
Message-ID: <2515195.qVqrclqyAa@debian64>
In-Reply-To: <87sh1gd1xj.fsf@kamboji.qca.qualcomm.com>
References: <9f53fa8a-89cf-2736-7832-5e4707e25c75@hauke-m.de>
 <2297652.AArlnWO5DQ@debian64> <87sh1gd1xj.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Robert Marko <robimarko@gmail.com>, ath10k@lists.infradead.org, Skorpy <skorpy@darmstadt.ccc.de>

On Monday, October 8, 2018 3:04:56 PM CEST Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> =

> > Hello,
> >
> > On Friday, September 28, 2018 9:28:44 PM CEST Hauke Mehrtens wrote:
> >> the ath10k-firmware repository already contains updated board-2.bin
> >> files with support for more devices. Please also update the board-2.bin
> >> files shipped in the linux-firmware repository as they are normally
> >> taken by distributions.
> >
> > At this opportunity, I would kindly like to remind the maintainer that =
there
> > are currently more pending boardfiles. It would be great if they all co=
uld be
> > included in the next update as well:
> >
> > pending
> > =3D=3D=3D=3D=3D=3D=3D
> >
> >  * Netgear WAC510
> >  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09186.htm=
l (IPQ4019)
> >
> >  * Netgear Orbi PRO SRK60
> >  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09078.htm=
l (IPQ4019) =

> >  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09079.htm=
l (QCA9984)
> >
> >  * ZyXEL WRE6606:
> >  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg08776.htm=
l (IPQ4019)
> >
> >  * ZyXEL NBG6617:
> >  - http://lists.infradead.org/pipermail/ath10k/2018-May/011377.html (IP=
Q4019)
> >
> > And there is an update for the ASUS' RT-AC58U
> >  - http://lists.infradead.org/pipermail/ath10k/2018-January/010770.html=
 (IPQ4019)
> =

> Thanks for the list, this was helpful. I should have now added all of
> these, but the exception ZyXEL WRE6606 for which I couldn't find the
> actual board files.
You are right. The two ZyXEL WRE6606 board.bin files were attached to
first post in the "Add ZyXEL WRE6606 specific BDFs" thread:
<https://www.mail-archive.com/ath10k@lists.infradead.org/msg08741.html>

But sadly not to the response by Magnus Fr=FChling that I linked to.
How do you want to handle this? Can you take the board bins from:
<https://www.mail-archive.com/ath10k@lists.infradead.org/msg08741.html>
Or do you prefere a new mail in this case, since the boardfile =

guidelines has changed?

Kind Regards,
Christian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
