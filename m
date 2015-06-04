Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0Yi0-0004It-4x
 for ath10k@lists.infradead.org; Thu, 04 Jun 2015 17:13:36 +0000
Received: by igbzc4 with SMTP id zc4so13758294igb.0
 for <ath10k@lists.infradead.org>; Thu, 04 Jun 2015 10:13:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMQd7maBxv_AeVZfkdMCri1C0Vq+nU8Jc386FU1LGUrPX0+gpA@mail.gmail.com>
References: <CAMQd7maBxv_AeVZfkdMCri1C0Vq+nU8Jc386FU1LGUrPX0+gpA@mail.gmail.com>
Date: Thu, 4 Jun 2015 10:13:13 -0700
Message-ID: <CAJ-VmomRnB76qFJ2MxD2mYo25-jD=F130shvNsXgQeeAfm9ufA@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 firmware, take two?
From: Adrian Chadd <adrian@freebsd.org>
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hi,

It's beeliner - they went and .. "changed" how they're doing firmware
releases and the firmware API. It's hopefully going to be more
structured and backwards-compatible. this time.

I don't know if/when there are plans for beeliner ath10k support. I'm
still trying to get the QCA988x firmware building for me so I can jump
back into development there.

Does anyone know more about plans for supporting beeliner and the
updated firmware APIs?




-adrian


On 4 June 2015 at 10:03, Enrico Tagliavini <enrico.tagliavini@gmail.com> wrote:
> Hi there,
>
> Just got the following device
>
> enrico@alientux ~ $ lspci -nn | grep QCA
> 03:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
> Wireless Network Adapter [168c:003e] (rev 20)
>
> And discovered there is no firmware available for it. I looked already
> at the April thread about it, but didn't managed to get it working.
> This is on Fedora 22, kernel 4.0.4.
>
> I used dissect.py from here
> https://gist.github.com/kazikcz/8e5845ad84ca251aa295 to generate the
> firmware image from my Windows installation:
> $ cat /windows/Windows/System32/DriverStore/FileRepository/netathrx.inf_amd64_481f6e2b133b287d/qca61x420.bin
> | ./dissect.py
>
> but I have no clue if that is actually the correct file. For sure it's
> the only one containing "qca" end ending in ".bin" alongside
> eeprom_qca9377_1p0_NFA435_olpc.bin which I used as board.bin.
>
> Unfortunately when trying those I get
> root@alientux ~ # dmesg | grep ath
> [   18.518677] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> [   18.519124] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
> irq_mode 0 reset_mode 0
> [   18.667191] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
> [   18.668652] ath10k_pci 0000:03:00.0: invalid firmware magic
> [   18.668791] ath10k_pci 0000:03:00.0: invalid firmware magic
> [   18.670086] ath10k_pci 0000:03:00.0: invalid firmware magic
> [   18.670265] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/firmware.bin failed with error -2
> [   18.670267] ath10k_pci 0000:03:00.0: could not fetch firmware (-2)
> [   18.670269] ath10k_pci 0000:03:00.0: could not fetch firmware files (-2)
> [   18.670271] ath10k_pci 0000:03:00.0: could not probe fw (-2)
>
> No idea where to go from here. I'm currently not sure if I want to try
> kvalo sources. Don't get me wrong but if I have to apply a patch to
> the official Linux source tree that's ok, but switching to the
> development tree is not what I was looking forward for this machine.
> Can 4.1 help instead? I'm afraid it might now since I can see the fix
> for the firmware crash is still not included.
>
> Thank you for the help.
> Best regards.
>
> Enrico
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
