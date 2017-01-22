Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cV7Ul-0003If-DE
 for ath10k@lists.infradead.org; Sun, 22 Jan 2017 02:03:06 +0000
Received: by mail-wm0-f67.google.com with SMTP id d140so16858548wmd.2
 for <ath10k@lists.infradead.org>; Sat, 21 Jan 2017 18:02:41 -0800 (PST)
Message-ID: <1485050497.3853.1.camel@gmail.com>
Subject: Re: ath10k failing with firmware RM.4.4-00022-QCARMSWPZ-2 on
 QCA6174 (Killer 1535)
From: Chris Le Sueur <thefishface@gmail.com>
Date: Sun, 22 Jan 2017 02:01:37 +0000
In-Reply-To: <CACKGw+FXdcKHU80fZ8zWwZFwePrF0GPv5ksqLEJMP-gusvOjHw@mail.gmail.com>
References: <1484594680.14978.5.camel@gmail.com>
 <CACKGw+FXdcKHU80fZ8zWwZFwePrF0GPv5ksqLEJMP-gusvOjHw@mail.gmail.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>


On Tue, 2017-01-17 at 11:30 +0100, Bartosz Markowski wrote:
> On 16 January 2017 at 20:24, Chris Le Sueur <thefishface@gmail.com>
> wrote:
> > Dear all,
> > 
> > (per request by kvalo on #ath10k)
> > 
> > I was trying out the firmware-5 from git to see if it would fix
> > throughput issues, but instead the driver just failed to work. I am
> > using kernel 4.8.15 on Fedora 25, and the following was printed to
> > the
> > kernel log:
> > 
> > ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
> > reset_mode 0
> > ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-
> > pci-
> > 0000:3a:00.0 .bin failed with error -2
> > ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
> > 0000:3a:00.0.bin failed with error -2
> > ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> > 0x00340aff sub 1a56:1535
> > ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
> > testmode 0
> > ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 
> > api
> > 5 features wowlan,ignore-otp crc32 4d458559
> > ath10k_pci 0000:3a:00.0: failed to fetch board data for
> > bus=pci,bmi-
> > chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
> > ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
> 
> Please try to apply this patch -
> https://patchwork.kernel.org/patch/9486941/ and retry.
> 
> -Bartosz

This also fails. I have had to update my kernel as part of obtaining
the module source (I am using 4.9.4 as distributed with Fedora 25) so
the messages are a bit different; I've included both the patched and
stock output. I see the debug message added in that patch is also not
printed, so I assume the difference here is due to some transient
situation and not the patch itself.

Patched:

ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
reset_mode 0
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
0x00340aff sub 1a56:1535
ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
testmode 0
ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
5 features wowlan,ignore-otp crc32 4d458559
ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: htt version request timed out
ath10k_pci 0000:3a:00.0: failed to setup htt: -110
ath10k_pci 0000:3a:00.0: could not init core (-110)
ath10k_pci 0000:3a:00.0: could not probe fw (-110)

Stock:

ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
reset_mode 0
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
0000:3a:00.0.bin failed with error -2
ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
0x00340aff sub 1a56:1535
ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
testmode 0
ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
5 features wowlan,ignore-otp crc32 4d458559
ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
ath10k_pci 0000:3a:00.0: failed to ping firmware: -110
ath10k_pci 0000:3a:00.0: failed to reset rx filter: -110
ath10k_pci 0000:3a:00.0: could not init core (-110)
ath10k_pci 0000:3a:00.0: could not probe fw (-110)

Regards,
Chris

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
