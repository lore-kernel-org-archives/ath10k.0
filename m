Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAgxe-00089f-7P
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 19:17:16 +0000
Received: by mail-ot0-x235.google.com with SMTP id p2-v6so18489125otf.3
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 12:17:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonSMWqe_9is8eq-6QYahH_AsX5gPq3MKQaxd6azZc49Lw@mail.gmail.com>
References: <CACD9L=BXEQRQVWGP5iMvSNOP7nHz68W62+q6xEZkeb2vZ13DKQ@mail.gmail.com>
 <CAJ-Vmom3c9QBtxPCP7B3WBfUSETRc5J+dFVB1Vf9AKDEhnLDzg@mail.gmail.com>
 <CACD9L=CUW2j6SsQmOMu=ER5SjZxhqF=zY8GTksRT-JTsb==kGw@mail.gmail.com>
 <CAJ-VmonSMWqe_9is8eq-6QYahH_AsX5gPq3MKQaxd6azZc49Lw@mail.gmail.com>
From: Arvid Picciani <aep@exys.org>
Date: Mon, 23 Apr 2018 21:17:02 +0200
Message-ID: <CACD9L=C0j3DPpZWFTNnmZ765XC2ZgRDoDZ=5iamMCzyYWVMUFA@mail.gmail.com>
Subject: Re: failed to run otp: -22
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k@lists.infradead.org

Ah, i did ask tp-link if the otp should be on the chip or on flash.
They didn't answer the question, instead they said i probably
overwrote the ART partition (didnt do that), which made me think the
OTP is on flash for ath10k as well.
So, it should be on the chip itself?

This is a tplink archer c7 v5.0.


this is a tplink-

On Mon, Apr 23, 2018 at 9:12 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> hi!
>
> It should be in OTP on the QCA9880 chip. Which board is this?
>
>
>
> -adiran
>
>
> On 23 April 2018 at 12:11, Arvid Picciani <aep@exys.org> wrote:
>> thanks for the response. That sounds bad.
>> Does ath10k load the calibration stuff different than ath9k? Ath9k works
>> just fine on the same board.
>> Do 9k and 10k usually share the same partition for that info or should i go
>> hunting for something completely else?
>> Any more reading material that might help me find out how to load that
>> correctly?
>>
>> /b/
>>
>> On Mon, Apr 23, 2018 at 9:07 PM, Adrian Chadd <adrian@freebsd.org> wrote:
>>>
>>> Hi,
>>>
>>> That's designed for debugging. It means you'll have an invalid MAC
>>> address and no calibration information so your NIC won't work very
>>> well.
>>>
>>> The reason why needs to be figured out!
>>>
>>>
>>>
>>> -adrian
>>>
>>>
>>> On 23 April 2018 at 09:56, Arvid Picciani <aep@exys.org> wrote:
>>> > Hi,
>>> >
>>> > Is it ok to run a QCA9880 with skip_otp=1?
>>> > It's working fine with skip_ota, but just want to confirm this is safe.
>>> >
>>> > without skip_otp, mine isn't coming up because of "failed to run otp:
>>> > -22"
>>> >
>>> > [    9.287905] PCI: Enabling device 0000:00:00.0 (0000 -> 0002)
>>> > [    9.293912] ath10k_pci 0000:00:00.0: pci irq legacy oper_irq_mode 1
>>> > irq_mode 0 reset_mode 0
>>> > [    9.568820] ath10k_pci 0000:00:00.0: Direct firmware load for
>>> > ath10k/pre-cal-pci-0000:00:00.0.bin failed with error -2
>>> > [    9.579896] ath10k_pci 0000:00:00.0: Falling back to user helper
>>> > [    9.737064] firmware ath10k!pre-cal-pci-0000:00:00.0.bin:
>>> > firmware_loading_store: map pages failed
>>> > [    9.746618] ath10k_pci 0000:00:00.0: Direct firmware load for
>>> > ath10k/cal-pci-0000:00:00.0.bin failed with error -2
>>> > [    9.757342] ath10k_pci 0000:00:00.0: Falling back to user helper
>>> > [    9.909261] firmware ath10k!cal-pci-0000:00:00.0.bin:
>>> > firmware_loading_store: map pages failed
>>> > [    9.918500] ath10k_pci 0000:00:00.0: Direct firmware load for
>>> > ath10k/QCA988X/hw2.0/firmware-6.bin failed with error -2
>>> > [    9.929582] ath10k_pci 0000:00:00.0: Falling back to user helper
>>> > [   10.059370] firmware ath10k!QCA988X!hw2.0!firmware-6.bin:
>>> > firmware_loading_store: map pages failed
>>> > [   10.073667] ath10k_pci 0000:00:00.0: qca988x hw2.0 target
>>> > 0x4100016c chip_id 0x043202ff sub 0000:0000
>>> > [   10.083242] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1
>>> > tracing 0 dfs 1 testmode 1
>>> > [   10.096229] ath10k_pci 0000:00:00.0: firmware ver 10.2.4-1.0-00033
>>> > api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c41417d0
>>> > [   10.189809] ath10k_pci 0000:00:00.0: Direct firmware load for
>>> > ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
>>> > [   10.200640] ath10k_pci 0000:00:00.0: Falling back to user helper
>>> > [   10.271745] firmware ath10k!QCA988X!hw2.0!board-2.bin:
>>> > firmware_loading_store: map pages failed
>>> > [   10.299633] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A
>>> > crc32 bebc7c08
>>> > [   10.437761] ath10k_pci 0000:00:00.0: otp calibration failed: 2
>>> > [   10.443792] ath10k_pci 0000:00:00.0: failed to run otp: -22
>>> > [   10.449551] ath10k_pci 0000:00:00.0: could not init core (-22)
>>> > [   10.455680] ath10k_pci 0000:00:00.0: could not probe fw (-22)
>>> >
>>> > _______________________________________________
>>> > ath10k mailing list
>>> > ath10k@lists.infradead.org
>>> > http://lists.infradead.org/mailman/listinfo/ath10k
>>
>>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
