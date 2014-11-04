Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlU7f-0001N9-Og
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 02:45:32 +0000
Message-ID: <54583DB4.1030808@candelatech.com>
Date: Mon, 03 Nov 2014 18:45:08 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Slow connect times?
References: <5458261C.2020700@candelatech.com>
 <CAHqTa-21YOPiV_UxxWh23mB7AqLhj0n+h6eA5cTUH8eh32heRw@mail.gmail.com>
In-Reply-To: <CAHqTa-21YOPiV_UxxWh23mB7AqLhj0n+h6eA5cTUH8eh32heRw@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 11/03/2014 05:35 PM, Avery Pennarun wrote:
> On Mon, Nov 3, 2014 at 8:04 PM, Ben Greear <greearb@candelatech.com> wrote:
>> If I am reading my results right, it takes over 2 seconds to associate an
>> ath10k station with WPA2 PSK on my systems.
>>
>> I was thinking this should be quite a bit faster than this...
>>
>> Has anyone done any similar measurements?
>
> I haven't noticed any delay like this.  WPA2 PSK negotiation is on the
> order of ~200ms or less. Then DHCP screws around for a few seconds,
> often.
>
> A packet trace would probably be useful for narrowing it down :)


Could be something weird with my setup.  I'll dig into it some more sometime
soon.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
