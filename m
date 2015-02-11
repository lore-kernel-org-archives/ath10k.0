Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out002.kontent.com ([81.88.40.216])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLXbb-00011I-Nw
 for ath10k@lists.infradead.org; Wed, 11 Feb 2015 13:45:28 +0000
Received: from lnxsrvr.dreyero.de (a89-183-1-223.net-htp.de [89.183.1.223])
 (Authenticated sender: dreyero_de@smtp-out002.kontent.com)
 by smtp-out002.kontent.com (Postfix) with ESMTPA id 751041003807D
 for <ath10k@lists.infradead.org>; Wed, 11 Feb 2015 14:45:01 +0100 (CET)
Received: from [192.168.1.122] (ip-2-205-229-64.web.vodafone.de [2.205.229.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lnxsrvr.dreyero.de (Postfix) with ESMTPSA id BEBE5269151F
 for <ath10k@lists.infradead.org>; Wed, 11 Feb 2015 14:45:00 +0100 (CET)
Message-ID: <54DB5CD8.80302@dreyero.de>
Date: Wed, 11 Feb 2015 14:44:56 +0100
From: Olaf Dreyer <olaf@dreyero.de>
MIME-Version: 1.0
Subject: First QCA6174 firmware release
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

I have a new Acer Aspire VN7-591 Laptop with a Qualcom Atheros QCNF344
wireless chip, which is shown by lspci as:

Qualcomm Atheros Device 003e (rev 20)
Subsystem: Foxconn International, Inc. Device e08e

I have installed the linux-next kernel from today 8:00 UTC.
I was able to load the ath10k_pci driver, but the driver complains about
missing firmware.
I installed a firmware from here: https://github.com/kvalo/ath10k-firmware
under /lib/firmware/ath10k/QCA6174/hw2.1/
But also the card is not working.
 
The output from dmesg is:
[ 9360.538767] ath10k_pci 0000:07:00.0: pci irq msi interrupts 1
irq_mode 0 reset_mode 0
[ 9360.788588] ath10k_pci 0000:07:00.0: Direct firmware load for
ath10k/cal-pci-0000:07:00.0.bin failed with error -2
[ 9362.729118] ath10k_pci 0000:07:00.0: unable to write to the device
[ 9362.729120] ath10k_pci 0000:07:00.0: failed to download normal
firmware: -110
[ 9362.729121] ath10k_pci 0000:07:00.0: could not init core (-110)
[ 9362.729156] ath10k_pci 0000:07:00.0: could not probe fw (-110)

I would like to know, as Austin Hendrix wrote it at 8 Feb 14:12 2015
too, where can I find the firmware on the
internet / my Windows7 partition and how can I prepare the needed files.

Many thanks,

Olaf


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
