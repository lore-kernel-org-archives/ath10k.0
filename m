Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcbIJ-00088F-LT
 for ath10k@lists.infradead.org; Thu, 17 Sep 2015 15:40:24 +0000
Message-ID: <55FADEC6.2030107@cttc.es>
Date: Thu, 17 Sep 2015 17:39:50 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Re: WLE600VX from PCEngines
References: <CAGNwC3mbOJcEyrJGB8vcQ8Sa7ip-g+TcuCG9Ksm+8xYvAqiQ6w@mail.gmail.com>
 <CALhHN=rHMicEVMWrHowFwt+U+EwsKeh03SKGfoHtpD+_kKj_4w@mail.gmail.com>
 <55EFCFC8.4050303@cttc.es>
 <CALhHN=p71pLTUWJLB3Tnt--D0JbWXjw5vafhT=GjmGek_D1CYw@mail.gmail.com>
 <CAGNwC3kzphTT2f7p8HT44V_3Lo08j3Q774ObRVFj4Q81Z6yWjg@mail.gmail.com>
 <CAGNwC3kLtBs3pYFPfVZkzxzZUyk_m188hZid59ra0R+miVJw7w@mail.gmail.com>
 <55F01104.6010600@tu-bs.de> <55F01328.4070403@cttc.es>
 <55F014CF.6090809@tu-bs.de> <55FA9590.1090200@cttc.es>
In-Reply-To: <55FA9590.1090200@cttc.es>
Content-Type: multipart/mixed; boundary="------------040305020301010207070509"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, "Marcel H." <maco@blava.net>

This is a multi-part message in MIME format.
--------------040305020301010207070509
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Dear Marcel and all,

I have also followed your setup for trying to configure the 
wpa_supplicant program to setup a 80MHz link but it has not been possible.
After downloading the last version of wpa_supplicant with git (version 
2.5), and using your wpa_supplicant.conf file, the link was not possible 
to be setup (the log file is attached) .
It results that nl80211 driver is not compatible with ap_scan=2 option. 
If using ap_scan=1, the result is the same.
I have to use the wext driver to establish the link but it is a 20Mhz 
link . The output of iw dev wlan2 info is:

Interface wlan2
     ifindex 6
     wdev 0x200000001
     addr 04:f0:21:18:24:71
     ssid SC224SC225
     type IBSS
     wiphy 2
     channel 36 (5180 MHz), width: 20 MHz (no HT), center1: 5180 MHz

Anyone faced the same problem?
Maybe is not possible to setup the 80MHz link with the Candela Kernel 4.0.

Thank you very much in advance for your time and attention,

Regards,

Jordi


