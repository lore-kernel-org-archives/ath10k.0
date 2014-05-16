Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHha-0006Kb-S7
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:57:31 +0000
Message-ID: <53760B23.9000408@candelatech.com>
Date: Fri, 16 May 2014 05:57:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Rate vs Range graphs for ath10k through attentuator.
References: <53750D0D.4060106@candelatech.com>
 <87vbt56g61.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87vbt56g61.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 05/16/2014 05:50 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Just FYI...here's a graph of a UDP upload test through an attenuator.
>> The attenuator goes from 0 up to 95.5, though isolation is not perfect
>> so even at highest attenuation a small bit of signal gets through.
>>
>> One interesting thing to me is that ath10k does so well at very hot
>> signal strength.  ath9k runs like crap with hot signal...
>>
>> AP is another of our systems, both are using my CT firmware, my 3.14.4+
>> kernel, and WLE900VX NICs.  32 stations were created and associated
>> on the station machine, but only one was actively sending any significant
>> data.  AP system had single active AP vdev, one station interface that was
>> not connected.  Traffic flow is station send to AP, AP sends back to station
>> machine on 1Gbps wired Ethernet connection.  Both systems are mobile core-i7
>> CPU, 8GB RAM, etc.
>>
>> http://www.candelatech.com/examples/ath10k-rate-vs-range-udp-upload/
>>
>> Lots of graphs in the link above..the most useful ones are:
>>
>> http://www.candelatech.com/examples/ath10k-rate-vs-range-udp-upload/chart-0.png
>>
>> http://www.candelatech.com/examples/ath10k-rate-vs-range-udp-upload/chart-30.png
>>
>> The throughput is a bit spikey, possibly because I am only doing 5 second throughput
>> tests.  Will run a 30-second one some day and hope that smooths out.
>
> Cool charts. Was this over the air or with cables?

Cables, have to run it through the attenuator...

Ben

>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
