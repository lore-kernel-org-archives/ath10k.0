Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from marchena.puc.rediris.es ([2001:720:418:ca00::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZYlC-0002W6-HG
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 06:21:36 +0000
Received: from [2001:40b0:7c22:6020:ccd9:8dc8:bdfb:2992] (helo=leo)
 by marchena.puc.rediris.es with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <jbaranda@cttc.es>) id 1ZZYkZ-0008Qb-Oy
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 08:21:04 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 947631FE10
 for <ath10k@lists.infradead.org>; Wed,  9 Sep 2015 08:20:52 +0200 (CEST)
Message-ID: <55EFCFC8.4050303@cttc.es>
Date: Wed, 09 Sep 2015 08:20:56 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Re: WLE600VX from PCEngines
References: <CAGNwC3mbOJcEyrJGB8vcQ8Sa7ip-g+TcuCG9Ksm+8xYvAqiQ6w@mail.gmail.com>
 <CALhHN=rHMicEVMWrHowFwt+U+EwsKeh03SKGfoHtpD+_kKj_4w@mail.gmail.com>
In-Reply-To: <CALhHN=rHMicEVMWrHowFwt+U+EwsKeh03SKGfoHtpD+_kKj_4w@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi everyone,

Reading this thread, I would like to share with people some doubts about =

it.
@Marco, I imagine you want to run your WLE600VX device using the =

802.11ac protocol, isn't it?
@Janusz, with running wpa_supplicant on both computers, will the ad-hoc =

connection be established? I am starting with these tools and now, I am =

getting used to know how they work. I was creating the ad-hoc connection =

with the iw tool.

Thanks,



El 09/09/15 07:50, Janusz Dziedzic escribi=F3:
> On 8 September 2015 at 23:31, Marcel H. <maco@blava.net> wrote:
>> Hi everyone,
>> I have an interesting issue - I'm trying to run the QCA9882 based card
>> in IBSS mode (to be used for BATMAN), however all I can do is to run
>> in in 40Mhz channel width in 5GHz spectrum. Any attempt to run it in
>> 80MHz width resolves in the following:
>>
> You should run IBSS using fresh wpa_supplicant (best latest code). By
> default should run in 80MHz.
> Other case is your regulatory - are you allow to use 80MHz on channel
> 157? First try 5180.
>
> eg. of wpa_supplicant config:
>
> network =3D {
>      ssid=3D"test_ibss"
>      key_mgmt=3DNONE
>      mode=3D1
>      frequency=3D5180
> }
>
> BR
> Janusz
>
>> Interface wlan0
>>      ifindex 5
>>      wdev 0x1
>>      addr 04:f0:21:1b:5f:3b
>>      ssid my-mesh-network
>>      type IBSS
>>      wiphy 0
>>      channel 157 (5785 MHz), width: 40 MHz, center1: 5795 MHz
>> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
>> command failed: Invalid argument (-22)
>> root@voyage2:/opt/ca_node/bin# ip link set wlan0 down
>> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
>> command failed: Invalid argument (-22)
>>
>>
>> More info:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> 06:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless
>> Network Adapter
>>      Flags: bus master, fast devsel, latency 0, IRQ 27
>>      Memory at f7400000 (64-bit, non-prefetchable) [size=3D2M]
>>      Expansion ROM at f7600000 [disabled] [size=3D64K]
>>      Capabilities: [40] Power Management version 2
>>      Capabilities: [50] MSI: Enable+ Count=3D1/8 Maskable+ 64bit-
>>      Capabilities: [70] Express Endpoint, MSI 00
>>      Capabilities: [100] Advanced Error Reporting
>>      Capabilities: [140] Virtual Channel
>>      Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
>>      Kernel driver in use: ath10k_pci
>>
>> root@voyage2:/opt/ca_node/bin# iw reg get
>> country US: DFS-FCC
>>      (2402 - 2472 @ 40), (N/A, 30), (N/A)
>>      (5170 - 5250 @ 80), (N/A, 17), (N/A)
>>      (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
>>      (5735 - 5835 @ 80), (N/A, 30), (N/A)
>>      (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>>
>>
>> root@voyage2:/opt/ca_node/bin# uname -a
>> Linux voyage2 4.2.0-wl-ath-261216-gd89281c #1 SMP Tue Sep 8 14:03:33
>> GMT 2015 i686 GNU/Linux
>> (todays checkout from https://github.com/kvalo/ath + Voyage Linux 0.10 .=
config)
>>
>> root@voyage2:/lib/firmware/ath10k/QCA988X/hw2.0# md5sum ./firmware-2.bin
>> e2db04b651c2b5ced4732f3f009a1cce  ./firmware-2.bin
>> (this is from the 'main' directory in the
>> https://github.com/kvalo/ath10k-firmware)
>>
>>
>> Wiphy phy0
>>      max # scan SSIDs: 16
>>      max scan IEs length: 195 bytes
>>      Retry short limit: 7
>>      Retry long limit: 4
>>      Coverage class: 0 (up to 0m)
>>      Device supports RSN-IBSS.
>>      Device supports AP-side u-APSD.
>>      Supported Ciphers:
>>          * WEP40 (00-0f-ac:1)
>>          * WEP104 (00-0f-ac:5)
>>          * TKIP (00-0f-ac:2)
>>          * CCMP (00-0f-ac:4)
>>          * CMAC (00-0f-ac:6)
>>      Available Antennas: TX 0x3 RX 0x3
>>      Configured Antennas: TX 0x3 RX 0x3
>>      Supported interface modes:
>>           * IBSS
>>           * managed
>>           * AP
>>           * AP/VLAN
>>           * monitor
>>           * P2P-client
>>           * P2P-GO
>>           * P2P-device
>>      Band 1:
>>          Capabilities: 0x19e3
>>              RX LDPC
>>              HT20/HT40
>>              Static SM Power Save
>>              RX HT20 SGI
>>              RX HT40 SGI
>>              TX STBC
>>              RX STBC 1-stream
>>              Max AMSDU length: 7935 bytes
>>              DSSS/CCK HT40
>>          Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>>          Minimum RX AMPDU time spacing: 8 usec (0x06)
>>          HT TX/RX MCS rate indexes supported: 0-15
>>          VHT Capabilities (0x338001b2):
>>              Max MPDU length: 11454
>>              Supported Channel Width: neither 160 nor 80+80
>>              RX LDPC
>>              short GI (80 MHz)
>>              TX STBC
>>              RX antenna pattern consistency
>>              TX antenna pattern consistency
>>          VHT RX MCS set:
>>              1 streams: MCS 0-9
>>              2 streams: MCS 0-9
>>              3 streams: not supported
>>              4 streams: not supported
>>              5 streams: not supported
>>              6 streams: not supported
>>              7 streams: not supported
>>              8 streams: not supported
>>          VHT RX highest supported: 0 Mbps
>>          VHT TX MCS set:
>>              1 streams: MCS 0-9
>>              2 streams: MCS 0-9
>>              3 streams: not supported
>>              4 streams: not supported
>>              5 streams: not supported
>>              6 streams: not supported
>>              7 streams: not supported
>>              8 streams: not supported
>>          VHT TX highest supported: 0 Mbps
>>          Bitrates (non-HT):
>>              * 1.0 Mbps
>>              * 2.0 Mbps (short preamble supported)
>>              * 5.5 Mbps (short preamble supported)
>>              * 11.0 Mbps (short preamble supported)
>>              * 6.0 Mbps
>>              * 9.0 Mbps
>>              * 12.0 Mbps
>>              * 18.0 Mbps
>>              * 24.0 Mbps
>>              * 36.0 Mbps
>>              * 48.0 Mbps
>>              * 54.0 Mbps
>>          Frequencies:
>>              * 2412 MHz [1] (30.0 dBm)
>>              * 2417 MHz [2] (30.0 dBm)
>>              * 2422 MHz [3] (30.0 dBm)
>>              * 2427 MHz [4] (30.0 dBm)
>>              * 2432 MHz [5] (30.0 dBm)
>>              * 2437 MHz [6] (30.0 dBm)
>>              * 2442 MHz [7] (30.0 dBm)
>>              * 2447 MHz [8] (30.0 dBm)
>>              * 2452 MHz [9] (30.0 dBm)
>>              * 2457 MHz [10] (30.0 dBm)
>>              * 2462 MHz [11] (30.0 dBm)
>>              * 2467 MHz [12] (disabled)
>>              * 2472 MHz [13] (disabled)
>>              * 2484 MHz [14] (disabled)
>>      Band 2:
>>          Capabilities: 0x19e3
>>              RX LDPC
>>              HT20/HT40
>>              Static SM Power Save
>>              RX HT20 SGI
>>              RX HT40 SGI
>>              TX STBC
>>              RX STBC 1-stream
>>              Max AMSDU length: 7935 bytes
>>              DSSS/CCK HT40
>>          Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>>          Minimum RX AMPDU time spacing: 8 usec (0x06)
>>          HT TX/RX MCS rate indexes supported: 0-15
>>          VHT Capabilities (0x338001b2):
>>              Max MPDU length: 11454
>>              Supported Channel Width: neither 160 nor 80+80
>>              RX LDPC
>>              short GI (80 MHz)
>>              TX STBC
>>              RX antenna pattern consistency
>>              TX antenna pattern consistency
>>          VHT RX MCS set:
>>              1 streams: MCS 0-9
>>              2 streams: MCS 0-9
>>              3 streams: not supported
>>              4 streams: not supported
>>              5 streams: not supported
>>              6 streams: not supported
>>              7 streams: not supported
>>              8 streams: not supported
>>          VHT RX highest supported: 0 Mbps
>>          VHT TX MCS set:
>>              1 streams: MCS 0-9
>>              2 streams: MCS 0-9
>>              3 streams: not supported
>>              4 streams: not supported
>>              5 streams: not supported
>>              6 streams: not supported
>>              7 streams: not supported
>>              8 streams: not supported
>>          VHT TX highest supported: 0 Mbps
>>          Bitrates (non-HT):
>>              * 6.0 Mbps
>>              * 9.0 Mbps
>>              * 12.0 Mbps
>>              * 18.0 Mbps
>>              * 24.0 Mbps
>>              * 36.0 Mbps
>>              * 48.0 Mbps
>>              * 54.0 Mbps
>>          Frequencies:
>>              * 5180 MHz [36] (17.0 dBm)
>>              * 5200 MHz [40] (17.0 dBm)
>>              * 5220 MHz [44] (17.0 dBm)
>>              * 5240 MHz [48] (17.0 dBm)
>>              * 5260 MHz [52] (23.0 dBm) (no IR, radar detection)
>>                DFS state: usable (for 1076 sec)
>>                DFS CAC time: 60000 ms
>>              * 5280 MHz [56] (23.0 dBm) (no IR, radar detection)
>>                DFS state: usable (for 1076 sec)
>>                DFS CAC time: 60000 ms
>>              * 5300 MHz [60] (23.0 dBm) (no IR, radar detection)
>>                DFS state: usable (for 1076 sec)
>>                DFS CAC time: 60000 ms
>>              * 5320 MHz [64] (23.0 dBm) (no IR, radar detection)
>>                DFS state: usable (for 1076 sec)
>>                DFS CAC time: 60000 ms
>>              * 5500 MHz [100] (disabled)
>>              * 5520 MHz [104] (disabled)
>>              * 5540 MHz [108] (disabled)
>>              * 5560 MHz [112] (disabled)
>>              * 5580 MHz [116] (disabled)
>>              * 5600 MHz [120] (disabled)
>>              * 5620 MHz [124] (disabled)
>>              * 5640 MHz [128] (disabled)
>>              * 5660 MHz [132] (disabled)
>>              * 5680 MHz [136] (disabled)
>>              * 5700 MHz [140] (disabled)
>>              * 5720 MHz [144] (disabled)
>>              * 5745 MHz [149] (30.0 dBm)
>>              * 5765 MHz [153] (30.0 dBm)
>>              * 5785 MHz [157] (30.0 dBm)
>>              * 5805 MHz [161] (30.0 dBm)
>>              * 5825 MHz [165] (30.0 dBm)
>>      Supported commands:
>>           * new_interface
>>           * set_interface
>>           * new_key
>>           * start_ap
>>           * new_station
>>           * set_bss
>>           * authenticate
>>           * associate
>>           * deauthenticate
>>           * disassociate
>>           * join_ibss
>>           * remain_on_channel
>>           * set_tx_bitrate_mask
>>           * frame
>>           * frame_wait_cancel
>>           * set_wiphy_netns
>>           * set_channel
>>           * set_wds_peer
>>           * probe_client
>>           * set_noack_map
>>           * register_beacons
>>           * start_p2p_device
>>           * set_mcast_rate
>>           * testmode
>>           * channel_switch
>>           * Unknown command (104)
>>           * connect
>>           * disconnect
>>      Supported TX frame types:
>>           * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
>> 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90
>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>           * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80
>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>      Supported RX frame types:
>>           * IBSS: 0x40 0xb0 0xc0 0xd0
>>           * managed: 0x40 0xd0
>>           * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>           * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>           * mesh point: 0xb0 0xc0 0xd0
>>           * P2P-client: 0x40 0xd0
>>           * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>           * P2P-device: 0x40 0xd0
>>      software interface modes (can always be added):
>>           * AP/VLAN
>>           * monitor
>>      valid interface combinations:
>>           * #{ managed, P2P-client } <=3D 8, #{ P2P-GO } <=3D 3, #{
>> P2P-device } <=3D 1, #{ AP } <=3D 7,
>>             total <=3D 8, #channels <=3D 1, STA/AP BI must match
>>      HT Capability overrides:
>>           * MCS: ff ff ff ff ff ff ff ff ff ff
>>           * maximum A-MSDU length
>>           * supported channel width
>>           * short GI for 40 MHz
>>           * max A-MPDU length exponent
>>           * min MPDU start spacing
>>      Device supports TX status socket option.
>>      Device supports HT-IBSS.
>>      Device supports SAE with AUTHENTICATE command
>>      Device supports scan flush.
>>      Device supports per-vif TX power setting
>>      Driver supports a userspace MPM
>>      Driver/device bandwidth changes during BSS lifetime (AP/GO mode)
>>      Device supports static SMPS
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>
>> I am grateful for any help here and do have some time to help
>> debugging the issue.
>>
>> Marcel
>>
>> --
>>
>> ------------------------------------------------------
>> This message is not intended to have
>> contractual effect
>> ------------------------------------------------------
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


-- =

Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
