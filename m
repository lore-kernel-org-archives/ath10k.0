Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9b4-0006M2-3v
 for ath10k@lists.infradead.org; Wed, 22 Apr 2020 07:15:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Killer WiFi card keeps disconnecting due to latest firmware
References: <b07a7ea1-7ab2-8ce3-95d7-6726e7708749.ref@aol.com>
 <b07a7ea1-7ab2-8ce3-95d7-6726e7708749@aol.com>
 <87ftd3r4lt.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 22 Apr 2020 10:14:53 +0300
In-Reply-To: <87ftd3r4lt.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 16 Apr 2020 15:34:54 +0300")
Message-ID: <87k128ng9e.fsf@kamboji.qca.qualcomm.com>
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
To: Nicola Mori <nicolamori@aol.com>
Cc: ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> writes:

> Nicola Mori <nicolamori@aol.com> writes:
>
>> Hi, I have an issue with the WiFi card in my laptop, that keeps
>> disconnecting from the network in a strange way: randomly every 1-2 
>> hours I can't access web pages or even ping the gateway, but existing
>> connections (like existing ssh sessions or Zoom videoconferences)
>> continue to work. The only solution is to restart the network
>> connection.
>>
>> The fix for me has been to downgrade the firmware by removing
>> /usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-6.bin so that
>> /usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin is used; with
>> this, I have no issues.
>
> These firmware filenames tell nothing to me (-6 and -4 are just
> interface version numbers), I need the exact firmware versions of which
> works and which doesn't. 'dmesg | grep ath10k' is the best way to get
> them.
>
> Also adding Wen to the loop.

For some reason I don't see Nicola's reply in the list, I'll copy it
below just in case. So it looks like WLAN.RM.4.4.1 has a regression.
Wen, what do you think?

----------------------------------------------------------------------
Hi Kalle, thanks for replying. This is the output of 'dmesg | grep
ath10k' when using the firmware file that works:

1448:[    3.485923] ath10k_pci 0000:3b:00.0: enabling device (0000 -> 0002)
1449:[    3.489776] ath10k_pci 0000:3b:00.0: pci irq msi oper_irq_mode
2 irq_mode 0 reset_mode 0
1480:[    3.845150] ath10k_pci 0000:3b:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
1481:[    3.845151] ath10k_pci 0000:3b:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
1482:[    3.845545] ath10k_pci 0000:3b:00.0: firmware ver
WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features
wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
1487:[    3.909684] ath10k_pci 0000:3b:00.0: board_file api 2 bmi_id
N/A crc32 4ac0889b
1507:[    3.986187] ath10k_pci 0000:3b:00.0: unsupported HTC service
id: 1536
1508:[    4.007720] ath10k_pci 0000:3b:00.0: htt-ver 3.26 wmi-op 4
htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
1530:[    4.459620] ath10k_pci 0000:3b:00.0: unsupported HTC service
id: 1536

And this is when using the faulty firmware file:

1411:[    3.161194] ath10k_pci 0000:3b:00.0: enabling device (0000 -> 0002)
1413:[    3.163852] ath10k_pci 0000:3b:00.0: pci irq msi oper_irq_mode
2 irq_mode 0 reset_mode 0
1446:[    3.544236] ath10k_pci 0000:3b:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:1535
1447:[    3.544237] ath10k_pci 0000:3b:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
1448:[    3.544560] ath10k_pci 0000:3b:00.0: firmware ver
WLAN.RM.4.4.1-00140-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
crc32 29eb8ca1
1461:[    3.636783] ath10k_pci 0000:3b:00.0: board_file api 2 bmi_id
N/A crc32 4ac0889b
1469:[    3.711916] ath10k_pci 0000:3b:00.0: unsupported HTC service
id: 1536
1470:[    3.730945] ath10k_pci 0000:3b:00.0: htt-ver 3.60 wmi-op 4
htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
1534:[    4.378847] ath10k_pci 0000:3b:00.0: unsupported HTC service
id: 1536
----------------------------------------------------------------------

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
