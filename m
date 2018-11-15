Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN67y-00025y-BY
 for ath10k@lists.infradead.org; Thu, 15 Nov 2018 01:07:27 +0000
Received: by mail-lj1-x241.google.com with SMTP id x85-v6so15842043ljb.2
 for <ath10k@lists.infradead.org>; Wed, 14 Nov 2018 17:07:15 -0800 (PST)
MIME-Version: 1.0
References: <CAEJqkgiKzYTZQTGWNAPTeOPFWz658FWqDsAhyoxVDP1VKWSukg@mail.gmail.com>
 <CAEJqkgh7xksO7tmPHGkOXvWftc2AcCgi4j3S3C88CorV53+Hgw@mail.gmail.com>
 <CAEJqkghgyYMxRc8-wnF-J1CGhuYD2vfVDSiLU1A0fwpXKN7Huw@mail.gmail.com>
In-Reply-To: <CAEJqkghgyYMxRc8-wnF-J1CGhuYD2vfVDSiLU1A0fwpXKN7Huw@mail.gmail.com>
From: Gabriel C <nix.or.die@gmail.com>
Date: Thu, 15 Nov 2018 02:06:47 +0100
Message-ID: <CAEJqkgiz0-5m5uDUW2vzCatxHPX2Gi6oPQwR_J5Y4fV8iuiguw@mail.gmail.com>
Subject: Re: atk10k Unknown eventid and WARN() on resume with kernel 4.19
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
To: Kalle Valo <kvalo@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-pm@vger.kernel.org, linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, dex77@frugalware.org

Am Mi., 14. Nov. 2018 um 23:16 Uhr schrieb Gabriel C <nix.or.die@gmail.com>:
> > > Hello,
> > >
> > > starting with kernel 4.19 we noticed  'Unknown eventid: xxxx' warnings
> > > on our Laptops.
> > >
> > > ...
> > >
> > > crazy@devnull:~$ dmesg | grep Unknow
> > > [    7.144998] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [    7.147758] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > > [    9.441654] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [    9.444446] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > > [   11.770997] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [   11.773787] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > > [320339.374108] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [320339.377020] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > > [320342.128664] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [320342.131447] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > > [320344.452864] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> > > [320344.455696] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> > >
> > > ....
> > >
> > > Both boxes also hits the following WARN*() on resume from S3:
> > >
> >  Uh sorry .. Gmail doesn't like long lines it seems.
> > There the WARN() message:
> >
> > http://ftp.frugalware.org/pub/other/people/crazy/warn.txt
> >
> > >
> > > Please let me know if you need an dmesg or any other informations.
>
>
> Added pm list maybe someone there got some idea ?
>
> Also same issue reported there :
> https://bugzilla.kernel.org/show_bug.cgi?id=201499
>

The WARN_ON() on resume seems to be triggered  after commit cd93b83ad927b.

BR,

Gabriel C

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
