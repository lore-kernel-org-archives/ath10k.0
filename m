Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WH1hB-0006pQ-Lb
 for ath10k@lists.infradead.org; Sat, 22 Feb 2014 01:48:02 +0000
Received: by mail-ve0-f180.google.com with SMTP id cz12so2672515veb.25
 for <ath10k@lists.infradead.org>; Fri, 21 Feb 2014 17:47:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5307F7D3.1030703@candelatech.com>
References: <5307F7D3.1030703@candelatech.com>
Date: Sat, 22 Feb 2014 09:47:40 +0800
Message-ID: <CAEFj984-_Des27n3-wvCScXMX1tntcZXNKZQ8FU_13nNOW2GqA@mail.gmail.com>
Subject: Re: Anyone have luck with WLE900VX?
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

WLE900VX is dual band card, right? 11ac should work on 5GHz. Is the FW
good enough to fall back to 11n when operating in 2.4GHz?

I still wait my card to come so haven't tested yet.

----
Chun-Yeow

On Sat, Feb 22, 2014 at 9:05 AM, Ben Greear <greearb@candelatech.com> wrote:
> I managed to get a few WLE900VX, and I've seen some funny things so far.
>
> First, with the official firmware 10.1.467.1-1 it immediately crashes on startup.
> I don't have that firmware source, so I don't know why it crashes.
> I wasn't even trying to create more than the default wlanX station.
>
> With my firmware (based on 10.1.389), it boots up OK and I can create
> and associate 32 station vifs.
>
> Both NICs that I have tried so far report the same mostly bogus
> MAC:  00:03:07:12:34:56
>
> The NIC's spec sheet claims it is 3x3, but 'iw phy phyX info' shows only
> 2 streams supported for both the 2.4Ghz n band and the 5Ghz /ac band.
>
> When stations associate (with ath9k AP in this case), throughput is
> very bad..tx rate-control rate is stuck at 6Mbps, and rx rate is normally around
> 300Mbps.  (Rates are as reported by OS/driver, I did not try sniffing
> the air..but total goodput throughput was in line with that bad tx rate.)
>
> RX signal is all over the place, even though AP and STA are close by.
>
> This is using over-the-air connection.
>
> If anyone else has any experience with these NICs I'm interested to
> hear about it...
>
> Thanks,
> Ben
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
