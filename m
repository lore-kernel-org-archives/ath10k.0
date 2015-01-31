Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHLpw-0003dq-9P
 for ath10k@lists.infradead.org; Sat, 31 Jan 2015 00:22:56 +0000
Message-ID: <54CC203D.9030309@qca.qualcomm.com>
Date: Fri, 30 Jan 2015 16:22:21 -0800
From: Peter Oh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Replace ioread with mb to drain write buffer
References: <7a87e5df81499e4d26a4f8bedf76ed3250a6f7bb.1422663244.git.poh@qca.qualcomm.com>
In-Reply-To: <7a87e5df81499e4d26a4f8bedf76ed3250a6f7bb.1422663244.git.poh@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org


On 01/30/2015 04:14 PM, Peter Oh wrote:
> Using ioread() to perform draining write buffer is excessive.
> Use compact API, mb(), that intended to be used for the case.
> It reduces total 14 CPU clocks per interrupt.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/pci.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index e6972b0..f1e6980 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -353,10 +353,8 @@ static void ath10k_pci_disable_and_clear_legacy_irq(struct ath10k *ar)
>   	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
>   			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
>   
> -	/* IMPORTANT: this extra read transaction is required to
> -	 * flush the posted write buffer. */
> -	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
> -				PCIE_INTR_ENABLE_ADDRESS);
> +	/* drain write buffer */
> +	mb();
It figured out that ath10k_pci_read32() use dsb with 'st' while wmb() is 
use with 'sy'.
So updated it from wmb() to mb() for the same effect as ath10k_pci_read32().
>   }
>   
>   static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
> @@ -365,10 +363,8 @@ static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
>   			   PCIE_INTR_ENABLE_ADDRESS,
>   			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
>   
> -	/* IMPORTANT: this extra read transaction is required to
> -	 * flush the posted write buffer. */
> -	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
> -				PCIE_INTR_ENABLE_ADDRESS);
> +	/* drain write buffer */
> +	mb();
>   }
>   
>   static inline const char *ath10k_pci_get_irq_method(struct ath10k *ar)
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
