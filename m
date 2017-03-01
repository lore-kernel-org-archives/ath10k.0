Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cj4pl-0005Sf-IV
 for ath10k@lists.infradead.org; Wed, 01 Mar 2017 14:02:27 +0000
Received: by mail-ot0-x236.google.com with SMTP id k4so29979839otc.0
 for <ath10k@lists.infradead.org>; Wed, 01 Mar 2017 06:02:05 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Wed, 1 Mar 2017 09:02:03 -0500
Message-ID: <CALJ2kaEeauorokz4s6zEVTYcuqvnKzYUCNdXxiDH_h1aFqLcYQ@mail.gmail.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
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

> Is this  a regression you saw and working with other kernel version but failed with 4.9?

I've only tried this card on a custom 4.1 kernel and `iw list` does
not report it as supporting more than one channel - for our purposes,
we require 2 channels, hence the upgrade.

> Can you give it a try with the latest firmware - https://github.com/kvalo/ath10k-firmware.git

I should mention that I have the 'skip_otp' directive set to 'y'. I
tried the following both with and without this setting to no avail.

The card seems to present only intermittently. When it does not
present, I see the following in the kernel's ring buffer.

# dmesg | grep ath
[    3.460109] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    3.745235] ath10k_pci 0000:02:00.0: firmware: failed to load
ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[    3.745240] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[    3.745249] ath10k_pci 0000:02:00.0: firmware: failed to load
ath10k/cal-pci-0000:02:00.0.bin (-2)
[    3.745252] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[    3.747717] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/firmware-5.bin
[    3.747723] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a3b:2260
[    3.747724] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[    3.748278] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 5 features wowlan,ignore-otp crc32
4d458559
[    3.814875] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/board-2.bin
[    3.814880] ath10k_pci 0000:02:00.0: failed to fetch board data for
bus=pci,bmi-chip-id=0,bmi-board-id=0 from
ath10k/QCA6174/hw3.0/board-2.bin
[    3.814996] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/board.bin
[    3.815007] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id 0:0
crc32 ed5f849a
[    5.927102] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[    8.934247] ath10k_pci 0000:02:00.0: htt version request timed out
[    8.934250] ath10k_pci 0000:02:00.0: failed to setup htt: -110
[    9.013168] ath10k_pci 0000:02:00.0: could not init core (-110)
[    9.013240] ath10k_pci 0000:02:00.0: could not probe fw (-110)

When the card does present (it seems to work randomly), I see the following.

# dmesg | grep ath
[    3.104528] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    3.384558] ath10k_pci 0000:02:00.0: firmware: failed to load
ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[    3.384564] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[    3.384572] ath10k_pci 0000:02:00.0: firmware: failed to load
ath10k/cal-pci-0000:02:00.0.bin (-2)
[    3.384575] ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[    3.387098] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/firmware-5.bin
[    3.387105] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a3b:2260
[    3.387106] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[    3.387664] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4-00022-QCARMSWPZ-2 api 5 features wowlan,ignore-otp crc32
4d458559
[    3.454317] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/board-2.bin
[    3.454322] ath10k_pci 0000:02:00.0: failed to fetch board data for
bus=pci,bmi-chip-id=0,bmi-board-id=0 from
ath10k/QCA6174/hw3.0/board-2.bin
[    3.454475] ath10k_pci 0000:02:00.0: firmware: direct-loading
firmware ath10k/QCA6174/hw3.0/board.bin
[    3.454486] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id 0:0
crc32 ed5f849a
[    5.562906] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[    5.563521] ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[    6.565534] ath10k_pci 0000:02:00.0: suspend timed out - target
pause event never came
[    6.644490] ath: EEPROM regdomain: 0x6a
[    6.644491] ath: EEPROM indicates we should expect a direct regpair map
[    6.644493] ath: Country alpha2 being used: 00
[    6.644494] ath: Regpair used: 0x6a

It now seems to be having some trouble setting the interface up.

# hostapd /etc/hostapd/hostapd1.conf
Configuration file: /etc/hostapd/hostapd1.conf
Could not set interface ap1 flags (UP): Connection timed out
nl80211: Could not set interface 'ap1' UP
nl80211: deinit ifname=ap1 disabled_11b_rates=0
nl80211 driver initialization failed.
ap1: interface state UNINITIALIZED->DISABLED
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started

# ip link set dev ap1 up
RTNETLINK answers: Connection timed out

No kernel panics, however. If I delete the new firmware, the card then
presents on each boot. I'm using the firmware from the repo at hash
8d15818.

> Can you give it a try if you just do the STA interface and scan?

For the rest of the response, I'm back to using the old firmware. In
addition, I tried not setting the skip_otp option and I seem to be
able to get it working, so this is probably some bad advice I found
somewhere on the web.

