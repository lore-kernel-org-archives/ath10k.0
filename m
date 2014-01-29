Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8YDO-0001CV-VJ
 for ath10k@lists.infradead.org; Wed, 29 Jan 2014 16:42:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
Date: Wed, 29 Jan 2014 18:41:48 +0200
In-Reply-To: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 28 Jan 2014 12:18:05 -0500")
Message-ID: <871tzq210z.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k@lists.infradead.org

Hi,

Avery Pennarun <apenwarr@gmail.com> writes:

> When the ath10k firmware crashes on my device (let's not worry about
> why the firmware crashes right now; one problem at a time), my host
> CPU (ARMv7 based) can't recover.  I get some variant of this error:
>
> [  780.116977] Unhandled fault: imprecise external abort (0x1406) at 0x2ac3706c
> [  780.124336] Internal error: : 1406 [#1] SMP
>
> I've narrowed this down to this code in ath10k/pci.c, ath10k_pci_device_reset:
>
>         /* Put Target, including PCIe, into RESET. */
>         val = ath10k_pci_reg_read32(ar, SOC_GLOBAL_RESET_ADDRESS);
>         val |= 1;
>         ath10k_pci_reg_write32(ar, SOC_GLOBAL_RESET_ADDRESS, val);
>         for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
>                 if (ath10k_pci_reg_read32(ar, RTC_STATE_ADDRESS) &
>                                           RTC_STATE_COLD_RESET_MASK)
>                         break;
>                 msleep(1);
>        }

Are you using CUS223 board? I was told that it has a problem with the
cold reset. When you issue the cold reset, some voltage in the board
goes too low and there's a chance that it breaks PCI communication.

> Specifically, the pci_reg_read32().  I can insert as much time as I
> want between the write32 and the read32; it always performs the read,
> then crashes with the PC pointing a few instructions later, inside the
> msleep(), with the imprecise external abort.  I think this means the
> PCI read operation has encountered a PCI target abort, which suggests
> that the SOC_GLOBAL_RESET_ADDRESS line has not successfully reset the
> device.  From what I understand, on x86 processors PCI target aborts
> are not fatal, so you might not notice this problem on those
> platforms, but it's bad on ARM.

FWIW the same problem also happens on MIPS.

> I'm using the ath10k driver from linux-next 20140117, but I had the
> same problem with 3.13-rc2 so I don't think this has changed.
>
> Are other people seeing this?  Is there something I can try to resolve it?

Yes, we see it as well. And we see it also on when doing interface down,
for example when shutting down hostapd. Soon we will post patches to
workaround the interface down issue, but for firmware crashes we haven't
yet found a reliable solution. I hope there's a way to fix warm reset to
properly recover from a firmware crash.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
