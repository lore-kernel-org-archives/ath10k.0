Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYZOW-0002zz-Mk
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 12:17:49 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: unknown qca6164 model 0x0041
Date: Thu, 19 Mar 2015 13:17:16 +0100
MIME-Version: 1.0
Message-Id: <201503191317.16541.arnd@arndb.de>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>

Hi,

I just got a Lenovo Yoga 3 11" Laptop that came with a NFA345 wifi module that
is allegedly using a qca6164 chip. The Windows driver calls it a 61x4 version 20
device and the PCI ID is 168c:0041, which is different from the device ID
that was just added to ath10k as QCA6174_2_1_DEVICE_ID (168c:003e).

Does anyone have more information about this device and about how hard it would
be to add support to the driver? Is there a chance that it might just work by
adding the IDs or is it something rather different?

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
