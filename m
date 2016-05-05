Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x244.google.com ([2607:f8b0:4003:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayLoo-0001ke-Mh
 for ath10k@lists.infradead.org; Thu, 05 May 2016 16:08:04 +0000
Received: by mail-ob0-x244.google.com with SMTP id ds10so5266991obb.3
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 09:07:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw5Y3DSzuOZo=S6_dsUqJvy_3ThNe6tMic2ZJ14kQPnFHg@mail.gmail.com>
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
 <CAA93jw5Y3DSzuOZo=S6_dsUqJvy_3ThNe6tMic2ZJ14kQPnFHg@mail.gmail.com>
Date: Thu, 5 May 2016 19:07:41 +0300
Message-ID: <CACiydb+kOLNBwEn+gDU3fZrXEQxp5FMFLH_mDS1ZO5J8r9yiBA@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>, Eric Dumazet <eric.dumazet@gmail.com>, make-wifi-fast@lists.bufferbloat.net

On 5 May 2016 at 18:32, Dave Taht <dave.taht@gmail.com> wrote:
> On Thu, May 5, 2016 at 7:53 AM, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 2 May 2016 at 19:14, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>>> On Mon, 2016-05-02 at 18:43 +0300, Roman Yeryomin wrote:
>>>> On 2 May 2016 at 18:07, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>>>> > On Mon, 2016-05-02 at 17:18 +0300, Roman Yeryomin wrote:
>>>> >
>>>> >> Imagine you are a video operator, have MacBook Pro, gigabit LAN and
>>>> >> NAS on ethernet side. You would want to get maximum speed. And
>>>> >> fq_codel just dropped it down to 550Mbps for TCP (instead of 750Mbps)
>>>> >> and to 30Mbps for UDP (instead of 900Mbps).
>>>> >> So, again, it looks broken to me.
>>>> >
>>>> > Can you show us your qdisc config ?
>>>>
>>>> Which build do you want? Before it broke or after?
>>>>
>>>
>>>
>>> I want to check your qdisc configuration, the one that you used and
>>> where you had fq_codel performance issues
>>>
>>> tc -s -d qdisc
>>>
> Looks fine.
>
> If you could sample that a few times during your various tests,
> that would be good.
>

UDP:

just started:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 84919 bytes 460 pkt (dropped 0, overlimits 0 requeues 2)
 backlog 0b 0p requeues 2
  maxpacket 1374 drop_overlimit 0 new_flow_count 1 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 87417 bytes 400 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 64155 bytes 309 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 21958 bytes 77 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0

after 10s of test:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 87093 bytes 489 pkt (dropped 0, overlimits 0 requeues 2)
 backlog 0b 0p requeues 2
  maxpacket 1374 drop_overlimit 0 new_flow_count 1 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 35600270 bytes 23892 pkt (dropped 679412, overlimits 0 requeues 5)
 backlog 1514Kb 1024p requeues 5
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 35891436 bytes 24003 pkt (dropped 685860, overlimits 0 requeues 5)
 backlog 1514Kb 1024p requeues 5
  maxpacket 1514 drop_overlimit 682059 new_flow_count 11 ecn_mark 0
  new_flows_len 0 old_flows_len 1
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 22442 bytes 83 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0

after 20s of test:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 87591 bytes 498 pkt (dropped 0, overlimits 0 requeues 2)
 backlog 0b 0p requeues 2
  maxpacket 1374 drop_overlimit 0 new_flow_count 1 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 60034332 bytes 40042 pkt (dropped 1176284, overlimits 0 requeues 5)
 backlog 1514Kb 1024p requeues 5
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 60398170 bytes 40201 pkt (dropped 1184220, overlimits 0 requeues 5)
 backlog 1514Kb 1024p requeues 5
  maxpacket 1514 drop_overlimit 1172942 new_flow_count 22 ecn_mark 0
  new_flows_len 0 old_flows_len 1
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 22442 bytes 83 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0


TCP:

just started:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 46784 bytes 299 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 52313 bytes 265 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 33248 bytes 194 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 17761 bytes 57 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0

after 10s of test:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 4274547 bytes 64354 pkt (dropped 0, overlimits 0 requeues 1)
 backlog 0b 0p requeues 1
  maxpacket 66 drop_overlimit 0 new_flow_count 1 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 766641277 bytes 507064 pkt (dropped 0, overlimits 0 requeues 482)
 backlog 483032b 320p requeues 482
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 768001532 bytes 507905 pkt (dropped 0, overlimits 0 requeues 482)
 backlog 529900b 350p requeues 482
  maxpacket 1514 drop_overlimit 0 new_flow_count 37 ecn_mark 0
  new_flows_len 0 old_flows_len 1
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 17761 bytes 57 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0

after 20s of test:
qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 9064993 bytes 136936 pkt (dropped 0, overlimits 0 requeues 1)
 backlog 0b 0p requeues 1
  maxpacket 66 drop_overlimit 0 new_flow_count 1 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 1638525871 bytes 1083456 pkt (dropped 0, overlimits 0 requeues 945)
 backlog 0b 0p requeues 945
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1304 bytes 14 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :2 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :3 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 1638506477 bytes 1083381 pkt (dropped 0, overlimits 0 requeues 945)
 backlog 0b 0p requeues 945
  maxpacket 1514 drop_overlimit 0 new_flow_count 70 ecn_mark 0
  new_flows_len 0 old_flows_len 1
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 18090 bytes 61 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0


That's with https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=9d18562a227874289fda8ca5d117d8f503f1dcca
Having same (low) speeds.
So it didn't help at all :(


Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
