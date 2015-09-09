Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZYHj-0005X3-Bx
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 05:51:09 +0000
Received: by ykdu9 with SMTP id u9so78755841ykd.2
 for <ath10k@lists.infradead.org>; Tue, 08 Sep 2015 22:50:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGNwC3mbOJcEyrJGB8vcQ8Sa7ip-g+TcuCG9Ksm+8xYvAqiQ6w@mail.gmail.com>
References: <CAGNwC3mbOJcEyrJGB8vcQ8Sa7ip-g+TcuCG9Ksm+8xYvAqiQ6w@mail.gmail.com>
Date: Wed, 9 Sep 2015 07:50:44 +0200
Message-ID: <CALhHN=rHMicEVMWrHowFwt+U+EwsKeh03SKGfoHtpD+_kKj_4w@mail.gmail.com>
Subject: Re: WLE600VX from PCEngines
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: "Marcel H." <maco@blava.net>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 8 September 2015 at 23:31, Marcel H. <maco@blava.net> wrote:
> Hi everyone,
> I have an interesting issue - I'm trying to run the QCA9882 based card
> in IBSS mode (to be used for BATMAN), however all I can do is to run
> in in 40Mhz channel width in 5GHz spectrum. Any attempt to run it in
> 80MHz width resolves in the following:
>
You should run IBSS using fresh wpa_supplicant (best latest code). By
default should run in 80MHz.
Other case is your regulatory - are you allow to use 80MHz on channel
157? First try 5180.

eg. of wpa_supplicant config:

network = {
    ssid="test_ibss"
    key_mgmt=NONE
    mode=1
    frequency=5180
}

BR
Janusz

