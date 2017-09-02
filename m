Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from astro.eq.uc.pt ([193.137.214.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1do5Tz-0000R9-D4
 for ath10k@lists.infradead.org; Sat, 02 Sep 2017 10:16:57 +0000
Received: from neo.eq.uc.pt ([193.137.214.155] helo=neo)
 by astro.eq.uc.pt with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.87) (envelope-from <nuno@eq.uc.pt>) id 1do56G-0007Pf-Jp
 for ath10k@lists.infradead.org; Sat, 02 Sep 2017 10:52:30 +0100
Received: from nuno by neo with local (Exim 4.89)
 (envelope-from <nuno@eq.uc.pt>) id 1do56G-0002M5-GT
 for ath10k@lists.infradead.org; Sat, 02 Sep 2017 10:52:24 +0100
Date: Sat, 2 Sep 2017 10:52:24 +0100
From: Nuno Oliveira <nuno@eq.uc.pt>
Subject: Re: Compex WLE600VX firmware crash
Message-ID: <20170902095224.xqrzlwajxwzs5bxz@eq.uc.pt>
MIME-Version: 1.0
Content-Disposition: inline
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
To: ath10k@lists.infradead.org

Hi,

Hit the same crash problem at startup with a Compex WLE900VX card, and 
firmware ver 10.2.4.70.63-2, that has reached Debian-testing. The crash 
log is:

[    3.528668] ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    3.528925] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[    3.805134] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:01:00.0.bin (-2)
[    3.805658] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/cal-pci-0000:01:00.0.bin (-2)
[    3.806915] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/firmware-6.bin (-2)
[    3.808932] ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/firmware-5.bin
[    3.808936] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[    3.808937] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[    3.809100] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[    3.849217] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/board-2.bin (-2)
[    3.849797] ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/board.bin
[    3.849803] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[    4.978292] ath10k_pci 0000:01:00.0: firmware crashed! (uuid n/a)
[    4.978770] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[    4.978771] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[    4.978915] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[    4.978918] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[    4.978919] ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
[    4.980917] ath10k_pci 0000:01:00.0: firmware register dump:
[    4.981349] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3 0x009BFF84 0x00955B31
[    4.981783] ath10k_pci 0000:01:00.0: [04]: 0x009BFF84 0x00060130 0x00000013 0x00000000
[    4.982222] ath10k_pci 0000:01:00.0: [08]: 0x009C8EA4 0x00007170 0x00000001 0x00435300
[    4.982662] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 0x00958360 0x0095836B
[    4.983089] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x0094078E 0x00000000 0x00000000
[    4.983505] ath10k_pci 0000:01:00.0: [20]: 0x409BFF84 0x0040AB44 0x004101E0 0x0000000C
[    4.983921] ath10k_pci 0000:01:00.0: [24]: 0x809BFE1C 0x0040ABA4 0x00000006 0xC09BFF84
[    4.984370] ath10k_pci 0000:01:00.0: [28]: 0x8098E907 0x0040ABD4 0x009C8E7C 0x0000016B
[    4.984809] ath10k_pci 0000:01:00.0: [32]: 0x8098FD3B 0x0040ABF4 0x004209EC 0x00420B0C
[    4.985216] ath10k_pci 0000:01:00.0: [36]: 0x8098A7DA 0x0040AC34 0x00420AA0 0x004062DC
[    4.985618] ath10k_pci 0000:01:00.0: [40]: 0x80988785 0x0040AC94 0x00410760 0x00400000
[    4.986019] ath10k_pci 0000:01:00.0: [44]: 0x8098AEC8 0x0040AD44 0x00410760 0x00000001
[    4.986421] ath10k_pci 0000:01:00.0: [48]: 0x809B67C4 0x0040AD84 0x00410760 0x00411344
[    4.986819] ath10k_pci 0000:01:00.0: [52]: 0x809B293C 0x0040ADA4 0x00400000 0x00416FA4
[    4.987216] ath10k_pci 0000:01:00.0: [56]: 0x809C0C3D 0x0040ADE4 0x0040AE08 0x00412118
[    4.987615] ath10k_pci 0000:01:00.0: Copy Engine register dump:
[    4.988052] ath10k_pci 0000:01:00.0: [00]: 0x00057400   0   0   3   3
[    4.988452] ath10k_pci 0000:01:00.0: [01]: 0x00057800   3   3   8   9
[    4.988836] ath10k_pci 0000:01:00.0: [02]: 0x00057c00   1   1   0   1
[    4.989212] ath10k_pci 0000:01:00.0: [03]: 0x00058000   1   1   2   1
[    4.989576] ath10k_pci 0000:01:00.0: [04]: 0x00058400   0   0  40   0
[    4.989929] ath10k_pci 0000:01:00.0: [05]: 0x00058800   0   0   0   0
[    4.990276] ath10k_pci 0000:01:00.0: [06]: 0x00058c00   0   0   0   0
[    4.990621] ath10k_pci 0000:01:00.0: [07]: 0x00059000   0   0   0   0
[   10.211709] ath10k_pci 0000:01:00.0: wmi unified ready event not received
[   10.291366] ath10k_pci 0000:01:00.0: could not init core (-110)
[   10.291740] ath10k_pci 0000:01:00.0: could not probe fw (-110)
[   10.307675] ath10k_pci 0000:01:00.0: cannot restart a device that hasn't been started

As suggested, with firmware-5.bin_10.2.4.70.61-2 everything works fine:

host:~# dmesg | grep ath10k
[    3.504648] ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    3.504914] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[    3.675744] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:01:00.0.bin (-2)
[    3.675750] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/cal-pci-0000:01:00.0.bin (-2)
[    3.675939] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/firmware-6.bin (-2)
[    3.677475] ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/firmware-5.bin
[    3.677479] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[    3.677480] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[    3.677620] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.61-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 af2517b8
[    3.719893] ath10k_pci 0000:01:00.0: firmware: failed to load ath10k/QCA988X/hw2.0/board-2.bin (-2)
[    3.720540] ath10k_pci 0000:01:00.0: firmware: direct-loading firmware ath10k/QCA988X/hw2.0/board.bin
[    3.720548] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[    4.865935] ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
[    4.945196] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

Thanks,

Nuno.

> Woo good catch!
> 
> Ok, I'll go ask.
> 
> 
> 
> -adrian
> 
> 
> On 7 August 2017 at 13:44, Richard Toy <richard.toy at gmail.com> wrote:
> > I have just noticed that firmware-5.bin_10.2.4.70.61-2 exists and that
> > also appears to work so the delta of interest is between releases
> > firmware-5.bin_10.2.4.70.61-2 and firmware-5.bin_10.2.4.70.63-2.
> >
> >     /        /\      _    ___ ___  ___
> >    /  LE    /  \    | |  | __|   \| __|
> >   /    DE  /    \   | |__| _|| |) | _|
> >  /________/  LE  \  |____|___|___/|___|                      
> >  lede-project.org
> >  \        \   DE /
> >   \    LE  \    /  
> >   -----------------------------------------------------------
> >    \  DE    \  /    Reboot (17.01.2, r3435-65eec8bd5f)
> >     \________\/    
> >     -----------------------------------------------------------
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
