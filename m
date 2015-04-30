Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ynlka-00070H-0K
 for ath10k@lists.infradead.org; Thu, 30 Apr 2015 10:31:25 +0000
Received: by wicmx19 with SMTP id mx19so9684090wic.1
 for <ath10k@lists.infradead.org>; Thu, 30 Apr 2015 03:31:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkhVx4LComy6KU_DEeoO5yzEudkNUVaVJMNXQHB3aGjeg@mail.gmail.com>
References: <CAEFj985e=6y2RQcHy-3RgaYx63hMdfJ+CdgaqpPdjuehLj=sKA@mail.gmail.com>
 <87lhha1fp7.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986cHR5J-LS+tz7tmoFAcHdkyZu9c2RqhnkAou1uK72c8w@mail.gmail.com>
 <CA+BoTQnJRUYzyGPpz1RVptfgLM1+Y1bpkGBG-OvXMZJqbC_Snw@mail.gmail.com>
 <CAEFj984ibOKiLESUDi9gO66iS7WAbvrJeH-2kDA3PNZU9p2Aqg@mail.gmail.com>
 <CA+BoTQkhVx4LComy6KU_DEeoO5yzEudkNUVaVJMNXQHB3aGjeg@mail.gmail.com>
Date: Thu, 30 Apr 2015 18:31:01 +0800
Message-ID: <CAEFj987NuHtuOkU6Yp_jjSq1-c9QrR14VYndbVy5CW5iKDnxwA@mail.gmail.com>
Subject: Re: Compex WLE900N5-23
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Michal

> I assume you need to reboot the machine before it starts to work
> again, no? Or does driver reload alone help?

The system looks very sluggish once the firmware start to crash. But
not required reboot.

> Did you try to `echo 1 >
> /sys/bus/pci/devices/xxxx:xx:xx.x/remove` and `echo 1 >
> /sys/bus/pci/rescan`?
> Or did you try to swap fw from 10.2 to 10.1
> (needs driver reload) after the "bad bad crashes" start to appear?
>

I try to load 10.1 after the firmware crashed on 10.2 and it is
working. See log below.

So no changes at all for this board to use 10.2 firmware?

----
Chun-Yeow


[  169.530000] ieee80211 phy0: Hardware restart was requested
[  172.110000] ath10k_pci 0000:00:00.0: device successfully recovered
[  172.450000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid
529a0c02-8d7b-4830-87ef-e491503db08c)
[  172.460000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2-00082-4-2 api 3 htt 2.1 wmi 3 cal otp max_sta 128
[  172.480000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
[  172.500000] ath10k_warn: 12 callbacks suppressed
[  172.500000] ath10k_pci 0000:00:00.0: failed to read diag value at
0x10100804: -16
[  172.510000] ath10k_pci 0000:00:00.0: failed to get memcpy hi
address for firmware address 4: -16
[  172.520000] ath10k_pci 0000:00:00.0: failed to read firmware dump area: -16
[  172.620000] ieee80211 phy0: Hardware restart was requested
[  172.620000] ath10k_pci 0000:00:00.0: failed to to request monitor
vdev 1 stop: -143
[  172.630000] ath10k_pci 0000:00:00.0: failed to synchronize monitor
vdev 1 stop: -143
[  172.640000] ath10k_pci 0000:00:00.0: failed to stop monitor vdev: -143
[  172.850000] ath10k_pci 0000:00:00.0: failed to read diag value at
0x10100800: -16
[  172.860000] ath10k_pci 0000:00:00.0: failed to poke copy engine: -16
[  172.970000] ath10k_pci 0000:00:00.0: failed to read diag value at
0x10100800: -16
[  172.980000] ath10k_pci 0000:00:00.0: failed to poke copy engine: -16
[  173.090000] ath10k_pci 0000:00:00.0: failed to read diag value at
0x10100800: -16
[  175.240000] ath10k_pci 0000:00:00.0: device successfully recovered
[  175.360000] br-lan: port 2(wlan0) entered disabled state
[  175.370000] device wlan0 left promiscuous mode
[  175.370000] br-lan: port 2(wlan0) entered disabled state
[  199.310000] pci 0000:00:00.0: [168c:003c] type 00 class 0x028000
[  199.310000] pci 0000:00:00.0: reg 0x10: [mem 0x10000000-0x101fffff 64bit]
[  199.310000] pci 0000:00:00.0: reg 0x30: [mem 0x00000000-0x0000ffff pref]
[  199.310000] pci 0000:00:00.0: supports D1 D2
[  199.310000] pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
[  199.310000] pci 0000:00:00.0: BAR 0: assigned [mem
0x10000000-0x101fffff 64bit]
[  199.320000] pci 0000:00:00.0: BAR 6: assigned [mem
0x10200000-0x1020ffff pref]
[  199.320000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[  199.540000] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/cal-pci-0000:00:00.0.bin failed with error -2
[  199.550000] ath10k_pci 0000:00:00.0: Falling back to user helper
[  199.640000] firmware ath10k!cal-pci-0000:00:00.0.bin:
firmware_loading_store: map pages failed
[  199.650000] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/firmware-4.bin failed with error -2
[  199.660000] ath10k_pci 0000:00:00.0: Falling back to user helper
[  199.760000] firmware ath10k!QCA988X!hw2.0!firmware-4.bin:
firmware_loading_store: map pages failed
[  199.770000] ath10k_pci 0000:00:00.0: could not fetch firmware file
'ath10k/QCA988X/hw2.0/firmware-4.bin': -11
[  199.780000] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/firmware-3.bin failed with error -2
[  199.790000] ath10k_pci 0000:00:00.0: Falling back to user helper
[  199.880000] firmware ath10k!QCA988X!hw2.0!firmware-3.bin:
firmware_loading_store: map pages failed
[  199.890000] ath10k_pci 0000:00:00.0: could not fetch firmware file
'ath10k/QCA988X/hw2.0/firmware-3.bin': -11
[  201.060000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.1.467.2-1 api 2 htt 2.1 wmi 2 cal otp max_sta 128
[  201.070000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
dfs 1 testmode 1
[  201.180000] ath: EEPROM regdomain: 0x0
[  201.180000] ath: EEPROM indicates default country code should be used
[  201.180000] ath: doing EEPROM country->regdmn map search
[  201.180000] ath: country maps to regdmn code: 0x3a
[  201.180000] ath: Country alpha2 being used: US
[  201.180000] ath: Regpair used: 0x3a
[  202.310000] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
