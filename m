Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b24pE-0002qa-1N
 for ath10k@lists.infradead.org; Sun, 15 May 2016 22:47:52 +0000
Received: by mail-oi0-x22f.google.com with SMTP id v145so244246782oie.0
 for <ath10k@lists.infradead.org>; Sun, 15 May 2016 15:47:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <572DBC21.10209@darbyshire-bryant.me.uk>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
 <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
 <1462464776.13075.18.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbJYrFRMJvSHM6tJYWR8vmgV3xxnSUQsb-h5WcnLW=KXoQ@mail.gmail.com>
 <1462476207.13075.20.camel@edumazet-glaptop3.roam.corp.google.com>
 <20160506114243.4eb4f95e@redhat.com>
 <572DBC21.10209@darbyshire-bryant.me.uk>
Date: Mon, 16 May 2016 01:47:30 +0300
Message-ID: <CACiydbLYFg7wgxdnzGGo1+_PSG=348x1c23nj96W8t6QhGKt_Q@mail.gmail.com>
Subject: Re: OpenWRT wrong adjustment of fq_codel defaults (Was: [Codel]
 fq_codel_drop vs a udp flood)
From: Roman Yeryomin <leroi.lists@gmail.com>
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
To: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Cc: Felix Fietkau <nbd@openwrt.org>, Eric Dumazet <eric.dumazet@gmail.com>, make-wifi-fast@lists.bufferbloat.net, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Jesper Dangaard Brouer <brouer@redhat.com>, Jonathan Morton <chromatix99@gmail.com>

On 7 May 2016 at 12:57, Kevin Darbyshire-Bryant
<kevin@darbyshire-bryant.me.uk> wrote:
>
>
> On 06/05/16 10:42, Jesper Dangaard Brouer wrote:
>> Hi Felix,
>>
>> This is an important fix for OpenWRT, please read!
>>
>> OpenWRT changed the default fq_codel sch->limit from 10240 to 1024,
>> without also adjusting q->flows_cnt.  Eric explains below that you must
>> also adjust the buckets (q->flows_cnt) for this not to break. (Just
>> adjust it to 128)
>>
>> Problematic OpenWRT commit in question:
>>  http://git.openwrt.org/?p=openwrt.git;a=patch;h=12cd6578084e
>>  12cd6578084e ("kernel: revert fq_codel quantum override to prevent it from causing too much cpu load with higher speed (#21326)")
> I 'pull requested' this to the lede-staging tree on github.
> https://github.com/lede-project/staging/pull/11
>
> One way or another Felix & co should see the change :-)

If you would follow the white rabbit, you would see that it doesn't help

>>
>>
>> I also highly recommend you cherry-pick this very recent commit:
>>  net-next: 9d18562a2278 ("fq_codel: add batch ability to fq_codel_drop()")
>>  https://git.kernel.org/davem/net-next/c/9d18562a227
>>
>> This should fix very high CPU usage in-case fq_codel goes into drop mode.
>> The problem is that drop mode was considered rare, and implementation
>> wise it was chosen to be more expensive (to save cycles on normal mode).
>> Unfortunately is it easy to trigger with an UDP flood. Drop mode is
>> especially expensive for smaller devices, as it scans a 4K big array,
>> thus 64 cache misses for small devices!
>>
>> The fix is to allow drop-mode to bulk-drop more packets when entering
>> drop-mode (default 64 bulk drop).  That way we don't suddenly
>> experience a significantly higher processing cost per packet, but
>> instead can amortize this.
> I haven't done the above cherry-pick patch & backport patch creation for
> 4.4/4.1/3.18 yet - maybe if $dayjob permits time and no one else beats
> me to it :-)
>
> Kevin
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
