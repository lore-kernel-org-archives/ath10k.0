Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from da1vs01.rockwellcollins.com ([205.175.227.27])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1edhp6-0004ZM-2L
 for ath10k@lists.infradead.org; Mon, 22 Jan 2018 19:32:05 +0000
Received: by mail-yb0-f198.google.com with SMTP id x65so6329439ybh.4
 for <ath10k@lists.infradead.org>; Mon, 22 Jan 2018 11:31:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAM=7fbeW-Eno1vDiu7eHOvjFkufk+2Hw3NNG6+BKSpCTigZXZA@mail.gmail.com>
References: <CAM=7fbeW-Eno1vDiu7eHOvjFkufk+2Hw3NNG6+BKSpCTigZXZA@mail.gmail.com>
From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 22 Jan 2018 13:31:48 -0600
Message-ID: <CAM=7fbc+W=5G8fO4zz1as9xaC6uiQX9jORo--_zDQ59h0ZMKSA@mail.gmail.com>
Subject: Re: ath10k could not get target info after transition from 32 bit to
 64 bit kernel
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

I accidentally pasted the same lspci for 32 bit and 64 bit.  Here is
the actual lspci for the 64 bit.

# lspci -k
00:00.0 Class 0604: 1957:0824 pcieport
01:00.0 Class 0280: 168c:003c ath10k_pci
00:00.0 Class 0604: 1957:0824 pcieport
01:00.0 Class 0106: 1b4b:9170 ahci
00:00.0 Class 0604: 1957:0824 pcieport
01:00.0 Class 0280: 168c:003c ath10k_pci

On Sat, Jan 20, 2018 at 6:09 PM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
> Hello,
>
> Recently I transitioned a build from a 32 bit build to a 64 bit build.
> In the 32 bit build, the wifi modules initialized properly and could
> be used.  After moving to the 64 bit build, the modules fail to get
> the device information and load firmware.  The other devices on the
> pci bus are still working.  For reference, it is an older kernel
> version (freescale sdk v2.0 which has linux v4.1).  Just wondering if
> anyone has come across this or has any information that may help.
> I've done a side by side comparison of the linux configs and haven't
> noticed anything different that would seem to be the problem.
>
> Here are the lspci and dmesg printouts from the 32 bit build and the
> 64 bit build.  As you can see, the driver is mapped to the device but
> it fails to get the device information in the 64 bit build.
>
> 32 bit (working)
>
> # lspci -k
> 00:00.0 Class 0604: 1957:0824 pcieport
> 01:00.0 Class 0280: 168c:003c ath10k_pci
> 04:00.0 Class 0604: 1957:0824 pcieport
> 05:00.0 Class 0106: 1b4b:9170 ahci
> 02:00.0 Class 0604: 1957:0824 pcieport
> 03:00.0 Class 0280: 168c:003c ath10k_pci
>
> # dmesg
> ath10k_pci 0001:03:00.0: enabling device (0000 -> 0002)
> ath10k_pci 0001:03:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
> pcieport 0002:04:00.0: Primary bus is hard wired to 0
> pci_bus 0002:05: busn_res: [bus 05] end is updated to 05
> ath10k_pci 0000:01:00.0: Direct firmware load for
> ath10k/cal-pci-0000:01:00.0.bin failed with error -2
> ath10k_pci 0001:03:00.0: Direct firmware load for
> ath10k/cal-pci-0001:03:00.0.bin failed with error -2
> ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c, 0x043222ff) fw
> 10.2.4.45 api 4 htt 2.1 wmi 5 cal otp max_sta 128
> ath10k_pci 0000:01:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 1
> ath: EEPROM regdomain: 0x6a
> ath: EEPROM indicates we should expect a direct regpair map
> ath: Country alpha2 being used: 00
> ath: Regpair used: 0x6a
>
>
>
> 64 bit (not working)
>
> # lspci -k
> 00:00.0 Class 0604: 1957:0824 pcieport
> 01:00.0 Class 0280: 168c:003c ath10k_pci
> 04:00.0 Class 0604: 1957:0824 pcieport
> 05:00.0 Class 0106: 1b4b:9170 ahci
> 02:00.0 Class 0604: 1957:0824 pcieport
> 03:00.0 Class 0280: 168c:003c ath10k_pci
>
> # dmesg
> ath10k_pci 0001:01:00.0: enabling device (0000 -> 0002)
> ath10k_pci 0001:01:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
> pci_bus 0002:01: busn_res: [bus 01] end is updated to 01
> ath10k_pci 0000:01:00.0: unable to get target info from device
> ath10k_pci 0000:01:00.0: could not get target info (1)
> ath10k_pci 0000:01:00.0: could not probe fw (1)
> ath10k_pci 0001:01:00.0: unable to get target info from device
> ath10k_pci 0001:01:00.0: could not get target info (1)
> ath10k_pci 0001:01:00.0: could not probe fw (1)
>
> Thank you,
> Jared

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
