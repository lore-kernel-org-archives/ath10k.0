Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diF4r-0000EQ-9z
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 07:18:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Introducing issue when updating firmware to 10.2.4.70.63-2
Date: Thu, 17 Aug 2017 07:18:22 +0000
Message-ID: <87lgmi4q81.fsf@kamboji.qca.qualcomm.com>
References: <CAM8JFhCRQM58qMT2d06ZW8zqxX=G5M3ZodaGug+MfYUSHsTvDg@mail.gmail.com>
In-Reply-To: <CAM8JFhCRQM58qMT2d06ZW8zqxX=G5M3ZodaGug+MfYUSHsTvDg@mail.gmail.com>	(Gilbert
 Moisio's message of "Wed, 16 Aug 2017 16:13:11 +0200")
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
To: Gilbert Moisio <gmoisio@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Gilbert Moisio <gmoisio@gmail.com> writes:

> Hi, moving ath10k_pci firmware to ver 10.2.4.70.63-2 in the
> linux-firmware package is crashing with the following dmesg output:
>
> -----------------------------------------------------------------------------------------------------------
> [ 3.794990] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0
> [ 3.956604] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c
> chip_id 0x043222ff sub 0000:0000
> [ 3.956616] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing
> 0 dfs 0 testmode 0
> [ 3.957508] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5
> features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
> [ 3.999024] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [ 5.141993] ath10k_pci 0000:01:00.0: firmware crashed! (uuid
> 5e1bf845-c278-425c-8c6d-c335a7833655)
> [ 5.151307] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c
> chip_id 0x043222ff sub 0000:0000
> [ 5.151315] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing
> 0 dfs 0 testmode 0
> [ 5.152235] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5
> features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
> [ 5.152254] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [ 5.152265] ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 5 htt-op 2 cal
> otp max-sta 128 raw 0 hwcrypto 1
> [ 5.154307] ath10k_pci 0000:01:00.0: firmware register dump:
> [ 5.160007] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3
> 0x009BFF84 0x00955B31
> [ 5.167961] ath10k_pci 0000:01:00.0: [04]: 0x009BFF84 0x00060130
> 0x00000013 0x00000000
> [ 5.175943] ath10k_pci 0000:01:00.0: [08]: 0x009C8EA4 0x00007170
> 0x00000001 0x00435300

Thanks, I see multiple reports of this in the ath10k list. This is now
reported to the firmware team.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
