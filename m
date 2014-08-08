Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFhgQ-0003ye-F4
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 10:46:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/6] ath10k: remove target soc ps code
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 <1407402212-29809-3-git-send-email-michal.kazior@tieto.com>
Date: Fri, 8 Aug 2014 13:45:31 +0300
In-Reply-To: <1407402212-29809-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:03:28 +0200")
Message-ID: <878umzz2d0.fsf@kamboji.qca.qualcomm.com>
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

> The soc powersave was disabled by default. It
> never was fully tested. Some hw apparently had
> problems with it and the implementation itself had
> a possible race.
>
> Just remove the refcounting and simply wake up the
> device when probing and put to sleep when
> removing.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This one introduced new warnings:

drivers/net/wireless/ath/ath10k/pci.c:646:5: warning: symbol 'ath10k_pci_wake' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/pci.c:653:6: warning: symbol 'ath10k_pci_sleep' was not declared. Should it be static?

Is it okay if I fix it like this:

--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -643,14 +643,14 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
        return -ETIMEDOUT;
 }
 
-int ath10k_pci_wake(struct ath10k *ar)
+static int ath10k_pci_wake(struct ath10k *ar)
 {
        ath10k_pci_reg_write32(ar, PCIE_SOC_WAKE_ADDRESS,
                               PCIE_SOC_WAKE_V_MASK);
        return ath10k_pci_wake_wait(ar);
 }
 
-void ath10k_pci_sleep(struct ath10k *ar)
+static void ath10k_pci_sleep(struct ath10k *ar)
 {
        ath10k_pci_reg_write32(ar, PCIE_SOC_WAKE_ADDRESS,
                               PCIE_SOC_WAKE_RESET);


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