El 17/09/15 12:27, Jorge Baranda escribió:
> Dear Hannes and all,
>
> I have tried to replicate Hannes' setup to make work wpa_supplicant 
> with Candela Kernel 4.0 (and Candela firmware 10.1.467-ct-14), but I 
> have not been successful.
> I downloaded the last version of wpa_supplicant from 
> http://w1.fi/wpa_supplicant/ website, applied your changes in the 
> wpa_supplicant.c file and your .config file.
> Then I used your wpa_supplicant.conf file but it failed to start 
> (attached the full log). The error says that "the ctrl_interface 
> exists and seems to be in use"
>
> I have checked with ps aux to see if there is a wpa_supplicant process 
> but after kill it, it restarts again.
> This is the result of ps aux | grep wpa_supplicant:
>
> root      2368  0.0  0.0  30868  6140 ?        Ss   11:40   0:00 
> /sbin/wpa_supplicant -u -s -O /var/run/wpa_supplicant
> monet     2690  0.0  0.0  13688  2372 pts/9    S+   12:10   0:00 grep 
> --color=auto wpa_supplicant
>
> Browsing in the internet I have not found any answer to solve this 
> problem :(. Have you faced it?
>
> Then I have tried removing the "ctrl_interface line" from the 
> wpa_supplicant.conf file (resulting in a file similar to the one sent 
> by Marcel H.) and the program started in a loop (see attached 
> wpa_supplicant2.log). It seems like it tries to connect to the ssid 
> "test" but it is not able to find it (normal, because we want to 
> create it).
>
> Apart from this, in this setup, do I have to make any change also in 
> the /etc/network/interfaces file?
>
> Thank you very much for your time and attention,
>
> Regards,
>
> Jordi
>
>
>
> El 09/09/15 13:15, Harms, Hannes escribió:
>> My wpa_supplicant config:
>>
>>
>> ctrl_interface=DIR=/run/wpa_supplicant
>> ap_scan=2
>>
>> network={
>>     ssid="test"
>>     bssid=02:12:34:56:78:9A
>>     key_mgmt=NONE
>>     mode=1
>>     frequency=5180
>>     disable_ht=0
>>     disable_vht=0
>>     disable_max_amsdu=1 # not sure, works also without this flag
>> }
>>
>>
>> Regards
>> Hannes
>>
>> Am 09.09.2015 um 13:08 schrieb Jorge Baranda:
>>> Hi,
>>>
>>> Good news!! Harms, could you share full wpa_supplicant configuration 
>>> files?
>>> (for both computers).
>>> I will download the latest version of wpa_supplicant, apply your 
>>> changes and try
>>> to make work IBSS mode and 80MHz with Candela Kernel 4.0.
>>>
>>> Thanks,
>>>
>>> El 09/09/15 12:59, Harms, Hannes escribió:
>>>> Hi,
>>>>
>>>> I have  WLE900VX working in IBSS mode and 80 Mhz with Candela 
>>>> Kernel 4.2.
>>>> For me also the latest wpa_supplicant was not able to activate 
>>>> 80MHz by default , I don't no why.
>>>>
>>>> The only way I found to get it working was to modify 
>>>> wpa_supplicant/wpa_supplicant.c
>>>> Commit following  two lines in wpa_supplicant.c like this :
>>>>
>>>> //if (!(wpa_s->drv_flags & WPA_DRIVER_FLAGS_VHT_IBSS))
>>>> //   return;
>>>>
>>>> That was all for me  to get it working.
>>>>
>>>> wpa_supplicant config file:
>>>> # Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is 
>>>> ignored)
>>>> CONFIG_LIBNL32=y
>>>>
>>>> # Support VHT overrides (disable VHT, mask MCS rates, etc.)
>>>> CONFIG_VHT_OVERRIDES=y
>>>>
>>>> # Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
>>>> CONFIG_HT_OVERRIDES=y
>>>>
>>>> # IEEE 802.11n (High Throughput) support (mainly for AP mode)
>>>> CONFIG_IEEE80211N=y
>>>>
>>>> # IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
>>>> # (depends on CONFIG_IEEE80211N)
>>>> CONFIG_IEEE80211AC=y
>>>>
>>>> # IEEE 802.11w (management frame protection), also known as PMF
>>>> # Driver support is also needed for IEEE 802.11w.
>>>> CONFIG_IEEE80211W=y
>>>>
>>>> Am 09.09.2015 um 11:46 schrieb Marcel H.:
>>>>> May I ask someone for support on this one?
>>>>> We would really like to make this work and I'm running out of ideas -
>>>>> is there any way do turn detailed debugging on to get a better
>>>>> understanding why do I get the following message back? ->
>>>>>
>>>>> root@voyage1:/opt/ca_node/etc# iw wlan0 set freq 5745 80 5775
>>>>> command failed: Device or resource busy (-16)
>>>>>
>>>>> Thanks,
>>>>> Marcel
>>>>>
>>>>> On Wed, Sep 9, 2015 at 9:49 AM, Marcel H. <maco@blava.net> wrote:
>>>>>> Thanks for the response, unfortunately this is the result of 
>>>>>> defining
>>>>>> the center frequency:
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# iw wlan0 set freq 5745 80 5775
>>>>>> command failed: Device or resource busy (-16)
>>>>>>
>>>>>> Also, using wpa_supplicant does not work using the following config:
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# cat wpa_supplicant-mesh.conf
>>>>>> ap_scan=2
>>>>>> ctrl_interface=/run/wpa_supplicant
>>>>>> update_config=1
>>>>>> device_type=0-00000000-0
>>>>>>
>>>>>> network={
>>>>>>      scan_ssid=1
>>>>>>      key_mgmt=NONE
>>>>>>      priority=1
>>>>>>      ssid="ibss"
>>>>>>      mode=1
>>>>>>      frequency=5180
>>>>>> }
>>>>>>
>>>>>> running as:
>>>>>> wpa_supplicant -i wlan0 -c ./wpa_supplicant-mesh.conf -dd -D 
>>>>>> nl80211,wext
>>>>>>
>>>>>>
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# iw dev wlan0 info
>>>>>> Interface wlan0
>>>>>>          ifindex 5
>>>>>>          wdev 0x100000001
>>>>>>          addr 04:f0:21:1b:5f:3d
>>>>>>          ssid ibss-rsn
>>>>>>          type IBSS
>>>>>>          wiphy 1
>>>>>>          channel 36 (5180 MHz), width: 20 MHz, center1: 5180 MHz
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# iw phy phy1 info
>>>>>> Wiphy phy1
>>>>>>                            DFS state: usable (for 46424 sec)
>>>>>>                            DFS CAC time: 60000 ms
>>>>>>                          * 5280 MHz [56] (23.0 dBm) (no IR, radar 
>>>>>> detection)
>>>>>>                            DFS state: usable (for 46424 sec)
>>>>>>                            DFS CAC time: 60000 ms
>>>>>>                          * 5300 MHz [60] (23.0 dBm) (no IR, radar 
>>>>>> detection)
>>>>>>                            DFS state: usable (for 46424 sec)
>>>>>>                            DFS CAC time: 60000 ms
>>>>>>                          * 5320 MHz [64] (23.0 dBm) (no IR, radar 
>>>>>> detection)
>>>>>>                            DFS state: usable (for 46424 sec)
>>>>>> Its fallbacking to 20MHz channels, which is even less than 40MHz
>>>>>> channels set manually by iw
>>>>>>
>>>>>>
>>>>>> How recent wpa_supplicat shall I try? I believe this it quite 
>>>>>> recent:
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# wpa_supplicant -v
>>>>>> wpa_supplicant v2.3
>>>>>> Copyright (c) 2003-2014, Jouni Malinen <j@w1.fi> and contributors
>>>>>>
>>>>>>
>>>>>> Re. the regulatory settings:
>>>>>>
>>>>>> root@voyage1:/opt/ca_node/etc# iw reg get
>>>>>> country US: DFS-FCC
>>>>>>          (2402 - 2472 @ 40), (N/A, 30), (N/A)
>>>>>>          (5170 - 5250 @ 80), (N/A, 17), (N/A)
>>>>>>          (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
>>>>>>          (5735 - 5835 @ 80), (N/A, 30), (N/A)
>>>>>>          (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>>>>>>
>>>>>>
>>>>>> Any other thoughts?
>>>>>>
>>>>>> Marcel
>>>>>>
>>>>>> On Wed, Sep 9, 2015 at 9:43 AM, Janusz Dziedzic
>>>>>> <janusz.dziedzic@tieto.com> wrote:
>>>>>>> On 9 September 2015 at 08:20, Jorge Baranda <jbaranda@cttc.es> 
>>>>>>> wrote:
>>>>>>>> Hi everyone,
>>>>>>>>
>>>>>>>> Reading this thread, I would like to share with people some 
>>>>>>>> doubts about it.
>>>>>>>> @Marco, I imagine you want to run your WLE600VX device using 
>>>>>>>> the 802.11ac
>>>>>>>> protocol, isn't it?
>>>>>>>> @Janusz, with running wpa_supplicant on both computers, will 
>>>>>>>> the ad-hoc
>>>>>>>> connection be established? I am starting with these tools and 
>>>>>>>> now, I am
>>>>>>>> getting used to know how they work. I was creating the ad-hoc 
>>>>>>>> connection
>>>>>>>> with the iw tool.
>>>>>>>>
>>>>>>> Yes you should use wpa_supplicant on both PC.
>>>>>>> In the future probably someone will add IBSS-VHT support also 
>>>>>>> for iw.
>>>>>>>
>>>>>>> BR
>>>>>>> Janusz
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> El 09/09/15 07:50, Janusz Dziedzic escribió:
>>>>>>>>
>>>>>>>>> On 8 September 2015 at 23:31, Marcel H. <maco@blava.net> wrote:
>>>>>>>>>> Hi everyone,
>>>>>>>>>> I have an interesting issue - I'm trying to run the QCA9882 
>>>>>>>>>> based card
>>>>>>>>>> in IBSS mode (to be used for BATMAN), however all I can do is 
>>>>>>>>>> to run
>>>>>>>>>> in in 40Mhz channel width in 5GHz spectrum. Any attempt to 
>>>>>>>>>> run it in
>>>>>>>>>> 80MHz width resolves in the following:
>>>>>>>>>>
>>>>>>>>> You should run IBSS using fresh wpa_supplicant (best latest 
>>>>>>>>> code). By
>>>>>>>>> default should run in 80MHz.
>>>>>>>>> Other case is your regulatory - are you allow to use 80MHz on 
>>>>>>>>> channel
>>>>>>>>> 157? First try 5180.
>>>>>>>>>
>>>>>>>>> eg. of wpa_supplicant config:
>>>>>>>>>
>>>>>>>>> network = {
>>>>>>>>>       ssid="test_ibss"
>>>>>>>>>       key_mgmt=NONE
>>>>>>>>>       mode=1
>>>>>>>>>       frequency=5180
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> BR
>>>>>>>>> Janusz
>>>>>>>>>
>>>>>>>>>> Interface wlan0
>>>>>>>>>>       ifindex 5
>>>>>>>>>>       wdev 0x1
>>>>>>>>>>       addr 04:f0:21:1b:5f:3b
>>>>>>>>>>       ssid my-mesh-network
>>>>>>>>>>       type IBSS
>>>>>>>>>>       wiphy 0
>>>>>>>>>>       channel 157 (5785 MHz), width: 40 MHz, center1: 5795 MHz
>>>>>>>>>> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
>>>>>>>>>> command failed: Invalid argument (-22)
>>>>>>>>>> root@voyage2:/opt/ca_node/bin# ip link set wlan0 down
>>>>>>>>>> root@voyage2:/opt/ca_node/bin# iw dev wlan0 set freq 5745 80
>>>>>>>>>> command failed: Invalid argument (-22)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> More info:
>>>>>>>>>> =====================================================
>>>>>>>>>> 06:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac 
>>>>>>>>>> Wireless
>>>>>>>>>> Network Adapter
>>>>>>>>>>       Flags: bus master, fast devsel, latency 0, IRQ 27
>>>>>>>>>>       Memory at f7400000 (64-bit, non-prefetchable) [size=2M]
>>>>>>>>>>       Expansion ROM at f7600000 [disabled] [size=64K]
>>>>>>>>>>       Capabilities: [40] Power Management version 2
>>>>>>>>>>       Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
>>>>>>>>>>       Capabilities: [70] Express Endpoint, MSI 00
>>>>>>>>>>       Capabilities: [100] Advanced Error Reporting
>>>>>>>>>>       Capabilities: [140] Virtual Channel
>>>>>>>>>>       Capabilities: [160] Device Serial Number 
>>>>>>>>>> 00-00-00-00-00-00-00-00
>>>>>>>>>>       Kernel driver in use: ath10k_pci
>>>>>>>>>>
>>>>>>>>>> root@voyage2:/opt/ca_node/bin# iw reg get
>>>>>>>>>> country US: DFS-FCC
>>>>>>>>>>       (2402 - 2472 @ 40), (N/A, 30), (N/A)
>>>>>>>>>>       (5170 - 5250 @ 80), (N/A, 17), (N/A)
>>>>>>>>>>       (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
>>>>>>>>>>       (5735 - 5835 @ 80), (N/A, 30), (N/A)
>>>>>>>>>>       (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> root@voyage2:/opt/ca_node/bin# uname -a
>>>>>>>>>> Linux voyage2 4.2.0-wl-ath-261216-gd89281c #1 SMP Tue Sep 8 
>>>>>>>>>> 14:03:33
>>>>>>>>>> GMT 2015 i686 GNU/Linux
>>>>>>>>>> (todays checkout from https://github.com/kvalo/ath + Voyage 
>>>>>>>>>> Linux 0.10
>>>>>>>>>> .config)
>>>>>>>>>>
>>>>>>>>>> root@voyage2:/lib/firmware/ath10k/QCA988X/hw2.0# md5sum 
>>>>>>>>>> ./firmware-2.bin
>>>>>>>>>> e2db04b651c2b5ced4732f3f009a1cce ./firmware-2.bin
>>>>>>>>>> (this is from the 'main' directory in the
>>>>>>>>>> https://github.com/kvalo/ath10k-firmware)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Wiphy phy0
>>>>>>>>>>       max # scan SSIDs: 16
>>>>>>>>>>       max scan IEs length: 195 bytes
>>>>>>>>>>       Retry short limit: 7
>>>>>>>>>>       Retry long limit: 4
>>>>>>>>>>       Coverage class: 0 (up to 0m)
>>>>>>>>>>       Device supports RSN-IBSS.
>>>>>>>>>>       Device supports AP-side u-APSD.
>>>>>>>>>>       Supported Ciphers:
>>>>>>>>>>           * WEP40 (00-0f-ac:1)
>>>>>>>>>>           * WEP104 (00-0f-ac:5)
>>>>>>>>>>           * TKIP (00-0f-ac:2)
>>>>>>>>>>           * CCMP (00-0f-ac:4)
>>>>>>>>>>           * CMAC (00-0f-ac:6)
>>>>>>>>>>       Available Antennas: TX 0x3 RX 0x3
>>>>>>>>>>       Configured Antennas: TX 0x3 RX 0x3
>>>>>>>>>>       Supported interface modes:
>>>>>>>>>>            * IBSS
>>>>>>>>>>            * managed
>>>>>>>>>>            * AP
>>>>>>>>>>            * AP/VLAN
>>>>>>>>>>            * monitor
>>>>>>>>>>            * P2P-client
>>>>>>>>>>            * P2P-GO
>>>>>>>>>>            * P2P-device
>>>>>>>>>>       Band 1:
>>>>>>>>>>           Capabilities: 0x19e3
>>>>>>>>>>               RX LDPC
>>>>>>>>>>               HT20/HT40
>>>>>>>>>>               Static SM Power Save
>>>>>>>>>>               RX HT20 SGI
>>>>>>>>>>               RX HT40 SGI
>>>>>>>>>>               TX STBC
>>>>>>>>>>               RX STBC 1-stream
>>>>>>>>>>               Max AMSDU length: 7935 bytes
>>>>>>>>>>               DSSS/CCK HT40
>>>>>>>>>>           Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>>>>>>>>>>           Minimum RX AMPDU time spacing: 8 usec (0x06)
>>>>>>>>>>           HT TX/RX MCS rate indexes supported: 0-15
>>>>>>>>>>           VHT Capabilities (0x338001b2):
>>>>>>>>>>               Max MPDU length: 11454
>>>>>>>>>>               Supported Channel Width: neither 160 nor 80+80
>>>>>>>>>>               RX LDPC
>>>>>>>>>>               short GI (80 MHz)
>>>>>>>>>>               TX STBC
>>>>>>>>>>               RX antenna pattern consistency
>>>>>>>>>>               TX antenna pattern consistency
>>>>>>>>>>           VHT RX MCS set:
>>>>>>>>>>               1 streams: MCS 0-9
>>>>>>>>>>               2 streams: MCS 0-9
>>>>>>>>>>               3 streams: not supported
>>>>>>>>>>               4 streams: not supported
>>>>>>>>>>               5 streams: not supported
>>>>>>>>>>               6 streams: not supported
>>>>>>>>>>               7 streams: not supported
>>>>>>>>>>               8 streams: not supported
>>>>>>>>>>           VHT RX highest supported: 0 Mbps
>>>>>>>>>>           VHT TX MCS set:
>>>>>>>>>>               1 streams: MCS 0-9
>>>>>>>>>>               2 streams: MCS 0-9
>>>>>>>>>>               3 streams: not supported
>>>>>>>>>>               4 streams: not supported
>>>>>>>>>>               5 streams: not supported
>>>>>>>>>>               6 streams: not supported
>>>>>>>>>>               7 streams: not supported
>>>>>>>>>>               8 streams: not supported
>>>>>>>>>>           VHT TX highest supported: 0 Mbps
>>>>>>>>>>           Bitrates (non-HT):
>>>>>>>>>>               * 1.0 Mbps
>>>>>>>>>>               * 2.0 Mbps (short preamble supported)
>>>>>>>>>>               * 5.5 Mbps (short preamble supported)
>>>>>>>>>>               * 11.0 Mbps (short preamble supported)
>>>>>>>>>>               * 6.0 Mbps
>>>>>>>>>>               * 9.0 Mbps
>>>>>>>>>>               * 12.0 Mbps
>>>>>>>>>>               * 18.0 Mbps
>>>>>>>>>>               * 24.0 Mbps
>>>>>>>>>>               * 36.0 Mbps
>>>>>>>>>>               * 48.0 Mbps
>>>>>>>>>>               * 54.0 Mbps
>>>>>>>>>>           Frequencies:
>>>>>>>>>>               * 2412 MHz [1] (30.0 dBm)
>>>>>>>>>>               * 2417 MHz [2] (30.0 dBm)
>>>>>>>>>>               * 2422 MHz [3] (30.0 dBm)
>>>>>>>>>>               * 2427 MHz [4] (30.0 dBm)
>>>>>>>>>>               * 2432 MHz [5] (30.0 dBm)
>>>>>>>>>>               * 2437 MHz [6] (30.0 dBm)
>>>>>>>>>>               * 2442 MHz [7] (30.0 dBm)
>>>>>>>>>>               * 2447 MHz [8] (30.0 dBm)
>>>>>>>>>>               * 2452 MHz [9] (30.0 dBm)
>>>>>>>>>>               * 2457 MHz [10] (30.0 dBm)
>>>>>>>>>>               * 2462 MHz [11] (30.0 dBm)
>>>>>>>>>>               * 2467 MHz [12] (disabled)
>>>>>>>>>>               * 2472 MHz [13] (disabled)
>>>>>>>>>>               * 2484 MHz [14] (disabled)
>>>>>>>>>>       Band 2:
>>>>>>>>>>           Capabilities: 0x19e3
>>>>>>>>>>               RX LDPC
>>>>>>>>>>               HT20/HT40
>>>>>>>>>>               Static SM Power Save
>>>>>>>>>>               RX HT20 SGI
>>>>>>>>>>               RX HT40 SGI
>>>>>>>>>>               TX STBC
>>>>>>>>>>               RX STBC 1-stream
>>>>>>>>>>               Max AMSDU length: 7935 bytes
>>>>>>>>>>               DSSS/CCK HT40
>>>>>>>>>>           Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>>>>>>>>>>           Minimum RX AMPDU time spacing: 8 usec (0x06)
>>>>>>>>>>           HT TX/RX MCS rate indexes supported: 0-15
>>>>>>>>>>           VHT Capabilities (0x338001b2):
>>>>>>>>>>               Max MPDU length: 11454
>>>>>>>>>>               Supported Channel Width: neither 160 nor 80+80
>>>>>>>>>>               RX LDPC
>>>>>>>>>>               short GI (80 MHz)
>>>>>>>>>>               TX STBC
>>>>>>>>>>               RX antenna pattern consistency
>>>>>>>>>>               TX antenna pattern consistency
>>>>>>>>>>           VHT RX MCS set:
>>>>>>>>>>               1 streams: MCS 0-9
>>>>>>>>>>               2 streams: MCS 0-9
>>>>>>>>>>               3 streams: not supported
>>>>>>>>>>               4 streams: not supported
>>>>>>>>>>               5 streams: not supported
>>>>>>>>>>               6 streams: not supported
>>>>>>>>>>               7 streams: not supported
>>>>>>>>>>               8 streams: not supported
>>>>>>>>>>           VHT RX highest supported: 0 Mbps
>>>>>>>>>>           VHT TX MCS set:
>>>>>>>>>>               1 streams: MCS 0-9
>>>>>>>>>>               2 streams: MCS 0-9
>>>>>>>>>>               3 streams: not supported
>>>>>>>>>>               4 streams: not supported
>>>>>>>>>>               5 streams: not supported
>>>>>>>>>>               6 streams: not supported
>>>>>>>>>>               7 streams: not supported
>>>>>>>>>>               8 streams: not supported
>>>>>>>>>>           VHT TX highest supported: 0 Mbps
>>>>>>>>>>           Bitrates (non-HT):
>>>>>>>>>>               * 6.0 Mbps
>>>>>>>>>>               * 9.0 Mbps
>>>>>>>>>>               * 12.0 Mbps
>>>>>>>>>>               * 18.0 Mbps
>>>>>>>>>>               * 24.0 Mbps
>>>>>>>>>>               * 36.0 Mbps
>>>>>>>>>>               * 48.0 Mbps
>>>>>>>>>>               * 54.0 Mbps
>>>>>>>>>>           Frequencies:
>>>>>>>>>>               * 5180 MHz [36] (17.0 dBm)
>>>>>>>>>>               * 5200 MHz [40] (17.0 dBm)
>>>>>>>>>>               * 5220 MHz [44] (17.0 dBm)
>>>>>>>>>>               * 5240 MHz [48] (17.0 dBm)
>>>>>>>>>>               * 5260 MHz [52] (23.0 dBm) (no IR, radar 
>>>>>>>>>> detection)
>>>>>>>>>>                 DFS state: usable (for 1076 sec)
>>>>>>>>>>                 DFS CAC time: 60000 ms
>>>>>>>>>>               * 5280 MHz [56] (23.0 dBm) (no IR, radar 
>>>>>>>>>> detection)
>>>>>>>>>>                 DFS state: usable (for 1076 sec)
>>>>>>>>>>                 DFS CAC time: 60000 ms
>>>>>>>>>>               * 5300 MHz [60] (23.0 dBm) (no IR, radar 
>>>>>>>>>> detection)
>>>>>>>>>>                 DFS state: usable (for 1076 sec)
>>>>>>>>>>                 DFS CAC time: 60000 ms
>>>>>>>>>>               * 5320 MHz [64] (23.0 dBm) (no IR, radar 
>>>>>>>>>> detection)
>>>>>>>>>>                 DFS state: usable (for 1076 sec)
>>>>>>>>>>                 DFS CAC time: 60000 ms
>>>>>>>>>>               * 5500 MHz [100] (disabled)
>>>>>>>>>>               * 5520 MHz [104] (disabled)
>>>>>>>>>>               * 5540 MHz [108] (disabled)
>>>>>>>>>>               * 5560 MHz [112] (disabled)
>>>>>>>>>>               * 5580 MHz [116] (disabled)
>>>>>>>>>>               * 5600 MHz [120] (disabled)
>>>>>>>>>>               * 5620 MHz [124] (disabled)
>>>>>>>>>>               * 5640 MHz [128] (disabled)
>>>>>>>>>>               * 5660 MHz [132] (disabled)
>>>>>>>>>>               * 5680 MHz [136] (disabled)
>>>>>>>>>>               * 5700 MHz [140] (disabled)
>>>>>>>>>>               * 5720 MHz [144] (disabled)
>>>>>>>>>>               * 5745 MHz [149] (30.0 dBm)
>>>>>>>>>>               * 5765 MHz [153] (30.0 dBm)
>>>>>>>>>>               * 5785 MHz [157] (30.0 dBm)
>>>>>>>>>>               * 5805 MHz [161] (30.0 dBm)
>>>>>>>>>>               * 5825 MHz [165] (30.0 dBm)
>>>>>>>>>>       Supported commands:
>>>>>>>>>>            * new_interface
>>>>>>>>>>            * set_interface
>>>>>>>>>>            * new_key
>>>>>>>>>>            * start_ap
>>>>>>>>>>            * new_station
>>>>>>>>>>            * set_bss
>>>>>>>>>>            * authenticate
>>>>>>>>>>            * associate
>>>>>>>>>>            * deauthenticate
>>>>>>>>>>            * disassociate
>>>>>>>>>>            * join_ibss
>>>>>>>>>>            * remain_on_channel
>>>>>>>>>>            * set_tx_bitrate_mask
>>>>>>>>>>            * frame
>>>>>>>>>>            * frame_wait_cancel
>>>>>>>>>>            * set_wiphy_netns
>>>>>>>>>>            * set_channel
>>>>>>>>>>            * set_wds_peer
>>>>>>>>>>            * probe_client
>>>>>>>>>>            * set_noack_map
>>>>>>>>>>            * register_beacons
>>>>>>>>>>            * start_p2p_device
>>>>>>>>>>            * set_mcast_rate
>>>>>>>>>>            * testmode
>>>>>>>>>>            * channel_switch
>>>>>>>>>>            * Unknown command (104)
>>>>>>>>>>            * connect
>>>>>>>>>>            * disconnect
>>>>>>>>>>       Supported TX frame types:
>>>>>>>>>>            * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 
>>>>>>>>>> 0x80 0x90
>>>>>>>>>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 
>>>>>>>>>> 0x80 0x90
>>>>>>>>>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 
>>>>>>>>>> 0x90 0xa0
>>>>>>>>>> 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 
>>>>>>>>>> 0x80 0x90
>>>>>>>>>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 
>>>>>>>>>> 0x70 0x80
>>>>>>>>>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 
>>>>>>>>>> 0x70 0x80
>>>>>>>>>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 
>>>>>>>>>> 0x80 0x90
>>>>>>>>>> 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>            * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 
>>>>>>>>>> 0x70 0x80
>>>>>>>>>> 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
>>>>>>>>>>       Supported RX frame types:
>>>>>>>>>>            * IBSS: 0x40 0xb0 0xc0 0xd0
>>>>>>>>>>            * managed: 0x40 0xd0
>>>>>>>>>>            * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>>>>>>>>>            * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>>>>>>>>>            * mesh point: 0xb0 0xc0 0xd0
>>>>>>>>>>            * P2P-client: 0x40 0xd0
>>>>>>>>>>            * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>>>>>>>>>>            * P2P-device: 0x40 0xd0
>>>>>>>>>>       software interface modes (can always be added):
>>>>>>>>>>            * AP/VLAN
>>>>>>>>>>            * monitor
>>>>>>>>>>       valid interface combinations:
>>>>>>>>>>            * #{ managed, P2P-client } <= 8, #{ P2P-GO } <= 3, #{
>>>>>>>>>> P2P-device } <= 1, #{ AP } <= 7,
>>>>>>>>>>              total <= 8, #channels <= 1, STA/AP BI must match
>>>>>>>>>>       HT Capability overrides:
>>>>>>>>>>            * MCS: ff ff ff ff ff ff ff ff ff ff
>>>>>>>>>>            * maximum A-MSDU length
>>>>>>>>>>            * supported channel width
>>>>>>>>>>            * short GI for 40 MHz
>>>>>>>>>>            * max A-MPDU length exponent
>>>>>>>>>>            * min MPDU start spacing
>>>>>>>>>>       Device supports TX status socket option.
>>>>>>>>>>       Device supports HT-IBSS.
>>>>>>>>>>       Device supports SAE with AUTHENTICATE command
>>>>>>>>>>       Device supports scan flush.
>>>>>>>>>>       Device supports per-vif TX power setting
>>>>>>>>>>       Driver supports a userspace MPM
>>>>>>>>>>       Driver/device bandwidth changes during BSS lifetime 
>>>>>>>>>> (AP/GO mode)
>>>>>>>>>>       Device supports static SMPS
>>>>>>>>>> =====================================================
>>>>>>>>>>
>>>>>>>>>> I am grateful for any help here and do have some time to help
>>>>>>>>>> debugging the issue.
>>>>>>>>>>
>>>>>>>>>> Marcel
>>>>>>>>>>
>>>>>>>>>> -- 
>>>>>>>>>>
>>>>>>>>>> ------------------------------------------------------
>>>>>>>>>> This message is not intended to have
>>>>>>>>>> contractual effect
>>>>>>>>>> ------------------------------------------------------
>>>>>>>>>>
>>>>>>>>>> _______________________________________________
>>>>>>>>>> ath10k mailing list
>>>>>>>>>> ath10k@lists.infradead.org
>>>>>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>>>> _______________________________________________
>>>>>>>>> ath10k mailing list
>>>>>>>>> ath10k@lists.infradead.org
>>>>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>>>
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> Jorge Baranda
>>>>>>>> Research Engineer, MSc
>>>>>>>> jorge.baranda@cttc.es
>>>>>>>>
>>>>>>>> Centre Tecnològic de Telecomunicacions de Catalunya (CTTC)
>>>>>>>> Av. Carl Friedrich Gauss, 7
>>>>>>>> 08860 Castelldefels, Barcelona (Spain)
>>>>>>>> Tel: +34 93 645 29 00 Ext: 2171
>>>>>>>> Fax. +34 93 645 29 01
>>>>>>>> www.cttc.es
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> ath10k mailing list
>>>>>>>> ath10k@lists.infradead.org
>>>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>> _______________________________________________
>>>>>>> ath10k mailing list
>>>>>>> ath10k@lists.infradead.org
>>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>
>>>>>>
>>>>>> -- 
>>>>>>
>>>>>> ------------------------------------------------------
>>>>>> This message is not intended to have
>>>>>> contractual effect
>>>>>> ------------------------------------------------------
>>>>>
>>>>>
>>>>
>>>
>>>
>>
>
>


-- 
Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnològic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


--------------040305020301010207070509
Content-Type: text/x-log;
 name="wpa_supplicant.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="wpa_supplicant.log"

wpa_supplicant v2.5-devel
random: Trying to read entropy from /dev/random
Successfully initialized wpa_supplicant
Initializing interface 'wlan2' conf '/etc/wpa_supplicant.conf' driver 'default' ctrl_interface 'N/A' bridge 'N/A'
Configuration file '/etc/wpa_supplicant.conf' -> '/etc/wpa_supplicant.conf'
Reading configuration file '/etc/wpa_supplicant.conf'
ctrl_interface='DIR=/run/wpa_supplicant'
ctrl_interface_group='wheel'
ap_scan=2
Priority group 0
   id=0 ssid='SC224SC225'
rfkill: initial event: idx=0 type=2 op=0 soft=0 hard=0
rfkill: initial event: idx=1 type=1 op=0 soft=0 hard=0
rfkill: initial event: idx=2 type=1 op=0 soft=0 hard=0
rfkill: initial event: idx=3 type=1 op=0 soft=0 hard=0
rfkill: initial event: idx=4 type=1 op=0 soft=0 hard=0
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Using driver-based off-channel TX
nl80211: Use separate P2P group interface (driver advertised support)
nl80211: use P2P_DEVICE support
nl80211: interface wlan2 in phy phy2
nl80211: Set mode ifindex 6 iftype 2 (STATION)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
netlink: Operstate: ifindex=6 linkmode=1 (userspace-control), operstate=5 (IF_OPER_DORMANT)
nl80211: driver param='(null)'
Add interface wlan2 to a new radio phy2
nl80211: Regulatory information - country=98 (DFS-FCC)
nl80211: 2402-2472 @ 40 MHz 20 mBm
nl80211: 5170-5250 @ 80 MHz 17 mBm (no outdoor)
nl80211: 5250-5330 @ 80 MHz 20 mBm (no outdoor) (DFS)
nl80211: 5490-5725 @ 160 MHz 23 mBm (DFS)
nl80211: 57240-63720 @ 2160 MHz 40 mBm
nl80211: Added 802.11b mode based on 802.11g information
wlan2: Own MAC address: 04:f0:21:18:24:71
Note: nl80211 driver interface is not designed to be used with ap_scan=2; this can result in connection failures
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=0 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=1 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=2 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=3 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=4 set_tx=0 seq_len=0 key_len=0
wpa_driver_nl80211_set_key: ifindex=6 (wlan2) alg=0 addr=(nil) key_idx=5 set_tx=0 seq_len=0 key_len=0
wlan2: RSN: flushing PMKID list in the driver
nl80211: Flush PMKIDs
wlan2: Setting scan request: 0.100000 sec
ENGINE: Loading dynamic engine
ENGINE: Loading dynamic engine
EAPOL: SUPP_PAE entering state DISCONNECTED
EAPOL: Supplicant port status: Unauthorized
nl80211: Skip set_supp_port(unauthorized) while not associated
EAPOL: KEY_RX entering state NO_KEY_RECEIVE
EAPOL: SUPP_BE entering state INITIALIZE
EAP: EAP entering state DISABLED
Using existing control interface directory.
wlan2: Added interface wlan2
wlan2: State: DISCONNECTED -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
random: Got 18/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=2 linkmode=0 ifi_family=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=2 linkmode=1 ifi_family=0 ifi_flags=0x1003 ([UP])
random: Got 2/2 bytes from /dev/random
wlan2: State: DISCONNECTED -> SCANNING
wlan2: Add radio work 'connect'@0x1680290
wlan2: First radio work item in the queue - schedule start immediately
wlan2: Starting radio work 'connect'@0x1680290 after 0.000013 second wait
wlan2: Trying to associate with SSID 'SC224SC225'
wlan2: Cancelling scan request
wlan2: WPA: clearing own WPA/RSN IE
wlan2: Automatic auth_alg selection: 0x1
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
wlan2: State: SCANNING -> ASSOCIATING
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Received scan results (0 BSSes)
wlan2: BSS: Start scan result update 1
IBSS/mesh: setup freq channel 36, sec_channel_offset 1
IBSS: VHT setup freq cf1 5210, cf2 0, bw 80
wlan2: set_disable_max_amsdu: 1
wlan2: set_ampdu_factor: -1
wlan2: set_ampdu_density: -1
wlan2: set_disable_ht40: 0
wlan2: set_disable_sgi: 0
wlan2: set_disable_ldpc: 0
nl80211: Join IBSS (ifindex=6)
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Failed to set interface 6 to mode 1: -16 (Device or resource busy)
nl80211: Try mode change after setting interface down
nl80211: Set freq 5180 (ht_enabled=1, vht_enabled=1, bandwidth=80 MHz, cf1=5210 MHz, cf2=0 MHz)
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
nl80211: Failed to set channel (freq=5180): -16 (Device or resource busy)
nl80211: Failed to set frequency on interface
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Mode change succeeded while interface is down
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=0x1662330 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
  * SSID - hexdump_ascii(len=10):
     53 43 32 32 34 53 43 32 32 35                     SC224SC225      
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
  * Extra IEs for Beacon/Probe Response frames - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
  * htcaps - hexdump(len=26): 63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * htcaps_mask - hexdump(len=26): 63 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps_mask - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
nl80211: Join IBSS failed: ret=-22 (Invalid argument)
wlan2: Association request to the driver failed
wlan2: Radio work 'connect'@0x1680290 done in 1.033801 seconds
Added BSSID 00:00:00:00:00:00 into blacklist
wlan2: Blacklist count 1 --> request scan in 100 ms
wlan2: Setting scan request: 0.100000 sec
wlan2: State: ASSOCIATING -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: disable timer tick
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=2 linkmode=1 ifi_family=0 ifi_flags=0x1002 ()
nl80211: Ignore interface down event since interface wlan2 is up
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=2 linkmode=1 ifi_family=0 ifi_flags=0x1003 ([UP])
l2_packet_receive - recvfrom: Network is down
wlan2: State: DISCONNECTED -> SCANNING
wlan2: Re-association to the same ESS
wlan2: Add radio work 'connect'@0x1680290
wlan2: First radio work item in the queue - schedule start immediately
wlan2: Starting radio work 'connect'@0x1680290 after 0.000021 second wait
wlan2: Trying to associate with SSID 'SC224SC225'
wlan2: Cancelling scan request
wlan2: WPA: clearing own WPA/RSN IE
wlan2: Automatic auth_alg selection: 0x1
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
wlan2: State: SCANNING -> ASSOCIATING
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Received scan results (0 BSSes)
wlan2: BSS: Start scan result update 2
IBSS/mesh: setup freq channel 36, sec_channel_offset 1
IBSS: VHT setup freq cf1 5210, cf2 0, bw 80
wlan2: set_disable_max_amsdu: 1
wlan2: set_ampdu_factor: -1
wlan2: set_ampdu_density: -1
wlan2: set_disable_ht40: 0
wlan2: set_disable_sgi: 0
wlan2: set_disable_ldpc: 0
nl80211: Join IBSS (ifindex=6)
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=0x1662330 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
  * SSID - hexdump_ascii(len=10):
     53 43 32 32 34 53 43 32 32 35                     SC224SC225      
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
  * Extra IEs for Beacon/Probe Response frames - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
  * htcaps - hexdump(len=26): 63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * htcaps_mask - hexdump(len=26): 63 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps_mask - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
nl80211: Join IBSS failed: ret=-22 (Invalid argument)
wlan2: Association request to the driver failed
wlan2: Radio work 'connect'@0x1680290 done in 0.000444 seconds
BSSID 00:00:00:00:00:00 blacklist count incremented to 2
wlan2: Blacklist count 2 --> request scan in 500 ms
wlan2: Setting scan request: 0.500000 sec
wlan2: State: ASSOCIATING -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlan2: State: DISCONNECTED -> SCANNING
wlan2: Re-association to the same ESS
wlan2: Add radio work 'connect'@0x1680290
wlan2: First radio work item in the queue - schedule start immediately
wlan2: Starting radio work 'connect'@0x1680290 after 0.000012 second wait
wlan2: Trying to associate with SSID 'SC224SC225'
wlan2: Cancelling scan request
wlan2: WPA: clearing own WPA/RSN IE
wlan2: Automatic auth_alg selection: 0x1
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
wlan2: State: SCANNING -> ASSOCIATING
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Received scan results (0 BSSes)
wlan2: BSS: Start scan result update 3
IBSS/mesh: setup freq channel 36, sec_channel_offset 1
IBSS: VHT setup freq cf1 5210, cf2 0, bw 80
wlan2: set_disable_max_amsdu: 1
wlan2: set_ampdu_factor: -1
wlan2: set_ampdu_density: -1
wlan2: set_disable_ht40: 0
wlan2: set_disable_sgi: 0
wlan2: set_disable_ldpc: 0
nl80211: Join IBSS (ifindex=6)
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=0x1662330 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
  * SSID - hexdump_ascii(len=10):
     53 43 32 32 34 53 43 32 32 35                     SC224SC225      
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
  * Extra IEs for Beacon/Probe Response frames - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
  * htcaps - hexdump(len=26): 63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * htcaps_mask - hexdump(len=26): 63 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps_mask - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
nl80211: Join IBSS failed: ret=-22 (Invalid argument)
wlan2: Association request to the driver failed
wlan2: Radio work 'connect'@0x1680290 done in 0.000493 seconds
BSSID 00:00:00:00:00:00 blacklist count incremented to 3
wlan2: Blacklist count 3 --> request scan in 1000 ms
wlan2: Setting scan request: 1.000000 sec
wlan2: State: ASSOCIATING -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlan2: State: DISCONNECTED -> SCANNING
wlan2: Re-association to the same ESS
wlan2: Add radio work 'connect'@0x1680290
wlan2: First radio work item in the queue - schedule start immediately
wlan2: Starting radio work 'connect'@0x1680290 after 0.000012 second wait
wlan2: Trying to associate with SSID 'SC224SC225'
wlan2: Cancelling scan request
wlan2: WPA: clearing own WPA/RSN IE
wlan2: Automatic auth_alg selection: 0x1
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
wlan2: State: SCANNING -> ASSOCIATING
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Received scan results (0 BSSes)
wlan2: BSS: Start scan result update 4
IBSS/mesh: setup freq channel 36, sec_channel_offset 1
IBSS: VHT setup freq cf1 5210, cf2 0, bw 80
wlan2: set_disable_max_amsdu: 1
wlan2: set_ampdu_factor: -1
wlan2: set_ampdu_density: -1
wlan2: set_disable_ht40: 0
wlan2: set_disable_sgi: 0
wlan2: set_disable_ldpc: 0
nl80211: Join IBSS (ifindex=6)
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=0x1662330 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
  * SSID - hexdump_ascii(len=10):
     53 43 32 32 34 53 43 32 32 35                     SC224SC225      
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
  * Extra IEs for Beacon/Probe Response frames - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
  * htcaps - hexdump(len=26): 63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * htcaps_mask - hexdump(len=26): 63 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps_mask - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
nl80211: Join IBSS failed: ret=-22 (Invalid argument)
wlan2: Association request to the driver failed
wlan2: Radio work 'connect'@0x1680290 done in 0.000465 seconds
BSSID 00:00:00:00:00:00 blacklist count incremented to 4
wlan2: Blacklist count 4 --> request scan in 5000 ms
wlan2: Setting scan request: 5.000000 sec
wlan2: State: ASSOCIATING -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlan2: State: DISCONNECTED -> SCANNING
wlan2: Re-association to the same ESS
wlan2: Add radio work 'connect'@0x1680290
wlan2: First radio work item in the queue - schedule start immediately
wlan2: Starting radio work 'connect'@0x1680290 after 0.000012 second wait
wlan2: Trying to associate with SSID 'SC224SC225'
wlan2: Cancelling scan request
wlan2: WPA: clearing own WPA/RSN IE
wlan2: Automatic auth_alg selection: 0x1
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
wlan2: State: SCANNING -> ASSOCIATING
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Received scan results (0 BSSes)
wlan2: BSS: Start scan result update 5
IBSS/mesh: setup freq channel 36, sec_channel_offset 1
IBSS: VHT setup freq cf1 5210, cf2 0, bw 80
wlan2: set_disable_max_amsdu: 1
wlan2: set_ampdu_factor: -1
wlan2: set_ampdu_density: -1
wlan2: set_disable_ht40: 0
wlan2: set_disable_sgi: 0
wlan2: set_disable_ldpc: 0
nl80211: Join IBSS (ifindex=6)
nl80211: Set mode ifindex 6 iftype 1 (ADHOC)
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH) nl_handle=0x1662330 match=
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
  * SSID - hexdump_ascii(len=10):
     53 43 32 32 34 53 43 32 32 35                     SC224SC225      
  * freq=5180
  * vht_enabled=1
  * ht_enabled=1
  * bandwidth=80
  * channel_width=3
  * center_freq1=5210
  * center_freq2=0
  * Extra IEs for Beacon/Probe Response frames - hexdump(len=10): 7f 08 00 00 00 00 00 00 00 40
  * htcaps - hexdump(len=26): 63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * htcaps_mask - hexdump(len=26): 63 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
  * vhtcaps_mask - hexdump(len=12): 00 00 00 00 00 00 00 00 00 00 00 00
nl80211: Join IBSS failed: ret=-22 (Invalid argument)
wlan2: Association request to the driver failed
wlan2: Radio work 'connect'@0x1680290 done in 0.000453 seconds
BSSID 00:00:00:00:00:00 blacklist count incremented to 5
wlan2: Blacklist count 5 --> request scan in 10000 ms
wlan2: Setting scan request: 10.000000 sec
wlan2: State: ASSOCIATING -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
nl80211: Drv Event 43 (NL80211_CMD_JOIN_IBSS) received for wlan2
nl80211: IBSS 86:8b:e8:f5:fa:d3 joined
nl80211: IBSS-joined on 5180 MHz
nl80211: Operating frequency for the associated BSS from scan results: 5180 MHz
nl80211: IBSS on frequency 5180 MHz
wlan2: Event ASSOC (0) received
wlan2: State: DISCONNECTED -> ASSOCIATED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
wlan2: Associated to a new BSS: BSSID=86:8b:e8:f5:fa:d3
wlan2: Select network based on association information
wlan2: Network configuration found for the current AP
wlan2: WPA: clearing AP WPA IE
wlan2: WPA: clearing AP RSN IE
wlan2: WPA: clearing own WPA/RSN IE
nl80211: IBSS-joined on 5180 MHz
nl80211: Received scan results (1 BSSes)
wlan2: BSS: Start scan result update 6
wlan2: BSS: Add new id 0 BSSID 86:8b:e8:f5:fa:d3 SSID 'SC224SC225' freq 5180
EAPOL: External notification - EAP success=0
EAPOL: External notification - EAP fail=0
EAPOL: External notification - portControl=ForceAuthorized
wlan2: Associated with 86:8b:e8:f5:fa:d3
wlan2: WPA: Association event - clear replay counter
wlan2: WPA: Clear old PTK
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
EAPOL: External notification - portEnabled=1
EAPOL: SUPP_PAE entering state S_FORCE_AUTH
EAPOL: Supplicant port status: Authorized
nl80211: Set supplicant port authorized for 86:8b:e8:f5:fa:d3
nl80211: Failed to set STA flag: -2 (No such file or directory)
EAPOL: SUPP_BE entering state IDLE
wlan2: Cancelling authentication timeout
wlan2: State: ASSOCIATED -> COMPLETED
wlan2: CTRL-EVENT-CONNECTED - Connection to 86:8b:e8:f5:fa:d3 completed [id=0 id_str=]
Removed BSSID 00:00:00:00:00:00 from blacklist (clear)
nl80211: Set wlan2 operstate 0->1 (UP)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=6 (IF_OPER_UP)
wlan2: Cancelling scan request
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=5 linkmode=1 ifi_family=0 ifi_flags=0x11003 ([UP][LOWER_UP])
nl80211: Set IF_OPER_UP again based on ifi_flags and expected operstate
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=6 (IF_OPER_UP)
RTM_NEWLINK: ifi_index=6 ifname=wlan2 wext ifi_family=0 ifi_flags=0x11003 ([UP][LOWER_UP])
nl80211: Set IF_OPER_UP again based on ifi_flags and expected operstate
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=6 (IF_OPER_UP)
RTM_NEWLINK: ifi_index=6 ifname=wlan2 operstate=6 linkmode=1 ifi_family=0 ifi_flags=0x11043 ([UP][RUNNING][LOWER_UP])
wlan2: Removing interface wlan2
wlan2: Request to deauthenticate - bssid=86:8b:e8:f5:fa:d3 pending_bssid=00:00:00:00:00:00 reason=3 state=COMPLETED
nl80211: Leave IBSS request sent successfully
nl80211: Set mode ifindex 6 iftype 2 (STATION)
nl80211: Failed to set interface 6 to mode 2: -16 (Device or resource busy)
nl80211: Try mode change after setting interface down
nl80211: Set mode ifindex 6 iftype 2 (STATION)
nl80211: Mode change succeeded while interface is down
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1662330
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0801
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=06
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a07
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0a11
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1101
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=1102
nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION) nl_handle=0x1662330 match=0505
wlan2: Event DEAUTH (12) received
wlan2: Deauthentication notification
wlan2:  * reason 3 (locally generated)
Deauthentication frame IE(s) - hexdump(len=0): [NULL]
wlan2: CTRL-EVENT-DISCONNECTED bssid=86:8b:e8:f5:fa:d3 reason=3 locally_generated=1
wlan2: Auto connect disabled: do not try to re-connect
wlan2: Ignore connection failure indication since interface has been put into disconnected state
wlan2: WPA: Clear old PMK and PTK
wlan2: State: COMPLETED -> DISCONNECTED
nl80211: Set wlan2 operstate 1->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: SUPP_PAE entering state DISCONNECTED
EAPOL: Supplicant port status: Unauthorized
nl80211: Skip set_supp_port(unauthorized) while not associated
EAPOL: SUPP_BE entering state INITIALIZE
EAPOL: External notification - portValid=0
wlan2: State: DISCONNECTED -> DISCONNECTED
nl80211: Set wlan2 operstate 0->0 (DORMANT)
netlink: Operstate: ifindex=6 linkmode=-1 (no change), operstate=5 (IF_OPER_DORMANT)
EAPOL: External notification - portEnabled=0
EAPOL: External notification - portValid=0
wlan2: WPA: Clear old PMK and PTK
wlan2: BSS: Remove id 0 BSSID 86:8b:e8:f5:fa:d3 SSID 'SC224SC225' due to wpa_bss_flush
wlan2: Cancelling scan request
wlan2: Cancelling authentication timeout
Remove interface wlan2 from radio phy2
Remove radio phy2
nl80211: deinit ifname=wlan2 disabled_11b_rates=0
nl80211: Remove monitor interface: refcount=0
netlink: Operstate: ifindex=6 linkmode=0 (kernel-control), operstate=6 (IF_OPER_UP)
nl80211: Set mode ifindex 6 iftype 2 (STATION)
nl80211: Unsubscribe mgmt frames handle 0x8888888889eeabb9 (mode change)
wlan2: CTRL-EVENT-TERMINATING 
Control interface directory not empty - leaving it behind

--------------040305020301010207070509
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--------------040305020301010207070509--
