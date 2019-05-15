Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQstS-0005fT-O6
 for ath10k@lists.infradead.org; Wed, 15 May 2019 12:20:24 +0000
Subject: Re: Problem with 9984 in routed mode with 512b frames.
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
Date: Wed, 15 May 2019 05:20:20 -0700
MIME-Version: 1.0
In-Reply-To: <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>, ath10k <ath10k@lists.infradead.org>

On 05/14/2019 09:26 PM, Sebastian Gottschall wrote:
> can you send me a detailed instruction for testing this on my devices? so which commands have been used for generating the traffic etc. (iperf3?)

I am using our own traffic generator, but I imagine iperf3 should work fine too.

I am testing on x86-64 and so forth.  Maybe you can test with UDP small-packet load on your platform
in routed mode (ie, external iperf generator through your AP) and see if you see issues?

 From debugging yesterday, I see a lot of tx-hang notifications in the firmware, and
I also believe I saw it trying to transmit with a 0 rate-indx, which is 11Mbps CCK,
which is invalid for 5Ghz.  I'll be debugging that more today.  I don't know if stock
firmware fails for the same reasons, but the symptom looked the same.

Thanks,
Ben

>
> Sebastian
>
> Am 15.05.2019 um 03:52 schrieb Ben Greear:
>> Hello,
>>
>> I found a strange issue and curious if someone has seen similar.
>>
>> I made an AP where the AP interface acts as a routed interface.  I generate
>> traffic through another interface in the router.  When sending 300Mbps of 512 byte
>> UDP payloads, in the downstream direction, and with the station being a 1x1 /AC device,
>> then the AP NIC appears to mostly lock up within about 1 minute. I still see beacons, but no
>> data frames.  In some cases, I reproduced with very slow speed traffic as well.
>>
>> I tried using a mostly un-modified firmware (ie, similar to upstream QCA), as well as my
>> hacked upon firmware, and all act similarly.  I'm using the 4.20 kernel, but at least for now,
>> it does not appear to be a kernel issue.
>>
>> If I use larger MTU sized frames, or have a 2x2 station instead of 1x1 then it is much harder
>> to reproduce (and maybe cannot be reproduced).  Also, when generating traffic directly on
>> the AP device instead of using the routed interface as a traffic source, it is harder to
>> reproduce.
>>
>> Thanks,
>> Ben
>>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
