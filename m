Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Gqk-0008EF-Iu
 for ath10k@lists.infradead.org; Mon, 10 Aug 2020 23:05:03 +0000
Subject: Re: WMM not working for mcast packets on ath10k
References: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
Date: Mon, 10 Aug 2020 16:05:00 -0700
MIME-Version: 1.0
In-Reply-To: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
Content-Language: en-MW
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
To: Ahmed Zaki <anzaki@gmail.com>, ath10k@lists.infradead.org

On 8/10/20 3:08 PM, Ahmed Zaki wrote:
> Hello,
> 
> I have 2 ath10k devices set in Mesh Point mode. When I use iptables'
> DSCP target to set the WMM AC for some traffic ports to VO, the rules
> work fine but only for unicast packets. All broadcast on the target
> UDP ports goes out as BE, and not VO.
> 
> With some ath10k debugging enabled, it seems that the htt is indeed
> sending the tx descriptor with the correct tid (6) set.
> 
> Is this the intended behavior for some reason? If not, is there any
> more debugging on the TX path that I can do?

I don't think that WMM makes sense for bcast frames since they go out on
a special TID that does not do aggregation or per peer QoS settings.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
