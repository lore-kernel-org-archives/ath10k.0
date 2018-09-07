Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy9FI-0005QE-Tf
 for ath10k@lists.infradead.org; Fri, 07 Sep 2018 05:23:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id 20-v6so13566289wrb.12
 for <ath10k@lists.infradead.org>; Thu, 06 Sep 2018 22:23:41 -0700 (PDT)
MIME-Version: 1.0
From: Su Kang Yin <paradyse@gmail.com>
Date: Fri, 7 Sep 2018 13:23:08 +0800
Message-ID: <CAHjFwoB4_AYjAU0DB+B4XgsLxQziBZ20wHX4T=fZ7fYcdxM+GA@mail.gmail.com>
Subject: ath10k failed to receive control response from QCA9888
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

Hi all,

Currently I bought a wave2 W-FI card Compex WLE650V5-18A, but it
failed to use on Linux 4.9.111 on x86, below are the kernel log and
card info.    Appreciate your inputs and help.

Thanks

/ # modprobe ath10k_pci
[67637.318466] ath10k_pci 0000:08:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[67637.457904] ath10k_pci 0000:08:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:08:00.0.bin failed with error -2
[67637.469346] ath10k_pci 0000:08:00.0: Direct firmware load for
ath10k/cal-pci-0000:08:00.0.bin failed with error -2
[67637.481084] ath10k_pci 0000:08:00.0: qca9888 hw2.0 target
0x01000000 chip_id 0x00000000 sub 0000:0000
[67637.490877] ath10k_pci 0000:08:00.0: kconfig debug 1 debugfs 1
tracing 0 dfs 0 testmode 0
[67637.500282] ath10k_pci 0000:08:00.0: firmware ver 10.4-3.6-00140
api 5 features no-p2p,mfp,peer-flow-ctrl crc32 99977b18
[67638.827834] ath: EEPROM regdomain: 0x0
[67638.831904] ath: EEPROM indicates default country code should be used
[67638.838815] ath: doing EEPROM country->regdmn map search
[67638.844522] ath: country maps to regdmn code: 0x3a
[67638.849618] ath: Country alpha2 being used: US
[67638.854427] ath: Regpair used: 0x3a
[67639.507822] ath10k_pci 0000:08:00.0: board_file api 2 bmi_id 0:17
crc32 8479f36c
[67644.062506] ath10k_pci 0000:08:00.0: failed to receive control
response completion, polling..
[67645.090502] ath10k_pci 0000:08:00.0: ctl_resp never came in (-110)
[67645.096871] ath10k_pci 0000:08:00.0: failed to connect to HTC: -110
[67645.165983] ath10k_pci 0000:08:00.0: could not init core (-110)
[67645.172202] ath10k_pci 0000:08:00.0: could not probe fw (-110)

08:00.0 Network controller: Qualcomm Atheros Device 0056

600730b0f0672c22ef2cfab32fda2a71  board-2.bin
ed002eda9d13ae9b2acf186fcf9b7328  firmware-5.bin_10.4-3.6-00140

https://github.com/kvalo/ath10k-firmware/tree/master/QCA9888/hw2.0
https://wikidevi.com/wiki/Compex_WLE650V5-18

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
