Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Esk-0003eL-VE
 for ath10k@lists.infradead.org; Fri, 21 Feb 2020 20:26:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id n10so3467706wrm.1
 for <ath10k@lists.infradead.org>; Fri, 21 Feb 2020 12:26:42 -0800 (PST)
MIME-Version: 1.0
From: Cale Collins <ccollins@gateworks.com>
Date: Fri, 21 Feb 2020 12:26:04 -0800
Message-ID: <CAG2Q2vXt3af3ATRnFNW8bA2BbaQ47fLsS1dL1iJ6JGQg=kbJSQ@mail.gmail.com>
Subject: ath10k_pci rawmode = 1 requires support from firmware
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
To: kvalo@codeaurora.org, ath10k@lists.infradead.org, kvalo@qca.qualcomm.com

Hello Kalle,

When attempting to bring up my mesh0 interface, I recieve an error and
in "dmesg":

[  901.629999] ath10k_pci 0001:90:00.0: must load driver with
rawmode=1 to add mesh interfaces

I enable this mode by changing my bootargs, appending "ath10k_core.rawmode=1".

On boot "dmesg" reports:

[   12.040581] ath10k_pci 0001:90:00.0: rawmode = 1 requires support
from firmware

Where does this "supported" firmware come from?

I'm using SparkLAN WPEQ-261ACNI(BT) 802.11ac/abgn + BT PCI Express
Mini Card (Half) - Qualcomm QCA6174A-5 chipset, with a mainline 4.20.7
kernel and Ubuntu Bionic root filesystem.

Thank you for looking into this, I'm glad to provide more information if needed.

Best regards,

Cale Collins

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
