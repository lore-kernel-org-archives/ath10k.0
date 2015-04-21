Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkhOp-0001JD-9q
 for ath10k@lists.infradead.org; Tue, 21 Apr 2015 23:16:16 +0000
Message-ID: <5536DA29.8080601@candelatech.com>
Date: Tue, 21 Apr 2015 16:15:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question about ath10k throughput
References: <153F35912E69C446A72CF7D6417EBADE6E7B5667@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <5536C33E.6000109@candelatech.com>
 <153F35912E69C446A72CF7D6417EBADE6E7B5688@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>,
 <5536CC7C.5000400@candelatech.com>
 <153F35912E69C446A72CF7D6417EBADE6E7B66B4@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
In-Reply-To: <153F35912E69C446A72CF7D6417EBADE6E7B66B4@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
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
To: "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/21/2015 04:07 PM, Shu, Nick wrote:
> Hi, Ben:
> The data packet do go through the wifi interface twice, so I times 2.
> Its hard to put DUT into the chamber, cause its too big.
> I'm using your patched driver and firmware, that disabled HW encryption, so you said this will add CPU load?
> Our application can be set to run traffic in one direction, so I will test again to check the throughout in downlink, uplink, and bidirection for comparison.
> Will also try different AP, NetGear 1900 and Asus one.

In general, bi-directional traffic on wifi is a lot slower than uni-directional,
even if you add up both directions in bi-directional traffic.

I think this is mostly because the AP and station radios contend for airtime, and
you end up taking less advantage of block-acks and A-MPDUS.  Maybe more retransmits
and backoffs too..  Maybe others will have a better idea.

Disabling HW encryption makes the CPU do the decryption, so yeah, that is CPU intensive.

'perf top' or similar should show your cpu usage hotspots.

Thanks,
Ben



> 
> Thanks!
> Nick
> ________________________________________
> From: Ben Greear [greearb@candelatech.com]
> Sent: Tuesday, April 21, 2015 4:17 PM
> To: Shu, Nick
> Cc: ath10k@lists.infradead.org
> Subject: Re: Question about ath10k throughput
> 
> On 04/21/2015 02:59 PM, Shu, Nick wrote:
>> Thanks, Ben:
>> We use our test application to generate traffic (TCP or UDP), sending from wifi NIC (ONLY 1 CLIENT, not multiple vStas). RF cables are used to connect from NIC antenna port (x3) to Cisco AP (model#3702E) antenna port (AP is placed inside an isolation chamber). Scan results for that AP shows the signal strength is -18 dBm  (strong enough).
>> AP is connected back to test server through Ethernet cable, then Network host is route back the data packet to test application.
>> So the data throughput is calculated as: number of bytes * 2 (round trip) * 8 = Mbps.
>>
>> So far, we can only get like 400-500 Mbps for UDP.
>> Should we set AP to open? Without encryption?
> 
> I don't see why you do the 2x to get 'round-trip'...I think for issues related
> to wifi throughput, just talk about the amount of data flowing across the
> wifi network interface itself.
> 
> Receiving on a station (download), when using CT firmware and with sw-crypt enabled,
> does decryption on the CPU, and this is normally a CPU bound issue at around
> 500Mbps even on expensive E5 processors.
> 
> Upload uses HW encryption, so should run faster with modest host CPU usage.
> 
> I would try Open auth testing when verifying wifi throughput..then compare that
> against your encrypted throughput to see if you are CPU bound (or, at least
> not RF bound).
> 
> If you are doing true TCP protocol, then it will back off on drops (and require
> TCP ack frames and so forth).  You will get quite a bit more bulk throughput
> with UDP.
> 
> I would also try multiple different APs to try to find the best one.
> 
> Big expensive names on the AP don't always mean so much for basic throughput
> tests in our experience.
> 
> Having the AP inside an isolation chamber is helpful, but you really
> need your station system inside a chamber as well for a truly isolated test, otherwise
> the station system may be picking up interference that causes lost frames
> and so forth (and AP might pick up similar interference through cables
> connected to your test equipment).
> 
> Thanks,
> Ben
> 
> 
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 
> Spirent Communications e-mail confidentiality.
> ------------------------------------------------------------------------
> This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.
> 
> Spirent Communications plc
> Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
> Tel No. +44 (0) 1293 767676
> Fax No. +44 (0) 1293 767677
> 
> Registered in England Number 470893
> Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
> 
> Or if within the US,
> 
> Spirent Communications,
> 27349 Agoura Road, Calabasas, CA, 91301, USA.
> Tel No. 1-818-676- 2300
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
