Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.compex.com.sg ([116.12.130.103] helo=compex.com.sg)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRaYJ-00039f-Ov
 for ath10k@lists.infradead.org; Thu, 12 Jan 2017 08:16:12 +0000
Message-ID: <F468EA06CC7341849F013B51FFCC88E2@PhyuThe>
From: "Phyu The" <pt_myat@compex.com.sg>
References: <20170110061217.096FD148A08@compex.com.sg>
 <63DDC83FD9364560ACBA60D17C3F5AD8@PhyuThe> <5874F1BC.80505@candelatech.com>
 <10981E9AB9EA46A1897BE3E5CF661C0F@PhyuThe>
 <f3ed8528-a9ab-fa33-e753-aa1fbebc969e@candelatech.com>
In-Reply-To: <f3ed8528-a9ab-fa33-e753-aa1fbebc969e@candelatech.com>
Subject: Re: QCA9880 3x3 80Mhz low performance
Date: Thu, 12 Jan 2017 16:15:34 +0800
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>

Dear Ben,

Thanks for your reply and suggestion.

I have tried as your suggestion to test IPQ8064+QCA9880 with Ath10k CT 
firmware/driver to run throughput UDP/TCP. Unfortunately, I could not be 
able to see throughput improvement. Could you please suggest what may cause 
low throughput?

thanks,
Phyuthe

-----Original Message----- 
From: Ben Greear
Sent: Thursday, January 12, 2017 12:59 AM
To: Phyu The ; ath10k@lists.infradead.org
Subject: Re: QCA9880 3x3 80Mhz low performance

We have not done a lot of testing in AP mode, but when using 9880 3x3 compex 
NICs
in our 2U rackmounts (high end Intel E5 processors), and with CT 
firmware/drivers,
we see near 950Mbps UDP download in station mode.  I think we were a bit 
slower in
AP mode, but not that much.

Are you testing TCP or UDP traffic?

http://www.candelatech.com/images/data-comp-07-20-2016-1147-with-labels.png

Have you tried normal STA/AP mode instead of WDS?

Maybe you are CPU bound on your platform?

Thanks,
Ben

On 01/10/2017 05:09 PM, Phyu The wrote:
> Dear Ben,
>
> I configured AP_WDS and Sta_WDS mode, channel 149, 11ac, 3x3, 80MHz and 
> without encryption. I used 2 RF boxes with 3 adjustable attenuators 
> running throughput
> by Ixchairot to get best performance. However, throughput seems limited to 
> 640Mbps. Kindly see attached for your reference for more details.
>
> thanks,
> Phyuthe
>
> -----Original Message----- From: Ben Greear
> Sent: Tuesday, January 10, 2017 10:37 PM
> To: Phyu The ; ath10k@lists.infradead.org
> Subject: Re: QCA9880 3x3 80Mhz low performance
>
> You should provide a lot more information about how you configured and 
> tested the system,
> including traffic generator and RF environment, etc.
>
> Thanks,
> Ben
>
> On 01/09/2017 10:19 PM, Phyu The wrote:
>> Dear Sir,
>>
>> I tested performance throughput test used WPQ864 + QCA9880 11ac 80MHz is 
>> 640Mbps that is very low since theoretical data rate is 1300Mbps. It 
>> should be at
>> least 866Mbps. Could you please suggest me how to get better performance?
>>
>> thanks,
>> Phyuthe
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
