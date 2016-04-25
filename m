Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aullB-0007sj-2u
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 19:01:29 +0000
Received: by mail-wm0-x242.google.com with SMTP id w143so23142261wmw.3
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2016 12:01:08 -0700 (PDT)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
Date: Mon, 25 Apr 2016 21:01:04 +0200
Message-ID: <112436203.W4fT509tru@debian64>
In-Reply-To: <CA+i30h9cNRQkMWfCXXgTgv8GVVPny8NkbUUAK6e-roPfRHaNGg@mail.gmail.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
 <CA+i30h9cNRQkMWfCXXgTgv8GVVPny8NkbUUAK6e-roPfRHaNGg@mail.gmail.com>
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
To: David Hutchison <dhutchison@bluemesh.net>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,

On Monday, April 25, 2016 10:53:41 AM David Hutchison wrote:
> So with some modifications to pci.c, hw.h and core.c I was able to get
> the radio initialized! :)

Hey, that's nice! Can you make and post a patch for that? 
I'm sure if it's just a matter of adding the new pci and chip
ids to the tables. You could just go ahead and post it, so it
will be picked up.

> pci.c: added QCA9887_DEVICE_ID, modified ath10k_pci_id_table and
> ath10k_pci_supp_chips
> core.c: Duplicated QCA988X entry in ath10k_hw_params_list and passed
> 0x4100016d as the ID ( left everything else the same )
> hw.h: added definitions for QCA9887
> 
> I found "https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/firmware-5.bin_10.2.3.31.7-1"
> on your github and replaced
> /lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin on my board.
> hotplug.d then loaded QCA9887 firmware on next boot.
> 
> Of course my approach was very much a hack. If there is anything I can
> contribute to creating a patch for ath10k, please let me know. I would
> love to help!
> 
> dmesg
> [   18.920000] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
> irq_mode 0 reset_mode 0
> [   19.030000] rev_id 00000000 QCA9887
> [   19.030000] dev_id 00000050 QCA9887
> [   20.460000] ath10k_pci 0000:00:00.0: qca988x hw2.0 (0x4100016d,
> 0x004000ff sub 0000:0000) fw 10.2.3.31.7-1 fwapi 5 bdapi 1 htt-ver 2.1
> wmi-op 5 htt-op 2 cal file max-sta 1p
> [   20.480000] ath10k_pci 0000:00:00.0: debug 1 debugfs 1 tracing 0
> dfs 0 testmode 1
> 
...

Does the device work? Can you scan for networks, connect to networks
and create networks? That would be good to know.

Regards,
Christian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
