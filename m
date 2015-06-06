Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1CaJ-0008Bw-Bd
 for ath10k@lists.infradead.org; Sat, 06 Jun 2015 11:48:20 +0000
Received: by wgbgq6 with SMTP id gq6so73073085wgb.3
 for <ath10k@lists.infradead.org>; Sat, 06 Jun 2015 04:47:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAiUAtu2ESMaMZ0-qVm6bS2Syy4sf1A8TSRGh7SWMaMM51KZ3A@mail.gmail.com>
References: <CAMQd7maBxv_AeVZfkdMCri1C0Vq+nU8Jc386FU1LGUrPX0+gpA@mail.gmail.com>
 <CAMQd7mbwo13QSd6_mreVzubw0EAHep1KsTH6ut3ZDtGS7pSvYQ@mail.gmail.com>
 <trinity-461097b2-68cb-4d23-90e2-933c8561f23a-1433452326111@3capp-mailcom-lxa06>
 <CAAiUAtu2ESMaMZ0-qVm6bS2Syy4sf1A8TSRGh7SWMaMM51KZ3A@mail.gmail.com>
Date: Sat, 6 Jun 2015 13:47:55 +0200
Message-ID: <CAMQd7mbCpoXG4dbSpQ5HBk90AYWz9dLnJeuPW0YdyF59gnTF1g@mail.gmail.com>
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

Moreover the integrated bluetooth adapter is 100% non working for me.
It's not the end of the world but that's a bummer.

On 5 June 2015 at 11:13, Dario Pellegrini <dario.pellegrini@cern.ch> wrote:
> Just to let you know that I am also willing to see this firmware pushed in
> the mainstream.
>
> And there are much more people out there without the technical competences
> to follow the ath10 development that are just willing to have this "problem"
> solved in their favorite distribution!
>
> 2015-06-04 23:12 GMT+02:00 Jason H <jhihn@gmx.com>:
>>
>> Glad to see I'm not the only one with this card!
>>
>> What are the blockages to getting this properly supported? I figure he
>> kernel patch has to work it's way though the maintainers, but are there any
>> restrictions with publishing the firmware for the linux driver?
>>
>>
>> > Sent: Thursday, June 04, 2015 at 1:22 PM
>> > From: "Enrico Tagliavini" <enrico.tagliavini@gmail.com>
>> > To: ath10k@lists.infradead.org
>> > Subject: Re: QCA6174 hw2.1 firmware, take two?
>> >
>> > Hi again,
>> >
>> > ok this was dumb.... I forgot to assemble back the firmware and I
>> > realized it just after sending out the previous email (that's why the
>> > driver was complaining about the invalid magic).
>> >
>> > Sorry for the noise, I apologize.
>> >
>> > Hope to see this fixed in upstream Linux kernel soon.
>> >
>> > Best regards.
>> >
>> > Enrico.
>> >
>> >
>> > P.S.: this is another Alienware 15 like Gabriele's. I think they all
>> > ship with such a WiFi. Just pointing it out since Dell now is even
>> > shyly suggesting to try out Linux
>> > https://twitter.com/DellCaresPRO/status/603780236531081216 (not on
>> > Alienware, but still...)
>> >
>> > On 4 June 2015 at 19:03, Enrico Tagliavini <enrico.tagliavini@gmail.com>
>> > wrote:
>> > > Hi there,
>> > >
>> > > Just got the following device
>> > >
>> > > enrico@alientux ~ $ lspci -nn | grep QCA
>> > > 03:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
>> > > Wireless Network Adapter [168c:003e] (rev 20)
>> > >
>> > > And discovered there is no firmware available for it. I looked already
>> > > at the April thread about it, but didn't managed to get it working.
>> > > This is on Fedora 22, kernel 4.0.4.
>> > >
>> > > I used dissect.py from here
>> > > https://gist.github.com/kazikcz/8e5845ad84ca251aa295 to generate the
>> > > firmware image from my Windows installation:
>> > > $ cat
>> > > /windows/Windows/System32/DriverStore/FileRepository/netathrx.inf_amd64_481f6e2b133b287d/qca61x420.bin
>> > > | ./dissect.py
>> > >
>> > > but I have no clue if that is actually the correct file. For sure it's
>> > > the only one containing "qca" end ending in ".bin" alongside
>> > > eeprom_qca9377_1p0_NFA435_olpc.bin which I used as board.bin.
>> > >
>> > > Unfortunately when trying those I get
>> > > root@alientux ~ # dmesg | grep ath
>> > > [   18.518677] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> > > [   18.519124] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>> > > irq_mode 0 reset_mode 0
>> > > [   18.667191] ath10k_pci 0000:03:00.0: Direct firmware load for
>> > > ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> > > [   18.668652] ath10k_pci 0000:03:00.0: invalid firmware magic
>> > > [   18.668791] ath10k_pci 0000:03:00.0: invalid firmware magic
>> > > [   18.670086] ath10k_pci 0000:03:00.0: invalid firmware magic
>> > > [   18.670265] ath10k_pci 0000:03:00.0: Direct firmware load for
>> > > ath10k/QCA6174/hw2.1/firmware.bin failed with error -2
>> > > [   18.670267] ath10k_pci 0000:03:00.0: could not fetch firmware (-2)
>> > > [   18.670269] ath10k_pci 0000:03:00.0: could not fetch firmware files
>> > > (-2)
>> > > [   18.670271] ath10k_pci 0000:03:00.0: could not probe fw (-2)
>> > >
>> > > No idea where to go from here. I'm currently not sure if I want to try
>> > > kvalo sources. Don't get me wrong but if I have to apply a patch to
>> > > the official Linux source tree that's ok, but switching to the
>> > > development tree is not what I was looking forward for this machine.
>> > > Can 4.1 help instead? I'm afraid it might now since I can see the fix
>> > > for the firmware crash is still not included.
>> > >
>> > > Thank you for the help.
>> > > Best regards.
>> > >
>> > > Enrico
>> >
>> > _______________________________________________
>> > ath10k mailing list
>> > ath10k@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/ath10k
>> >
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
