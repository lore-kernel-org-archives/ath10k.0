Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x22a.google.com ([2607:f8b0:400d:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X04Lg-00020t-Sg
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 07:44:03 +0000
Received: by mail-qc0-f170.google.com with SMTP id l6so2814698qcy.15
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 00:43:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj9861McWmx4s81Y6bDirJX4s99_WG4W6Voi2fZRreoeB=4w@mail.gmail.com>
References: <CAEFj987hAnJV_0KOk4qfk3YbzPZNWqVY1Uq2sDe-+F0bw3hgbA@mail.gmail.com>
 <CA+BoTQnnrjhUK_ZPwpG-L+wQ=suisNrkb1Tdhdww4ueMpAvDwQ@mail.gmail.com>
 <53AAC317.4050403@candelatech.com>
 <CAEFj9861McWmx4s81Y6bDirJX4s99_WG4W6Voi2fZRreoeB=4w@mail.gmail.com>
Date: Thu, 26 Jun 2014 00:43:39 -0700
Message-ID: <CAJ-VmonZUQzSLqGT=sU5OAxprYfv_cucho2rFMyP3gLap5--tg@mail.gmail.com>
Subject: Re: CT and AP firmware not allowed beaconing in adhoc mode
From: Adrian Chadd <adrian@freebsd.org>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 26 June 2014 00:40, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Not possible for all the modes to be supported in one single firmware?

It (mostly) is; it's a question of time, effort and resources.

There's a size limitation to how much code and data you can squeeze
into the firmware. Is it possible to structure the firmware in a way
that gives you one source tree for multiple firmware builds, with
different features on and off? Quite so.

That's just not how it happened inside of QCA. When I was working
there on the ath10k chip bringup, there indeed was one branch to do
station, adhoc and AP mode. That changed shortly after I left for
reasons I don't quite know. I'm still trying to .. well, figure out
how to try and repair that damage.



-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
