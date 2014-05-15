Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktDO-0003Dj-5x
 for ath10k@lists.infradead.org; Thu, 15 May 2014 10:48:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: improve warm reset reliability
References: <1400050658-2763-1-git-send-email-michal.kazior@tieto.com>
 <1400050658-2763-2-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 May 2014 13:48:16 +0300
In-Reply-To: <1400050658-2763-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 14 May 2014 08:57:37 +0200")
Message-ID: <87r43v9v2n.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Warm reset is now able to recover after device
> crashes which required a cold reset before.
>
> This should greatly reduce chances of getting data
> bus errors or host system freezes due to buggy
> cold reset on some chips.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Awesome! This is very much needed. I just have a cosmetic comment:

> +/* this function effectively clears target memory controller assert line */
> +static void ath10k_pci_warm_reset_si0(struct ath10k *ar)
> +{
> +	u32 val;
> +
> +	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
> +				SOC_RESET_CONTROL_ADDRESS);
> +	ath10k_pci_write32(ar, RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS,
> +			   val | SOC_RESET_CONTROL_SI0_RST_MASK);
> +	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
> +				SOC_RESET_CONTROL_ADDRESS);

We do have the ath10k_pci_soc_ functions for accessing SOC registers, I
would prefer to use those here. I now modified your patch with the diff
below. Is that ok to you?

--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1807,20 +1807,18 @@ static void ath10k_pci_warm_reset_si0(struct ath10k *ar)
 {
        u32 val;
 
-       val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
-                               SOC_RESET_CONTROL_ADDRESS);
-       ath10k_pci_write32(ar, RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS,
-                          val | SOC_RESET_CONTROL_SI0_RST_MASK);
-       val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
-                               SOC_RESET_CONTROL_ADDRESS);
+       val = ath10k_pci_soc_read32(ar, SOC_RESET_CONTROL_ADDRESS);
+       ath10k_pci_soc_write32(ar, SOC_RESET_CONTROL_ADDRESS,
+                              val | SOC_RESET_CONTROL_SI0_RST_MASK);
+       val = ath10k_pci_soc_read32(ar, SOC_RESET_CONTROL_ADDRESS);
+
        msleep(10);
 
-       val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
-                               SOC_RESET_CONTROL_ADDRESS);
-       ath10k_pci_write32(ar, RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS,
-                          val & ~SOC_RESET_CONTROL_SI0_RST_MASK);
-       val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
-                               SOC_RESET_CONTROL_ADDRESS);
+       val = ath10k_pci_soc_read32(ar, SOC_RESET_CONTROL_ADDRESS);
+       ath10k_pci_soc_write32(ar, SOC_RESET_CONTROL_ADDRESS,
+                              val & ~SOC_RESET_CONTROL_SI0_RST_MASK);
+       val = ath10k_pci_soc_read32(ar, SOC_RESET_CONTROL_ADDRESS);
+
        msleep(10);
 }

Full patch here:

https://github.com/kvalo/ath/commit/7b52054308a371d479a9e686e1d8411d19a90fd7

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
