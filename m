Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chN7o-00084G-GV
 for ath10k@lists.infradead.org; Fri, 24 Feb 2017 21:10:04 +0000
Received: by mail-vk0-x22f.google.com with SMTP id x75so18510422vke.2
 for <ath10k@lists.infradead.org>; Fri, 24 Feb 2017 13:09:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMQd7mZ294nvukbVsdUR_HjkcyJ=sU7BBkXxeDHhKo-cTsyPBw@mail.gmail.com>
References: <CAMQd7mbOEz0SChV=QcZ_=cWLg9zv3f4zhH9r7YVwC_O6tE-UUw@mail.gmail.com>
 <87r330pzr9.fsf@kamboji.qca.qualcomm.com>
 <CAMQd7mZ294nvukbVsdUR_HjkcyJ=sU7BBkXxeDHhKo-cTsyPBw@mail.gmail.com>
From: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Date: Fri, 24 Feb 2017 22:09:37 +0100
Message-ID: <CAMQd7mZw6zNm07rz2fCy6LZ4ob3WbazjeQ0Z-FgTrUCXnbH4zA@mail.gmail.com>
Subject: Re: Suspend resume broken since 4.9
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mhm I came across a very interesting event. I'm now around 4.9 rc4 in
my bisect and I found a commit where the suspend fails, but only the
third time. If I attempt the suspend three times in a row the first
two everything works, the third one it fails (with firmware crash
included). I rebooted three times and reproduced it consistently, it's
always at the third attempt.

Now with the released kernel version it always happen at the first
time. *always* and I mean it, 100%.

So what to do? Should I mark this as bad or good? It entirely the same
issue. It's most likely related, I guess, but not entirely the same.

This is the bisect history so far (I cloned linux.git marked v4.10 as
bad and v4.8 as good, I tested 4.10 vanilla to be sure I can reproduce
the issue)

enrico@alientux /h/m/t/linux $ git bisect bad # tag v4.10
enrico@alientux /h/m/t/linux $ git bisect good v4.8
Bisecting: 15820 revisions left to test after this (roughly 14 steps)
[05ee799f2021658cc0fc64c1f05c940877b90724] usb: dwc2: Move gadget
settings into core_params
enrico@alientux /h/m/t/linux $ git bisect good
Bisecting: 7680 revisions left to test after this (roughly 13 steps)
[72cca7baf4fba777b8ab770b902cf2e08941773f] Merge tag
'staging-4.10-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
enrico@alientux /h/m/t/linux $ git bisect bad
Bisecting: 4114 revisions left to test after this (roughly 12 steps)
[fe6bce8d30a86c693bf7cfbf4759cbafd121289f] treewide: Make remaining
source files non-executable
enrico@alientux /h/m/t/linux $ git bisect bad
Bisecting: 1909 revisions left to test after this (roughly 11 steps)
[f9aa9dc7d2d00e6eb02168ffc64ef614b89d7998] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
enrico@alientux /h/m/t/linux $ git bisect bad
Bisecting: 1056 revisions left to test after this (roughly 10 steps)
[d117b9acaeada0b243f31e0fe83e111fcc9a6644] Merge tag 'ext4_for_stable'
of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4
enrico@alientux /h/m/t/linux $ git bisect bad
Bisecting: 531 revisions left to test after this (roughly 9 steps)
[ae65a21fb851f09bf6341761d884fb86b644b75a] lib/stackdepot: export
save/fetch stack for drivers

