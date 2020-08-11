Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5TJ9-0003Ni-L6
 for ath10k@lists.infradead.org; Tue, 11 Aug 2020 12:23:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id f5so2775527plr.9
 for <ath10k@lists.infradead.org>; Tue, 11 Aug 2020 05:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
 <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
In-Reply-To: <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
From: Ahmed Zaki <anzaki@gmail.com>
Date: Tue, 11 Aug 2020 14:22:33 +0200
Message-ID: <CANczwAH0TT9oeTjLem8cZo=eLAVimeJcDCDCuV4DeySUn4zxKg@mail.gmail.com>
Subject: Re: WMM not working for mcast packets on ath10k
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
Cc: ath10k@lists.infradead.org

On Tue, 11 Aug 2020 at 01:05, Ben Greear <greearb@candelatech.com> wrote:
>
> On 8/10/20 3:08 PM, Ahmed Zaki wrote:
> > Hello,
> >
> > I have 2 ath10k devices set in Mesh Point mode. When I use iptables'
> > DSCP target to set the WMM AC for some traffic ports to VO, the rules
> > work fine but only for unicast packets. All broadcast on the target
> > UDP ports goes out as BE, and not VO.
> >
> > With some ath10k debugging enabled, it seems that the htt is indeed
> > sending the tx descriptor with the correct tid (6) set.
> >
> > Is this the intended behavior for some reason? If not, is there any
> > more debugging on the TX path that I can do?
>
> I don't think that WMM makes sense for bcast frames since they go out on
> a special TID that does not do aggregation or per peer QoS settings.

I get that, but we want to give some WMM priority to bcast as they tend to have
higher probability of loss under high network loads.

That special TID that you mentioned, is it set in the ath10k fw?
Because I traced the
htt and it is sending the intended tid in the txbuf flags, but bcast
still come 0 (BE) on air.
Or am I missing something in the driver?

Thanks again for help.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
