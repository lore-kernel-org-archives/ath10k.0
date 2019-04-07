Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDEOi-0001ZK-Lo
 for ath10k@lists.infradead.org; Sun, 07 Apr 2019 20:28:14 +0000
Subject: Re: [BUG] Can't change default country code from US to DE with Compex
 WLE900VX (Debian 10 Buster amd64)
References: <e3ba2603-152b-3c05-57d8-68b04023514d@bartschnet.de>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <4f2d20c2-29a3-f8bd-8d35-5d71365631c5@candelatech.com>
Date: Sun, 7 Apr 2019 13:28:11 -0700
MIME-Version: 1.0
In-Reply-To: <e3ba2603-152b-3c05-57d8-68b04023514d@bartschnet.de>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>, ath10k@lists.infradead.org

On 04/06/2019 11:19 PM, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> Hi,
>
> I posted this to the linux-wireless mailing-list 4 days ago and did not receive an answer.
>
> The ath10k module sets the country code to "US" at initialization. After that the country code can't be changed anymore (e.g. to "DE").

You might have to patch the driver and maybe the ath/ logic too, but the
country code is handled in driver/kernel, so at least you can fix it.

Thanks,
Ben

>
> Compex support suggests setting "reg->country_code = CTRY_UNITED_STATES;" in "/drivers/net/wireless/ath/regd.c" to the local country.
> Patching and re-compiling every kernel-update isn't an option on an UEFI-only production system.
>
> Kernel version: 4.19.0-4-amd64 #1 SMP Debian 4.19.28-2 (2019-03-15) x86_64 GNU/Linux on Debian 10 Buster
>
> The WLE900VX is based on the QCA XB140 reference design.
>
> Until Thursday we have the option to return the cards to the dealer.
>
> Thanx for any hint,
>
> Renne
>
>
> renne@cloud:/lib/firmware/ath10k/QCA988X/hw2.0$ uname -a
> Linux cloud 4.19.0-4-amd64 #1 SMP Debian 4.19.28-2 (2019-03-15) x86_64 GNU/Linux
>
> renne@cloud:~$ ls /lib/firmware/ath10k/QCA988X/hw2.0/
> board.bin  firmware-4.bin  firmware-5.bin
>
> What doesn't work:
>
> /etc/modprobe.d/cfg80211.conf:
> options cfg80211 ieee80211_regdom=DE
>
> /etc/hostapd/hostapd.conf:
> ...
> ieee80211d=1
> country_code=DE
> ...
>
> root@cloud:/# export COUNTRY=DE; /sbin/crda
> Failed to set regulatory domain: -7
>
> root@cloud:/# iw reg set DE && iw reg get
> global
> country 98: DFS-UNSET
>    (2402 - 2472 @ 40), (N/A, 20), (N/A)
>    (5170 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW
>    (5250 - 5330 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>    (5490 - 5725 @ 160), (N/A, 23), (0 ms), DFS
>    (5725 - 5730 @ 5), (N/A, 13), (0 ms), DFS
>    (5735 - 5835 @ 80), (N/A, 13), (N/A)
>    (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
> phy#1
> country US: DFS-FCC
>   (2402 - 2472 @ 40), (N/A, 30), (N/A)
>   (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>   (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>   (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>   (5735 - 5835 @ 80), (N/A, 30), (N/A)
>   (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
> phy#0
> country US: DFS-FCC
>    (2402 - 2472 @ 40), (N/A, 30), (N/A)
>    (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>    (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>    (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>    (5735 - 5835 @ 80), (N/A, 30), (N/A)
>    (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
>
> LOGs:
>
> renne@cloud:~$ sudo dmesg | grep ath
> [    4.630113] ath10k_pci 0000:04:00.0: enabling device (0000 -> 0002)
> [    4.630548] ath10k_pci 0000:04:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [    4.803687] ath10k_pci 0000:04:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:04:00.0.bin (-2)
> [    4.803700] ath10k_pci 0000:04:00.0: firmware: failed to load ath10k/cal-pci-0000:04:00.0.bin (-2)
> [    4.803872] ath10k_pci 0000:04:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/firmware-6.bin (-2)
> [    4.804994] ath10k_pci 0000:04:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/firmware-5.bin
> [    4.804999] ath10k_pci 0000:04:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
> [    4.805000] ath10k_pci 0000:04:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [    4.805147] ath10k_pci 0000:04:00.0: firmware ver 10.2.4-1.0-00041 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 f43fa422
> [    4.840158] ath10k_pci 0000:04:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/board-2.bin (-2)
> [    4.840338] ath10k_pci 0000:04:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/board.bin
> [    4.840343] ath10k_pci 0000:04:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [    5.988575] ath10k_pci 0000:04:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
> [    6.067999] ath: EEPROM regdomain: 0x0
> [    6.068000] ath: EEPROM indicates default country code should be used
> [    6.068000] ath: doing EEPROM country->regdmn map search
> [    6.068001] ath: country maps to regdmn code: 0x3a
> [    6.068002] ath: Country alpha2 being used: US
> [    6.068002] ath: Regpair used: 0x3a
> [    6.078078] ath10k_pci 0000:04:00.0 wlp4s0: renamed from wlan0
> [ 5099.420780] ath10k_pci 0000:04:00.0: pdev param 0 not supported by firmware
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
