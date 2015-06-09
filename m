Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Fl0-0000US-GG
 for ath10k@lists.infradead.org; Tue, 09 Jun 2015 09:23:43 +0000
Received: by wifx6 with SMTP id x6so9700309wif.0
 for <ath10k@lists.infradead.org>; Tue, 09 Jun 2015 02:23:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2128694.iEsF7A6qyf@gregors>
References: <CAMQd7maBxv_AeVZfkdMCri1C0Vq+nU8Jc386FU1LGUrPX0+gpA@mail.gmail.com>
 <2128694.iEsF7A6qyf@gregors>
Date: Tue, 9 Jun 2015 11:23:17 +0200
Message-ID: <CAMQd7mYKPGw9njBhnZ_JGMKRhSaKHi-zVFu-Mt=qHF2_ZzNwtA@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 firmware, take two?
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
To: ath10k@lists.infradead.org

Hi Gregor,

yes it works, but bluetooth is broken (for me at least, does it work for you?).

Also this is just a place holder solution, this needs to get into
mainline linux kernel and firmware must be available linux-firmware
package.

I'm ok to patch my own kernel for a very short time, but in the long
run I'd rather switch to another wireless adapter (for how much this
can upset me). Don't get me wrong, no hard feelings, but I'll be on
the road in a month or two and I need to have no potential problems
since the time for fixing them will be short if any.

Best regards.

On 7 June 2015 at 19:08, Gregor Plata <gregor.plata@t-online.de> wrote:
> Hi all,
>
> the solution described in the bug report
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1383184 (comment #150)
> works perfectly for me. Wi-fi is stable without any drops and the 4.1.0-rc6-
> wl-ath kernel doesn't cause any  issues but the wi-fi performance comes only
> to about 35%-40% of the performance on windows on the same machine downloading
> the same file from the same server .
>
> best regards
> Gregor
>
> Am Donnerstag, 4. Juni 2015, 19:03:55 schrieb Enrico Tagliavini:
>> Hi there,
>>
>> Just got the following device
>>
>> enrico@alientux ~ $ lspci -nn | grep QCA
>> 03:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
>> Wireless Network Adapter [168c:003e] (rev 20)
>>
>> And discovered there is no firmware available for it. I looked already
>> at the April thread about it, but didn't managed to get it working.
>> This is on Fedora 22, kernel 4.0.4.
>>
>> I used dissect.py from here
>> https://gist.github.com/kazikcz/8e5845ad84ca251aa295 to generate the
>> firmware image from my Windows installation:
>> $ cat
>> /windows/Windows/System32/DriverStore/FileRepository/netathrx.inf_amd64_481
>> f6e2b133b287d/qca61x420.bin
>> | ./dissect.py
>>
>> but I have no clue if that is actually the correct file. For sure it's
>> the only one containing "qca" end ending in ".bin" alongside
>> eeprom_qca9377_1p0_NFA435_olpc.bin which I used as board.bin.
>>
>> Unfortunately when trying those I get
>> root@alientux ~ # dmesg | grep ath
>> [   18.518677] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> [   18.519124] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>> irq_mode 0 reset_mode 0
>> [   18.667191] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> [   18.668652] ath10k_pci 0000:03:00.0: invalid firmware magic
>> [   18.668791] ath10k_pci 0000:03:00.0: invalid firmware magic
>> [   18.670086] ath10k_pci 0000:03:00.0: invalid firmware magic
>> [   18.670265] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/QCA6174/hw2.1/firmware.bin failed with error -2
>> [   18.670267] ath10k_pci 0000:03:00.0: could not fetch firmware (-2)
>> [   18.670269] ath10k_pci 0000:03:00.0: could not fetch firmware files (-2)
>> [   18.670271] ath10k_pci 0000:03:00.0: could not probe fw (-2)
>>
>> No idea where to go from here. I'm currently not sure if I want to try
>> kvalo sources. Don't get me wrong but if I have to apply a patch to
>> the official Linux source tree that's ok, but switching to the
>> development tree is not what I was looking forward for this machine.
>> Can 4.1 help instead? I'm afraid it might now since I can see the fix
>> for the firmware crash is still not included.
>>
>> Thank you for the help.
>> Best regards.
>>
>> Enrico
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
