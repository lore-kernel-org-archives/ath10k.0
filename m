Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aydPw-00019r-DP
 for ath10k@lists.infradead.org; Fri, 06 May 2016 10:56:16 +0000
Received: by mail-oi0-x243.google.com with SMTP id w198so17719272oiw.2
 for <ath10k@lists.infradead.org>; Fri, 06 May 2016 03:55:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydbJBMHGxeDj=BErL3h3RPetLhv3uz+s-trZSnz4Ee5FPyw@mail.gmail.com>
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
 <CACiydbJBMHGxeDj=BErL3h3RPetLhv3uz+s-trZSnz4Ee5FPyw@mail.gmail.com>
Date: Fri, 6 May 2016 13:55:10 +0300
Message-ID: <CACiydbLV9fHQk-7ovj3sYTaUrfju2Ryf5vvNCKm5H5A+q5VDPw@mail.gmail.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, make-wifi-fast@lists.bufferbloat.net

On 5 May 2016 at 19:42, Roman Yeryomin <leroi.lists@gmail.com> wrote:
> On 5 May 2016 at 19:25, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 5 May 2016 at 19:12, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>>> On Thu, 2016-05-05 at 17:53 +0300, Roman Yeryomin wrote:
>>>
>>>>
>>>> qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
>>>> quantum 1514 target 5.0ms interval 100.0ms ecn
>>>>  Sent 12306 bytes 128 pkt (dropped 0, overlimits 0 requeues 0)
>>>>  backlog 0b 0p requeues 0
>>>>   maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
>>>>   new_flows_len 0 old_flows_len 0
>>>
>>>
>>> Limit of 1024 packets and 1024 flows is not wise I think.
>>>
>>> (If all buckets are in use, each bucket has a virtual queue of 1 packet,
>>> which is almost the same than having no queue at all)
>>>
>>> I suggest to have at least 8 packets per bucket, to let Codel have a
>>> chance to trigger.
>>>
>>> So you could either reduce number of buckets to 128 (if memory is
>>> tight), or increase limit to 8192.
>>
>> Will try, but what I've posted is default, I didn't change/configure that.
>
> So it didn't change anything :(
> Do you want new stats?

Just realized that the patch should be applied/ported to Linux kernel
OpenWrt part, not compat-wireless.
Will try to do that now.

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
