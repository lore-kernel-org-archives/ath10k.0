Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8rYq-000664-30
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 16:03:00 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Regression in qca99x0 on x86 platform (kernel: 4.7.0-rc1-wt-ath
Date: Fri, 3 Jun 2016 16:02:28 +0000
Message-ID: <87wpm6uup8.fsf@kamboji.qca.qualcomm.com>
References: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
In-Reply-To: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 2 Jun 2016 17:20:06 +0000")
Content-Language: en-US
Content-ID: <054114B330EFB24EBD0A5292DCF458FA@qualcomm.com>
MIME-Version: 1.0
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "nbd@nbd.name" <nbd@nbd.name>

(Fixing Felix' address to nbd@nbd.name)

"Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com> writes:

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

Did you enable kernel debugging features, like deplock, memory
poisoning, DMA-API debug etc? They might give more hints why it's
failing. We should get bottom of this.

Felix, in case you missed because of the old email address the commit
is:

commit b057886524be060021e3cfad0ba8458c850330cd
Author: Felix Fietkau <nbd@openwrt.org>
Date:   Mon Nov 30 19:32:01 2015 +0100

    ath10k: do not use coherent memory for allocated device memory chunks
    
    Coherent memory is more expensive to allocate (and constrained on some
    architectures where it has to be pre-allocated). It is also completely
    unnecessary, since the host has no reason to even access these allocated
    memory spaces
    
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