On 20 February 2017 at 16:36, Enrico Tagliavini
<enrico.tagliavini@gmail.com> wrote:
> Hi Kalle,
>
>    unfortunately the breakage happened between 4.8 and 4.9, bisecting
> is the way. Better to ask before wasting a lot of time if the
> bisecting is actually not necessary.
>
> Thank you for the time being. I'll get back with the bisect done
>
> On 14 February 2017 at 16:18, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> Enrico Tagliavini <enrico.tagliavini@gmail.com> writes:
>>
>>> Hello everybody,
>>>
>>> few days ago Fedora 24 pushed kernel 4.9.4 as a stable update, moving
>>> from the last release of the 4.8 series. I use suspend to ram very
>>> often and I noticed it doesn't work anymore with 4.9.4 (and also
>>> 4.9.5). Screen goes black (but still showing mouse pointer) for 5-10
>>> seconds and then the desktop comes back instead of going to sleep. It
>>> worked without issues on kernel 4.8.16 and earlier series.
>>>
>>> I think it might be a fault of ath10k for two reasons: 1. when I try
>>> to suspend firmware crashes, 2. if I modprobe -r ath10k_pci before
>>> attempting the suspend, then I suspend to ram it works!
>>>
>>> I've posted a bug report on the kernel bugzilla [1], with some log,
>>> which I also report here:
>>>
>>> [   61.104169] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
>>> 7f9700df-93ab-4d1b-8c6d-aea24b60d170)
>>> [   61.104175] ath10k_pci 0000:03:00.0: qca6174 hw2.1 target
>>> 0x05010000 chip_id 0x003405ff sub 1a56:1525
>>> [   61.104176] ath10k_pci 0000:03:00.0: kconfig debug 0 debugfs 1
>>> tracing 0 dfs 0 testmode 0
>>> [   61.104450] ath10k_pci 0000:03:00.0: firmware ver
>>> SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad
>>> crc32 10bf8e08
>>> [   61.104596] ath10k_pci 0000:03:00.0: board_file api 2 bmi_id N/A
>>> crc32 ae2e275a
>>> [   61.104598] ath10k_pci 0000:03:00.0: htt-ver 3.1 wmi-op 4 htt-op 3
>>> cal otp max-sta 32 raw 0 hwcrypto 1
>>> [   61.105151] ath10k_pci 0000:03:00.0: firmware register dump:
>>> [   61.105151] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x00000000
>>> 0x0092E4DC 0x365591B9
>>> [   61.105151] ath10k_pci 0000:03:00.0: [04]: 0x0092E4DC 0x00060130
>>> 0x00000018 0x0041A760
>>> [   61.105151] ath10k_pci 0000:03:00.0: [08]: 0x365591A5 0x00400000
>>> 0x00000000 0x000A5C88
>>> [   61.105151] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
>>> 0x0096C09C 0x0096C0A7
>>> [   61.105151] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009BFC42
>>> 0x00000000 0x009287BD
>>> [   61.105151] ath10k_pci 0000:03:00.0: [20]: 0x4092E4DC 0x0041A710
>>> 0x00000000 0x0F000000
>>> [   61.105151] ath10k_pci 0000:03:00.0: [24]: 0x809432A7 0x0041A770
>>> 0x0040D400 0xC092E4DC
>>> [   61.105151] ath10k_pci 0000:03:00.0: [28]: 0x80942BC4 0x0041A790
>>> 0x365591A5 0x00400000
>>> [   61.105151] ath10k_pci 0000:03:00.0: [32]: 0x80947BA7 0x0041A7B0
>>> 0x00404D88 0x00413980
>>> [   61.105151] ath10k_pci 0000:03:00.0: [36]: 0x809BDECC 0x0041A7D0
>>> 0x00404D88 0x00413980
>>> [   61.105151] ath10k_pci 0000:03:00.0: [40]: 0x8099638C 0x0041A7F0
>>> 0x00404D88 0x00000000
>>> [   61.105151] ath10k_pci 0000:03:00.0: [44]: 0x80992076 0x0041A810
>>> 0x004084F0 0x00405244
>>> [   61.105151] ath10k_pci 0000:03:00.0: [48]: 0x80996BD3 0x0041A830
>>> 0x004084F0 0x00000000
>>> [   61.105151] ath10k_pci 0000:03:00.0: [52]: 0x800B4405 0x0041A850
>>> 0x00422318 0x00005002
>>> [   61.105151] ath10k_pci 0000:03:00.0: [56]: 0x809A6C34 0x0041A8E0
>>> 0x0042932C 0x0042CA20
>>> [   61.111014] ath10k_pci 0000:03:00.0: could not suspend target (-108)
>>> [   61.178604] ath10k_pci 0000:03:00.0: cannot restart a device that
>>> hasn't been started
>>>
>>> there are some more in the bug report, but I don't think they add
>>> anything useful so I wont repost them here.
>>>
>>> Needless to say I'm seeking some assistance here, since I rely on
>>> suspend to ram for a few things that would make it annoying otherwise.
>>> To start with, is my assumption correct in believing this is a fault
>>> within ath10k?
>>
>> The firmware shouldn't crash, obviously, but I cannot see what's the
>> reason for the crash. Most helpful would be to find the change which
>> broke your setup. For example, try different kernel versions but don't
>> change anything else, especially not the firmware files. And then keep
>> the kernel version same but try different firmware versions (if that was
>> updated on your system).
>>
>> If it's a kernel problem the best is that if you can build your own
>> kernels and use 'git bisect' to find the exact commit which broke this.
>> Then the changes to get the problem fixed is very high. There should be
>> plenty of instructions on the web how to do that.
>>
>> --
>> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
