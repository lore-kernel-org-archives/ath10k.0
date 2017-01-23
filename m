Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVnYY-0006Mf-Ge
 for ath10k@lists.infradead.org; Mon, 23 Jan 2017 22:57:48 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: ath10k failing with firmware RM.4.4-00022-QCARMSWPZ-2 on QCA6174
 (Killer 1535)
Date: Mon, 23 Jan 2017 22:57:23 +0000
Message-ID: <734b2b26-7c3d-d1cc-7a13-340d7c24e5e4@qca.qualcomm.com>
References: <1484594680.14978.5.camel@gmail.com>
 <CACKGw+FXdcKHU80fZ8zWwZFwePrF0GPv5ksqLEJMP-gusvOjHw@mail.gmail.com>
 <1485050497.3853.1.camel@gmail.com>
In-Reply-To: <1485050497.3853.1.camel@gmail.com>
Content-Language: en-US
Content-ID: <B3BD0CD01C4FBC4F875C6EC018DFFD15@qualcomm.com>
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
To: Chris Le Sueur <thefishface@gmail.com>, "bartosz.markowski@tieto.com" <bartosz.markowski@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 01/21/2017 06:01 PM, Chris Le Sueur wrote:
> On Tue, 2017-01-17 at 11:30 +0100, Bartosz Markowski wrote:
>> On 16 January 2017 at 20:24, Chris Le Sueur <thefishface@gmail.com>
>> wrote:
>>> Dear all,
>>>
>>> (per request by kvalo on #ath10k)
>>>
>>> I was trying out the firmware-5 from git to see if it would fix
>>> throughput issues, but instead the driver just failed to work. I am
>>> using kernel 4.8.15 on Fedora 25, and the following was printed to
>>> the
>>> kernel log:
>>>
>>> ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
>>> reset_mode 0
>>> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-
>>> pci-
>>> 0000:3a:00.0 .bin failed with error -2
>>> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
>>> 0000:3a:00.0.bin failed with error -2
>>> ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
>>> 0x00340aff sub 1a56:1535
>>> ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
>>> testmode 0
>>> ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 
>>> api
>>> 5 features wowlan,ignore-otp crc32 4d458559
>>> ath10k_pci 0000:3a:00.0: failed to fetch board data for
>>> bus=pci,bmi-
>>> chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
>>> ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
>> Please try to apply this patch -
>> https://patchwork.kernel.org/patch/9486941/ and retry.
>>
>> -Bartosz
> This also fails. I have had to update my kernel as part of obtaining
> the module source (I am using 4.9.4 as distributed with Fedora 25) so
> the messages are a bit different; I've included both the patched and
> stock output. I see the debug message added in that patch is also not
> printed, so I assume the difference here is due to some transient
> situation and not the patch itself.
>
> Patched:
>
> ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
> reset_mode 0
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
> 0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
> 0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> 0x00340aff sub 1a56:1535
> ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
> testmode 0
> ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
> 5 features wowlan,ignore-otp crc32 4d458559
> ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
> chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
> ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
> ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
> ath10k_pci 0000:3a:00.0: htt version request timed out
> ath10k_pci 0000:3a:00.0: failed to setup htt: -110
> ath10k_pci 0000:3a:00.0: could not init core (-110)
> ath10k_pci 0000:3a:00.0: could not probe fw (-110)
>
> Stock:
>
> ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
> reset_mode 0
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
> 0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
> 0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> 0x00340aff sub 1a56:1535
> ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
> testmode 0
> ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
> 5 features wowlan,ignore-otp crc32 4d458559
> ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
> chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
> ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a
> ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
> ath10k_pci 0000:3a:00.0: failed to ping firmware: -110
> ath10k_pci 0000:3a:00.0: failed to reset rx filter: -110
> ath10k_pci 0000:3a:00.0: could not init core (-110)
> ath10k_pci 0000:3a:00.0: could not probe fw (-110)

Hmm...  I do see the patch applied and works to my card, maybe not the Killer 1535, but it doesn't matter.
Can you please try again to reload the driver or reboot to see?

ath10k_pci 0000:04:00.0: unable to load pre cal data from DT: -2
ath10k_pci 0000:04:00.0: could not load pre cal data: -2
ath10k_pci 0000:04:00.0: boot upload otp to 0x1234 len 24193 for board id
ath10k_pci 0000:04:00.0: boot get otp board id result 0x00000000 board_id 0 chip_id 0
ath10k_pci 0000:04:00.0: board id is not exist in otp, ignore it
ath10k_pci 0000:04:00.0: boot using board name 'bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3361'
ath10k_pci 0000:04:00.0: board name

- Ryan
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
