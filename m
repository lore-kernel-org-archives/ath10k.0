Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZg4X-0003zB-Hy
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 13:05:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath10k: calibration data through Device Tree?
Date: Thu, 2 Oct 2014 16:05:01 +0300
Message-ID: <8738b6oc5e.fsf@kamboji.qca.qualcomm.com>
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
To: devicetree-discuss@lists.ozlabs.org
Cc: ath10k@lists.infradead.org

Hi Device Tree gurus,

ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
located in drivers/net/wireless/ath/ath10k/. Currently it only supports
PCI devices.

Some of the devices store the calibration data to the host flash and the
bootloader reads the data from the flash. And now we need a method to
deliver the calibration data from bootloader to ath10k. Basically our
requirements are:

* ath10k must support any number of radios (one radio per PCI device).

* The calibration data is now 2116 bytes, in the future it might be
  longer. The data is unique for each radio and is created at the
  factory.

* ath10k must be able to reliably map the PCI device (=radio) to the
  correct calibration data. Maybe with using PCI bus and slot numbers?

We have been trying to find similar cases from other drivers but no
luck. Basically my question is how to do this properly with Device Tree?
Especially how to map the calibration data to correct PCI device? Are
there any examples which would help us to implement this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
