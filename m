Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eygxO-0004RS-PL
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 16:51:24 +0000
Subject: Re: [ath10k] not working in 64 bit with >2GB Ram
References: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <760892ee-c949-b0e4-fdb7-93859f753691@candelatech.com>
Date: Wed, 21 Mar 2018 09:51:04 -0700
MIME-Version: 1.0
In-Reply-To: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
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
To: paresh chaudhary <chaudharyparesh1986@gmail.com>, ath10k@lists.infradead.org

On 03/21/2018 09:38 AM, paresh chaudhary wrote:
> Hi Team,
>
> We need your help regarding ath10k module.
>
> We are using ath10k wifi module with T1040 processor. We have total 8GB DDR in a system.
>
> The ath10k is working fine on a 32bit system but it's not working on 64 bit system. We are getting error ( ath10k_pci 0001:01:00.0: failed to transmit packet : drivers/net/wireless/ath/ath10k/mac.c).
>
>
> NOTE: One interesting point is that when we set DDR size is equal to 2GB from uboot console rather than to use full 8GB  (setenv bootargs "root=/dev/ram rw console=ttyS0,115200 quiet mem=2050M") then ath10k is working fine on a 64bit machine.
>
>
> Is it related to DMA? Do you have a patch to resolve this?
>
>
> We are using linux-fsl-sdk-v2.0 ( 4.1.35) from nxp.

You are using an old kernel with unknown patches applied on a CPU architecture
most of us do not use.

Probably it is DMA related, if you google for ath10k and DMA you should find some
patches that might help.

Probably you will want to update to an ath10k driver from 4.7 kernel or higher,
maybe using the backports project or something like that.

Your vendor might can help you with that, and if not, then maybe find a better
vendor with more up-to-date software and/or a platform that supports something modern
like a recent OpenWRT release.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
