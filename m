Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bR56p-0005pZ-No
 for ath10k@lists.infradead.org; Sat, 23 Jul 2016 22:09:24 +0000
Message-ID: <5793E7D9.60707@candelatech.com>
Date: Sat, 23 Jul 2016 14:55:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <5792A189.5050807@candelatech.com>
 <6495e664-5da8-a11b-0bd5-15dc24c51edf@dd-wrt.com>
In-Reply-To: <6495e664-5da8-a11b-0bd5-15dc24c51edf@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, rmanohar@codeaurora.org, Felix Fietkau <nbd@nbd.name>



On 07/23/2016 02:11 AM, Sebastian Gottschall wrote:
> from my point of view this patch is just shit. it trunkates the maximum allocated memory to a certain value.
> so firmware requests 800 kb memory but just gets 256kb. so out of bound memory access is guaranteed at all.

At least some of the firmware logic attempts to deal with this segmentation.  9984 firmware had bugs in one area that I fixed,
but probably there are other bugs and that is why it fails for 9980 firmware.

Even if I fix my firmware, that doesn't help everyone else with stock firmware.

At best, maybe enable this type of logic for only exact firmware with proper feature
flag showing that it is known to work with it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
