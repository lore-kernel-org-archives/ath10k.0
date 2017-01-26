Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cWpsQ-0002OY-5M
 for ath10k@lists.infradead.org; Thu, 26 Jan 2017 19:38:39 +0000
Subject: Re: Very low throughput with QCA9880
References: <CAGmNNdvdJfYY75xKJ+-C4vEj98bArgrQeDihdxtZ76__Js-uGg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <f3d0ad9d-93ed-bbed-af3f-f80340873f4b@candelatech.com>
Date: Thu, 26 Jan 2017 11:38:11 -0800
MIME-Version: 1.0
In-Reply-To: <CAGmNNdvdJfYY75xKJ+-C4vEj98bArgrQeDihdxtZ76__Js-uGg@mail.gmail.com>
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
To: Martin Potts <fluxcap451@gmail.com>, ath10k@lists.infradead.org

If UDP works noticeably better, then you probably need to use a different
TCP congestion control.

Thanks,
Ben

On 01/26/2017 11:34 AM, Martin Potts wrote:
> Hi all,
>
> I'm using a QC9880 802.11ac NIC with Ubuntu 14.04 LTS and getting
> really low upstream (STA to AP) throughput. The specific NIC is the
> Compex WLE900VX.
>
> Testing using iperf3 in TCP mode I cannot achieve much more than 15
> Mbps. Downstream throughput is roughly 145 Mbps. I get nearly the same
> performance when testing with different AP's. Using other 802.11ac
> client devices (iPads etc) can achieve 200+ Mbps upstream to the same
> test setup.
>
> At the moment I am testing open air but will move to a cabled setup
> shortly to try and rule out RF interference issues.
>
> The ath10k driver version and firmware appear to be pretty recent.
> Here is some version info from my system.
>
> modinfo ath10k_core
> filename:
> /lib/modules/4.4.0-59-generic/kernel/drivers/net/wireless/ath/ath10k/ath10k_core.ko
> license:        Dual BSD/GPL
> description:    Core module for QCA988X PCIe devices.
> author:         Qualcomm Atheros
> srcversion:     F5C0E3964FCD86D0F5FE986
> depends:        mac80211,cfg80211,ath
> intree:         Y
> vermagic:       4.4.0-59-generic SMP mod_unload modversions
> parm:           debug_mask:Debugging mask (uint)
> parm:           uart_print:Uart target debugging (bool)
> parm:           skip_otp:Skip otp failure for calibration in testmode (bool)
> parm:           cryptmode:Crypto mode: 0-hardware, 1-software (uint)
> parm:           rawmode:Use raw 802.11 frame datapath (bool)
>
> modinfo ath10k_pci
> filename:
> /lib/modules/4.4.0-59-generic/kernel/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
> firmware:       ath10k/QCA9377/hw1.0/board.bin
> firmware:       ath10k/QCA9377/hw1.0/firmware-5.bin
> firmware:       ath10k/QCA6174/hw3.0/board-2.bin
> firmware:       ath10k/QCA6174/hw3.0/board.bin
> firmware:       ath10k/QCA6174/hw3.0/firmware-5.bin
> firmware:       ath10k/QCA6174/hw3.0/firmware-4.bin
> firmware:       ath10k/QCA6174/hw2.1/board-2.bin
> firmware:       ath10k/QCA6174/hw2.1/board.bin
> firmware:       ath10k/QCA6174/hw2.1/firmware-5.bin
> firmware:       ath10k/QCA6174/hw2.1/firmware-4.bin
> firmware:       ath10k/QCA988X/hw2.0/board-2.bin
> firmware:       ath10k/QCA988X/hw2.0/board.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware-5.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware-4.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware-3.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware-2.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware.bin
> license:        Dual BSD/GPL
> description:    Driver support for Atheros QCA988X PCIe devices
> author:         Qualcomm Atheros
> srcversion:     8CBDAC7980FC042032AE6A6
> alias:          pci:v0000168Cd00000042sv*sd*bc*sc*i*
> alias:          pci:v0000168Cd00000040sv*sd*bc*sc*i*
> alias:          pci:v0000168Cd0000003Esv*sd*bc*sc*i*
> alias:          pci:v0000168Cd00000041sv*sd*bc*sc*i*
> alias:          pci:v0000168Cd0000003Csv*sd*bc*sc*i*
> depends:        ath10k_core
> intree:         Y
> vermagic:       4.4.0-59-generic SMP mod_unload modversions
> parm:           irq_mode:0: auto, 1: legacy, 2: msi (default: 0) (uint)
> parm:           reset_mode:0: auto, 1: warm only (default: 0) (uint)
>
> ethtool -i wlan2
> driver: ath10k_pci
> version: 4.4.0-59-generic
> firmware-version: 10.2.4.70.9-2
> bus-info: 0000:04:00.0
> supports-statistics: yes
> supports-test: no
> supports-eeprom-access: no
> supports-register-dump: no
> supports-priv-flags: no
>
> iw list
> Wiphy phy0
>         Band 1:
>                 Capabilities: 0x19e3
>                         RX LDPC
>                         HT20/HT40
>                         Static SM Power Save
>                         RX HT20 SGI
>                         RX HT40 SGI
>                         TX STBC
>                         RX STBC 1-stream
>                         Max AMSDU length: 7935 bytes
>                         DSSS/CCK HT40
>                 Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>                 Minimum RX AMPDU time spacing: 8 usec (0x06)
>                 HT TX/RX MCS rate indexes supported: 0-23
>                 Frequencies:
>                         * 2412 MHz [1] (27.0 dBm)
>                         * 2417 MHz [2] (27.0 dBm)
>                         * 2422 MHz [3] (27.0 dBm)
>                         * 2427 MHz [4] (27.0 dBm)
>                         * 2432 MHz [5] (27.0 dBm)
>                         * 2437 MHz [6] (27.0 dBm)
>                         * 2442 MHz [7] (27.0 dBm)
>                         * 2447 MHz [8] (27.0 dBm)
>                         * 2452 MHz [9] (27.0 dBm)
>                         * 2457 MHz [10] (27.0 dBm)
>                         * 2462 MHz [11] (27.0 dBm)
>                         * 2472 MHz [13] (disabled)
>                         * 2484 MHz [14] (disabled)
>                 Bitrates (non-HT):
>                         * 1.0 Mbps
>                         * 2.0 Mbps (short preamble supported)
>                         * 5.5 Mbps (short preamble supported)
>                         * 11.0 Mbps (short preamble supported)
>                         * 6.0 Mbps
>                         * 9.0 Mbps
>                         * 12.0 Mbps
>                         * 18.0 Mbps
>                         * 24.0 Mbps
>                         * 36.0 Mbps
>                         * 48.0 Mbps
>                         * 54.0 Mbps
>         Band 2:
>                 Capabilities: 0x19e3
>                         RX LDPC
>                         HT20/HT40
>                         Static SM Power Save
>                         RX HT20 SGI
>                         RX HT40 SGI
>                         TX STBC
>                         RX STBC 1-stream
>                         Max AMSDU length: 7935 bytes
>                         DSSS/CCK HT40
>                 Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>                 Minimum RX AMPDU time spacing: 8 usec (0x06)
>                 HT TX/RX MCS rate indexes supported: 0-23
>                 Frequencies:
>                         * 5180 MHz [36] (17.0 dBm)
>                         * 5200 MHz [40] (17.0 dBm)
>                         * 5220 MHz [44] (17.0 dBm)
>                         * 5240 MHz [48] (17.0 dBm)
>                         * 5260 MHz [52] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5280 MHz [56] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5300 MHz [60] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5320 MHz [64] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5500 MHz [100] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5520 MHz [104] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5540 MHz [108] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5560 MHz [112] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5580 MHz [116] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5600 MHz [120] (disabled)
>                         * 5620 MHz [124] (disabled)
>                         * 5640 MHz [128] (disabled)
>                         * 5660 MHz [132] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5680 MHz [136] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5700 MHz [140] (20.0 dBm) (passive scanning,
> no IBSS, radar detection)
>                         * 5745 MHz [149] (30.0 dBm)
>                         * 5765 MHz [153] (30.0 dBm)
>                         * 5785 MHz [157] (30.0 dBm)
>                         * 5805 MHz [161] (30.0 dBm)
>                         * 5825 MHz [165] (30.0 dBm)
>                 Bitrates (non-HT):
>                         * 6.0 Mbps
>                         * 9.0 Mbps
>                         * 12.0 Mbps
>                         * 18.0 Mbps
>                         * 24.0 Mbps
>                         * 36.0 Mbps
>                         * 48.0 Mbps
>                         * 54.0 Mbps
>         max # scan SSIDs: 16
>         max scan IEs length: 195 bytes
>         Coverage class: 0 (up to 0m)
>         Supported Ciphers:
>                 * WEP40 (00-0f-ac:1)
>                 * WEP104 (00-0f-ac:5)
>                 * TKIP (00-0f-ac:2)
>                 * CCMP (00-0f-ac:4)
>                 * CMAC (00-0f-ac:6)
>         Available Antennas: TX 0x7 RX 0x7
>         Configured Antennas: TX 0x7 RX 0x7
>         Supported interface modes:
>                  * managed
>                  * AP
>                  * AP/VLAN
>                  * monitor
>                  * mesh point
>         software interface modes (can always be added):
>                  * AP/VLAN
>                  * monitor
>         valid interface combinations:
>                  * #{ AP, mesh point } <= 8,
>                    total <= 8, #channels <= 1, STA/AP BI must match
>         Supported commands:
>                  * new_interface
>                  * set_interface
>                  * new_key
>                  * new_beacon
>                  * new_station
>                  * new_mpath
>                  * set_mesh_params
>                  * set_bss
>                  * authenticate
>                  * associate
>                  * deauthenticate
>                  * disassociate
>                  * join_ibss
>                  * join_mesh
>                  * remain_on_channel
>                  * set_tx_bitrate_mask
>                  * action
>                  * frame_wait_cancel
>                  * set_wiphy_netns
>                  * set_channel
>                  * set_wds_peer
>                  * Unknown command (84)
>                  * Unknown command (87)
>                  * Unknown command (85)
>                  * Unknown command (89)
>                  * Unknown command (92)
>                  * connect
>                  * disconnect
>         Supported TX frame types:
>                  * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
> 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
> 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
> 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
> 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70
> 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>                  * Unknown mode (10): 0x00 0x10 0x20 0x30 0x40 0x50
> 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>         Supported RX frame types:
>                  * IBSS: 0x40 0xb0 0xc0 0xd0
>                  * managed: 0x40 0xd0
>                  * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>                  * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>                  * mesh point: 0xb0 0xc0 0xd0
>                  * P2P-client: 0x40 0xd0
>                  * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>                  * Unknown mode (10): 0x40 0xd0
>         Device supports RSN-IBSS.
>         Device supports AP-side u-APSD.
>         HT Capability overrides:
>                  * MCS: ff ff ff ff ff ff ff ff ff ff
>                  * maximum A-MSDU length
>                  * supported channel width
>                  * short GI for 40 MHz
>                  * max A-MPDU length exponent
>                  * min MPDU start spacing
>         Device supports TX status socket option.
>         Device supports HT-IBSS.
>
> Any thoughts on why my throughput numbers are so low or suggestions
> would be greatly appreciated.
>
> Regards,
> Martin
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
