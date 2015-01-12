Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAiFM-0000wa-0r
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 16:53:44 +0000
Message-ID: <54B3FC02.9020404@candelatech.com>
Date: Mon, 12 Jan 2015 08:53:22 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on CE_DESC_FLAGS_META_DATA field.
References: <54B01892.4080609@candelatech.com>
 <CA+BoTQkAb+sn4nSZ+E=w1yp_fHK=5HuLs-mtjvJ3ZC6WFX9iFw@mail.gmail.com>
In-Reply-To: <CA+BoTQkAb+sn4nSZ+E=w1yp_fHK=5HuLs-mtjvJ3ZC6WFX9iFw@mail.gmail.com>
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

On 01/11/2015 11:42 PM, Michal Kazior wrote:
> On 9 January 2015 at 19:06, Ben Greear <greearb@candelatech.com> wrote:
>> While poking in the CE code, I notice this below.
>>
>> Shouldn't the CE_DESC_FLAGS_META_DATA_LSB be 2, and if not,
>> can someone explain why?
>>
>> [greearb@ben-dt2 ath10k]$ grep CE_DESC_FLAGS_META_DATA *h
>> ce.h:#define CE_DESC_FLAGS_META_DATA_MASK 0xFFFC
>> ce.h:#define CE_DESC_FLAGS_META_DATA_LSB  3
> 
> Nice catch!
> 
> This shouldn't have been harmful though. Meta data part is used to
> store htc endpoint ids which shouldn't overflow the mask even with
> lsb=3 and as far as I know neither CE nor firmware cares what is
> stored there.

Ok, I'll fix this in my tree and post a patch sometime soon.

Upstream 10.1 firmware does ignore the transfer_id, but I am
fixing that in my firmware to aid debugging (and fixing ath10k
driver to use it for debugging as well).

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
