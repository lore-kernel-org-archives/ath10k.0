Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bD0zj-00043o-VB
 for ath10k@lists.infradead.org; Wed, 15 Jun 2016 02:55:56 +0000
MIME-Version: 1.0
Date: Wed, 15 Jun 2016 08:25:34 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: Regression in qca99x0 on x86 platform (kernel: 4.7.0-rc1-wt-ath
In-Reply-To: <57600A3C.9000104@candelatech.com>
References: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
 <57506C7A.7070109@candelatech.com>
 <c3facd0acc1c2f49f4a4638bf0c2a591@codeaurora.org>
 <57507269.1060108@candelatech.com>
 <ac15f3e10cedc20199051bab88b36eba@codeaurora.org>
 <57600A3C.9000104@candelatech.com>
Message-ID: <f91f033b77e415fc14f94d5890115e09@codeaurora.org>
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

On 2016-06-14 19:14, Ben Greear wrote:
> On 06/13/2016 11:21 PM, Rajkumar Manoharan wrote:
>> On 2016-06-02 23:22, Ben Greear wrote:
> 
>>> At the time, I bisected to this commit as well, but I decided to just
>>> live with it
>>> since it seemed it fixed some other bug and we had a work-around.  My
>>> understanding
>>> is that without the patch above, some ARM systems failed to work.
>>> 
>> Ben,
>> 
>> I posted a fix for the freeze issue 
>> (https://patchwork.kernel.org/patch/9175029/). Can you please give a 
>> try with VT-d disabled?
>> 
>> -Rajkumar
> 
> Yes, but it might be a bit.  I just ported my patches to 4.7, and will 
> add yours
> there.  We are mainly focussed on getting a stable 4.4+ out the door
> currently though.
> 
Thanks..

> Were you able to test on the ARM platform that originally had the 
> problem that
> Felix's patch was supposed to fix?
> 
I tested this patch on ARM platform. Unfortunately I did not observe 
original dma_alloc_coherent failures. Felix replaced dma_alloc_coherent 
by kmalloc + dma_map_single. I retained the logic as it is. Thee change 
is that host memory chuck size for target is limited by 256 KiB.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
