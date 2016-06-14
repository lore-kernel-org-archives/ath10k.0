Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bChjl-0002ZB-0X
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 06:22:09 +0000
MIME-Version: 1.0
Date: Tue, 14 Jun 2016 11:51:48 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: Regression in qca99x0 on x86 platform (kernel: 4.7.0-rc1-wt-ath
In-Reply-To: <57507269.1060108@candelatech.com>
References: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
 <57506C7A.7070109@candelatech.com>
 <c3facd0acc1c2f49f4a4638bf0c2a591@codeaurora.org>
 <57507269.1060108@candelatech.com>
Message-ID: <ac15f3e10cedc20199051bab88b36eba@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: nbd@openwrt.org, ath10k@lists.infradead.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, nbd@nbd.name

On 2016-06-02 23:22, Ben Greear wrote:
> On 06/02/2016 10:46 AM, Rajkumar Manoharan wrote:
>> On 2016-06-02 22:57, Ben Greear wrote:
>>> On 06/02/2016 10:20 AM, Manoharan, Rajkumar wrote:
>>>> Found a regression in ath.git TOT that system hangs while probing 
>>>> qca99x0 device on x86_64 platform.
>>>> It seems the system hangs while DMA mapping of bigger memory chunks. 
>>>> Below are the list of memory
>>>> chucks requested by target for qca99x0 during service ready event. 
>>>> This issue is seen only on x86 platform.
>>>> No issues are observed on ARM platform (AP148). After reverting 
>>>> below commit able to bring up device on x86.
>>>> 
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 0 pool_size 689816 
>>>> num_units 529 unit_len 1304
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 1 pool_size 17152 
>>>> num_units 67 unit_len 256
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 2 pool_size 68608 
>>>> num_units 67 unit_len 1024
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 3 pool_size 274432 
>>>> num_units 67 unit_len 4096
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 4 pool_size 107520 
>>>> num_units 35 unit_len 3072
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 5 pool_size 6144 num_units 
>>>> 1 unit_len 6144
>>>> Jun  2 17:24:37 rmanohar-arch kernel: idx 6 pool_size 865444 
>>>> num_units 529 unit_len 1636
>>> 
>>> We have seen similar.  But, if we enable VT-d in our BIOS, then it
>>> works, at least in
>>> our scenarios.  I have not tried putting more than one 99x0 NIC in a
>>> system to date, so possibly
>>> more than one would cause more issues, and I guess systems without 
>>> VT-d might
>>> fail too...
>>> 
>> Yeah.. But the code should work even on non-VT-d systems. ins't it?
> 
> It would be great if it did.
> 
>>>> commit b057886524be060021e3cfad0ba8458c850330cd
>>>> Author: Felix Fietkau <nbd@openwrt.org>
>>>> Date:   Mon Nov 30 19:32:01 2015 +0100
>>>> 
>>>>      ath10k: do not use coherent memory for allocated device memory 
>>>> chunks
>>>> 
>>>>      Coherent memory is more expensive to allocate (and constrained 
>>>> on some
>>>>      architectures where it has to be pre-allocated). It is also 
>>>> completely
>>>>      unnecessary, since the host has no reason to even access these 
>>>> allocated
>>>>      memory spaces
>>>> 
>>>>      Signed-off-by: Felix Fietkau <nbd@openwrt.org>
>>>>      Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>>> 
>>>> 
>> Ben,
>> 
>> Can you help to confirm this issue by disabling VT-d and bring up 
>> qca99x0? If it freezes, try reverting the patch.
> 
> At the time, I bisected to this commit as well, but I decided to just
> live with it
> since it seemed it fixed some other bug and we had a work-around.  My
> understanding
> is that without the patch above, some ARM systems failed to work.
> 
Ben,

I posted a fix for the freeze issue 
(https://patchwork.kernel.org/patch/9175029/). Can you please give a try 
with VT-d disabled?

-Rajkumar


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
