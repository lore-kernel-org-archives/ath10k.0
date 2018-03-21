Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyge5-0002aJ-GF
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 16:31:27 +0000
Subject: Re: [ath10k throughput] low throughput in multi-user mode
References: <072101d3c0b6$1a954f50$4fbfedf0$@sina.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <18864c97-63f9-3bfe-190c-24fda424c882@candelatech.com>
Date: Wed, 21 Mar 2018 09:31:10 -0700
MIME-Version: 1.0
In-Reply-To: <072101d3c0b6$1a954f50$4fbfedf0$@sina.com>
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
To: gary <guohuizou2000@sina.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/20/2018 06:44 PM, gary wrote:
>
> Hi all,
> I have run the throughput test on veriwave.(from Ethernet to wireless)
> My AP suports 4*4, 11ac, mu-mimo.,wireless chip is QCA9984.
> At first, the throughput is about 80Mbps only with 16 users, so I force to
> return true in function ath10k_mac_tx_can_push().
> As a result, when the user number is 1~16, the udp throughput is about
> 1.2Gbps ~1.4Gbps.
> But when the user number is 32, the udp throughput is only 520Mbps.
>
> So I try to substitute ath10k-firmware.
> With firmware 10.4-3.4-0082 and above, the throughput is around 520Mbps.
> But with firmware 10.4-3.4-0072, the throughput gets 1.1Gbps.
>
> Do I miss something in configuration?
> Any comment is appreciated.

What kernel version (or backports, if you are using that?) are you using?

And, I'd be curious how the latest ath10k-CT (beta) firmware compares
if you have time to try that:

http://www.candelatech.com/ath10k-10.4.php

At least in upload testing, we get better throughput with lots of
virtual stations if we tune the number of tx descriptors to be larger
as that will generate larger AMPDUs on air.

You might also check your rate-ctrl logic to make sure all of your
stations are using higher MCS rates.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
