Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diLHu-00089Q-7j
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 13:56:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
Date: Thu, 17 Aug 2017 13:56:15 +0000
Message-ID: <878tii47sx.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
 <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhBEkiRoyO+10ShcU2UDbz3a+zFxKVvxkipvqd2e3B9u3w@mail.gmail.com>
 <87valn5vhs.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhCpWBDv=_rZ_KDTsQ008wjUgv5nix=kxv-RPd2035xGLQ@mail.gmail.com>
 <CAPYrjBUrEuuxpO=KYi1EXh-bZU2sPNLEsnNZnnp6_w1viss3wQ@mail.gmail.com>
 <87pobu4qer.fsf@kamboji.qca.qualcomm.com>
 <CAPYrjBWJ5teJ9SDN0NPEr4Qa=cGvSkbHzLfE=-pyYw=hVgGryA@mail.gmail.com>
In-Reply-To: <CAPYrjBWJ5teJ9SDN0NPEr4Qa=cGvSkbHzLfE=-pyYw=hVgGryA@mail.gmail.com>
 (Kouroche Bouchiat's message of "Thu, 17 Aug 2017 10:59:04 +0200")
Content-Language: en-US
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
To: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kouroche Bouchiat <kouroche.bouchiat@gmail.com> writes:

> Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> I was told that 4.4.1 firmare should have a fix for this. Please let me
>> know if you can confirm that and then I'll update the firmware in
>> linux-firmware.
>
> I'm sorry about my previous email. I forgot to disable HTML formatting.
> Been testing the 4.4.1 firmware for around 40 minutes and no
> disconnections so far. It's looking great. dmesg tells me it's been
> correctly upgraded:
>  ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
>  ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
>  ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> 0x00340aff sub 1a56:1535
>  ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
>  ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00026-QCARMSWP-1
> api 6 features wowlan,ignore-otp,raw-mode crc32 7b90c3fc
>  ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 07ee144e
>  ath10k_pci 0000:02:00.0: Unknown eventid: 118809
>  ath10k_pci 0000:02:00.0: Unknown eventid: 90118
>  ath10k_pci 0000:02:00.0: htt-ver 3.44 wmi-op 4 htt-op 3 cal otp
> max-sta 32 raw 0 hwcrypto 1
>  ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
>  ath10k_pci 0000:02:00.0: Unknown eventid: 118809
>  ath10k_pci 0000:02:00.0: Unknown eventid: 90118
>  ath10k_pci 0000:02:00.0: Unknown eventid: 118809
>  ath10k_pci 0000:02:00.0: Unknown eventid: 90118
>
> A diff on the previous firmware's dmesg (before moving to
> firmware-4.bin) shows the new version:
> 5c5
> <  ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2
> api 6 features wowlan,ignore-otp crc32 4d458559
>>  ath10k_pci 0000:02:00.0: firmware ver
>> WLAN.RM.4.4.1-00026-QCARMSWP-1 api 6 features
>> wowlan,ignore-otp,raw-mode crc32 7b90c3fc
> 8c9
> <  ath10k_pci 0000:02:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp
> max-sta 32 raw 0 hwcrypto 1
>>  ath10k_pci 0000:02:00.0: htt-ver 3.44 wmi-op 4 htt-op 3 cal otp
>> max-sta 32 raw 0 hwcrypto 1
>
> Thanks a lot for your help,
> Tell me if you need anything else.

This is enough, thanks. I added an item to my todo list to update the
firmware in linux-firmware.

BTW, the unknown event ids are annoying. Anyone want to submit a patch
to fix (silence) those?

ath10k_pci 0000:02:00.0: Unknown eventid: 118809
ath10k_pci 0000:02:00.0: Unknown eventid: 90118
ath10k_pci 0000:02:00.0: Unknown eventid: 118809
ath10k_pci 0000:02:00.0: Unknown eventid: 90118

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
