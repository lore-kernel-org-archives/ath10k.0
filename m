Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSm0-0004U4-7r
 for ath10k@lists.infradead.org; Tue, 14 May 2019 08:26:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k: wmi service ready event not received
References: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
 <87r296jsj4.fsf@codeaurora.org>
 <CAHk-=wgUdQ+7-EHWHh-QMdMKNJKN9c_fmCgKHNUY6SOsFnDGeg@mail.gmail.com>
Date: Tue, 14 May 2019 11:26:51 +0300
In-Reply-To: <CAHk-=wgUdQ+7-EHWHh-QMdMKNJKN9c_fmCgKHNUY6SOsFnDGeg@mail.gmail.com>
 (Linus Torvalds's message of "Fri, 10 May 2019 07:44:43 -0700")
Message-ID: <87a7fpfnlg.fsf@kamboji.qca.qualcomm.com>
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ath10k@lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Fri, May 10, 2019 at 7:25 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Can you post dmesg log when ath10k starts so that we know what hardware
>> and firmware you are using? "dmesg | grep ath10k" should tell that, I
>> assume this is a QCA6174 PCI device. Even better if you can provide full
>> dmesg so that we could see what was happening before this timeout, even
>> if just privately to me. Did this happen during laptop startup or after
>> resume?
>
> This was during bootup. Kernel log attached

Thanks, so this is QCA6174 hw3.2 PCI with firmware
RM.4.4.1.c2-00057-QCARMSWP-1. And the failure happened when ath10k was
loaded and it tried to start the firmware for the first time:

May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: firmware ver RM.4.4.1.c2-00057-QCARMSWP-1 api 6 features wowlan,ignore-otp,no-4addr-pad,raw-mode crc32 e061250a
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 4ed3569e
May 10 05:07:59 xps13 kernel: ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
May 10 05:08:05 xps13 kernel: ath10k_pci 0000:02:00.0: wmi service ready event not received
May 10 05:08:05 xps13 kernel: ath10k_pci 0000:02:00.0: could not init core (-110)
May 10 05:08:05 xps13 kernel: ath10k_pci 0000:02:00.0: could not probe fw (-110)

I can't immediately see what could cause this and I have not seen these
kind of reports before. Some kind of regression in the firmware's
initialisation or problems with PCI bus/interrupts are something which
come to my mind first.

Is there any way to check if PCI bus is having problems so that we could
rule that out? When this happens you could also do "modprobe -r
ath10k_pci; modprobe ath10k_pci" to see if the firmware initialisation
works without cold reboot, that would give some hints.

Also something you could try is the new firmware which I'm planning to
push to linux-firmware:

https://github.com/kvalo/ath10k-firmware/raw/master/QCA6174/hw3.0/4.4.1/firmware-6.bin_WLAN.RM.4.4.1-00132-QCARMSWP-1

Just copy that to ath10k/QCA6174/hw3.0/firmware-6.bin in your firmware
directory and reload ath10k_pci. I'm not expecting this to fix your
issue, but I did receive one weird crash report on Dragonboard which was
fixed by that release.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
