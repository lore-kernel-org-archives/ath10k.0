Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk3WE-0006jy-7z
 for ath10k@lists.infradead.org; Tue, 13 May 2014 03:36:42 +0000
Message-ID: <53719332.9040700@candelatech.com>
Date: Mon, 12 May 2014 20:36:18 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : [PATCH v2 2/2] ath10k: support get/set antenna
 configurations.
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
In-Reply-To: <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 05/12/2014 05:49 PM, Avery Pennarun wrote:
> On Mon, May 12, 2014 at 12:17 PM, Ben Greear <greearb@candelatech.com> wrote:
>> My patch was against my own tree which is a mix of 3.14 and an older version of git://github.com/kvalo/ath.git
>>
>> I do not have time right now to re-do the patch, but next time I get some time I will
>> fix the patch to apply to ath.git.  If someone else wants to do it first, I will not
>> complain :)
>
> I've tested it and will upload a re-spun version against a more resent
> ath-next shortly.
>
> Using firmware 10.1.467.2-1, I tested it as follows:
> - disconnected the second antenna
> - iw phy phy1 set antenna {all, 1, 2, 4, 6, 3, 5, 7}
> - Measure iperf performance and RSSI from my (2x2) macbook.
>
> Expected:
> - lower RSSI when using fewer antennas
> - very poor signal when using only the disconnected antenna
> - slower speeds when using fewer antennas
>
> Actual:
> - my AP did not successfully send out any beacons with antenna modes 2, 4, or 6.
> - RSSI was roughly 6dB less with 1 than with 5 or 7
> - seemed to degrade to 1 spatial stream as expected in modes 1 and 3
> - 2 spatial streams and good RSSI as expected in modes 5 and 7
>
> So there seems to be a problem when the first antenna is not enabled.
> Firmware bug perhaps?

I seem to recall that you can only use 1, 3, or 7 in ath9k, probably ath10k
has same constraints.

Thanks,
Ben

>
> Thanks,
>
> Avery
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
