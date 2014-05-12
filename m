Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x231.google.com ([2607:f8b0:400c:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjfzw-0000FY-OC
 for ath10k@lists.infradead.org; Mon, 12 May 2014 02:29:49 +0000
Received: by mail-ve0-f177.google.com with SMTP id db11so7885014veb.22
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 19:29:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw68eh=avxUFSuoBdds7TTsdQtoUdjGpH1753ooRuHXjUw@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <CAA93jw68eh=avxUFSuoBdds7TTsdQtoUdjGpH1753ooRuHXjUw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 11 May 2014 22:29:06 -0400
Message-ID: <CAHqTa-2o+KeseCG0_epLTTayn8_WAv3OP22WqB07MSikn+ADTA@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
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
To: Dave Taht <dave.taht@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Sun, May 11, 2014 at 10:07 PM, Dave Taht <dave.taht@gmail.com> wrote:
> I have been failing to find and fix a very similar problem on the
> ath9k for many months now. What I see happening there is that one or
> more of the
> hardware queues locks up, and stops transmitting traffic. So, for
> example I might get traffic destined for the BK (background queue,
> traffic marked CS1) hung,
> but BE remains fine. Most recently I was able to lock up the VO, VI
> AND BK queues by exercising it overnight with multiple copies of the
> rrul test.
>
> I don't know much about how the hardware queues are configured on
> ath10k, but you can land stuff in each queue by marking with CS0, CS1,
> CS5, and CS7 (BE,BK,VI,VO) on mac80211 based devices.

I think my problem may be something else.  In particular, it seems to
affect each station separately, and doesn't seem to happen if I
disable encryption.  (Does your ath9k problem trigger if encryption is
turned off?)  I also have an ath9k device in the same AP on 2.4 GHz,
and it doesn't trigger there either.  I haven't attempted to see if
your bug triggers on that one though :)

> I can make it happen more often, faster, if the associated station has
> considerable distance and less signal strength than nearby.

I just checked, and my bug seems to trigger more often when I'm at a
longer distance (my macbook says about -60 RSSI) and less often at a
closer distance (currently macbook reports RSSI of -41).  Not sure if
this is related to increased retransmits or decreased speed or
something else.

> Blow it up with netperf-wrappers -H someserver rrul...

That's not a bad idea... I really need to get netperf-wrappers going
for some stress testing :)

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