> Interface wlan0
>     ifindex 5
>     wdev 0x1
>     addr 04:f0:21:1b:5f:3b
>     ssid my-mesh-network
>     type IBSS
>     wiphy 0
>     channel 157 (5785 MHz), width: 40 MHz, center1: 5795 MHz
> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
> command failed: Invalid argument (-22)
> root@voyage2:/opt/ca_node/bin# ip link set wlan0 down
> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
> command failed: Invalid argument (-22)
>
>
> More info:
> =====================================================
> 06:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
> Network Adapter
>     Flags: bus master, fast devsel, latency 0, IRQ 27
>     Memory at f7400000 (64-bit, non-prefetchable) [size=2M]
>     Expansion ROM at f7600000 [disabled] [size=64K]
>     Capabilities: [40] Power Management version 2
>     Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
>     Capabilities: [70] Express Endpoint, MSI 00
>     Capabilities: [100] Advanced Error Reporting
>     Capabilities: [140] Virtual Channel
>     Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
>     Kernel driver in use: ath10k_pci
>
> root@voyage2:/opt/ca_node/bin# iw reg get
> country US: DFS-FCC
>     (2402 - 2472 @ 40), (N/A, 30), (N/A)
>     (5170 - 5250 @ 80), (N/A, 17), (N/A)
>     (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
>     (5735 - 5835 @ 80), (N/A, 30), (N/A)
>     (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
>
> root@voyage2:/opt/ca_node/bin# uname -a
> Linux voyage2 4.2.0-wl-ath-261216-gd89281c #1 SMP Tue Sep 8 14:03:33
> GMT 2015 i686 GNU/Linux
> (todays checkout from https://github.com/kvalo/ath + Voyage Linux 0.10 .config)
>
> root@voyage2:/lib/firmware/ath10k/QCA988X/hw2.0# md5sum ./firmware-2.bin
> e2db04b651c2b5ced4732f3f009a1cce  ./firmware-2.bin
> (this is from the 'main' directory in the
> https://github.com/kvalo/ath10k-firmware)
>
>
> Wiphy phy0
>     max # scan SSIDs: 16
>     max scan IEs length: 195 bytes
>     Retry short limit: 7
>     Retry long limit: 4
>     Coverage class: 0 (up to 0m)
>     Device supports RSN-IBSS.
>     Device supports AP-side u-APSD.
>     Supported Ciphers:
>         * WEP40 (00-0f-ac:1)
>         * WEP104 (00-0f-ac:5)
>         * TKIP (00-0f-ac:2)
>         * CCMP (00-0f-ac:4)
>         * CMAC (00-0f-ac:6)
>     Available Antennas: TX 0x3 RX 0x3
>     Configured Antennas: TX 0x3 RX 0x3
>     Supported interface modes:
>          * IBSS
>          * managed
>          * AP
>          * AP/VLAN
>          * monitor
>          * P2P-client
>          * P2P-GO
>          * P2P-device
>     Band 1:
>         Capabilities: 0x19e3
>             RX LDPC
>             HT20/HT40
>             Static SM Power Save
>             RX HT20 SGI
>             RX HT40 SGI
>             TX STBC
>             RX STBC 1-stream
>             Max AMSDU length: 7935 bytes
>             DSSS/CCK HT40
>         Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>         Minimum RX AMPDU time spacing: 8 usec (0x06)
>         HT TX/RX MCS rate indexes supported: 0-15
>         VHT Capabilities (0x338001b2):
>             Max MPDU length: 11454
>             Supported Channel Width: neither 160 nor 80+80
>             RX LDPC
>             short GI (80 MHz)
>             TX STBC
>             RX antenna pattern consistency
>             TX antenna pattern consistency
>         VHT RX MCS set:
>             1 streams: MCS 0-9
>             2 streams: MCS 0-9
>             3 streams: not supported
>             4 streams: not supported
>             5 streams: not supported
>             6 streams: not supported
>             7 streams: not supported
>             8 streams: not supported
>         VHT RX highest supported: 0 Mbps
>         VHT TX MCS set:
>             1 streams: MCS 0-9
>             2 streams: MCS 0-9
>             3 streams: not supported
>             4 streams: not supported
>             5 streams: not supported
>             6 streams: not supported
>             7 streams: not supported
>             8 streams: not supported
>         VHT TX highest supported: 0 Mbps
>         Bitrates (non-HT):
>             * 1.0 Mbps
>             * 2.0 Mbps (short preamble supported)
>             * 5.5 Mbps (short preamble supported)
>             * 11.0 Mbps (short preamble supported)
>             * 6.0 Mbps
>             * 9.0 Mbps
>             * 12.0 Mbps
>             * 18.0 Mbps
>             * 24.0 Mbps
>             * 36.0 Mbps
>             * 48.0 Mbps
>             * 54.0 Mbps
>         Frequencies:
>             * 2412 MHz [1] (30.0 dBm)
>             * 2417 MHz [2] (30.0 dBm)
>             * 2422 MHz [3] (30.0 dBm)
>             * 2427 MHz [4] (30.0 dBm)
>             * 2432 MHz [5] (30.0 dBm)
>             * 2437 MHz [6] (30.0 dBm)
>             * 2442 MHz [7] (30.0 dBm)
>             * 2447 MHz [8] (30.0 dBm)
>             * 2452 MHz [9] (30.0 dBm)
>             * 2457 MHz [10] (30.0 dBm)
>             * 2462 MHz [11] (30.0 dBm)
>             * 2467 MHz [12] (disabled)
>             * 2472 MHz [13] (disabled)
>             * 2484 MHz [14] (disabled)
>     Band 2:
>         Capabilities: 0x19e3
>             RX LDPC
>             HT20/HT40
>             Static SM Power Save
>             RX HT20 SGI
>             RX HT40 SGI
>             TX STBC
>             RX STBC 1-stream
>             Max AMSDU length: 7935 bytes
>             DSSS/CCK HT40
>         Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>         Minimum RX AMPDU time spacing: 8 usec (0x06)
>         HT TX/RX MCS rate indexes supported: 0-15
>         VHT Capabilities (0x338001b2):
>             Max MPDU length: 11454
>             Supported Channel Width: neither 160 nor 80+80
>             RX LDPC
>             short GI (80 MHz)
>             TX STBC
>             RX antenna pattern consistency
>             TX antenna pattern consistency
>         VHT RX MCS set:
>             1 streams: MCS 0-9
>             2 streams: MCS 0-9
>             3 streams: not supported
>             4 streams: not supported
>             5 streams: not supported
>             6 streams: not supported
>             7 streams: not supported
>             8 streams: not supported
>         VHT RX highest supported: 0 Mbps
>         VHT TX MCS set:
>             1 streams: MCS 0-9
>             2 streams: MCS 0-9
>             3 streams: not supported
>             4 streams: not supported
>             5 streams: not supported
>             6 streams: not supported
>             7 streams: not supported
>             8 streams: not supported
>         VHT TX highest supported: 0 Mbps
>         Bitrates (non-HT):
>             * 6.0 Mbps
>             * 9.0 Mbps
>             * 12.0 Mbps
>             * 18.0 Mbps
>             * 24.0 Mbps
>             * 36.0 Mbps
>             * 48.0 Mbps
>             * 54.0 Mbps
>         Frequencies:
>             * 5180 MHz [36] (17.0 dBm)
>             * 5200 MHz [40] (17.0 dBm)
>             * 5220 MHz [44] (17.0 dBm)
>             * 5240 MHz [48] (17.0 dBm)
>             * 5260 MHz [52] (23.0 dBm) (no IR, radar detection)
>               DFS state: usable (for 1076 sec)
>               DFS CAC time: 60000 ms
>             * 5280 MHz [56] (23.0 dBm) (no IR, radar detection)
>               DFS state: usable (for 1076 sec)
>               DFS CAC time: 60000 ms
>             * 5300 MHz [60] (23.0 dBm) (no IR, radar detection)
>               DFS state: usable (for 1076 sec)
>               DFS CAC time: 60000 ms
>             * 5320 MHz [64] (23.0 dBm) (no IR, radar detection)
>               DFS state: usable (for 1076 sec)
>               DFS CAC time: 60000 ms
>             * 5500 MHz [100] (disabled)
>             * 5520 MHz [104] (disabled)
>             * 5540 MHz [108] (disabled)
>             * 5560 MHz [112] (disabled)
>             * 5580 MHz [116] (disabled)
>             * 5600 MHz [120] (disabled)
>             * 5620 MHz [124] (disabled)
>             * 5640 MHz [128] (disabled)
>             * 5660 MHz [132] (disabled)
>             * 5680 MHz [136] (disabled)
>             * 5700 MHz [140] (disabled)
>             * 5720 MHz [144] (disabled)
>             * 5745 MHz [149] (30.0 dBm)
>             * 5765 MHz [153] (30.0 dBm)
>             * 5785 MHz [157] (30.0 dBm)
>             * 5805 MHz [161] (30.0 dBm)
>             * 5825 MHz [165] (30.0 dBm)
>     Supported commands:
>          * new_interface
>          * set_interface
>          * new_key
>          * start_ap
>          * new_station
>          * set_bss
>          * authenticate
>          * associate
>          * deauthenticate
>          * disassociate
>          * join_ibss
>          * remain_on_channel
>          * set_tx_bitrate_mask
>          * frame
>          * frame_wait_cancel
>          * set_wiphy_netns
>          * set_channel
>          * set_wds_peer
>          * probe_client
>          * set_noack_map
>          * register_beacons
>          * start_p2p_device
>          * set_mcast_rate
>          * testmode
>          * channel_switch
>          * Unknown command (104)
>          * connect
>          * disconnect
>     Supported TX frame types:
>          * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>          * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>          * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>     Supported RX frame types:
>          * IBSS: 0x40 0xb0 0xc0 0xd0
>          * managed: 0x40 0xd0
>          * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>          * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>          * mesh point: 0xb0 0xc0 0xd0
>          * P2P-client: 0x40 0xd0
>          * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>          * P2P-device: 0x40 0xd0
>     software interface modes (can always be added):
>          * AP/VLAN
>          * monitor
>     valid interface combinations:
>          * #{ managed, P2P-client } <= 8, #{ P2P-GO } <= 3, #{
> P2P-device } <= 1, #{ AP } <= 7,
>            total <= 8, #channels <= 1, STA/AP BI must match
>     HT Capability overrides:
>          * MCS: ff ff ff ff ff ff ff ff ff ff
>          * maximum A-MSDU length
>          * supported channel width
>          * short GI for 40 MHz
>          * max A-MPDU length exponent
>          * min MPDU start spacing
>     Device supports TX status socket option.
>     Device supports HT-IBSS.
>     Device supports SAE with AUTHENTICATE command
>     Device supports scan flush.
>     Device supports per-vif TX power setting
>     Driver supports a userspace MPM
>     Driver/device bandwidth changes during BSS lifetime (AP/GO mode)
>     Device supports static SMPS
> =====================================================
>
> I am grateful for any help here and do have some time to help
> debugging the issue.
>
> Marcel
>
> --
>
> ------------------------------------------------------
> This message is not intended to have
> contractual effect
> ------------------------------------------------------
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
