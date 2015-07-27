Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJohQ-0006Bq-6j
 for ath10k@lists.infradead.org; Mon, 27 Jul 2015 20:08:36 +0000
Received: by wibud3 with SMTP id ud3so154380271wib.1
 for <ath10k@lists.infradead.org>; Mon, 27 Jul 2015 13:08:14 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 27 Jul 2015 22:08:14 +0200
Message-ID: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
Subject: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
From: Enrico Tagliavini <enrico.tagliavini@gmail.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org

Hello there,

I gave 4.2 rc3 a shot and I discovered the wireless was not working
anymore with it. I tried adding irq_mode=1 alongside skip_otp=y in
ath10k_core (I assume you need fw api 5 to remove this, is that
correct?, I still have fw 4 only).

Loading with irq_mode=0

[   21.130224] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
[   21.130734] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[   21.277023] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[   21.278105] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/board-pci-168c:003e:1a56:1525.bin failed with
error -2
[   21.278109] ath10k_pci 0000:03:00.0: failed to load spec board
file, falling back to generic: -2
[   21.279048] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[   21.279051] ath10k_pci 0000:03:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-5.bin': -2
[   22.445285] ath10k_pci 0000:03:00.0: received unsolicited fw crash interrupt
[   22.445319] ath10k_pci 0000:03:00.0: received unsolicited fw crash interrupt
[   23.445028] ath10k_pci 0000:03:00.0: failed to receive control
response completion, polling..
[   23.445183] ath10k_pci 0000:03:00.0: received unsolicited fw crash interrupt
[   23.445247] ath10k_pci 0000:03:00.0: received unsolicited fw crash interrupt
[   24.445040] ath10k_pci 0000:03:00.0: Service connect timeout
[   24.445043] ath10k_pci 0000:03:00.0: failed to connect htt (-110)
[   24.508619] ath10k_pci 0000:03:00.0: could not init core (-110)
[   24.508640] ath10k_pci 0000:03:00.0: could not probe fw (-110)
[   74.965904] ath10k_pci 0000:03:00.0: received unsolicited fw crash interrupt

With irq_mode=1 (and debug_mask=0x00000432 for ath10k_core... didn't
do.. anything?)

[  612.043708] ath10k_pci 0000:03:00.0: limiting irq mode to: 1
[  612.043711] ath10k_pci 0000:03:00.0: pci irq legacy interrupts 0
irq_mode 1 reset_mode 0
[  612.249048] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[  612.249148] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/board-pci-168c:003e:1a56:1525.bin failed with
error -2
[  612.249150] ath10k_pci 0000:03:00.0: failed to load spec board
file, falling back to generic: -2
[  612.249251] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[  612.249252] ath10k_pci 0000:03:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-5.bin': -2
[  613.435568] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff, 168c:003e:1a56:1525 fallback) fw killer-n1525-fw api 4 htt
3.0 wmi 4 cal otp max_sta 32
[  613.435571] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[  613.509157] ath: EEPROM regdomain: 0x6c
[  613.509160] ath: EEPROM indicates we should expect a direct regpair map
[  613.509162] ath: Country alpha2 being used: 00
[  613.509163] ath: Regpair used: 0x6c
[  613.513311] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wlan0


This is a Dell Alienware 15 (early 2015) laptop.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
