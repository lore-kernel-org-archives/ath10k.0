Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXMDV-0001oF-MY
 for ath10k@lists.infradead.org; Thu, 03 Sep 2015 04:33:42 +0000
Message-ID: <55E7CD8D.7090003@candelatech.com>
Date: Wed, 02 Sep 2015 21:33:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: HT80 monitoring using ath10k
References: <CAEFj984QMQrsDPuThJCnnDj=vDFAeHwkdVT2MA0PXvhCAL2Hcw@mail.gmail.com>
 <55E743F3.1060802@candelatech.com>
 <CAEFj984KSFw6a6kQTMO_80MM+tZqbQo3hq=faKWtS+oxk14zkQ@mail.gmail.com>
In-Reply-To: <CAEFj984KSFw6a6kQTMO_80MM+tZqbQo3hq=faKWtS+oxk14zkQ@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/02/2015 08:32 PM, Yeoh Chun-Yeow wrote:
> On Thu, Sep 3, 2015 at 2:46 AM, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/01/2015 06:20 PM, Yeoh Chun-Yeow wrote:
>>>
>>> Hi, all
>>>
>>> Anyone has able to capture the packet sent using HT80 or even higher
>>> putting ath10k in monitor mode?
>>>
>>> Please let me know. Thanks
>>
>>
>> I guess it would require wave-2 hardware to even have a chance of HT160?
>>
>> I thought HT80 capture worked fine on peregrine....I should have a chance to
>> try this for some upcoming IBSS work I have scheduled for my 10.1 firmware.
>
> Did you ever try it before with HT80?
>
> I set using the following after bring up the interface:
> iw moni0 set freq 5180 80 5210
>
> But not seeing any data packet and just those mgmt frame.

To be honest, I normally configure an AP on appropriate channels, and
then just start up a monitor interface.  Then, stop the AP interface.
I have poor luck getting a monitor interface to reliably configure the
proper channel & width on its own.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
