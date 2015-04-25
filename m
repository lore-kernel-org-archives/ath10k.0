Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ym4ls-0006ta-Dk
 for ath10k@lists.infradead.org; Sat, 25 Apr 2015 18:25:45 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldad-ath10k@m.gmane.org>) id 1Ym4lF-000097-Ls
 for ath10k@lists.infradead.org; Sat, 25 Apr 2015 20:25:06 +0200
Received: from pc200768385.optele.net ([pc200768385.optele.net])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2015 20:25:05 +0200
Received: from oscarrydberg by pc200768385.optele.net with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2015 20:25:05 +0200
From: Oscar Rydberg <oscarrydberg@gmail.com>
Subject: Re: First QCA6174 firmware release
Date: Sat, 25 Apr 2015 18:22:31 +0000 (UTC)
Message-ID: <loom.20150425T202151-34@post.gmane.org>
References: <54DB5CD8.80302@dreyero.de>
Mime-Version: 1.0
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

Olaf Dreyer <olaf <at> dreyero.de> writes:

> 
> I have a new Acer Aspire VN7-591 Laptop with a Qualcom Atheros 
QCNF344
> wireless chip, which is shown by lspci as:
> 
> Qualcomm Atheros Device 003e (rev 20)
> Subsystem: Foxconn International, Inc. Device e08e
> 
> I have installed the linux-next kernel from today 8:00 UTC.
> I was able to load the ath10k_pci driver, but the driver complains 
about
> missing firmware.
> I installed a firmware from here: https://github.com/kvalo/ath10k-
firmware
> under /lib/firmware/ath10k/QCA6174/hw2.1/
> But also the card is not working.
> 
> The output from dmesg is:
> [ 9360.538767] ath10k_pci 0000:07:00.0: pci irq msi interrupts 1
> irq_mode 0 reset_mode 0
> [ 9360.788588] ath10k_pci 0000:07:00.0: Direct firmware load for
> ath10k/cal-pci-0000:07:00.0.bin failed with error -2
> [ 9362.729118] ath10k_pci 0000:07:00.0: unable to write to the 
device
> [ 9362.729120] ath10k_pci 0000:07:00.0: failed to download normal
> firmware: -110
> [ 9362.729121] ath10k_pci 0000:07:00.0: could not init core (-110)
> [ 9362.729156] ath10k_pci 0000:07:00.0: could not probe fw (-110)
> 
> I would like to know, as Austin Hendrix wrote it at 8 Feb 14:12 
2015
> too, where can I find the firmware on the
> internet / my Windows7 partition and how can I prepare the needed 
files.
> 
> Many thanks,
> 
> Olaf
> 

Hi did you advance anything on this?

Trying to run a QCA6164 card myself on a Lenovo 3-14 laptop.
Sems I've gotten as far as you. 
Prepared Ath10k hw2.1 board.bin and firmware-4.bin for hw2.1 using 
windows binary driver. (And assemble.py, disassemble.py tools linked 
elsewhere)

Board.bin seems to load and execute fine. But after that when 
loading firmware-4.bin, it ends up with Unable to write to the 
device.

I see it starts sending firmware-4.bin and first 256 bytes ce_send 
fine.
2nd ce_send 256 bytes seem to also ce_send fine, however after that 
bmi_wait times out. (-110)




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
