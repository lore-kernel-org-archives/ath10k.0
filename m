Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1aimTA-0007i2-3M
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 17:21:21 +0000
Subject: Re: UDP throughput problems with WDS and ath10k
References: <56F27596.3080506@dks-koeln.de>
 <CA+BoTQndwokRf467hN0QZREZ1-hprHCHovMX2pi7X8oUUvpOGw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56F2D062.2050104@candelatech.com>
Date: Wed, 23 Mar 2016 10:20:34 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQndwokRf467hN0QZREZ1-hprHCHovMX2pi7X8oUUvpOGw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Xue Liu <xue.liu@dks-koeln.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/23/2016 09:54 AM, Michal Kazior wrote:
> On 23 March 2016 at 11:53, Xue Liu <xue.liu@dks-koeln.de> wrote:
>> Hello everyone,
>>
>> Now I am doing point to point  throughput test using  and ath10k. The
>> hardwares are clearfog A1 board with armada 388 and WLE900VX (QCA9880). The
>> OpenWRT trunk is running on it.
>>
>> At first I did UDP throughput test ( WDS AP <---> WDS Client ) with iperf3
>> server on the WDS AP. The throughput is approx 630 Mbps.  But if the server
>> sends the data, the throughput will rise to 700 Mbps.  I did the
>> bidirectional test for many times. The UDP data transferring from AP side
>> always has 70 - 80 Mbps more throughput.
>>
>> In the same situation, I did UDP throughput test between PC and WDS AP ( PC
>> <---->WDS Client <----> WDS AP ) . The PC is connected with the WDS client
>> via GbE port.  I have found a more interesting result. The data throughput
>> is about 678 Mbps when the data is transmitted from AP to PC. There is
>> almost no performance loss. But the throughput is only about 425 Mpbs from
>> PC to AP.
>>
>> Can anyone give me some advises or some info about the reason and how to
>> improve the transmitting performance from PC to AP side. Thank you.
>
> This is weird. Did you check CPU utilization on all involved devices
> (PC, WDS Client, WDS AP)? Did you try tweaking iperf parameters, e.g.
> number of threads, buffer sizes? Playing around with some parameters
> could narrow down the problem.
>
> Normally I would expect the reverse performance drop (i.e. slower
> performance when traffic is generated locally on WDS Client).

I don't know about WDS, but we definitely see slower upload (from station perspective)
than download rates, using identical hardware for AP and STA devices.

Patches posted to ath10k list yesterday claim to resolve at least some of this,
but I have not tested those yet...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
