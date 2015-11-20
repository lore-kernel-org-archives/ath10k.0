Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzjyO-0008Pl-Kj
 for ath10k@lists.infradead.org; Fri, 20 Nov 2015 11:35:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Yesterdays kernel/git/kvalo/ath.git failes with COMPEX WLE600VX
References: <1749993920.7465237.1447934318588.JavaMail.yahoo.ref@mail.yahoo.com>
 <1749993920.7465237.1447934318588.JavaMail.yahoo@mail.yahoo.com>
Date: Fri, 20 Nov 2015 13:34:48 +0200
In-Reply-To: <1749993920.7465237.1447934318588.JavaMail.yahoo@mail.yahoo.com>
 (Joerg Pommnitz's message of "Thu, 19 Nov 2015 11:58:38 +0000 (UTC)")
Message-ID: <87a8q8uco7.fsf@kamboji.qca.qualcomm.com>
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
To: Joerg Pommnitz <pommnitz@yahoo.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Joerg Pommnitz <pommnitz@yahoo.com> writes:

> Hello all,
> Kalles current git tree fails to initialize my COMPEX WLE600VX. The kernel log shows
> [   16.373978] ath10k_pci 0000:05:00.0: failed to wake up device : -110
> [   16.374118] ath10k_pci: probe of 0000:05:00.0 failed with error -110

Can you send full dmesg, right from the beginning of the boot, please?
It might give some hints.

I have a similar problem in one of my laptop (lenovo thinkpad x230). The
patch below helps with that one, but I haven't investigated it more yet.

--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2811,6 +2811,18 @@ static int ath10k_pci_claim(struct ath10k *ar)
 
        pci_set_drvdata(pdev, ar);
 
+       /*
+        * Without any knowledge of the Host, the Target may have been
reset or
+        * power cycled and its Config Space may no longer reflect the
PCI
+        * address space that was assigned earlier by the PCI
infrastructure.
+        * Refresh it now.
+        */
+       ret = pci_assign_resource(pdev, BAR_NUM);
+       if (ret) {
+               ath10k_err(ar, "failed to assign PCI space: %d\n", ret);
+               return ret;
+       }
+
        ret = pci_enable_device(pdev);
        if (ret) {
                ath10k_err(ar, "failed to enable pci device: %d\n",
                ret);


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
