Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drfnK-0002tr-LB
 for ath10k@lists.infradead.org; Tue, 12 Sep 2017 07:39:44 +0000
Received: by mail-wr0-x234.google.com with SMTP id a43so18768336wrc.0
 for <ath10k@lists.infradead.org>; Tue, 12 Sep 2017 00:39:22 -0700 (PDT)
Subject: Re: failed to fetch board data QCA6174
From: Luka Karinja <luka.karinja@gmail.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
Message-ID: <fbac77a5-e1cf-5164-d1e3-25a7c74be8e7@gmail.com>
Date: Tue, 12 Sep 2017 09:39:18 +0200
MIME-Version: 1.0
In-Reply-To: <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


On 09/12/2017 09:24 AM, Luka Karinja wrote:
>
>
> On 09/12/2017 12:25 AM, Ryan Hsu wrote:
>> On 09/11/2017 03:03 PM, Luka Karinja wrote:
>>
>>>>> Hello. I'm trying to get a M.2 QCA6174 working on my MSI 
>>>>> B150Mortar motherboard. i did try all the various firmware 
>>>>> versions from https://github.com/kvalo/ath10k-firmware more or 
>>>>> less with the same errors as bellow
>>>>>
>>>>> in dmesg i get: failed to fetch board data for 
>>>>> bus=pci,vendor=168c,device=003e,subsystem-vendor=0000,subsystem-device=0000 
>>>>> from ath10k/QCA6174/hw3.0/board-2.bin
>>>>>
>>>>> when trying to get the device up i get: RTNETLINK answers: 
>>>>> Resource temporarily unavailable
>>>>>
>>>>> [ 2026.219245] ath10k_pci 0000:05:00.0: pci irq msi oper_irq_mode 
>>>>> 2 irq_mode 0 reset_mode 0
>>>>> [ 2026.477510] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 
>>>>> 0x05030000 chip_id 0x00340aff sub 0000:0000
>>>>> [ 2026.477517] ath10k_pci 0000:05:00.0: kconfig debug 0 debugfs 1 
>>>>> tracing 0 dfs 0 testmode 0
>>>>> [ 2026.478640] ath10k_pci 0000:05:00.0: firmware ver 
>>>>> WLAN.RM.4.4.1-00026-QCARMSWP-1 api 6 features 
>>>>> wowlan,ignore-otp,raw-mode crc32 7b90c3fc
>>>>> [ 2026.542196] ath10k_pci 0000:05:00.0: failed to fetch board data 
>>>>> for 
>>>>> bus=pci,vendor=168c,device=003e,subsystem-vendor=0000,subsystem-device=0000 
>>>>> from ath10k/QCA6174/hw3.0/board-2.bin
>>>>>
>>>> Not sure what kernel and driver do you have?
>>>>
>>>> This should already fix this case - 
>>>> https://patchwork.kernel.org/patch/9486941/
>>>>
>>> I have kernel 4.12.10 (Arch linux) i did try with ath10k 
>>> WLAN.RM.2.4, 4.4, 4.4.1 firmware
>>>
>> ok, then it should be happening, would you mind enable the 
>> ATH10K_DBG_BOOT and share logs?
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug
>>
> here is the log with ATH10K_DBG_BOOT

BTW. that log is from kernel 4.13.1 and FW 4.4.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
