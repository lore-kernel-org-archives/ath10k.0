Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from lang.hm ([66.167.227.134] helo=bifrost.lang.hm)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2DeY-0002Gh-9v
 for ath10k@lists.infradead.org; Mon, 16 May 2016 08:13:27 +0000
Date: Mon, 16 May 2016 01:12:59 -0700 (PDT)
From: David Lang <david@lang.hm>
Subject: Re: [Make-wifi-fast] OpenWRT wrong adjustment of fq_codel defaults
 (Was: [Codel] fq_codel_drop vs a udp flood)
In-Reply-To: <CACiydbLcYe=2VLb3W9i-i2FGALwxJK=oO8RcZWjmj3YPGObK3Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1605160110270.1574@nftneq.ynat.uz>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
 <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
 <1462464776.13075.18.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbJYrFRMJvSHM6tJYWR8vmgV3xxnSUQsb-h5WcnLW=KXoQ@mail.gmail.com>
 <1462476207.13075.20.camel@edumazet-glaptop3.roam.corp.google.com>
 <20160506114243.4eb4f95e@redhat.com> <20160506144740.210901f5@redhat.com>
 <CACiydbL3qZrvZ4a_OUXiN0dp7qdqOktaQdAUdfOpKkZ1OfEZbA@mail.gmail.com>
 <CACiydb+A_vFNdp7tbw67Rnp+kHwt5GsLa+Su+pO8YmOZYp_KHg@mail.gmail.com>
 <CAA93jw4XeMSxiTLHWZ2b=F9ni7wz9RpkWDdhTh99gn4Mf1aWjA@mail.gmail.com>
 <CACiydbLcYe=2VLb3W9i-i2FGALwxJK=oO8RcZWjmj3YPGObK3Q@mail.gmail.com>
MIME-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, Felix Fietkau <nbd@nbd.name>

On Mon, 16 May 2016, Roman Yeryomin wrote:

> On 6 May 2016 at 22:43, Dave Taht <dave.taht@gmail.com> wrote:
>> On Fri, May 6, 2016 at 11:56 AM, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>>> On 6 May 2016 at 21:43, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>>>> On 6 May 2016 at 15:47, Jesper Dangaard Brouer <brouer@redhat.com> wrote:
>>>>>
>
>> That is too low a limit, also, for normal use. And:
>> for the purpose of this particular UDP test, flows 16 is ok, but not
>> ideal.
>
> I played with different combinations, it doesn't make any
> (significant) difference: 20-30Mbps, not more.
> What numbers would you propose?

How many different flows did you have going at once? I believe that the reason 
for higher numbers isn't for throughput, but to allow for more flows to be 
isolated from each other. If you have too few buckets, different flows will end 
up being combined into one bucket so that one will affect the other more.

David Lang

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
