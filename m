Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHbM-00032v-F6
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 07:59:52 +0000
Received: by mail-vc0-f171.google.com with SMTP id lg15so1772838vcb.2
 for <ath10k@lists.infradead.org>; Tue, 11 Mar 2014 00:59:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=AX9MzrCuwv_LMBkD6mT97S+c1K1cbLiJLKWx=2im5=A@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
 <CAJ-Vmo=AX9MzrCuwv_LMBkD6mT97S+c1K1cbLiJLKWx=2im5=A@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 11 Mar 2014 02:59:10 -0500
Message-ID: <CAHqTa-1q+z-Xp3nYPBaCd-03PZDkjSbFRwcJu7y58=i70_yk-Q@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Mar 11, 2014 at 2:52 AM, Adrian Chadd <adrian@freebsd.org> wrote:
> ... it's not a complete loss!
>
> This to me says "we need a hook from the driver to call the host
> "reset the bus" thing".
>
> We also kinda need it for ath9k/ath5k (if it's not there) so AHB
> attached things can be reset by actually poking an SoC reset register.

That would be awesome.  It would make my hack feel much less hacky :)

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
