Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgOq9-0003VH-AQ
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 02:38:41 +0000
Message-ID: <55273798.3000004@candelatech.com>
Date: Thu, 09 Apr 2015 19:38:16 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS support in ath10k - our test results and questions
References: <2680922.jiTnlqor3W@prime> <550B425A.7090505@candelatech.com>
 <1638549.OfoyQL4eQV@bentobox> <5522C8A1.6040007@candelatech.com>
 <5522E6D3.30109@candelatech.com> <55257592.1080900@candelatech.com>
In-Reply-To: <55257592.1080900@candelatech.com>
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
To: Sven Eckelmann <sven@open-mesh.com>
Cc: Simon Wunderlich <simon@open-mesh.com>, marek@open-mesh.com, ath10k@lists.infradead.org

I am still getting closer..found place in my 10.1 firmware that was setting
the mcast peer's key-index when it shouldn't, and now I can generate
udp broadcast frames on ath10k and ath9k receives them fine
(and they are encrypted on the air).

But, ARP request and response packets are being transmitted wrong by the ath10k.  Looks like
they are truncated and/or scrambled a bit..but they do decrypt on the
ath9k peer (just as mal-formed packet).

I found a bit of stuff that adjusts TID for ARP in the firmware,
but could not find any other special handling.

Anyone know if there is other special handling somewhere that might
account for this?

Thanks,
Ben


On 04/08/2015 11:38 AM, Ben Greear wrote:
> So, I've made some progress.
> 
> After fixing PSK (I had it misconfigured all of yesterday!), and with full restart of supplicant,
> I can get the 4-way to complete, and I see PTK and GTK set in driver and firmware.
> I do not know if the keys are set correctly, but the logs seem plausible.
> 
> After that, I see plain-text ARPs hit the air (the should be encrypted),
> and the last 21 bytes of the packet appear to be random garbage.
> 
> I am guessing driver and/or firmware and/or hardware is not properly
> encrypting the frames.
> 
> Off to do some more spelunking in the firmware.
> 
> Thanks,
> Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
