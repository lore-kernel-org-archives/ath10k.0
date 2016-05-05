Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayKex-00077H-On
 for ath10k@lists.infradead.org; Thu, 05 May 2016 14:53:48 +0000
Received: by mail-ob0-x241.google.com with SMTP id aq1so4930543obc.0
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 07:53:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
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
Date: Thu, 5 May 2016 17:53:26 +0300
Message-ID: <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
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

On 2 May 2016 at 19:14, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> On Mon, 2016-05-02 at 18:43 +0300, Roman Yeryomin wrote:
>> On 2 May 2016 at 18:07, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>> > On Mon, 2016-05-02 at 17:18 +0300, Roman Yeryomin wrote:
>> >
>> >> Imagine you are a video operator, have MacBook Pro, gigabit LAN and
>> >> NAS on ethernet side. You would want to get maximum speed. And
>> >> fq_codel just dropped it down to 550Mbps for TCP (instead of 750Mbps)
>> >> and to 30Mbps for UDP (instead of 900Mbps).
>> >> So, again, it looks broken to me.
>> >
>> > Can you show us your qdisc config ?
>>
>> Which build do you want? Before it broke or after?
>>
>
>
> I want to check your qdisc configuration, the one that you used and
> where you had fq_codel performance issues
>
> tc -s -d qdisc
>

qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
quantum 1514 target 5.0ms interval 100.0ms ecn
 Sent 12306 bytes 128 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc mq 0: dev wlan0 root
 Sent 29775 bytes 254 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
qdisc fq_codel 0: dev wlan0 parent :1 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
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
 Sent 29775 bytes 254 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0
qdisc fq_codel 0: dev wlan0 parent :4 limit 1024p flows 1024 quantum
1514 target 5.0ms interval 100.0ms ecn
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
  maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
  new_flows_len 0 old_flows_len 0


Will try your patch now.

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
