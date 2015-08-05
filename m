Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMxhZ-00065q-5w
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 12:21:45 +0000
Subject: Re: [PATCH] ath10k: Add QCA99X0 to supported device list
References: <1437478567-11339-1-git-send-email-vthiagar@qti.qualcomm.com>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <55C1FFBC.7070905@openwrt.org>
Date: Wed, 5 Aug 2015 14:21:16 +0200
MIME-Version: 1.0
In-Reply-To: <1437478567-11339-1-git-send-email-vthiagar@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org

On 2015-07-21 13:36, Vasanthakumar Thiagarajan wrote:
> Add vendor/device id of QCA99X0 V2.0 to pci id table and
> QCA99X0_HW_2_0_CHIP_ID_REV to ath10k_pci_supp_chips[] for
> QCA99X0 to get detected by the driver.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
I just tested a 99X0 card, and I'm getting this:

[    8.742514] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
[    8.747173] ath10k_pci 0000:01:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[   11.793314] ath10k_pci 0000:01:00.0: failed to receive initialized event from target: 00000000
[   11.793344] ath10k_pci 0000:01:00.0: failed to wait for target after cold reset: -110
[   11.800814] ath10k_pci 0000:01:00.0: failed to reset chip: -110
[   11.809228] ath10k_pci: probe of 0000:01:00.0 failed with error -110

This is on an AP148 board with Linux 3.18, backports generated from
latest wireless-testing (2015-08-03) + all patches from kvalo's ath
tree.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
