Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auom1-00054J-FV
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 22:14:34 +0000
Received: by mail-vk0-x22e.google.com with SMTP id o133so8367409vka.0
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2016 15:14:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <112436203.W4fT509tru@debian64>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
 <CA+i30h9cNRQkMWfCXXgTgv8GVVPny8NkbUUAK6e-roPfRHaNGg@mail.gmail.com>
 <112436203.W4fT509tru@debian64>
Date: Mon, 25 Apr 2016 16:14:11 -0600
Message-ID: <CA+i30h_WKx0Fu5uzitSyti0N70=pFpz6rGUNUo1saydThTmHaQ@mail.gmail.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Scanning appears to work ( iw dev wlan1 scan ) ,

As soon as I try to use hostapd to run as an AP I get:

[20475.140000] ath10k_pci 0000:00:00.0: firmware crashed! (uuid
b826d45e-e51f-4beb-a489-6b7a4d5c6f76)
[20475.150000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016d,
0x004000ff sub 0000:0000) fw 10.2.3.31.7-1 fwapi 5 bdapi 1 htt-ver 2.1
wmi-op 5 htt-op 2 cal file max-sta 1p
[20475.170000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
dfs 0 testmode 1
[20475.180000] ath10k_pci 0000:00:00.0: firmware register dump:
[20475.180000] ath10k_pci 0000:00:00.0: [00]: 0x4100016D 0x00000000
0x004146C8 0x004146C8
[20475.190000] ath10k_pci 0000:00:00.0: [04]: 0x004146C8 0x00060530
0x0000001F 0x00955A00
[20475.200000] ath10k_pci 0000:00:00.0: [08]: 0x0040AE04 0x00400000
0x00000007 0x00000000
[20475.210000] ath10k_pci 0000:00:00.0: [12]: 0x00000002 0xFFFFFFFF
0x00958360 0x0095836B
[20475.210000] ath10k_pci 0000:00:00.0: [16]: 0x809ACDE0 0x0040AD94
0x0040AE04 0x00400000
[20475.220000] ath10k_pci 0000:00:00.0: [20]: 0x00000000 0x00000000
0x00000000 0x0040E830
[20475.230000] ath10k_pci 0000:00:00.0: [24]: 0x809AC4E2 0x0040ADC4
0x00000001 0x0040AE04
[20475.240000] ath10k_pci 0000:00:00.0: [28]: 0x004133E0 0x00000001
0x0040AE08 0x00000000
[20475.250000] ath10k_pci 0000:00:00.0: [32]: 0x00000007 0x00000000
0x00000000 0x004133C8
[20475.260000] ath10k_pci 0000:00:00.0: [36]: 0x809B9C49 0x0040ADE4
0x00411568 0x0041158C
[20475.260000] ath10k_pci 0000:00:00.0: [40]: 0x00000001 0x00000000
0x00955A00 0x0040E840
[20475.270000] ath10k_pci 0000:00:00.0: [44]: 0x809B944C 0x0040AE04
0x00000001 0x00000000
[20475.280000] ath10k_pci 0000:00:00.0: [48]: 0x0040AE04 0x00000001
0x004133C8 0x004117AC
[20475.290000] ath10k_pci 0000:00:00.0: [52]: 0x809B9263 0x0040AEA4
0x0041ECF8 0x00411BC8
[20475.300000] ath10k_pci 0000:00:00.0: [56]: 0x004133C8 0x0040AE34
0x00411F08 0x00411F08
[20475.410000] ieee80211 phy1: Hardware restart was requested

-- Davey

On Mon, Apr 25, 2016 at 1:01 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> Hello,
>
> On Monday, April 25, 2016 10:53:41 AM David Hutchison wrote:
>> So with some modifications to pci.c, hw.h and core.c I was able to get
>> the radio initialized! :)
>
> Hey, that's nice! Can you make and post a patch for that?
> I'm sure if it's just a matter of adding the new pci and chip
> ids to the tables. You could just go ahead and post it, so it
> will be picked up.
>
>> pci.c: added QCA9887_DEVICE_ID, modified ath10k_pci_id_table and
>> ath10k_pci_supp_chips
>> core.c: Duplicated QCA988X entry in ath10k_hw_params_list and passed
>> 0x4100016d as the ID ( left everything else the same )
>> hw.h: added definitions for QCA9887
>>
>> I found "https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/firmware-5.bin_10.2.3.31.7-1"
>> on your github and replaced
>> /lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin on my board.
>> hotplug.d then loaded QCA9887 firmware on next boot.
>>
>> Of course my approach was very much a hack. If there is anything I can
>> contribute to creating a patch for ath10k, please let me know. I would
>> love to help!
>>
>> dmesg
>> [   18.920000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
>> irq_mode 0 reset_mode 0
>> [   19.030000] rev_id 00000000 QCA9887
>> [   19.030000] dev_id 00000050 QCA9887
>> [   20.460000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016d,
>> 0x004000ff sub 0000:0000) fw 10.2.3.31.7-1 fwapi 5 bdapi 1 htt-ver 2.1
>> wmi-op 5 htt-op 2 cal file max-sta 1p
>> [   20.480000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
>> dfs 0 testmode 1
>>
> ...
>
> Does the device work? Can you scan for networks, connect to networks
> and create networks? That would be good to know.
>
> Regards,
> Christian
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
