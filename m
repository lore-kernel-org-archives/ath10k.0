Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8WPc-0003et-TL
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 17:28:07 +0000
Subject: Re: Regression in qca99x0 on x86 platform (kernel: 4.7.0-rc1-wt-ath
References: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57506C7A.7070109@candelatech.com>
Date: Thu, 2 Jun 2016 10:27:22 -0700
MIME-Version: 1.0
In-Reply-To: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "nbd@openwrt.org" <nbd@openwrt.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 06/02/2016 10:20 AM, Manoharan, Rajkumar wrote:
> Found a regression in ath.git TOT that system hangs while probing qca99x0 device on x86_64 platform.
> It seems the system hangs while DMA mapping of bigger memory chunks. Below are the list of memory
> chucks requested by target for qca99x0 during service ready event. This issue is seen only on x86 platform.
> No issues are observed on ARM platform (AP148). After reverting below commit able to bring up device on x86.
>
> Jun  2 17:24:37 rmanohar-arch kernel: idx 0 pool_size 689816 num_units 529 unit_len 1304
> Jun  2 17:24:37 rmanohar-arch kernel: idx 1 pool_size 17152 num_units 67 unit_len 256
> Jun  2 17:24:37 rmanohar-arch kernel: idx 2 pool_size 68608 num_units 67 unit_len 1024
> Jun  2 17:24:37 rmanohar-arch kernel: idx 3 pool_size 274432 num_units 67 unit_len 4096
> Jun  2 17:24:37 rmanohar-arch kernel: idx 4 pool_size 107520 num_units 35 unit_len 3072
> Jun  2 17:24:37 rmanohar-arch kernel: idx 5 pool_size 6144 num_units 1 unit_len 6144
> Jun  2 17:24:37 rmanohar-arch kernel: idx 6 pool_size 865444 num_units 529 unit_len 1636

We have seen similar.  But, if we enable VT-d in our BIOS, then it works, at least in
our scenarios.  I have not tried putting more than one 99x0 NIC in a system to date, so possibly
more than one would cause more issues, and I guess systems without VT-d might
fail too...

Thanks,
Ben


>
> commit b057886524be060021e3cfad0ba8458c850330cd
> Author: Felix Fietkau <nbd@openwrt.org>
> Date:   Mon Nov 30 19:32:01 2015 +0100
>
>      ath10k: do not use coherent memory for allocated device memory chunks
>
>      Coherent memory is more expensive to allocate (and constrained on some
>      architectures where it has to be pre-allocated). It is also completely
>      unnecessary, since the host has no reason to even access these allocated
>      memory spaces
>
>      Signed-off-by: Felix Fietkau <nbd@openwrt.org>
>      Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> -Rajkumar
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
