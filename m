Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm13-vm0.bullet.mail.bf1.yahoo.com ([98.139.213.79])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzNrl-0004YA-Jh
 for ath10k@lists.infradead.org; Thu, 19 Nov 2015 11:59:06 +0000
Date: Thu, 19 Nov 2015 11:58:38 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <1749993920.7465237.1447934318588.JavaMail.yahoo@mail.yahoo.com>
Subject: Yesterdays kernel/git/kvalo/ath.git failes with COMPEX WLE600VX
MIME-Version: 1.0
References: <1749993920.7465237.1447934318588.JavaMail.yahoo.ref@mail.yahoo.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello all,
Kalles current git tree fails to initialize my COMPEX WLE600VX. The kernel log shows
[   16.373978] ath10k_pci 0000:05:00.0: failed to wake up device : -110
[   16.374118] ath10k_pci: probe of 0000:05:00.0 failed with error -110


For comparison, with 3.18.24 I get:
[   16.083400] ath10k_pci 0000:05:00.0: irq 18 for MSI/MSI-X
[   16.083443] ath10k_pci 0000:05:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[   16.408686] ath10k_pci 0000:05:00.0: Direct firmware load for ath10k/QCA988X/hw2.0/firmware-3.bin failed with error -2
[   16.408697] ath10k_pci 0000:05:00.0: Falling back to user helper
[   16.411071] ath10k_pci 0000:05:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-3.bin': -11
[   17.845673] ath10k_pci 0000:05:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw 10.1.467.2-1 api 2 htt 2.1
[   17.845685] ath10k_pci 0000:05:00.0: debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
[   18.426968] ath10k_pci 0000:05:00.0 ap: renamed from wlan0
[   35.073267] ath10k_pci 0000:05:00.0: peer-unmap-event: unknown peer id 2
[   39.294061] ath10k_pci 0000:05:00.0: peer-unmap-event: unknown peer id 2
[   46.083727] ath10k_pci 0000:05:00.0: peer-unmap-event: unknown peer id 2


The problem with Kalles GIT tree is 100% reproducible. I don't know when this problem came up.
 -- Regards       Joerg

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