# ip link set dev ap1 up
# iw dev ap1 scan | grep signal
signal: -47.00 dBm
signal: -47.00 dBm
signal: -47.00 dBm
signal: -46.00 dBm
signal: -52.00 dBm
signal: -58.00 dBm
signal: -55.00 dBm
signal: -45.00 dBm
signal: -57.00 dBm
signal: -41.00 dBm
signal: -54.00 dBm
signal: -49.00 dBm
signal: -48.00 dBm
signal: -48.00 dBm
signal: -50.00 dBm
signal: -71.00 dBm
signal: -56.00 dBm
signal: -55.00 dBm
signal: -44.00 dBm
signal: -69.00 dBm
signal: -68.00 dBm
signal: -75.00 dBm
signal: -55.00 dBm
signal: -55.00 dBm
signal: -55.00 dBm
signal: -55.00 dBm
signal: -84.00 dBm
signal: -83.00 dBm
signal: -82.00 dBm
signal: -41.00 dBm
signal: -52.00 dBm
signal: -83.00 dBm
signal: -83.00 dBm
signal: -83.00 dBm
signal: -85.00 dBm
signal: -67.00 dBm
signal: -78.00 dBm
signal: -61.00 dBm
signal: -60.00 dBm
signal: -60.00 dBm
signal: -60.00 dBm
signal: -55.00 dBm
signal: -83.00 dBm
signal: -75.00 dBm
signal: -78.00 dBm
signal: -78.00 dBm
signal: -78.00 dBm

And for the first time, the ACS seems to actually work. I noticed that
I have to manually set the interface to 'up' however, though this is
probably a matter for the hostapd devs. I've been able to host the AP
repeatedly without seeing the panic, so this looks promising.

> What is the other channel you failed? what is the output of the "iw reg get" show?
> Can you share the kernel log as well?

Possibly not relevant anymore, but here you go.

# iw reg get
global
country CA: DFS-FCC
(2402 - 2472 @ 40), (N/A, 30), (N/A)
(5170 - 5250 @ 80), (N/A, 17), (N/A), AUTO-BW
(5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
(5490 - 5600 @ 80), (N/A, 24), (0 ms), DFS
(5650 - 5730 @ 80), (N/A, 24), (0 ms), DFS
(5735 - 5835 @ 80), (N/A, 30), (N/A)

The dmesg output is as above.

> Is the other card also run with ath10k? what is the combination you've?
> Are you running multiple hostapd or wpa_supplicant instance?

I wasn't clear about this part - there is only one card, and I wish to
use it in one of a few ways. Namely, I want to host 2 access points,
or host to one access point and connect to another. `iw list` gives me
the following.

valid interface combinations:
* #{ managed } <= 2, #{ AP, mesh point, P2P-client, P2P-GO } <= 2, #{
P2P-device } <= 1,
  total <= 4, #channels <= 1
* #{ managed } <= 2, #{ P2P-client } <= 2, #{ AP, mesh point, P2P-GO }
<= 1, #{ P2P-device } <= 1,
  total <= 4, #channels <= 2
* #{ managed } <= 1, #{ IBSS } <= 1,
  total <= 2, #channels <= 1

Maybe I misunderstand the output, but I would expect to be able to
host two access points simultaneously. However I am unable to do that
by either running a single hostapd instance, specifying both config
files, or by running two separate instances.

# hostapd /etc/hostapd/hostapd0.conf /etc/hostapd/hostapd1.conf
Configuration file: /etc/hostapd/hostapd0.conf
Configuration file: /etc/hostapd/hostapd1.conf
ap0: interface state UNINITIALIZED->COUNTRY_UPDATE
Using interface ap0 with hwaddr f0:03:8c:4a:64:fe and ssid "test2.4"
random: Only 15/20 bytes of strong random data available from /dev/random
random: Not enough entropy pool available for secure operations
WPA: Not enough entropy in random pool for secure operations - update
keys later when the first station connects
ap0: interface state COUNTRY_UPDATE->ENABLED
ap0: AP-ENABLED
ap1: interface state UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
ap1: interface state COUNTRY_UPDATE->ACS
ap1: ACS-STARTED
ap1: ACS-COMPLETED freq=5220 channel=44
Using interface ap1 with hwaddr f0:03:8c:4a:64:fd and ssid "test5"
Failed to set beacon parameters
Interface initialization failed
ap1: interface state ACS->DISABLED
ap1: AP-DISABLED
ACS: Possibly channel configuration is invalid, please report this
along with your config file.
ACS: Failed to start
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started
nl80211: deinit ifname=ap1 disabled_11b_rates=0
ap1: interface state DISABLED->DISABLED
ap0: interface state ENABLED->DISABLED
ap0: AP-DISABLED
nl80211: deinit ifname=ap0 disabled_11b_rates=0
ap1: interface state DISABLED->DISABLED
ap1: AP-DISABLED
hostapd_free_hapd_data: Interface ap1 wasn't started

When I run two instances, I also see "Failed to set beacon parameters"
on whichever AP I start last.

On the other hand, I am able to simultaneously host one AP and connect
to another, so it's performing some of the functions I would expect.
As for the panic, that seems to be related to the 'skip_otp' option.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
