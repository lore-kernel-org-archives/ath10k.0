Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdesU-0003Er-OV
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 15:18:52 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Suspend resume broken since 4.9
Date: Tue, 14 Feb 2017 15:18:27 +0000
Message-ID: <87r330pzr9.fsf@kamboji.qca.qualcomm.com>
References: <CAMQd7mbOEz0SChV=QcZ_=cWLg9zv3f4zhH9r7YVwC_O6tE-UUw@mail.gmail.com>
In-Reply-To: <CAMQd7mbOEz0SChV=QcZ_=cWLg9zv3f4zhH9r7YVwC_O6tE-UUw@mail.gmail.com>	(Enrico
 Tagliavini's message of "Wed, 25 Jan 2017 21:35:23 +0100")
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Enrico Tagliavini <enrico.tagliavini@gmail.com> writes:

> Hello everybody,
>
> few days ago Fedora 24 pushed kernel 4.9.4 as a stable update, moving
> from the last release of the 4.8 series. I use suspend to ram very
> often and I noticed it doesn't work anymore with 4.9.4 (and also
> 4.9.5). Screen goes black (but still showing mouse pointer) for 5-10
> seconds and then the desktop comes back instead of going to sleep. It
> worked without issues on kernel 4.8.16 and earlier series.
>
> I think it might be a fault of ath10k for two reasons: 1. when I try
> to suspend firmware crashes, 2. if I modprobe -r ath10k_pci before
> attempting the suspend, then I suspend to ram it works!
>
> I've posted a bug report on the kernel bugzilla [1], with some log,
> which I also report here:
>
> [   61.104169] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
> 7f9700df-93ab-4d1b-8c6d-aea24b60d170)
> [   61.104175] ath10k_pci 0000:03:00.0: qca6174 hw2.1 target
> 0x05010000 chip_id 0x003405ff sub 1a56:1525
> [   61.104176] ath10k_pci 0000:03:00.0: kconfig debug 0 debugfs 1
> tracing 0 dfs 0 testmode 0
> [   61.104450] ath10k_pci 0000:03:00.0: firmware ver
> SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad
> crc32 10bf8e08
> [   61.104596] ath10k_pci 0000:03:00.0: board_file api 2 bmi_id N/A
> crc32 ae2e275a
> [   61.104598] ath10k_pci 0000:03:00.0: htt-ver 3.1 wmi-op 4 htt-op 3
> cal otp max-sta 32 raw 0 hwcrypto 1
> [   61.105151] ath10k_pci 0000:03:00.0: firmware register dump:
> [   61.105151] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x00000000
> 0x0092E4DC 0x365591B9
> [   61.105151] ath10k_pci 0000:03:00.0: [04]: 0x0092E4DC 0x00060130
> 0x00000018 0x0041A760
> [   61.105151] ath10k_pci 0000:03:00.0: [08]: 0x365591A5 0x00400000
> 0x00000000 0x000A5C88
> [   61.105151] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
> 0x0096C09C 0x0096C0A7
> [   61.105151] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009BFC42
> 0x00000000 0x009287BD
> [   61.105151] ath10k_pci 0000:03:00.0: [20]: 0x4092E4DC 0x0041A710
> 0x00000000 0x0F000000
> [   61.105151] ath10k_pci 0000:03:00.0: [24]: 0x809432A7 0x0041A770
> 0x0040D400 0xC092E4DC
> [   61.105151] ath10k_pci 0000:03:00.0: [28]: 0x80942BC4 0x0041A790
> 0x365591A5 0x00400000
> [   61.105151] ath10k_pci 0000:03:00.0: [32]: 0x80947BA7 0x0041A7B0
> 0x00404D88 0x00413980
> [   61.105151] ath10k_pci 0000:03:00.0: [36]: 0x809BDECC 0x0041A7D0
> 0x00404D88 0x00413980
> [   61.105151] ath10k_pci 0000:03:00.0: [40]: 0x8099638C 0x0041A7F0
> 0x00404D88 0x00000000
> [   61.105151] ath10k_pci 0000:03:00.0: [44]: 0x80992076 0x0041A810
> 0x004084F0 0x00405244
> [   61.105151] ath10k_pci 0000:03:00.0: [48]: 0x80996BD3 0x0041A830
> 0x004084F0 0x00000000
> [   61.105151] ath10k_pci 0000:03:00.0: [52]: 0x800B4405 0x0041A850
> 0x00422318 0x00005002
> [   61.105151] ath10k_pci 0000:03:00.0: [56]: 0x809A6C34 0x0041A8E0
> 0x0042932C 0x0042CA20
> [   61.111014] ath10k_pci 0000:03:00.0: could not suspend target (-108)
> [   61.178604] ath10k_pci 0000:03:00.0: cannot restart a device that
> hasn't been started
>
> there are some more in the bug report, but I don't think they add
> anything useful so I wont repost them here.
>
> Needless to say I'm seeking some assistance here, since I rely on
> suspend to ram for a few things that would make it annoying otherwise.
> To start with, is my assumption correct in believing this is a fault
> within ath10k?

The firmware shouldn't crash, obviously, but I cannot see what's the
reason for the crash. Most helpful would be to find the change which
broke your setup. For example, try different kernel versions but don't
change anything else, especially not the firmware files. And then keep
the kernel version same but try different firmware versions (if that was
updated on your system).

If it's a kernel problem the best is that if you can build your own
kernels and use 'git bisect' to find the exact commit which broke this.
Then the changes to get the problem fixed is very high. There should be
plenty of instructions on the web how to do that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
