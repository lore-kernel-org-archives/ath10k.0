Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy9VR-0003ZV-FD
 for ath10k@lists.infradead.org; Fri, 07 Sep 2018 05:40:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id 20-v6so13595655wrb.12
 for <ath10k@lists.infradead.org>; Thu, 06 Sep 2018 22:40:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHjFwoB4_AYjAU0DB+B4XgsLxQziBZ20wHX4T=fZ7fYcdxM+GA@mail.gmail.com>
References: <CAHjFwoB4_AYjAU0DB+B4XgsLxQziBZ20wHX4T=fZ7fYcdxM+GA@mail.gmail.com>
From: Su Kang Yin <paradyse@gmail.com>
Date: Fri, 7 Sep 2018 13:39:51 +0800
Message-ID: <CAHjFwoBS+pk+oJTW8_Q=GJdJpRus76LGNmZjEwuVY3P4-MXPVA@mail.gmail.com>
Subject: Re: ath10k failed to receive control response from QCA9888
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
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, Adrian Chadd <adrian@freebsd.org>

I have tried also Ubuntu 18.04 LTS, firmware crashed:

[   47.969872] ath10k_pci 0000:08:00.0: board_file api 2 bmi_id 0:17
crc32 74a04250
[   51.472590] ath10k_pci 0000:08:00.0: firmware crashed! (guid
b645cef3-35fb-4576-83a9-dc0117647f28)
[   51.481685] ath10k_pci 0000:08:00.0: qca9888 hw2.0 target
0x01000000 chip_id 0x00000000 sub 0000:0000
[   51.481689] ath10k_pci 0000:08:00.0: kconfig debug 0 debugfs 1
tracing 1 dfs 0 testmode 0
[   51.482386] ath10k_pci 0000:08:00.0: firmware ver 10.4-3.5.3-00053
api 5 features no-p2p,mfp,peer-flow-ctrl,allows-mesh-bcast,no-ps crc32
a9603656
[   51.482467] ath10k_pci 0000:08:00.0: board_file api 2 bmi_id 0:17
crc32 74a04250
[   51.482472] ath10k_pci 0000:08:00.0: htt-ver 0.0 wmi-op 6 htt-op 4
cal otp max-sta 32 raw 0 hwcrypto 1
[   51.484479] ath10k_pci 0000:08:00.0: firmware register dump:
[   51.490217] ath10k_pci 0000:08:00.0: [00]: 0x01000000 0x000015B3
0x009B6C03 0x00975B31
[   51.498233] ath10k_pci 0000:08:00.0: [04]: 0x009B6C03 0x00060730
0x0000001E 0x00000004
[   51.506257] ath10k_pci 0000:08:00.0: [08]: 0x40000060 0x00000078
0x0AAA2058 0x0000000D
[   51.514270] ath10k_pci 0000:08:00.0: [12]: 0x00000009 0x00000000
0x009735D1 0x009735DF
[   51.522279] ath10k_pci 0000:08:00.0: [16]: 0x00973820 0x009606CA
0x00000000 0x00000000
[   51.530313] ath10k_pci 0000:08:00.0: [20]: 0x409B6C03 0x0040603C
0xFFFEFFFF 0x0000000D
[   51.538334] ath10k_pci 0000:08:00.0: [24]: 0x809B6C4E 0x0040609C
0x00000001 0xC09B6C03
[   51.546359] ath10k_pci 0000:08:00.0: [28]: 0x8098002B 0x004060CC
0x00448001 0x0000000D
[   51.554375] ath10k_pci 0000:08:00.0: [32]: 0x809607C1 0x004060EC
0xD8400100 0x004060FC
[   51.562434] ath10k_pci 0000:08:00.0: [36]: 0x80960892 0x0040610C
0x00000000 0x00000008
[   51.570469] ath10k_pci 0000:08:00.0: [40]: 0x80960E81 0x0040612C
0x00400000 0x00400600
[   51.578493] ath10k_pci 0000:08:00.0: [44]: 0x80960EE5 0x0040614C
0x00000000 0x00400600
[   51.586539] ath10k_pci 0000:08:00.0: [48]: 0x40960024 0x0040616C
0x00403830 0x00403830
[   51.594567] ath10k_pci 0000:08:00.0: [52]: 0x00000000 0x0040618C
0x00448001 0x00040020
[   51.602573] ath10k_pci 0000:08:00.0: [56]: 0x00404FB8 0x00400000
0x000015B8 0x000013B8
[   51.610578] ath10k_pci 0000:08:00.0: Copy Engine register dump:
[   51.616573] ath10k_pci 0000:08:00.0: [00]: 0x0004a000   2   2  19  18
[   51.623117] ath10k_pci 0000:08:00.0: [01]: 0x0004a400   6   6   5   6
[   51.629658] ath10k_pci 0000:08:00.0: [02]: 0x0004a800   0   0 127   0
[   51.636197] ath10k_pci 0000:08:00.0: [03]: 0x0004ac00   0   0   0   0
[   51.642723] ath10k_pci 0000:08:00.0: [04]: 0x0004b000   0   0   0   0
[   51.649256] ath10k_pci 0000:08:00.0: [05]: 0x0004b400   0   0   0   0
[   51.655788] ath10k_pci 0000:08:00.0: [06]: 0x0004b800   0   0   0   0
[   51.662342] ath10k_pci 0000:08:00.0: [07]: 0x0004bc00   1   1   1   1
[   51.668865] ath10k_pci 0000:08:00.0: [08]: 0x0004c000   0   0 127   0
[   51.675369] ath10k_pci 0000:08:00.0: [09]: 0x0004c400   0   0   0   0
[   51.681905] ath10k_pci 0000:08:00.0: [10]: 0x0004c800   0   0   0   0
[   51.688427] ath10k_pci 0000:08:00.0: [11]: 0x0004cc00   0   0   0   0
[   52.476053] ath10k_pci 0000:08:00.0: failed to receive control
response completion, polling..
[   53.500043] ath10k_pci 0000:08:00.0: ctl_resp never came in (-110)
[   53.506645] ath10k_pci 0000:08:00.0: failed to connect to HTC: -110
[   53.572336] ath10k_pci 0000:08:00.0: could not init core (-110)
[   53.578523] ath10k_pci 0000:08:00.0: could not probe fw (-110)
[   53.600033] ath10k_pci 0000:08:00.0: cannot restart a device that
hasn't been started


