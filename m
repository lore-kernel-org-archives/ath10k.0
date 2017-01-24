Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW2gs-0000HA-3c
 for ath10k@lists.infradead.org; Tue, 24 Jan 2017 15:07:24 +0000
Received: by mail-wm0-f48.google.com with SMTP id c85so186088667wmi.1
 for <ath10k@lists.infradead.org>; Tue, 24 Jan 2017 07:07:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <11515104.ikeaahra59@prime>
References: <CAJ-Vmo=_apPFE1LQmXj6pn9g1c0bvzAS-gk86Hi7-CX+KuZtrw@mail.gmail.com>
 <002c01d26fe0$2a664ab0$7f32e010$@acksys.fr>
 <CAJ-VmokegH87gnsJ8Rp57OPnNUo_C=_7V0b9AD4-NcaYtLxJHw@mail.gmail.com>
 <11515104.ikeaahra59@prime>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 24 Jan 2017 07:05:58 -0800
Message-ID: <CAJ-Vmo=WYvi5ZL_VDr623cFkp0oocDYkui346_mtb91cthsXMA@mail.gmail.com>
Subject: Re: ath9k/ath10k DFS testing / certification
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Jean-Pierre Tosoni <jp.tosoni@acksys.fr>, Cedric VONCKEN <cedric.voncken@acksys.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hi!


On 24 January 2017 at 03:16, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> Hi Adrian,
>
> I've been doing DFS pre-tests back in December 2016. We did AP tests for a
> 9880 based AP for ETSI and FCC region. We had two small patches for making the
> tests less painful (in hostapd and mac80211):
>
>  * disable CSA on incoming radar, that is keep on staying on the operating
> channels. That makes continouos testing of radar signals much easier (usually
> you test like 10 radars in a row), since we don't had to reboot the device all
> the time.
>  * shorten CAC to 3 seconds, because waiting 60 seconds is also taking some
> time

Do you have those patches available somewhere?

>
> All FCC tests pass, at least from the radar detection point. ETSI had a
> problem with one of the patterns. We used iperf UDP tests to generate load,
> but will probably switch to another tool in the next round (or tune it), since
> it seems to send packets too bursty, which could be the cause for the failed
> ETSI test.

Ok. What are you using to generate radar patterns for testing?

> Thanks for the info on the scan bug, we discovered that too, but thought we
> could fix it in mac80211 (but never really followed up). Please keep me in the
> loop when this is fixed. :)

:) I'll punt this to QCA if/when the right time arises and see if
they'll fix ath10k firmware.

Thanks!



-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
