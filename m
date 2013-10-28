Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vao8o-0007Cq-Ko
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 14:50:04 +0000
Message-ID: <526E7979.8040202@candelatech.com>
Date: Mon, 28 Oct 2013 07:49:29 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: DMAR faults?
References: <5266B204.8030901@candelatech.com>
 <8761sheoom.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8761sheoom.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

On 10/28/2013 02:21 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Any idea what this means?  The 05:00.0 is the ath10k device...
>>
>> ath10k_pci 0000:05:00.0: BAR 0: assigned [mem 0xf4400000-0xf45fffff 64bit]
>> ath10k: MSI-X interrupt handling (8 intrs)
>> dmar: DRHD: handling fault status reg 3
>> dmar: DMAR:[DMA Write] Request device [05:00.0] fault addr ffe46000
>> DMAR:[fault reason 02] Present bit in context entry is clear
>
> I guess you have iommu enabled? I think that means ath10k device tried
> to write to a memory area which was not mapped by the driver.
>
>> ath10k: Hardware name qca988x hw2.0 version 0x4100016c
>> ath10k: UART prints disabled
>> ath10k: firmware 999.999.0.636 booted
>> ath10k: htt target version 2.1
>> ath10k: Completion buffers are full
>
> Timestamps would be really useful. How fast did you get that completion
> buffers are full message?

These mostly happen after I crash firmware if I remember corectly.
I haven't looked closely yet.

I'm using a normal-ish Intel core-i7 system with 64-bit Fedora 19
OS.  Probably iommu is enabled.


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
