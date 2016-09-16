Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkqdu-0005sL-TG
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 10:45:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA6174 Performance
Date: Fri, 16 Sep 2016 10:44:48 +0000
Message-ID: <87intw9l9c.fsf@kamboji.qca.qualcomm.com>
References: <3683ea4d-10ce-80a1-2e11-4b873f4129b8@gmx.de>
 <1474018906.3370.0@smtp.gmail.com>
In-Reply-To: <1474018906.3370.0@smtp.gmail.com> (Daniel Holz's message of
 "Fri, 16 Sep 2016 11:41:46 +0200")
Content-Language: en-US
Content-ID: <6D87D436444A3C44AE4FA24DA6FF29CD@qualcomm.com>
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
To: Daniel Holz <daniel.holz91@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

please don't email me privately, I'm adding the mailing list back so
that everyone can participate.

Daniel Holz <daniel.holz91@gmail.com> writes:

> Do you mean by board file board.bin? I downloaded all files related to the
> QCA6174 from your Github repository.

I meant board-2.bin actually:

$ md5sum QCA6174/hw2.1/board-2.bin 
11920f7c30a1b1dd009928baef1021dc  QCA6174/hw2.1/board-2.bin

This file should support your board with subsystem id 17aa:3044.

> Here is the output of lspci:
>
> 02:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless
> Network Adapter [168c:003e] (rev 20)
> Subsystem: Lenovo QCA6174 802.11ac Wireless Network Adapter [17aa:3044]
> Flags: bus master, fast devsel, latency 0, IRQ 49
> Memory at c1000000 (64-bit, non-prefetchable) [size=2M]
> Capabilities: [40] Power Management version 3
> Capabilities: [50] MSI: Enable+ Count=8/8 Maskable+ 64bit-
> Capabilities: [70] Express Endpoint, MSI 00
> Capabilities: [100] Advanced Error Reporting
> Capabilities: [148] Virtual Channel
> Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
> Capabilities: [178] Latency Tolerance Reporting
> Capabilities: [180] L1 PM Substates
> Kernel driver in use: ath10k_pci
> Kernel modules: ath10k_pci
>
> And of dmesg | grep -i ath10k:
>
> [    3.717494] ath10k_pci 0000:02:00.0: pci irq msi-x interrupts 8 irq_mode 0
> reset_mode 0
> [    3.953007] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/
> cal-pci-0000:02:00.0.bin failed with error -2
> [    5.232572] ath10k_pci 0000:02:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff
> sub 17aa:3044) fw SW_RM.1.1.1-00157-QCARMSWPZ-1 fwapi 5 bdapi 2 htt-ver 3.1
> wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
> ignore-otp,no-4addr-pad
> [    5.232578] ath10k_pci 0000:02:00.0: debug 0 debugfs 1 tracing 1 dfs 0
> testmode 0
> [    5.318496] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
> [    6.879214] ath10k_pci 0000:02:00.0: no channel configured; ignoring frame
> (s)!

From the logs I can't immeaditely see anything wrong, but you version of
ath10k is so old that it doesn't print the crc32 for the board file so I
can't be 100% sure. So I recommend to check the md5sum above matches
with your file.

From a quick look I can't immediately come up what else would cause low
throughput, it would involve more detailed analysis with wireless
sniffer etc. It's a wild shot but you could always try latest ath10k
using kernel-backports:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports

Do note that backports project hasn't had stable updates for a long time
so use the daily releases instead:

https://www.kernel.org/pub/linux/kernel/projects/backports/2016/03/24/

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
