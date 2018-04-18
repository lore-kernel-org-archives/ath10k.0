Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8qJd-0000Oi-Bu
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 16:52:19 +0000
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
 <87vacompp1.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <3cf55d70-0f63-6aeb-ec6a-3b52f4871d60@candelatech.com>
Date: Wed, 18 Apr 2018 09:52:01 -0700
MIME-Version: 1.0
In-Reply-To: <87vacompp1.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k <ath10k@lists.infradead.org>

On 04/18/2018 09:42 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> It seems the upstream board-2.bin file for 9984 does not yet include
>> support for WLE1216V5-20 (or possibly it does and OpenWRT grabs the
>> wrong one?).
>>
>> I'm attaching the board file for this NIC and for another one which I
>> have not yet tested. I received these from Compex and have tested the
>> bus=pci,bmi-chip-id=0,bmi-board-id=31-compex.bin file on the
>> WLE1216V5-20
>>
>> Please add these into the official board-2.bin for 9984.
>
> Are these the actual board names I should use:
>
> bus=pci,bmi-chip-id=0,bmi-board-id=31
> bus=pci,bmi-chip-id=0,bmi-board-id=30

Yes, I think so.  If you want to send me the bin file your tools create
before you commit, I will be happy to load it on my system with the compex
NIC and make sure it works as expected.

Thanks,
Ben

>
> In the attached filenames you have the -compex suffix but I don't think
> I should use those:
>
> [2. application/x-macbinary; bus=pci,bmi-chip-id=0,bmi-board-id=31-compex.bin]...
> [3. application/x-macbinary; bus=pci,bmi-chip-id=0,bmi-board-id=30-compex.bin]...
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
