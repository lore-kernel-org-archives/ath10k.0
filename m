Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from magratgarlick.emantor.de ([78.46.208.201]
 helo=margratgarlick.emantor.de)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eecJF-0000YA-SF
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 07:50:59 +0000
References: <87h8rwd1z2.fsf@czerwinskis.de>
 <848cf7f7-fdfc-ef85-d1b7-eefdd8672112@qti.qualcomm.com>
From: Rouven Czerwinski <rouven@czerwinskis.de>
Subject: Re: Firmware Crash on qca61741 hw3.2
In-reply-to: <848cf7f7-fdfc-ef85-d1b7-eefdd8672112@qti.qualcomm.com>
Date: Thu, 25 Jan 2018 08:43:36 +0100
Message-ID: <87fu6us7rr.fsf@czerwinskis.de>
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Ryan Hsu <ryanhsu@qti.qualcomm.com> writes:

> On 01/08/2018 03:28 AM, Rouven Czerwinski wrote:
>
>> Hello,
>>
>> I just experienced a firmware crash:
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: firmware crashed! (guid 07b97ee6-5eb2-4196-b038-e3cad581c735)
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4.1-00051-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 c3fd4411
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A crc32 0e26ef70
>> [Mo Jan  8 12:15:44 2018] ath10k_pci 0000:01:00.0: htt-ver 3.44 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
>>
>> Complete dmesg attached.
>>
>> Is this issue fixed in newer firmware versions?
>
> It seems the failure is due to the BANDWIDTH information mismatch in firmware
> when the initial connection is made with narrower PHYMODE and BANDWIDTH and
> then AP changed that later.
>
> I've seen similar issue earlier but I can't reproduce at my setup.
>
> I've sent out a patch to address that, to reconfigure the PHYMODE while
> changing the BANDWIDTH.
>
> Can you help to give it test to see if that helps at your end?

Sure, the failure was pretty reliable on my universities wireless
network. I'll apply and report back, thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
