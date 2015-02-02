Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIKPh-0000Jo-M4
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 17:03:54 +0000
Message-ID: <54CFADE3.6040102@candelatech.com>
Date: Mon, 02 Feb 2015 09:03:31 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Unable to read firmware registers on crash?
References: <54CE6664.9090101@candelatech.com>
 <CA+BoTQ=593PK2J5WVh-pPcaKApd2N08-FpvnVKUr+LK0ChaBHA@mail.gmail.com>
In-Reply-To: <CA+BoTQ=593PK2J5WVh-pPcaKApd2N08-FpvnVKUr+LK0ChaBHA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/02/2015 04:11 AM, Michal Kazior wrote:
> On 1 February 2015 at 18:46, Ben Greear <greearb@candelatech.com> wrote:
>> I am trying to debug a case where firmware occasionally crashes and
>> the driver cannot read any crash dump to debug problem further.
>>
>> Any idea what might be the problem and how I might could read info
>> from the firmware (or hack firmware to deliver the crash info in some
>> other means...maybe though a previously reserved piece of memory on
>> the host??)
>>
>> [147334.397148] ath10k: firmware crashed! (uuid
>> ff405224-b2a4-493d-b619-19ad8152d190)
>> [147334.404808] ath10k: hardware name qca988x hw2.0 version 0x4100016c
>> [147334.411111] ath10k: firmware version: 10.1.467-ct-community-full-013
>> [147334.429603] ath10k: failed to read diag value at 0x1300804: -16
>> [147334.435647] ath10k: failed to read FW dump area address: -16
> 
> I see this rarely. Mostly when the device goes bonkers at which point
> warm reset doesn't work anymore and I'm forced to either risk cold
> reset causing platform lock up or re-inject the card in the express
> card slot.
> 
> I haven't played with this so I don't know if DMA is still possible
> (it might not). MMIO should be operational and there should be some
> scratch registers chilling around... ;-)

To normally read the crash dump, we do this over a CE pipe?

So, if IRQ handlers are thoroughly busted on the target, then
that could be reason why we cannot read the crash dump?

If I were to use MMIO, what sort of things could I get
access to?  Just registers you think?  I might could tweak
the firmware assert routine to scribble the crash register
contents into a specific place, perhaps a bit at a time
so that the host could read it if normal crash dump read
fails?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
