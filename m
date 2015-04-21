Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkfsC-00047f-M8
 for ath10k@lists.infradead.org; Tue, 21 Apr 2015 21:38:30 +0000
Message-ID: <5536C33E.6000109@candelatech.com>
Date: Tue, 21 Apr 2015 14:38:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question about ath10k throughput
References: <153F35912E69C446A72CF7D6417EBADE6E7B5667@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
In-Reply-To: <153F35912E69C446A72CF7D6417EBADE6E7B5667@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
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

On 04/21/2015 02:28 PM, Shu, Nick wrote:
> Hi, Group:
> I'm doing throughout measurement on QCA9880 chip, running ath10k 3.17 driver with firmware.
> I'm able to set channel width to 80MHz, enabled all three streams, MCS index to 9 for max. data throughput.
> I verified all initial setting are correct.
> But when test starts, MCS dropped (as the results of packet error?).
> Is there any app command to send to driver to lock the MCS index during the test, so we can see better throughput?
> What is the best practical number we can get for ath10k chip? 800? 900?

Please let us know more about your test setup:

Traffic protocol type (TCP, UDP, etc)

Over-the-air tests, or using cables + attenuators?

Is this in normal environment, or in an RF isolation chamber?

We've seen as much as 950Mbps UDP download using a certain Netgear AP,
but it is not reproducible.  We normally do this type of test using
sma cables + attenuators, and get mostly similar results whether in
isolation chamber or not when cabled up as long as the RF spectrum is
relatively quiet.

More often we see TCP in the 400-600 Mbps range and UDP in 700-800 Mbps
range..and with TCP, it can also be tricky to get good throughput
in our experience.

Increasing number of virtual stations decreases total throughput on most APs.

I have tried forcing the rate-control to run at specific (high) rates,
but it has not increased throughput in tests so far, so I have not played
with it that much.

Thanks,
Ben


> 
> Thanks!
> Nick Shu
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
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
