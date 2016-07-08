Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLWIY-0004DN-S5
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 13:58:31 +0000
Message-ID: <577FB15B.3050907@candelatech.com>
Date: Fri, 08 Jul 2016 06:57:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: AR9882 IOMMU faults
References: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
 <1467983388208.13042@qti.qualcomm.com>
In-Reply-To: <1467983388208.13042@qti.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, Ben Skeggs <bskeggs@redhat.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 07/08/2016 06:09 AM, Manoharan, Rajkumar wrote:
> Logs are so limited. If possible, revert below commit and give a try
>
> "ath10k: do not use coherent memory for allocated device memory chunks"
>
> If revert is not so clean, try with this patch.
>
> https://patchwork.kernel.org/patch/9175029/

I use this patch, I don't think it is upstream, and per comment, I have not
tested this on other than x86 platform:

[greearb@ben-dt ath10k]$ git show 0e6e6f6b2
commit 0e6e6f6b2fac0ade990de56eef3841dbe7128f35
Author: Ben Greear <greearb@candelatech.com>
Date:   Thu Jan 21 18:57:11 2016 -0800

     ath10k:  wmi-alloc-chunk should use DMA_BIDIRECTIONAL.

     These memory chunks are often used as 'swap' by the NIC,
     so it will be both reading and writing to these areas.

     This seems to fix errors like this on my x86-64 machine:

     kernel: DMAR: DMAR:[DMA Write] Request device [05:00.0] fault addr ff5de000
             DMAR:[fault reason 05] PTE Write access is not set

     Should be tested and verified by someone who uses other platforms
     though...

     Signed-off-by: Ben Greear <greearb@candelatech.com>

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index af37a77..502f0e0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4404,7 +4404,7 @@ static int ath10k_wmi_alloc_chunk(struct ath10k *ar, u32 req_id,
         if (!num_units)
                 return -ENOMEM;

-       paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVICE);
+       paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_BIDIRECTIONAL);
         if (dma_mapping_error(ar->dev, paddr)) {
                 kfree(vaddr);
                 return -ENOMEM;
[greearb@ben-dt ath10k]$

>
> -Rajkumar
> ________________________________________
> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Ben Skeggs <bskeggs@redhat.com>
> Sent: Friday, July 8, 2016 10:59 AM
> To: ath10k@lists.infradead.org
> Subject: AR9882 IOMMU faults
>
> Hey,
>
> I've just installed a COMPEX WLE600VX (AR9882) in my router machine,
> operating in AP mode.
>
> While it appears to be working well enough, I get massive floods of
> IOMMU faults reported in my kernel log.  These appear to increase with
> the load on the network.
>
> I've attached both the info that ath10k reports when it detects the
> device, and a sample of one of the DMAR messages (worth nothing that
> it's the same fault address in all the messages).
>
> Is this a known issue, and anything I can do to help get it resolved?
>
> Thanks,
> Ben.
>
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
