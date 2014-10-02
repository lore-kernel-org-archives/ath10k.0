Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgQk-0002nQ-Pw
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 13:28:27 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 02 Oct 2014 15:27:53 +0200
Message-ID: <3548219.ad4Qe1WtGp@wuerfel>
In-Reply-To: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: devicetree@vger.kernel.org, ath10k@lists.infradead.org

On Thursday 02 October 2014 16:14:43 Kalle Valo wrote:
> Hi Device Tree gurus,
> 
> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
> PCI devices.
> 
> Some of the devices store the calibration data to the host flash and the
> bootloader reads the data from the flash. And now we need a method to
> deliver the calibration data from bootloader to ath10k. Basically our
> requirements are:
> 
> * ath10k must support any number of radios (one radio per PCI device).
> 
> * The calibration data is now 2116 bytes, in the future it might be
>   longer. The data is unique for each radio and is created at the
>   factory.
> 
> * ath10k must be able to reliably map the PCI device (=radio) to the
>   correct calibration data. Maybe with using PCI bus and slot numbers?
> 
> We have been trying to find similar cases from other drivers but no
> luck. Basically my question is how to do this properly with Device Tree?
> Especially how to map the calibration data to correct PCI device? Are
> there any examples which would help us to implement this?

When you know the PCI bus/device/function ID of the device, you can put
a device node in the dts file that corresponds to the PCI dev, and you
can find the of_node pointer from pci_dev->dev.of_node. 2116 is probably
ok to put into a DT property of that device directly.

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
