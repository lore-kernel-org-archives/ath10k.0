Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhVkc-0008Qi-8o
 for ath10k@lists.infradead.org; Tue, 15 Aug 2017 06:54:56 +0000
Received: by mail-qt0-x22a.google.com with SMTP id 16so538679qtz.4
 for <ath10k@lists.infradead.org>; Mon, 14 Aug 2017 23:54:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fuctfzqp.fsf@ben-laptop.smart-cactus.org>
References: <87fuctfzqp.fsf@ben-laptop.smart-cactus.org>
From: Richard Toy <richard.toy@gmail.com>
Date: Tue, 15 Aug 2017 08:53:50 +0200
Message-ID: <CAK3eJOBDNLw1oLZHLdBWKHe2KBRwOv3ZUHC8Sn1_v3a7w7uT6w@mail.gmail.com>
Subject: Re: QCA 9880 probe failure
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
To: Ben Gamari <ben@smart-cactus.org>
Cc: ath10k@lists.infradead.org

Others also have issues with 10.2.4.70.63-2, see my post from last
month and earlier this month.

Try firmware-5.bin_10.2.4.70.61-2 or earlier.

Kindest regards,
Richard

On 15 August 2017 at 02:20, Ben Gamari <ben@smart-cactus.org> wrote:
>
> Hello everyone,
>
> I recently purchased a QCA 9880-based PCIe device (Compex WLE900VX 7AA)
> and have been having trouble getting ath10k to load. Specifically I see
> the following output from the driver on boot,
>
>     ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
>     ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
>     ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 0
>     ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
>     ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
>     ath10k_pci 0000:01:00.0: firmware crashed! (uuid ecd9a022-3a8c-4775-a54e-f0b0b94d121f)
>     ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
>     ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 0
>     ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
>     ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
>     ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
>     ath10k_pci 0000:01:00.0: firmware register dump:
>     ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3 0x009BFF84 0x00955B31
>     ath10k_pci 0000:01:00.0: [04]: 0x009BFF84 0x00060130 0x00000013 0x00000000
>     ath10k_pci 0000:01:00.0: [08]: 0x009C8EA4 0x00007170 0x00000001 0x00435300
>     ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 0x00958360 0x0095836B
>     ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x0094078E 0x00000000 0x00000000
>     ath10k_pci 0000:01:00.0: [20]: 0x409BFF84 0x0040AB44 0x004101E0 0x0000000C
>     ath10k_pci 0000:01:00.0: [24]: 0x809BFE1C 0x0040ABA4 0x00000006 0xC09BFF84
>     ath10k_pci 0000:01:00.0: [28]: 0x8098E907 0x0040ABD4 0x009C8E7C 0x0000016B
>     ath10k_pci 0000:01:00.0: [32]: 0x8098FD3B 0x0040ABF4 0x004209EC 0x00420B0C
>     ath10k_pci 0000:01:00.0: [36]: 0x8098A7DA 0x0040AC34 0x00420AA0 0x004062DC
>     ath10k_pci 0000:01:00.0: [40]: 0x80988785 0x0040AC94 0x00410760 0x00400000
>     ath10k_pci 0000:01:00.0: [44]: 0x8098AEC8 0x0040AD44 0x00410760 0x00000001
>     ath10k_pci 0000:01:00.0: [48]: 0x809B67C4 0x0040AD84 0x00410760 0x00411344
>     ath10k_pci 0000:01:00.0: [52]: 0x809B293C 0x0040ADA4 0x00400000 0x00416FA4
>     ath10k_pci 0000:01:00.0: [56]: 0x809C0C3D 0x0040ADE4 0x0040AE08 0x00412118
>     ath10k_pci 0000:01:00.0: Copy Engine register dump:
>     ath10k_pci 0000:01:00.0: [00]: 0x00057400   0   0   3   3
>     ath10k_pci 0000:01:00.0: [01]: 0x00057800   3   3   8   9
>     ath10k_pci 0000:01:00.0: [02]: 0x00057c00   1   1   0   1
>     ath10k_pci 0000:01:00.0: [03]: 0x00058000   1   1   2   1
>     ath10k_pci 0000:01:00.0: [04]: 0x00058400   0   0  40   0
>     ath10k_pci 0000:01:00.0: [05]: 0x00058800   0   0   0   0
>     ath10k_pci 0000:01:00.0: [06]: 0x00058c00   0   0   0   0
>     ath10k_pci 0000:01:00.0: [07]: 0x00059000   0   0   0   0
>     ath10k_pci 0000:01:00.0: wmi unified ready event not received
>     ath10k_pci 0000:01:00.0: could not init core (-110)
>     ath10k_pci 0000:01:00.0: could not probe fw (-110)
>     ath10k_pci 0000:01:00.0: cannot restart a device that hasn't been started
>
> I see this both with 4.12 and 4.13-rc5 kernels using the latest firmware
> in Debian 9 (10.2.4.70).
>
> I have attached the output from devcoredump. Any ideas what might be
> going wrong here?
>
> Cheers,
>
> - Ben
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
