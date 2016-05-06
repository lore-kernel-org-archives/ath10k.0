Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayfAt-00088g-Sq
 for ath10k@lists.infradead.org; Fri, 06 May 2016 12:48:08 +0000
Date: Fri, 6 May 2016 14:47:40 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: OpenWRT wrong adjustment of fq_codel defaults (Was: [Codel]
 fq_codel_drop vs a udp flood)
Message-ID: <20160506144740.210901f5@redhat.com>
In-Reply-To: <20160506114243.4eb4f95e@redhat.com>
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
MIME-Version: 1.0
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
To: Felix Fietkau <nbd@nbd.name>, Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, zajec5@gmail.com, brouer@redhat.com, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Jonathan Morton <chromatix99@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>, openwrt-devel@lists.openwrt.org


I've created a OpenWRT ticket[1] on this issue, as it seems that someone[2]
closed Felix'es OpenWRT email account (bad choice! emails bouncing).
Sounds like OpenWRT and the LEDE https://www.lede-project.org/ project
is in some kind of conflict.

OpenWRT ticket [1] https://dev.openwrt.org/ticket/22349

[2] http://thread.gmane.org/gmane.comp.embedded.openwrt.devel/40298/focus=40335


On Fri, 6 May 2016 11:42:43 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> Hi Felix,
> 
> This is an important fix for OpenWRT, please read!
> 
> OpenWRT changed the default fq_codel sch->limit from 10240 to 1024,
> without also adjusting q->flows_cnt.  Eric explains below that you must
> also adjust the buckets (q->flows_cnt) for this not to break. (Just
> adjust it to 128)
> 
> Problematic OpenWRT commit in question:
>  http://git.openwrt.org/?p=openwrt.git;a=patch;h=12cd6578084e
>  12cd6578084e ("kernel: revert fq_codel quantum override to prevent it from causing too much cpu load with higher speed (#21326)")
> 
> 
> I also highly recommend you cherry-pick this very recent commit:
>  net-next: 9d18562a2278 ("fq_codel: add batch ability to fq_codel_drop()")
>  https://git.kernel.org/davem/net-next/c/9d18562a227
> 
> This should fix very high CPU usage in-case fq_codel goes into drop mode.
> The problem is that drop mode was considered rare, and implementation
> wise it was chosen to be more expensive (to save cycles on normal mode).
> Unfortunately is it easy to trigger with an UDP flood. Drop mode is
> especially expensive for smaller devices, as it scans a 4K big array,
> thus 64 cache misses for small devices!
> 
> The fix is to allow drop-mode to bulk-drop more packets when entering
> drop-mode (default 64 bulk drop).  That way we don't suddenly
> experience a significantly higher processing cost per packet, but
> instead can amortize this.
> 
> To Eric, should we recommend OpenWRT to adjust default (max) 64 bulk
> drop, given we also recommend bucket size to be 128 ? (thus the amount
> of memory to scan is less, but their CPU is also much smaller).
> 
> --Jesper
> 
> 
> On Thu, 05 May 2016 12:23:27 -0700 Eric Dumazet <eric.dumazet@gmail.com> wrote:
> 
> > On Thu, 2016-05-05 at 19:25 +0300, Roman Yeryomin wrote:  
> > > On 5 May 2016 at 19:12, Eric Dumazet <eric.dumazet@gmail.com> wrote:    
> > > > On Thu, 2016-05-05 at 17:53 +0300, Roman Yeryomin wrote:
> > > >    
> > > >>
> > > >> qdisc fq_codel 0: dev eth0 root refcnt 2 limit 1024p flows 1024
> > > >> quantum 1514 target 5.0ms interval 100.0ms ecn
> > > >>  Sent 12306 bytes 128 pkt (dropped 0, overlimits 0 requeues 0)
> > > >>  backlog 0b 0p requeues 0
> > > >>   maxpacket 0 drop_overlimit 0 new_flow_count 0 ecn_mark 0
> > > >>   new_flows_len 0 old_flows_len 0    
> > > >
> > > >
> > > > Limit of 1024 packets and 1024 flows is not wise I think.
> > > >
> > > > (If all buckets are in use, each bucket has a virtual queue of 1 packet,
> > > > which is almost the same than having no queue at all)
> > > >
> > > > I suggest to have at least 8 packets per bucket, to let Codel have a
> > > > chance to trigger.
> > > >
> > > > So you could either reduce number of buckets to 128 (if memory is
> > > > tight), or increase limit to 8192.    
> > > 
> > > Will try, but what I've posted is default, I didn't change/configure that.    
> > 
> > fq_codel has a default of 10240 packets and 1024 buckets.
> > 
> > http://lxr.free-electrons.com/source/net/sched/sch_fq_codel.c#L413
> > 
> > If someone changed that in the linux variant you use, he probably should
> > explain the rationale.  

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
