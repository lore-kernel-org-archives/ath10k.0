Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aujls-0001Tg-P0
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 16:54:06 +0000
Received: by mail-yw0-x22d.google.com with SMTP id g133so196755139ywb.2
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2016 09:53:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <CA+i30h--nmpjeNK4S02a9o9qrQ-b3QR77WcRorxC5-Dame5hBw@mail.gmail.com>
 <CA+i30h-Y_rB0kZfgWifk14Zw1CCkGZH5x5zf8+OH-GTwswXh3w@mail.gmail.com>
 <2596438.Cv6xmiar05@debian64>
 <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 25 Apr 2016 10:53:41 -0600
Message-ID: <CA+i30h9cNRQkMWfCXXgTgv8GVVPny8NkbUUAK6e-roPfRHaNGg@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
From: David Hutchison <dhutchison@bluemesh.net>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,

So with some modifications to pci.c, hw.h and core.c I was able to get
the radio initialized! :)

pci.c: added QCA9887_DEVICE_ID, modified ath10k_pci_id_table and
ath10k_pci_supp_chips
core.c: Duplicated QCA988X entry in ath10k_hw_params_list and passed
0x4100016d as the ID ( left everything else the same )
hw.h: added definitions for QCA9887

I found "https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/firmware-5.bin_10.2.3.31.7-1"
on your github and replaced
/lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin on my board.
hotplug.d then loaded QCA9887 firmware on next boot.

Of course my approach was very much a hack. If there is anything I can
contribute to creating a patch for ath10k, please let me know. I would
love to help!

dmesg
[   18.920000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[   19.030000] rev_id 00000000 QCA9887
[   19.030000] dev_id 00000050 QCA9887
[   20.460000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016d,
0x004000ff sub 0000:0000) fw 10.2.3.31.7-1 fwapi 5 bdapi 1 htt-ver 2.1
wmi-op 5 htt-op 2 cal file max-sta 1p
[   20.480000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
dfs 0 testmode 1


iw phy phy1 info
Wiphy phy1
        max # scan SSIDs: 16
        max scan IEs length: 199 bytes
        Retry short limit: 7
        Retry long limit: 4
        Coverage class: 0 (up to 0m)
        Device supports AP-side u-APSD.
        Available Antennas: TX 0x1 RX 0x1
        Configured Antennas: TX 0x1 RX 0x1
        Supported interface modes:
                 * managed
                 * AP
                 * AP/VLAN
                 * monitor
                 * mesh point
        Band 2:
                Capabilities: 0x19e3
                        RX LDPC
                        HT20/HT40
                        Static SM Power Save
                        RX HT20 SGI
                        RX HT40 SGI
                        TX STBC
                        RX STBC 1-stream
                        Max AMSDU length: 7935 bytes
                        DSSS/CCK HT40
                Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
                Minimum RX AMPDU time spacing: 8 usec (0x06)
                HT TX/RX MCS rate indexes supported: 0-7
                VHT Capabilities (0x338001b2):
                        Max MPDU length: 11454
                        Supported Channel Width: neither 160 nor 80+80
                        RX LDPC
                        short GI (80 MHz)
                        TX STBC
                        RX antenna pattern consistency
                        TX antenna pattern consistency
                VHT RX MCS set:
                        1 streams: MCS 0-9
                        2 streams: not supported
                        3 streams: not supported
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT RX highest supported: 0 Mbps
                VHT TX MCS set:
                        1 streams: MCS 0-9
                        2 streams: not supported
                        3 streams: not supported
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT TX highest supported: 0 Mbps
                Frequencies:
                        * 5180 MHz [36] (23.0 dBm)
                        * 5200 MHz [40] (23.0 dBm)
                        * 5220 MHz [44] (23.0 dBm)
                        * 5240 MHz [48] (23.0 dBm)
                        * 5260 MHz [52] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5280 MHz [56] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5300 MHz [60] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5320 MHz [64] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5500 MHz [100] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5520 MHz [104] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5540 MHz [108] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5560 MHz [112] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5580 MHz [116] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5600 MHz [120] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5620 MHz [124] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5640 MHz [128] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5660 MHz [132] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5680 MHz [136] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5700 MHz [140] (23.0 dBm) (no IR, radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5720 MHz [144] (23.0 dBm) (radar detection)
                          DFS state: usable (for 39 sec)
                          DFS CAC time: 60000 ms
                        * 5745 MHz [149] (30.0 dBm)
                        * 5765 MHz [153] (30.0 dBm)
                        * 5785 MHz [157] (30.0 dBm)
                        * 5805 MHz [161] (30.0 dBm)
                        * 5825 MHz [165] (30.0 dBm)
        valid interface combinations:
                 * #{ AP, mesh point } <= 8,
                   total <= 8, #channels <= 1, STA/AP BI must match
        HT Capability overrides:
                 * MCS: ff ff ff ff ff ff ff ff ff ff
                 * maximum A-MSDU length
                 * supported channel width
                 * short GI for 40 MHz
                 * max A-MPDU length exponent
                 * min MPDU start spacing

-- Davey

On Mon, Apr 25, 2016 at 9:21 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Christian Lamparter <chunkeey@googlemail.com> writes:
>
>> On Sunday, April 24, 2016 01:16:11 AM David Hutchison wrote:
>>> I spoke too soon:
>>> https://pci-ids.ucw.cz/read/PC/168c/0050
>>>
>>> It is the QCA9887, so it's definitely on the PCIe bus and is being
>>> seen.
>>
>> Does ath10k support the QCA9887? I see no entry for this pci-id (168c:0050)
>> in ath10k's pci table [0] and there's no definition of it in the hardware
>> header either [1]. The chip-id is also not present. I CC'ed ath10k, since
>> this seems to be a new chip that might be easy to add.
>
> Currently ath10k does not support QCA9887.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
