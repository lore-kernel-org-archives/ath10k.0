Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyh6t-0002Tu-M4
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 17:01:37 +0000
Subject: Re: [ath10k] not working in 64 bit with >2GB Ram
References: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
 <760892ee-c949-b0e4-fdb7-93859f753691@candelatech.com>
 <CAJsuzOXKb2Q40PCb5=FbU6BSePVUH9yBSVaf-8UXDtfVnHuScA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <e2cedf15-050b-7853-8651-97e4f3e4760d@candelatech.com>
Date: Wed, 21 Mar 2018 10:00:56 -0700
MIME-Version: 1.0
In-Reply-To: <CAJsuzOXKb2Q40PCb5=FbU6BSePVUH9yBSVaf-8UXDtfVnHuScA@mail.gmail.com>
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
To: paresh chaudhary <chaudharyparesh1986@gmail.com>
Cc: ath10k@lists.infradead.org

On 03/21/2018 09:56 AM, paresh chaudhary wrote:
> We also tried  4.15  but we are getting the same error.
>
>
> After some more investigation, We have found that when the virtual address of data pointer (a member of sk_buff) is above ~3.7 GB RAM address range then return
> address from dma_map_single API is failed to validate in dma_mapping_error function.
>
> We also noticed that in a 64bit machine some time ping is working and because of the virtual address is under ~3.7GAM RAM address range.
> *Case 1. 64bit with restrict memory with 'mem' command from uboot. Here virtual address will be within 2GB range so ping will never fail.*
>
>
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d7e30
> ath10k_htt_tx:468, Address of skb_cb->paddr=2d0d7e30
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d7e30
> ath10k_htt_tx:468, Address of skb_cb->paddr=2d0d7e30
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d6e30
> ath10k_htt_tx:468, Address of skb_cb->paddr=2d0d6e30
> ath10k_htt_tx:465, Address of msdu->data=c000000073f20c30
> ath10k_htt_tx:468, Address of skb_cb->paddr=73f20c30
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d6e30
> ath10k_htt_tx:468, Address of skb_cb->paddr=2d0d6e30
> ath10k_htt_tx:465, Address of msdu->data=c000000073f20630
> ath10k_htt_tx:468, Address of skb_cb->paddr=73f20630
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d6e30
> ath10k_htt_tx:468, Address of skb_cb->paddr=2d0d6e30
> ath10k_htt_tx:465, Address of msdu->data=c000000073f20630
> ath10k_htt_tx:468, Address of skb_cb->paddr=73f20630
> ath10k_htt_tx:465, Address of msdu->data=c00000002d0d6e30
>
>
>
>
>
> *Case 2. 64bit without any memory restriction. I also added a description in a dmesg log to understand virtual address range issue.*
>
>
>
> ath10k_htt_tx:465, Address of msdu->data=c0000001eac22830        (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c00000007bcc2830        *(PASS) (Here lower bit(7bcc2830) is under ~3.7 Ram address range)*
> ath10k_htt_tx:468, Address of skb_cb->paddr=7bcc2830           *  (Here dma_map_single api return correct mapping address becuase of cpu virtual address range
> under ~3.7 ramaddress) *
> ath10k_htt_tx:465, Address of msdu->data=c0000001eac24030       * (FAIL) (Here lower bit(1eac24030) is above ~3.7 Ram address range)*
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000          *   (Here dma_map single api return address failed to validate  in dma_mapping_error)*
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c0000001eacee030             (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c0000001eac26830         (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c0000001eacee030               (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c0000001eac26830        (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
> ath10k_htt_tx:465, Address of msdu->data=c00000007bcc2a30       (Pass)
> ath10k_htt_tx:468, Address of skb_cb->paddr=7bcc2a30
> ath10k_htt_tx:465, Address of msdu->data=c0000001eacef630            (Fail)
> ath10k_htt_tx:468, Address of skb_cb->paddr=fbff7000
> ath10k_pci 0001:01:00.0: failed to transmit packet, dropping: -5
>
>
>
> As per my understanding, In 32bit machine limit of a virtual address is 4GB so we are not facing this issue on a 32bit machine.
>
> I have added all debug print in drivers/net/wireless/ath/ath10k/htt_tx.c file.

Maybe this is some specific issue with DMA and your platform.  I am afraid
that I do not understand this well enough to help.  But, at least testing
with a recent kernel might encourage others to post some suggestions.

ath10k driver works fine with x86-64 platform with 8+ GB RAM, we
use that all the time.

Thanks,
Ben


>
>
>
>
>
>
>
>
>
> *Regards,
> Chaudhary Paresh*
>
>
>
> On Wed, Mar 21, 2018 at 11:51 AM, Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>> wrote:
>
>     On 03/21/2018 09:38 AM, paresh chaudhary wrote:
>
>         Hi Team,
>
>         We need your help regarding ath10k module.
>
>         We are using ath10k wifi module with T1040 processor. We have total 8GB DDR in a system.
>
>         The ath10k is working fine on a 32bit system but it's not working on 64 bit system. We are getting error ( ath10k_pci 0001:01:00.0: failed to transmit
>         packet : drivers/net/wireless/ath/ath10k/mac.c).
>
>
>         NOTE: One interesting point is that when we set DDR size is equal to 2GB from uboot console rather than to use full 8GB  (setenv bootargs "root=/dev/ram
>         rw console=ttyS0,115200 quiet mem=2050M") then ath10k is working fine on a 64bit machine.
>
>
>         Is it related to DMA? Do you have a patch to resolve this?
>
>
>         We are using linux-fsl-sdk-v2.0 ( 4.1.35) from nxp.
>
>
>     You are using an old kernel with unknown patches applied on a CPU architecture
>     most of us do not use.
>
>     Probably it is DMA related, if you google for ath10k and DMA you should find some
>     patches that might help.
>
>     Probably you will want to update to an ath10k driver from 4.7 kernel or higher,
>     maybe using the backports project or something like that.
>
>     Your vendor might can help you with that, and if not, then maybe find a better
>     vendor with more up-to-date software and/or a platform that supports something modern
>     like a recent OpenWRT release.
>
>     Thanks,
>     Ben
>
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
