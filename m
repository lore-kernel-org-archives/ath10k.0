Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aldv4-0006Ah-8w
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 14:50:00 +0000
Subject: Re: UDP throughput problems with WDS and ath10k
References: <56F27596.3080506@dks-koeln.de>
 <CA+BoTQndwokRf467hN0QZREZ1-hprHCHovMX2pi7X8oUUvpOGw@mail.gmail.com>
 <56F2D062.2050104@candelatech.com>
 <ad55aa16-af01-6f1c-bf97-c02316335ddc@dks-koeln.de>
From: Xue Liu <xue.liu@dks-koeln.de>
Message-ID: <b0ccd3ea-f03d-a48a-2dec-5791ff3d6887@dks-koeln.de>
Date: Thu, 31 Mar 2016 16:49:28 +0200
MIME-Version: 1.0
In-Reply-To: <ad55aa16-af01-6f1c-bf97-c02316335ddc@dks-koeln.de>
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
To: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sorry. I think I misunderstand the info from "top". I will correct my 
result as below:

When the data is sent from PC to AP, the AP has
CPU:   1%    9% sys   0% nic  61% idle   0% io   0% irq  27% sirq
Load average: 0.54 0.46 0.36 2/53 5034

And the client has
CPU:   0% usr   0% sys   0% nic  73% idle   0% io   0% irq  26% sirq
Load average: 0.00 0.01 0.02 1/53 1228

When the data is sent from AP to PC, the AP has
CPU:   1% usr  21% sys   0% nic  70% idle   0% io   0% irq   6% sirq
Load average: 0.79 0.62 0.44 2/53 5282

And the client has
CPU:   0% usr   0% sys   0% nic  74% idle   0% io   0% irq  25% sirq
Load average: 0.00 0.01 0.02 1/53 1228


On 31/03/16 16:36, Xue Liu wrote:
> Hello,
>
> I have test throughput with different 3  parameters. But the results 
> are similar. The data rate from PC via  Client to the AP decreases 
> significantly comparing with the reverse direction.
>
> During the test I also obverse the CPU load of client and AP. C, the 
> AP has ~2% CPU load, ~63 nic and ~25% sirq. The client has ~0% CPU 
> load ~78% nic and ~20% sirq. When the data sent from AP, the AP has 
> ~1% cpu ~69% nic and 7% sirq. The client has ~0% cpu, 76% nic and ~24% 
> sirq.
>
> The test diagram is shown as
>
> PC(GbE) --- (GbE)WDS Client (Wireless) --- (Wireless) WDS AP.
>
> Did anyone else tries with such setup ?
>
>
> On 23/03/16 18:20, Ben Greear wrote:
>> On 03/23/2016 09:54 AM, Michal Kazior wrote:
>>> On 23 March 2016 at 11:53, Xue Liu <xue.liu@dks-koeln.de> wrote:
>>>> Hello everyone,
>>>>
>>>> Now I am doing point to point  throughput test using  and ath10k. The
>>>> hardwares are clearfog A1 board with armada 388 and WLE900VX 
>>>> (QCA9880). The
>>>> OpenWRT trunk is running on it.
>>>>
>>>> At first I did UDP throughput test ( WDS AP <---> WDS Client ) with 
>>>> iperf3
>>>> server on the WDS AP. The throughput is approx 630 Mbps. But if the 
>>>> server
>>>> sends the data, the throughput will rise to 700 Mbps.  I did the
>>>> bidirectional test for many times. The UDP data transferring from 
>>>> AP side
>>>> always has 70 - 80 Mbps more throughput.
>>>>
>>>> In the same situation, I did UDP throughput test between PC and WDS 
>>>> AP ( PC
>>>> <---->WDS Client <----> WDS AP ) . The PC is connected with the WDS 
>>>> client
>>>> via GbE port.  I have found a more interesting result. The data 
>>>> throughput
>>>> is about 678 Mbps when the data is transmitted from AP to PC. There is
>>>> almost no performance loss. But the throughput is only about 425 
>>>> Mpbs from
>>>> PC to AP.
>>>>
>>>> Can anyone give me some advises or some info about the reason and 
>>>> how to
>>>> improve the transmitting performance from PC to AP side. Thank you.
>>>
>>> This is weird. Did you check CPU utilization on all involved devices
>>> (PC, WDS Client, WDS AP)? Did you try tweaking iperf parameters, e.g.
>>> number of threads, buffer sizes? Playing around with some parameters
>>> could narrow down the problem.
>>>
>>> Normally I would expect the reverse performance drop (i.e. slower
>>> performance when traffic is generated locally on WDS Client).
>>
>> I don't know about WDS, but we definitely see slower upload (from 
>> station perspective)
>> than download rates, using identical hardware for AP and STA devices.
>>
>> Patches posted to ath10k list yesterday claim to resolve at least 
>> some of this,
>> but I have not tested those yet...
>>
>> Thanks,
>> Ben
>>
>>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
