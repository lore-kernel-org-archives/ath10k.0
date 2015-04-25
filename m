Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yloln-00087o-7z
 for ath10k@lists.infradead.org; Sat, 25 Apr 2015 01:20:36 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldad-ath10k@m.gmane.org>) id 1YlolI-0008TH-DQ
 for ath10k@lists.infradead.org; Sat, 25 Apr 2015 03:20:04 +0200
Received: from host230-224-dynamic.44-79-r.retail.telecomitalia.it
 ([79.44.224.230]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2015 03:20:04 +0200
Received: from g.martino by
 host230-224-dynamic.44-79-r.retail.telecomitalia.it with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2015 03:20:04 +0200
From: Gabriele Martino <g.martino@gmx.com>
Subject: Re: QCA6174 hw2.1?
Date: Sat, 25 Apr 2015 01:15:48 +0000 (UTC)
Message-ID: <loom.20150425T025815-684@post.gmane.org>
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
Mime-Version: 1.0
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

Michal Kazior <michal.kazior <at> tieto.com> writes:

> 
> https://gist.github.com/kazikcz/c970cbf3a863ebbc4495
> https://gist.github.com/kazikcz/64313b9e2470660faae1
> 
> Here are two simple and crude tools I have to deal with ath10k FW API
> blobs. Use with care.
> 
> You can use the disassemble.py to extract the otp.bin from hw3 ath10k
> FW API blob:
> 
>   python disassemble.py < /lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin
> 
> Then you can use the assemble.py to generate hw2.1 ath10k FW ABI blob:
> 
>   mkdir -p /lib/firmware/ath10k/QCA6174/hw2.1/
>   python assemble.py killer1252-testfw 0 path/to/qca61x420.bin
> path/to/otp.bin 4 > /lib/firmware/ath10k/QCA6174/hw2.1/firmware-4.bin
>   cp path/to/eeprom_ar6320_2p1_NFA354xp.bin
> /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
> 
> (mind the email line wrapping)
> 

I'm trying to generate the blob, but I found two big issues.
The first: I have too many board files, which one should I use?
eeprom_ar6320_2p1_NFA324i_5.bin
eeprom_ar6320_2p1_NFA344i.bin
eeprom_ar6320_2p1_NFA344i_highTX.bin
eeprom_ar6320_2p1_NFA345i.bin
eeprom_ar6320_2p1_NFA345i_highTX.bin
eeprom_ar6320_2p1_NFA354xp.bin
eeprom_ar6320_2p1_NFA355i.bin
eeprom_qca9377_1p0_NFA435_olpc.bin

The controller is a
"Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 20)"
declared as Killer N1525 on Alienware 15.

Whatever, I can try them one by one later.
I picked up the first and built the firmware blob.
But here's the second issue: it wants the calibration data.

[    2.067447] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
[    2.068679] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8 irq_mode
0 reset_mode 0
[    2.215280] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-
0000:03:00.0.bin failed with error -2
[    2.924276] ath3k: probe of 1-9:1.0 failed with error -22
[    2.924299] usbcore: registered new interface driver ath3k
[    3.289023] ath10k_pci 0000:03:00.0: unable to write to the device
[    3.289026] ath10k_pci 0000:03:00.0: failed to download normal firmware: -110
[    3.289052] ath10k_pci 0000:03:00.0: could not init core (-110)
[    3.289099] ath10k_pci 0000:03:00.0: could not probe fw (-110)

How can I generate the cal-pci-0000:03:00.0.bin file?
I'm using the 4.0.0-gentoo kernel on x86_64.

Regards,
Gabriele


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
