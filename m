Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eWYMZ-0001fW-VI
 for ath10k@lists.infradead.org; Wed, 03 Jan 2018 02:01:06 +0000
Subject: Re: Bad TCP performance on WLE900VX
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5d961441-ac4d-26f3-2f60-51c210098411@candelatech.com>
Date: Tue, 2 Jan 2018 18:00:44 -0800
MIME-Version: 1.0
In-Reply-To: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
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
To: Robert Jones <rjones@gateworks.com>, ath10k@lists.infradead.org


On 01/02/2018 05:47 PM, Robert Jones wrote:
> Hello Everyone,
>
> I'm using a custom arm64 board with a Cavium CN8030 CPU and testing
> wireless card performance via iperf on Ubuntu 16.02 with a mainline
> 4.14 kernel. I have two identical units connected to each other via
> 60dB attenuators on all three channels. Channel is set to 161 VHT80.
>
> With UDP I see throughput upwards of 650Mbits/s, but TCP is
> ~24Mbits/s. That seemed odd so I did a little more testing. Switched
> to a 4.9 kernel and still saw the poor performance, but not with a
> 4.4. Before I went through the trouble of bisecting I thought to ask
> if there was something I was missing.
>
> I did come across this Ubuntu bug thread
> [https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1670041] which
> appeared to follow the same behavior I was seeing. Switched my TCP
> congestion algorithm to reno and saw throughput jump to >330Mbits/s.
> Cubic and BBR still ~24.
>
> My question now, is there a standing bug that I'm not aware of or
> could there be some sort of problem with my configuration that is
> being worked around with the reno algorithm?

There are more tcp related hacks that make ath10k useful for
generating TCP traffic.  The tcp_tsq_limit_output_interval
one in particular is helpful.

You can dig through my kernel and look for a commit related to
tcp_tsq_limit_output_interval.  Try setting it to 5 or higher.

https://github.com/greearb/linux-ct-4.13

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
