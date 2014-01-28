Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vb0-f47.google.com ([209.85.212.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8CJF-0002UH-FT
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 17:18:50 +0000
Received: by mail-vb0-f47.google.com with SMTP id p6so420498vbe.20
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 09:18:25 -0800 (PST)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 28 Jan 2014 12:18:05 -0500
Message-ID: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
Subject: ath10k driver crashes whenever firmware crashes on ARM SoC
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

Hi all,

When the ath10k firmware crashes on my device (let's not worry about
why the firmware crashes right now; one problem at a time), my host
CPU (ARMv7 based) can't recover.  I get some variant of this error:

[  780.116977] Unhandled fault: imprecise external abort (0x1406) at 0x2ac3706c
[  780.124336] Internal error: : 1406 [#1] SMP

I've narrowed this down to this code in ath10k/pci.c, ath10k_pci_device_reset:

        /* Put Target, including PCIe, into RESET. */
        val = ath10k_pci_reg_read32(ar, SOC_GLOBAL_RESET_ADDRESS);
        val |= 1;
        ath10k_pci_reg_write32(ar, SOC_GLOBAL_RESET_ADDRESS, val);
        for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
                if (ath10k_pci_reg_read32(ar, RTC_STATE_ADDRESS) &
                                          RTC_STATE_COLD_RESET_MASK)
                        break;
                msleep(1);
       }

Specifically, the pci_reg_read32().  I can insert as much time as I
want between the write32 and the read32; it always performs the read,
then crashes with the PC pointing a few instructions later, inside the
msleep(), with the imprecise external abort.  I think this means the
PCI read operation has encountered a PCI target abort, which suggests
that the SOC_GLOBAL_RESET_ADDRESS line has not successfully reset the
device.  From what I understand, on x86 processors PCI target aborts
are not fatal, so you might not notice this problem on those
platforms, but it's bad on ARM.

I'm using the ath10k driver from linux-next 20140117, but I had the
same problem with 3.13-rc2 so I don't think this has changed.

Are other people seeing this?  Is there something I can try to resolve it?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
