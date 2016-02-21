Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXZYZ-0003FD-Ib
 for ath10k@lists.infradead.org; Sun, 21 Feb 2016 19:20:36 +0000
Received: by mail-wm0-x236.google.com with SMTP id c200so142814744wme.0
 for <ath10k@lists.infradead.org>; Sun, 21 Feb 2016 11:20:14 -0800 (PST)
Date: Sun, 21 Feb 2016 20:20:14 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Re: ath10k and QCA3977 - random transfer rate losses
Message-ID: <20160221192014.GA23774@localhost.fritz.box>
References: <20160214154651.GA16161@localhost.fritz.box>
 <56C0C12F.5010900@gmail.com>
 <20160214214016.GA27902@localhost.fritz.box>
 <22d26207d398427b9ea847881e6a3a1f@NALASEXR01G.na.qualcomm.com>
 <20160219091602.GA7702@localhost.fritz.box>
 <CAJ-VmomFHCiiK+OQfafcSJFda7c=WU+bbgK7fpm7GT37LS1YKw@mail.gmail.com>
 <20160219172300.GA9252@localhost.fritz.box>
 <a65854576afe4e5c84ec772f7202f709@NALASEXR01G.na.qualcomm.com>
 <20160221144419.GA9138@localhost.fritz.box>
 <CAJ-VmokgsUui600Gbz_3JBDS2Ko3FReSNM8ehhfhfA7QtGqUbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ-VmokgsUui600Gbz_3JBDS2Ko3FReSNM8ehhfhfA7QtGqUbA@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: vagner_ <vagnerrener@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Hsu,
 Ryan" <ryanhsu@qca.qualcomm.com>

Yes. I confirm full functionality now. 

On Sun, Feb 21, 2016 at 10:33:26AM -0800, Adrian Chadd wrote:
> Right, so just to be clear - it's just the board file updates that
> make it all work fine?
> 
> 
> -a
> 
> 
> On 21 February 2016 at 06:44, Tobias Predel <tobias.predel@gmail.com> wrote:
> > Hello again,
> >
> > one last word about the the board files:
> >
> > I extracted the board files from an AsusTek Windows Driver installer
> > that included the Qualcomm driver files for diverse variants of QCA9377
> > built in Samsung, Asus (Askey), Acer, Lenovo notebooks.
> >
> > An archive with all these files can be found at the comment 10 of my bug report
> > <https://bugzilla.kernel.org/show_bug.cgi?id=112451#c10>
> > including board files (eeprom_*.bin) for NFA425, NFA435 (A), NFA455.
> >
> > If some people experience trouble, those might look at the netathr10x.inf
> > to find out which eeprom board file is needed or try out by installing
> > it to /lib/firmware/ath10k/QCA9377/hw1.0/board.bin.
> >
> > Those board files are using api 1 and must be named board.bin.
> > firmware-5.bin is still to be pulled from kvalo's github repo.
> >
> > Thank you to all for your support. I wish the best!
> >
> > Tobias
> >
> >
> > On Fri, Feb 19, 2016 at 05:55:26PM +0000, Hsu, Ryan wrote:
> >> Glad that help!
> >>
> >> I've cc that file to Kalle, hope we can see that get merged soon.
> >>
> >> Ryan
> >>
> >> > -----Original Message-----
> >> > From: Tobias Predel [mailto:tobias.predel@gmail.com]
> >> > Sent: Friday, February 19, 2016 09:23 AM
> >> > To: Adrian Chadd
> >> > Cc: Hsu, Ryan; ath10k@lists.infradead.org; vagner_
> >> > Subject: Re: ath10k and QCA3977 - random transfer rate losses
> >> >
> >> > On Fri, Feb 19, 2016 at 08:07:49AM -0800, Adrian Chadd wrote:
> >> > > Ok, so it's a board file problem? this can be solved by telling kvalo@
> >> > > about it, right?
> >> > >
> >> > >
> >> > > -a
> >> >
> >> > Yes, they differ and the board-2.bin file isn't included neither in linux-
> >> > firmware nor in kvalo's repository.
> >> >
> >> > MD5 checksums:
> >> > 73cca12b9398f0cecaa3cfa35c8961b7  board-2.bin
> >> > 44349f6ae93cf9ceffb164f58d4fb124  board.bin
> >> >
> >> > I'll try to contact him and send the board file.
> >> >
> >> > Tobias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
