Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPsNQ-0007JX-GD
 for ath10k@lists.infradead.org; Tue, 18 Mar 2014 11:40:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [For Help]Wrong mac address when i used ath10k driver
References: <53280D21.9080008@dhc.com.cn>
Date: Tue, 18 Mar 2014 13:39:43 +0200
In-Reply-To: <53280D21.9080008@dhc.com.cn> (wangdc@dhc.com.cn's message of
 "Tue, 18 Mar 2014 17:08:49 +0800")
Message-ID: <8761nbka68.fsf@kamboji.qca.qualcomm.com>
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
To: wangdc <wangdc@dhc.com.cn>
Cc: ath10k@lists.infradead.org

wangdc <wangdc@dhc.com.cn> writes:

> When i used the driver of the ath10k(backports-3.13.2-1) to drive the
> 11ac mini-pcie WIFI card(9880)

What board is this? Something based on XB140 design?

> on the ubuntu 12.04(based x86), the card seems to be working but i got
> a wrong mac address when
> i used the following command. Though i changed the other mini-pcie
> card, i got the same mac address.
> ---------------
> root@ubuntu:~$ cat /sys/class/ieee80211/phy0/addresses
> 00:03:07:12:34:56
> ---------------
>
> If anybody get the same this problem, could you please tell me how to
> fix it.
>
> Any suggestions would be helpful.
>
> ps:
> start log when i grep ath as following:
> root@ubuntu:~$ dmesg | grep ath
> [   25.240895] ath10k_pci 0000:04:00.0: BAR 0: assigned [mem
> 0xf0400000-0xf05fffff 64bit]
> [   25.240918] ath10k_pci 0000:04:00.0: BAR 0: set to [mem
> 0xf0400000-0xf05fffff 64bit] (PCI address [0xf0400000-0xf05fffff])
> [   25.240932] ath10k_pci 0000:04:00.0: enabling device (0000 -> 0002)
> [   25.240943] ath10k_pci 0000:04:00.0: PCI INT A -> GSI 18 (level,
> low) -> IRQ 18
> [   25.241008] ath10k_pci 0000:04:00.0: setting latency timer to 64
> [   25.241481] ath10k: MSI-X didn't succeed (1), trying MSI
> [   25.241549] ath10k_pci 0000:04:00.0: irq 45 for MSI/MSI-X
> [   25.241582] ath10k: MSI interrupt handling
> [   25.274432] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
> [   26.645636] ath10k: UART prints disabled
> [   26.649723] ath10k: firmware 999.999.0.636 booted
> [   26.659427] ath10k: htt target version 2.1
> [   26.659951] ath: EEPROM regdomain: 0x0
> [   26.659953] ath: EEPROM indicates default country code should be used
> [   26.659954] ath: doing EEPROM country->regdmn map search
> [   26.659956] ath: country maps to regdmn code: 0x3a
> [   26.659958] ath: Country alpha2 being used: US
> [   26.659960] ath: Regpair used: 0x3a
> [   62.880138] type=1400 audit(1395133013.810:12): apparmor="STATUS"
> operation="profile_load" name="/usr/lib/telepathy/mission-control-5"
> pid=1117 comm="apparmor_parser"
> [   62.880710] type=1400 audit(1395133013.810:13): apparmor="STATUS"
> operation="profile_load" name="/usr/lib/telepathy/telepathy-*"
> pid=1117 comm="apparmor_parser"
> [   63.953074] ath10k: MSI-X didn't succeed (1), trying MSI
> [   63.953152] ath10k_pci 0000:04:00.0: irq 45 for MSI/MSI-X
> [   63.953190] ath10k: MSI interrupt handling
> [   65.135257] ath10k: UART prints disabled
> [   65.139331] ath10k: firmware 999.999.0.636 booted

I'm guessing otp.bin fails and use the default board file. Can you try
firmware 10.1.467.2-1? Just get the firmware here:

https://github.com/kvalo/ath10k-firmware/tree/master/10.1

And rename it to firmware-2.bin:

cp firmware-2.bin_10.1.467.2-1 /lib/firmware/ath10k/QCA988X/hw2.0/firmware-2.bin

And reload ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
