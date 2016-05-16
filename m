Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2Frl-0004Ha-A7
 for ath10k@lists.infradead.org; Mon, 16 May 2016 10:35:19 +0000
In-Reply-To: <alpine.DEB.2.02.1605160127430.1574@nftneq.ynat.uz>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
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
 <alpine.DEB.2.02.1605160110270.1574@nftneq.ynat.uz>
 <CACiydbL_dfBU=8m=gSSiR6HwdVU+z2WMeQMjP+boNhGe19_7Sg@mail.gmail.com>
 <alpine.DEB.2.02.1605160127430.1574@nftneq.ynat.uz>
MIME-Version: 1.0
Subject: Re: [OpenWrt-Devel] [Make-wifi-fast] OpenWRT wrong adjustment of
 fq_codel defaults (Was: [Codel] fq_codel_drop vs a udp flood)
From: Sebastian Moeller <moeller0@gmx.de>
Date: Mon, 16 May 2016 12:34:24 +0200
Message-ID: <1E11CBFE-1471-4ECC-8D34-9172B61D3F59@gmx.de>
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
To: David Lang <david@lang.hm>, Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>

Hi David,

On May 16, 2016 10:46:25 AM GMT+02:00, David Lang <david@lang.hm> wrote:
>On Mon, 16 May 2016, Roman Yeryomin wrote:
>
>> On 16 May 2016 at 11:12, David Lang <david@lang.hm> wrote:
>>> On Mon, 16 May 2016, Roman Yeryomin wrote:
>>>
>>>> On 6 May 2016 at 22:43, Dave Taht <dave.taht@gmail.com> wrote:
>>>>>
>>>>> On Fri, May 6, 2016 at 11:56 AM, Roman Yeryomin
><leroi.lists@gmail.com>
>>>>> wrote:
>>>>>>
>>>>>> On 6 May 2016 at 21:43, Roman Yeryomin <leroi.lists@gmail.com>
>wrote:
>>>>>>>
>>>>>>> On 6 May 2016 at 15:47, Jesper Dangaard Brouer
><brouer@redhat.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>>
>>>>
>>>>> That is too low a limit, also, for normal use. And:
>>>>> for the purpose of this particular UDP test, flows 16 is ok, but
>not
>>>>> ideal.
>>>>
>>>>
>>>> I played with different combinations, it doesn't make any
>>>> (significant) difference: 20-30Mbps, not more.
>>>> What numbers would you propose?
>>>
>>>
>>> How many different flows did you have going at once? I believe that
>the
>>> reason for higher numbers isn't for throughput, but to allow for
>more flows
>>> to be isolated from each other. If you have too few buckets,
>different flows
>>> will end up being combined into one bucket so that one will affect
>the other
>>> more.
>>
>> I'm testing with one flow, I never saw bigger performance with more
>> flows (e.g. -P8 to iperf3).
>
>The issue isn't performance, it's isolating a DNS request from a VoIP
>flow 
>from a streaming video flow from a DVD image download.
>
>The question is how many buckets do you need to have to isolate these
>in 
>practice? it depends how many flows you have. The default was 1024
>buckets, but 
>got changed to 128 for low memory devices, and that lower value got
>made into 
>the default, even for devices with lots of memory.

And I believe that the reduction was suboptimal, we need the Hash buckets to spread the glows around to avoid shared fate due to shared buckets... So the 1024 glows make a lot of sense even if the number of real  concurrent flows is lower think birthday paradoxon.
The change came because at full saturation our reduced packet limit only allowed one packet per bucket which is too low for decent performance... also less hash buckets make searching faster.
Since we now can specify a memory limit in addition to the packet limit, we should set the packet limit back to its default of 10240 and instead set the memory limit to something same for each platform. This will effectively have the same consequences as setting a packet limit, except it becomes clearer why performance degrades and I at least take a performance hit gladly over a forced oom reboot....



>
>I'm wondering if instead of trying to size this based on device memory,
>can it 
>be resizable on the fly and grow if too many flows/collisions are
>detected?
>
>David Lang
>_______________________________________________
>openwrt-devel mailing list
>openwrt-devel@lists.openwrt.org
>https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