287048d39009c5f50b2b72945faca9b2  /lib/firmware/ath10k/QCA9888/hw2.0/board-2.bin
296ddf3871993458b561262e534410a1
/lib/firmware/ath10k/QCA9888/hw2.0/firmware-5.bin

Linux ub12044svr 4.15.0-29-generic #31-Ubuntu SMP Tue Jul 17 15:39:52
UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

On 7 September 2018 at 13:23, Su Kang Yin <paradyse@gmail.com> wrote:
> Hi all,
>
> Currently I bought a wave2 W-FI card Compex WLE650V5-18A, but it
> failed to use on Linux 4.9.111 on x86, below are the kernel log and
> card info.    Appreciate your inputs and help.
>
> Thanks
>
> / # modprobe ath10k_pci
> [67637.318466] ath10k_pci 0000:08:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0
> [67637.457904] ath10k_pci 0000:08:00.0: Direct firmware load for
> ath10k/pre-cal-pci-0000:08:00.0.bin failed with error -2
> [67637.469346] ath10k_pci 0000:08:00.0: Direct firmware load for
> ath10k/cal-pci-0000:08:00.0.bin failed with error -2
> [67637.481084] ath10k_pci 0000:08:00.0: qca9888 hw2.0 target
> 0x01000000 chip_id 0x00000000 sub 0000:0000
> [67637.490877] ath10k_pci 0000:08:00.0: kconfig debug 1 debugfs 1
> tracing 0 dfs 0 testmode 0
> [67637.500282] ath10k_pci 0000:08:00.0: firmware ver 10.4-3.6-00140
> api 5 features no-p2p,mfp,peer-flow-ctrl crc32 99977b18
> [67638.827834] ath: EEPROM regdomain: 0x0
> [67638.831904] ath: EEPROM indicates default country code should be used
> [67638.838815] ath: doing EEPROM country->regdmn map search
> [67638.844522] ath: country maps to regdmn code: 0x3a
> [67638.849618] ath: Country alpha2 being used: US
> [67638.854427] ath: Regpair used: 0x3a
> [67639.507822] ath10k_pci 0000:08:00.0: board_file api 2 bmi_id 0:17
> crc32 8479f36c
> [67644.062506] ath10k_pci 0000:08:00.0: failed to receive control
> response completion, polling..
> [67645.090502] ath10k_pci 0000:08:00.0: ctl_resp never came in (-110)
> [67645.096871] ath10k_pci 0000:08:00.0: failed to connect to HTC: -110
> [67645.165983] ath10k_pci 0000:08:00.0: could not init core (-110)
> [67645.172202] ath10k_pci 0000:08:00.0: could not probe fw (-110)
>
> 08:00.0 Network controller: Qualcomm Atheros Device 0056
>
> 600730b0f0672c22ef2cfab32fda2a71  board-2.bin
> ed002eda9d13ae9b2acf186fcf9b7328  firmware-5.bin_10.4-3.6-00140
>
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA9888/hw2.0
> https://wikidevi.com/wiki/Compex_WLE650V5-18

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
