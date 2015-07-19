Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZGna9-0003UU-5S
 for ath10k@lists.infradead.org; Sun, 19 Jul 2015 12:20:38 +0000
Received: by wgav7 with SMTP id v7so46408242wga.2
 for <ath10k@lists.infradead.org>; Sun, 19 Jul 2015 05:20:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMQd7mb8o4__K+D-+HhJ07M773b96HiXwLqmwGBU0-oLNdhXGA@mail.gmail.com>
References: <CAMQd7maa410JYZL7CvX+us99-ZjUNKMCPjK6cRBJFUY4NBj=0g@mail.gmail.com>
 <CAMQd7mb8o4__K+D-+HhJ07M773b96HiXwLqmwGBU0-oLNdhXGA@mail.gmail.com>
Date: Sun, 19 Jul 2015 14:20:15 +0200
Message-ID: <CAMQd7mY0C+JMTZhDRognkwi_zkYZmCNcvLPGP8_aNRbVm+0fxg@mail.gmail.com>
Subject: Re: qca6174 hw2.1 firmware crash with kernel 4.1.2
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

Confirmed, backporting the previous linked commit make the wireless
work again. Official backport to the 4.1 series would be much
appreciated being the latest stable and supported released kernel. The
reason why I assumed it was backported already was that the commit
date is quite old, like 3 months ago.

Still I have quite a flood in my dmesg:
[   41.778147] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   41.807350] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.083753] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.142931] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.190855] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.250871] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.399526] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.460780] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.508290] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.568318] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.616520] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   51.676759] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   56.163756] ath10k_warn: 47 callbacks suppressed
[   56.163766] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   56.211631] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   56.367889] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   56.415761] ath10k_pci 0000:03:00.0: Unknown eventid: 16389
[   56.572301] ath10k_pci 0000:03:00.0: Unknown eventid: 16389

never ending.

Other than this commit I saw some work in 4.2-rc logs, is the
situation to be any better for this WNIC? May be bluetooth support?
Fedora rawhide is already providing 4.2 RC kernel builds and since I
have to recompile the kernel anyway (unless the named patch gets
backport) I might temporary switch to 4.2 from rawhide if this gets me
better support. Any advise?

Thanks

On 19 July 2015 at 11:51, Enrico Tagliavini <enrico.tagliavini@gmail.com> wrote:
> Mhm seems like I assumed the backport missing from 4.0 was merged for
> 4.1.... but it is not, it's in 4.2 only. Any chance you'll ask for a
> backport of this 4 lines patch?
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath10k?id=11a002efbaa7fbd9f6e616695ab42aa9f1caf060
>
> Would be much appreciated
>
> On 19 July 2015 at 11:42, Enrico Tagliavini <enrico.tagliavini@gmail.com> wrote:
>> Hi,
>>
>> just tried mainline 4.1.2 (from fedora-updates testing) in the hope to
>> have a kernel working out of the box (4.0.x series misses a backport),
>> but unfortunately it doesn't work:
>>
>> [   25.311642] ath10k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> [   25.312904] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
>> irq_mode 0 reset_mode 0
>> [   25.463029] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> [   26.637234] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
>> 34a02c41-e7e5-459e-9d9b-5a10bf9da011)
>> [   26.637241] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
>> 0x003405ff) fw killer-n1525-fw api 4 htt 0.0 wmi 4 cal otp max_sta 32
>> [   26.637243] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0
>> dfs 0 testmode 0
>> [   26.638152] ath10k_pci 0000:03:00.0: firmware register dump:
>> [   26.638152] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
>> 0x0095186B 0x00955B31
>> [   26.638152] ath10k_pci 0000:03:00.0: [04]: 0x0095186B 0x00060130
>> 0x00000010 0x0040AF04
>> [   26.638152] ath10k_pci 0000:03:00.0: [08]: 0x00000018 0x00000001
>> 0x00000001 0x00412250
>> [   26.638152] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
>> 0x0096C09C 0x0096C0A7
>> [   26.638152] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009286B6
>> 0x00000000 0x00000000
>> [   26.638152] ath10k_pci 0000:03:00.0: [20]: 0x4095186B 0x0040E160
>> 0x0041F82C 0x00000001
>> [   26.638152] ath10k_pci 0000:03:00.0: [24]: 0x80936238 0x0040E1C0
>> 0x00000000 0xC095186B
>> [   26.638152] ath10k_pci 0000:03:00.0: [28]: 0x80936361 0x0040E1E0
>> 0x00000000 0x0041C8DC
>> [   26.638152] ath10k_pci 0000:03:00.0: [32]: 0x80934A67 0x0040E200
>> 0x00436DF0 0x0040E250
>> [   26.638152] ath10k_pci 0000:03:00.0: [36]: 0x809A5C92 0x0040E250
>> 0x004275B0 0x00000001
>> [   26.638152] ath10k_pci 0000:03:00.0: [40]: 0x809A5CEA 0x0040E290
>> 0x00426F40 0x00000004
>> [   26.638152] ath10k_pci 0000:03:00.0: [44]: 0x809A5DCA 0x0040E2B0
>> 0x00426F40 0x0041C8DC
>> [   26.638152] ath10k_pci 0000:03:00.0: [48]: 0x800A0909 0x0040E2D0
>> 0x00426F40 0x004275A0
>> [   26.638152] ath10k_pci 0000:03:00.0: [52]: 0x800A024A 0x0040E2F0
>> 0x0041ABB0 0x00420440
>> [   26.638152] ath10k_pci 0000:03:00.0: [56]: 0x809287D9 0x0040E310
>> 0x00000000 0x00400000
>> [   27.630142] ath10k_pci 0000:03:00.0: failed to receive control
>> response completion, polling..
>> [   28.630050] ath10k_pci 0000:03:00.0: ctl_resp never came in (-110)
>> [   28.630054] ath10k_pci 0000:03:00.0: failed to connect to HTC: -110
>> [   28.693606] ath10k_pci 0000:03:00.0: could not init core (-110)
>> [   28.693635] ath10k_pci 0000:03:00.0: could not probe fw (-110)
>> [   28.714076] ath10k_pci 0000:03:00.0: cannot restart a device that
>> hasn't been started
>>
>>
>> anything I can do to have wireless working again?
>>
>> Thank you for the help.
>>
>> Enrico

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
