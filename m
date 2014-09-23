Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-f174.google.com ([74.125.82.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWZyl-0000Zp-M4
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 23:58:44 +0000
Received: by mail-we0-f174.google.com with SMTP id w62so4891478wes.33
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 16:58:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54219982.8020204@candelatech.com>
References: <5420BCDA.5010701@candelatech.com>
 <CA+BoTQ=21YJ=WC+T51J_15m1qtDKhWSVP0cYw-P6R-tEmLoLNQ@mail.gmail.com>
 <54219982.8020204@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 23 Sep 2014 19:57:57 -0400
Message-ID: <CAHqTa-3L+6cK_mtub9hCZmAYyZsGTMTAd=d+EG5u5xqAQWiukg@mail.gmail.com>
Subject: Re: Rate ctrl problem with 2x2 station.
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
To: Ben Greear <greearb@candelatech.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Tue, Sep 23, 2014 at 12:02 PM, Ben Greear <greearb@candelatech.com> wrote:
> I have not tried 10.2, the latest snapshot I can get is from last
> December, so it does not appear anyone is actively working on it,
> and if it took 8 months to get into the ath10k driver, it must not be
> obviously better??

We tried the 10.2 firmware.  It definitely fixes some bugs that we've
run into (packet corruption), but it adds some even worse ones
(unexplained firmware crashes).

Certainly you could try the new firmware and see if your particular
bug is fixed.  But I also wouldn't say it's ready for prime time.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
