Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22b.google.com ([2607:f8b0:4001:c0b::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG6C6-0006Kj-Jp
 for ath10k@lists.infradead.org; Wed, 31 May 2017 16:10:32 +0000
Received: by mail-it0-x22b.google.com with SMTP id r63so14359758itc.1
 for <ath10k@lists.infradead.org>; Wed, 31 May 2017 09:09:37 -0700 (PDT)
Received: from localhost ([137.122.64.20])
 by smtp.gmail.com with ESMTPSA id 82sm7126992iok.39.2017.05.31.09.09.33
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 31 May 2017 09:09:33 -0700 (PDT)
Date: Wed, 31 May 2017 12:09:07 -0400
From: Blair Drummond <blair.robert.drummond@gmail.com>
Subject: [blair.robert.drummond@gmail.com: Re: ath10k Issue with eduroam?]
Message-ID: <20170531160907.osmyypkupw5dpq3q@void>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mbkavmqd6oeumzo3"
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org


--mbkavmqd6oeumzo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----- Forwarded message from Blair Drummond <blair.robert.drummond@gmail.com> -----

Date: Wed, 31 May 2017 12:07:02 -0400
From: Blair Drummond <blair.robert.drummond@gmail.com>
To: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k Issue with eduroam?
User-Agent: NeoMutt/20170428 (1.8.2)

Hi Kalle,

Thanks for the reply. Here are dmesg and journalctl logs when
(successfully) connecting to a different network.

You're right, the 

> [ 337.838605] ath10k_pci 0000:02:00.0 wlp2s0: disabling HT as WMM/QoS
> is not supported by the AP
> [ 337.838607] ath10k_pci 0000:02:00.0 wlp2s0: disabling VHT as WMM/QoS
> is not supported by the AP

Does not seem to be present.

Blair

On Tue, May 30, 2017 at 01:42:20PM +0000, Kalle Valo wrote:
> Blair Robert Drummond <bdrum047@uottawa.ca> writes:
> 
> > I'm having some trouble connecting to eduroam, and I think that ath10k
> > is where this issue is. To be clear, the wireless *mostly* works, in
> > that it has no issue with most wireless networks, but this specific
> > network it doesn't behave on. When I blacklist ath10k_pci and use a
> > usb wireless card, I can connect just fine, so I don't think it's a
> > configuration issue. This is on a fresh install of Elementary OS
> > (originally with kernel 4.8, but I upgraded to 4.10, though to no
> > effect). A similar fresh install on a different computer doesn't
> > suffer from this problem, and a void linux live image also has the
> > same issue.
> >
> > So, I hope that I've successfully ruled out all other reasonable
> > sources of error (though, admittedly I don't know what I'm doing). The
> > eduroam network is a WPA2-Enterprise network with PEAP and MSCHAPv2.
> > I'm attaching the output of dmesg, journalctl, lspci, and lsmod. The
> > specific problem is that while I do "connect" I can't seem to pass any
> > data 'ping -c 30 www.google.com' terminates with "unknown host" and
> > browsers fail with "temporary failure in name resolution".
> >
> 
> [...]
> 
> > I also noticed things like:
> > kernel: ath10k_pci 0000:02:00.0: Direct firmware load for
> > ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
> > kernel: ath10k_pci 0000:02:00.0: Direct firmware load for
> > ath10k/cal-pci-0000:02:00.0.bin failed with error -2
> 
> You can ignore these warnings, they are fixed in
> 9f5bcfe93315d75da4cc46bd30b536966559359a and should not be related in
> your problem in any way.
> 
> > [  333.396188] ath10k_pci 0000:02:00.0: no channel configured; ignoring frame(s)!
> > [  337.696604] wlp2s0: authenticate with 00:1a:1e:bb:2a:29
> > [  337.734058] wlp2s0: send auth to 00:1a:1e:bb:2a:29 (try 1/3)
> > [  337.834610] wlp2s0: send auth to 00:1a:1e:bb:2a:29 (try 2/3)
> > [  337.838398] wlp2s0: authenticated
> > [ 337.838605] ath10k_pci 0000:02:00.0 wlp2s0: disabling HT as WMM/QoS
> > is not supported by the AP
> > [ 337.838607] ath10k_pci 0000:02:00.0 wlp2s0: disabling VHT as WMM/QoS
> > is not supported by the AP
> > [  337.842590] wlp2s0: associate with 00:1a:1e:bb:2a:29 (try 1/3)
> > [ 337.855890] wlp2s0: RX AssocResp from 00:1a:1e:bb:2a:29 (capab=0x411
> > status=0 aid=1)
> > [  337.858372] wlp2s0: associated
> 
> From a quick look only suspicious I found was these disabling HT and VHT
> messages. It might be that ath10k is not handling that case correctly.
> Do you see these messages with ath10k when the connection works without
> problems?
> 
> -- 
> Kalle Valo

[    0.000000] Linux version 4.10.0-14-generic (buildd@lgw01-10) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #16~16.04.1-Ubuntu SMP Fri Mar 17 17:28:20 UTC 2017 (Ubuntu 4.10.0-14.16~16.04.1-generic 4.10.3)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007834dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000007834e000-0x000000007834efff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000007834f000-0x0000000078378fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000078379000-0x0000000078427fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000078428000-0x0000000078d28fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000078d29000-0x0000000085c3dfff] usable
[    0.000000] BIOS-e820: [mem 0x0000000085c3e000-0x000000008662dfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000008662e000-0x0000000087fadfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000087fae000-0x0000000087ffdfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000087ffe000-0x0000000087ffefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000087fff000-0x00000000880fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000089000000-0x000000008c7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002727fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: Acer Aspire E5-574/Zoro_SL , BIOS V1.03 08/28/2015
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x272800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-E7FFF write-protect
[    0.000000]   E8000-EFFFF write-combining
[    0.000000]   F0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask 7C00000000 write-back
[    0.000000]   1 base 0087FFF000 mask 7FFFFFF000 uncachable
[    0.000000]   2 base 0088000000 mask 7FF8000000 uncachable
[    0.000000]   3 base 0090000000 mask 7FF0000000 uncachable
[    0.000000]   4 base 00A0000000 mask 7FE0000000 uncachable
[    0.000000]   5 base 00C0000000 mask 7FC0000000 uncachable
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
[    0.000000] total RAM covered: 14463M
[    0.000000]  gran_size: 64K 	chunk_size: 64K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 64K 	chunk_size: 128K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 256K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 60K
[    0.000000]  gran_size: 128K 	chunk_size: 128K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 128K 	chunk_size: 256K 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 124K
[    0.000000]  gran_size: 256K 	chunk_size: 256K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 256K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 252K
[    0.000000]  gran_size: 512K 	chunk_size: 512K 	num_reg: 10  	lose cover RAM: 8389116K
[    0.000000]  gran_size: 512K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 508K
[    0.000000]  gran_size: 1M 	chunk_size: 1M 	num_reg: 10  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 1020K
[    0.000000]  gran_size: 2M 	chunk_size: 2M 	num_reg: 9  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 2044K
[    0.000000]  gran_size: 4M 	chunk_size: 4M 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 8M 	chunk_size: 8M 	num_reg: 7  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 8188K
[    0.000000]  gran_size: 16M 	chunk_size: 16M 	num_reg: 6  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 16380K
[    0.000000]  gran_size: 32M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 32764K
[    0.000000]  gran_size: 64M 	chunk_size: 64M 	num_reg: 4  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 65532K
[    0.000000]  gran_size: 128M 	chunk_size: 128M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 256M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 256M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 1G 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 1G 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 2G 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000] mtrr_cleanup: can not find optimal value
[    0.000000] please specify mtrr_gran_size/mtrr_chunk_size
[    0.000000] e820: update [mem 0x87fff000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0x87fff max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf] mapped at [ffff93d0800fe1b0]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff93d080098000] 98000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] BRK [0x07827000, 0x07827fff] PGTABLE
[    0.000000] BRK [0x07828000, 0x07828fff] PGTABLE
[    0.000000] BRK [0x07829000, 0x07829fff] PGTABLE
[    0.000000] BRK [0x0782a000, 0x0782afff] PGTABLE
[    0.000000] BRK [0x0782b000, 0x0782bfff] PGTABLE
[    0.000000] BRK [0x0782c000, 0x0782cfff] PGTABLE
[    0.000000] BRK [0x0782d000, 0x0782dfff] PGTABLE
[    0.000000] BRK [0x0782e000, 0x0782efff] PGTABLE
[    0.000000] BRK [0x0782f000, 0x0782ffff] PGTABLE
[    0.000000] BRK [0x07830000, 0x07830fff] PGTABLE
[    0.000000] RAMDISK: [mem 0x33006000-0x357fafff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000FE020 000024 (v02 ACRSYS)
[    0.000000] ACPI: XSDT 0x0000000087FDF188 0000F4 (v01 ACRSYS ACRPRDCT 00000000      01000013)
[    0.000000] ACPI: FACP 0x0000000087FE4000 00010C (v05 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: DSDT 0x0000000087FC7000 016421 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: FACS 0x0000000087F7C000 000040
[    0.000000] ACPI: TCPA 0x0000000087FFC000 000032 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFB000 000236 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFA000 000042 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF9000 0004B7 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF8000 00004B (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: TPM2 0x0000000087FF7000 000034 (v03 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF2000 0040CA (v01 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: MSDM 0x0000000087FF1000 000055 (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FEC000 004E73 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FEB000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: DBG2 0x0000000087FEA000 000054 (v00 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FE9000 0004CA (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: ASF! 0x0000000087FE8000 0000A5 (v32 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: ASPT 0x0000000087FE7000 000034 (v07 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: BOOT 0x0000000087FE6000 000028 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FE5000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: HPET 0x0000000087FE3000 000038 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: LPIT 0x0000000087FE2000 000094 (v01 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: APIC 0x0000000087FE1000 0000BC (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: MCFG 0x0000000087FE0000 00003C (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FDE000 00019A (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FC6000 0004A3 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FC5000 000E58 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: DMAR 0x0000000087FC4000 0000CC (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: FPDT 0x0000000087FC3000 000044 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x00000002727fffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x2727d3000-0x2727fdfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000007834dfff]
[    0.000000]   node   0: [mem 0x0000000078379000-0x0000000078427fff]
[    0.000000]   node   0: [mem 0x0000000078d29000-0x0000000085c3dfff]
[    0.000000]   node   0: [mem 0x0000000087ffe000-0x0000000087ffefff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x00000002727fffff]
[    0.000000] On node 0 totalpages: 2063024
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3997 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 8461 pages used for memmap
[    0.000000]   DMA32 zone: 541459 pages, LIFO batch:31
[    0.000000]   Normal zone: 23712 pages used for memmap
[    0.000000]   Normal zone: 1517568 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics memory at 0x000000008a800000-0x000000008c7fffff
[    0.000000] ACPI: PM-Timer IO Port: 0x1808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x7834e000-0x7834efff]
[    0.000000] PM: Registered nosave memory: [mem 0x7834f000-0x78378fff]
[    0.000000] PM: Registered nosave memory: [mem 0x78428000-0x78d28fff]
[    0.000000] PM: Registered nosave memory: [mem 0x85c3e000-0x8662dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x8662e000-0x87fadfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87fae000-0x87ffdfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87fff000-0x880fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x88100000-0x88ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x89000000-0x8c7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x8c800000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe800000-0xfeafffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xff9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffa00000-0xffffffff]
[    0.000000] e820: [mem 0x8c800000-0xdfffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
[    0.000000] percpu: Embedded 36 pages/cpu @ffff93d2f2400000 s107800 r8192 d31464 u524288
[    0.000000] pcpu-alloc: s107800 r8192 d31464 u524288 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 2030766
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 7992568K/8252096K available (9033K kernel code, 1665K rwdata, 3832K rodata, 2224K init, 2364K bss, 259528K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
[    0.000000] NR_IRQS:524544 nr_irqs:1024 16
[    0.000000] vt handoff: transparent VT on vt#7
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Detected 2400.000 MHz processor
[    0.000025] Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.00 BogoMIPS (lpj=9600000)
[    0.000027] pid_max: default: 32768 minimum: 301
[    0.000036] ACPI: Core revision 20160930
[    0.029431] ACPI: 9 ACPI AML tables successfully acquired and loaded
[    0.029457] Security Framework initialized
[    0.029458] Yama: becoming mindful.
[    0.029471] AppArmor: AppArmor initialized
[    0.029902] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.031413] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.032100] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.032108] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.032323] CPU: Physical Processor ID: 0
[    0.032323] CPU: Processor Core ID: 0
[    0.032327] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.032327] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.032332] mce: CPU supports 8 MCE banks
[    0.032341] CPU0: Thermal monitoring enabled (TM1)
[    0.032356] process: using mwait in idle threads
[    0.032358] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.032359] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.032465] Freeing SMP alternatives memory: 32K
[    0.034176] ftrace: allocating 34183 entries in 134 pages
[    0.051036] smpboot: Max logical packages: 2
[    0.051046] DMAR: Host address width 39
[    0.051047] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.051052] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
[    0.051053] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.051056] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.051057] DMAR: RMRR base: 0x0000008652a000 end: 0x00000086549fff
[    0.051058] DMAR: RMRR base: 0x0000008a000000 end: 0x0000008c7fffff
[    0.051059] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.051060] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.051061] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.051062] DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
[    0.051062] DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
[    0.052501] DMAR-IR: Enabled IRQ remapping in xapic mode
[    0.052502] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.056538] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.096230] TSC deadline timer enabled
[    0.096234] smpboot: CPU0: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz (family: 0x6, model: 0x4e, stepping: 0x3)
[    0.096282] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.096312] ... version:                4
[    0.096313] ... bit width:              48
[    0.096313] ... generic registers:      4
[    0.096314] ... value mask:             0000ffffffffffff
[    0.096314] ... max period:             00007fffffffffff
[    0.096314] ... fixed-purpose events:   3
[    0.096315] ... event mask:             000000070000000f
[    0.097159] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
[    0.097171] smp: Bringing up secondary CPUs ...
[    0.097229] x86: Booting SMP configuration:
[    0.097230] .... node  #0, CPUs:      #1 #2 #3
[    0.098927] smp: Brought up 1 node, 4 CPUs
[    0.098929] smpboot: Total of 4 processors activated (19200.00 BogoMIPS)
[    0.103126] devtmpfs: initialized
[    0.103177] x86/mm: Memory block size: 128MB
[    0.105341] evm: security.selinux
[    0.105342] evm: security.SMACK64
[    0.105342] evm: security.SMACK64EXEC
[    0.105343] evm: security.SMACK64TRANSMUTE
[    0.105343] evm: security.SMACK64MMAP
[    0.105343] evm: security.ima
[    0.105344] evm: security.capability
[    0.105394] PM: Registering ACPI NVS region [mem 0x7834e000-0x7834efff] (4096 bytes)
[    0.105395] PM: Registering ACPI NVS region [mem 0x8662e000-0x87fadfff] (26738688 bytes)
[    0.105756] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.105764] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.105801] pinctrl core: initialized pinctrl subsystem
[    0.105961] RTC time: 20:42:43, date: 05/30/17
[    0.106037] NET: Registered protocol family 16
[    0.118854] cpuidle: using governor ladder
[    0.130872] cpuidle: using governor menu
[    0.130874] PCCT header not found.
[    0.130910] Simple Boot Flag at 0x44 set to 0x1
[    0.130927] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.130927] ACPI: bus type PCI registered
[    0.130928] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.130988] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.131017] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.131021] pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
[    0.131290] PCI: Using configuration type 1 for base access
[    0.151013] HugeTLB registered 1 GB page size, pre-allocated 0 pages
[    0.151014] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.151232] ACPI: Added _OSI(Module Device)
[    0.151232] ACPI: Added _OSI(Processor Device)
[    0.151233] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.151234] ACPI: Added _OSI(Processor Aggregator Device)
[    0.152513] ACPI: Executed 18 blocks of module-level executable AML code
[    0.160438] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.163993] ACPI: Dynamic OEM Table Load:
[    0.164045] ACPI: SSDT 0xFFFF93D2E86E6800 00061E (v02 PmRef  Cpu0Ist  00003000 INTL 20130117)
[    0.164295] ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
[    0.165322] ACPI: Dynamic OEM Table Load:
[    0.165331] ACPI: SSDT 0xFFFF93D2E8133800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20130117)
[    0.166030] ACPI: Dynamic OEM Table Load:
[    0.166039] ACPI: SSDT 0xFFFF93D2E86E6000 0005AA (v02 PmRef  ApIst    00003000 INTL 20130117)
[    0.166527] ACPI: Dynamic OEM Table Load:
[    0.166534] ACPI: SSDT 0xFFFF93D2E8134200 000119 (v02 PmRef  ApCst    00003000 INTL 20130117)
[    0.168212] ACPI : EC: EC started
[    0.168642] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
[    0.168643] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.168645] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions
[    0.168645] ACPI: Interpreter enabled
[    0.168693] ACPI: (supports S0 S3 S4 S5)
[    0.168693] ACPI: Using IOAPIC for interrupt routing
[    0.168730] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.185611] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.185617] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.188381] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
[    0.188382] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.190302] PCI host bridge to bus 0000:00
[    0.190304] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.190305] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.190306] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.190307] pci_bus 0000:00: root bus resource [mem 0x8c800000-0xdfffffff window]
[    0.190308] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.190309] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.190316] pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
[    0.191087] pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
[    0.191096] pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
[    0.191101] pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64bit pref]
[    0.191106] pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.191937] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.191957] pci 0000:00:14.0: reg 0x10: [mem 0xa1300000-0xa130ffff 64bit]
[    0.192030] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.192781] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.192818] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.192837] pci 0000:00:14.2: reg 0x10: [mem 0xa132a000-0xa132afff 64bit]
[    0.193653] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.193677] pci 0000:00:15.0: reg 0x10: [mem 0xa132b000-0xa132bfff 64bit]
[    0.194548] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.194570] pci 0000:00:16.0: reg 0x10: [mem 0xa132c000-0xa132cfff 64bit]
[    0.194649] pci 0000:00:16.0: PME# supported from D3hot
[    0.195442] pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
[    0.195458] pci 0000:00:17.0: reg 0x10: [mem 0xa1328000-0xa1329fff]
[    0.195466] pci 0000:00:17.0: reg 0x14: [mem 0xa132f000-0xa132f0ff]
[    0.195474] pci 0000:00:17.0: reg 0x18: [io  0x4080-0x4087]
[    0.195482] pci 0000:00:17.0: reg 0x1c: [io  0x4088-0x408b]
[    0.195490] pci 0000:00:17.0: reg 0x20: [io  0x4060-0x407f]
[    0.195497] pci 0000:00:17.0: reg 0x24: [mem 0xa132d000-0xa132d7ff]
[    0.195543] pci 0000:00:17.0: PME# supported from D3hot
[    0.196328] pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
[    0.196396] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.197166] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.197213] pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
[    0.197280] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.198046] pci 0000:00:1c.5: System wakeup disabled by ACPI
[    0.198093] pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
[    0.198962] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.198975] pci 0000:00:1f.2: reg 0x10: [mem 0xa1324000-0xa1327fff]
[    0.199802] pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
[    0.199826] pci 0000:00:1f.3: reg 0x10: [mem 0xa1320000-0xa1323fff 64bit]
[    0.199861] pci 0000:00:1f.3: reg 0x20: [mem 0xa1310000-0xa131ffff 64bit]
[    0.199914] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.200669] pci 0000:00:1f.3: System wakeup disabled by ACPI
[    0.200706] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.200753] pci 0000:00:1f.4: reg 0x10: [mem 0xa132e000-0xa132e0ff 64bit]
[    0.200822] pci 0000:00:1f.4: reg 0x20: [io  0x4040-0x405f]
[    0.201714] pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
[    0.201733] pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
[    0.201761] pci 0000:01:00.0: reg 0x18: [mem 0xa1204000-0xa1204fff 64bit]
[    0.201778] pci 0000:01:00.0: reg 0x20: [mem 0xa1200000-0xa1203fff 64bit]
[    0.201874] pci 0000:01:00.0: supports D1 D2
[    0.201875] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.201929] pci 0000:01:00.0: System wakeup disabled by ACPI
[    0.211062] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.211064] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.211067] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.211381] pci 0000:02:00.0: [168c:0042] type 00 class 0x028000
[    0.211607] pci 0000:02:00.0: reg 0x10: [mem 0xa1000000-0xa11fffff 64bit]
[    0.213046] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.213498] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.223235] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.223239] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.224409] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224460] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.224509] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224557] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224605] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224653] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224700] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224748] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.225052] platform MSFT0101:00: failed to claim resource 1
[    0.225056] acpi MSFT0101:00: platform device creation failed: -16
[    0.225144] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.225263] ACPI Warning: GPE type mismatch (level/edge) (20160930/evxface-826)
[    0.225278] ACPI : EC: event unblocked
[    0.225290] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.225291] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions and events
[    0.225532] SCSI subsystem initialized
[    0.225567] libata version 3.00 loaded.
[    0.225604] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.225606] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.225608] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.225609] vgaarb: loaded
[    0.225625] ACPI: bus type USB registered
[    0.225639] usbcore: registered new interface driver usbfs
[    0.225646] usbcore: registered new interface driver hub
[    0.225658] usbcore: registered new device driver usb
[    0.225739] PCI: Using ACPI for IRQ routing
[    0.253772] PCI: pci_cache_line_size set to 64 bytes
[    0.254119] e820: reserve RAM buffer [mem 0x0009e800-0x0009ffff]
[    0.254120] e820: reserve RAM buffer [mem 0x7834e000-0x7bffffff]
[    0.254121] e820: reserve RAM buffer [mem 0x78428000-0x7bffffff]
[    0.254122] e820: reserve RAM buffer [mem 0x85c3e000-0x87ffffff]
[    0.254123] e820: reserve RAM buffer [mem 0x87fff000-0x87ffffff]
[    0.254123] e820: reserve RAM buffer [mem 0x272800000-0x273ffffff]
[    0.254201] NetLabel: Initializing
[    0.254201] NetLabel:  domain hash size = 128
[    0.254202] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.254215] NetLabel:  unlabeled traffic allowed by default
[    0.254320] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.254324] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.256365] clocksource: Switched to clocksource hpet
[    0.262875] VFS: Disk quotas dquot_6.6.0
[    0.262888] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.262968] AppArmor: AppArmor Filesystem Enabled
[    0.263001] pnp: PnP ACPI init
[    0.263152] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.263153] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.263154] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.263155] system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
[    0.263156] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.263158] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.263159] system 00:00: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.263162] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263483] system 00:01: [io  0x2000-0x20fe] has been reserved
[    0.263485] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263628] system 00:02: [io  0x0680-0x069f] has been reserved
[    0.263632] system 00:02: [io  0xffff] has been reserved
[    0.263633] system 00:02: [io  0xffff] has been reserved
[    0.263634] system 00:02: [io  0xffff] has been reserved
[    0.263635] system 00:02: [io  0x1800-0x18fe] has been reserved
[    0.263636] system 00:02: [io  0x164e-0x164f] has been reserved
[    0.263638] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263736] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.263770] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.263772] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.263796] pnp 00:05: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.265027] system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.265028] system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.265030] system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.265031] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.265591] system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.265592] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.265593] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.265595] system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
[    0.265596] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.265597] system 00:07: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.265598] system 00:07: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.265599] system 00:07: [mem 0xff000000-0xffffffff] could not be reserved
[    0.265600] system 00:07: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.265601] system 00:07: [mem 0x8c800000-0x8c81ffff] has been reserved
[    0.265603] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.265822] pnp: PnP ACPI: found 8 devices
[    0.272667] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.272685] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.272688] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.272691] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.272697] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.272700] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.272707] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.272708] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.272709] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.272710] pci_bus 0000:00: resource 7 [mem 0x8c800000-0xdfffffff window]
[    0.272711] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff window]
[    0.272712] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    0.272713] pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
[    0.272714] pci_bus 0000:02: resource 1 [mem 0xa1000000-0xa11fffff]
[    0.272830] NET: Registered protocol family 2
[    0.272989] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    0.273096] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.273192] TCP: Hash tables configured (established 65536 bind 65536)
[    0.273211] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.273234] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.273273] NET: Registered protocol family 1
[    0.273284] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.275057] PCI: CLS 64 bytes, default 64
[    0.275095] Unpacking initramfs...
[    0.920773] Freeing initrd memory: 40916K
[    0.920810] DMAR: ACPI device "device:6a" under DMAR at fed91000 as 00:15.0
[    0.920821] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.920823] software IO TLB [mem 0x81c3e000-0x85c3e000] (64MB) mapped at [ffff93d101c3e000-ffff93d105c3dfff]
[    0.920968] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22983777dd9, max_idle_ns: 440795300422 ns
[    0.921051] Scanning for low memory corruption every 60 seconds
[    0.921338] audit: initializing netlink subsys (disabled)
[    0.921389] audit: type=2000 audit(1496176963.916:1): initialized
[    0.921760] Initialise system trusted keyrings
[    0.921854] workingset: timestamp_bits=36 max_order=21 bucket_order=0
[    0.923169] zbud: loaded
[    0.923552] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.923748] fuse init (API version 7.26)
[    0.925388] Key type asymmetric registered
[    0.925388] Asymmetric key parser 'x509' registered
[    0.925418] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.925448] io scheduler noop registered
[    0.925449] io scheduler deadline registered
[    0.925455] io scheduler cfq registered (default)
[    0.926013] pcieport 0000:00:1c.0: AER enabled with IRQ 122
[    0.926029] pcieport 0000:00:1c.5: AER enabled with IRQ 123
[    0.926040] pcieport 0000:00:1c.0: Signaling PME with IRQ 122
[    0.926048] pcieport 0000:00:1c.5: Signaling PME with IRQ 123
[    0.926089] vesafb: mode is 1366x768x32, linelength=5504, pages=0
[    0.926089] vesafb: scrolling: redraw
[    0.926090] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.926103] vesafb: framebuffer at 0x90000000, mapped to 0xffff9f6881800000, using 4160k, total 4160k
[    0.926178] Console: switching to colour frame buffer device 170x48
[    0.926193] fb0: VESA VGA frame buffer device
[    0.926203] intel_idle: MWAIT substates: 0x11142120
[    0.926203] intel_idle: v0.4.1 model 0x4E
[    0.926407] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.926949] ACPI: AC Adapter [ACAD] (off-line)
[    0.927004] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.927007] ACPI: Power Button [PWRB]
[    0.927034] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    0.927036] ACPI: Sleep Button [SLPB]
[    0.927085] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    0.927105] ACPI: Lid Switch [LID0]
[    0.927134] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    0.927135] ACPI: Power Button [PWRF]
[    0.927475] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    0.927519] thermal LNXTHERM:00: registered as thermal_zone0
[    0.927520] ACPI: Thermal Zone [TZ01] (40 C)
[    0.927565] GHES: HEST is not enabled!
[    0.927636] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.928188] ACPI: Battery Slot [BAT1] (battery present)
[    0.929075] Linux agpgart interface v0.103
[    0.930856] loop: module loaded
[    0.930997] libphy: Fixed MDIO Bus: probed
[    0.930998] tun: Universal TUN/TAP device driver, 1.6
[    0.930998] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.931031] PPP generic driver version 2.4.2
[    0.931066] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.931068] ehci-pci: EHCI PCI platform driver
[    0.931077] ehci-platform: EHCI generic platform driver
[    0.931084] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.931085] ohci-pci: OHCI PCI platform driver
[    0.931091] ohci-platform: OHCI generic platform driver
[    0.931095] uhci_hcd: USB Universal Host Controller Interface driver
[    0.931260] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.931265] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    0.932355] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00109810
[    0.932359] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.932458] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.932459] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.932460] usb usb1: Product: xHCI Host Controller
[    0.932461] usb usb1: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
[    0.932461] usb usb1: SerialNumber: 0000:00:14.0
[    0.932583] hub 1-0:1.0: USB hub found
[    0.932597] hub 1-0:1.0: 12 ports detected
[    0.940798] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.940801] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    0.940826] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    0.940827] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.940828] usb usb2: Product: xHCI Host Controller
[    0.940829] usb usb2: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
[    0.940829] usb usb2: SerialNumber: 0000:00:14.0
[    0.940919] hub 2-0:1.0: USB hub found
[    0.940927] hub 2-0:1.0: 6 ports detected
[    0.945013] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    0.945013] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    0.947202] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.947287] mousedev: PS/2 mouse device common for all mice
[    0.947450] rtc_cmos 00:03: RTC can wake from S4
[    0.947820] rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
[    0.947901] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    0.947905] i2c /dev entries driver
[    0.947951] device-mapper: uevent: version 1.0.3
[    0.948003] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    0.948006] intel_pstate: Intel P-state driver initializing
[    0.948279] intel_pstate: HWP enabled
[    0.948314] ledtrig-cpu: registered to indicate activity on CPUs
[    0.948702] NET: Registered protocol family 10
[    0.952051] Segment Routing with IPv6
[    0.952065] NET: Registered protocol family 17
[    0.952086] Key type dns_resolver registered
[    0.952330] microcode: sig=0x406e3, pf=0x80, revision=0x33
[    0.952407] microcode: Microcode Update Driver: v2.2.
[    0.952534] registered taskstats version 1
[    0.952540] Loading compiled-in X.509 certificates
[    0.954549] Loaded X.509 cert 'Build time autogenerated kernel key: 9b4fdbf663ae6c34cad42981a5d67e8ef42b1abf'
[    0.954564] zswap: loaded using pool lzo/zbud
[    0.955356] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    0.965160] Key type big_key registered
[    0.965178] Key type trusted registered
[    0.967182] Key type encrypted registered
[    0.967184] AppArmor: AppArmor sha1 policy hashing enabled
[    0.967186] ima: No TPM chip found, activating TPM-bypass! (rc=-19)
[    0.967198] evm: HMAC attrs: 0x1
[    0.967884]   Magic number: 1:57:752
[    0.967898] tty ttyS3: hash matches
[    0.968067] rtc_cmos 00:03: setting system clock to 2017-05-30 20:42:44 UTC (1496176964)
[    0.968151] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
[    0.968152] EDD information not available.
[    0.968202] PM: Hibernation image not present or could not be loaded.
[    0.969537] Freeing unused kernel memory: 2224K
[    0.969538] Write protecting the kernel read-only data: 14336k
[    0.969958] Freeing unused kernel memory: 1192K
[    0.970447] Freeing unused kernel memory: 264K
[    0.976917] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.986917] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.986972] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.986980] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.987330] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.987351] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988104] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988114] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988461] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988507] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988539] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.007233] FUJITSU Extended Socket Network Device Driver - version 1.2 - Copyright (c) 2015 FUJITSU LIMITED
[    1.009451] wmi: Mapper loaded
[    1.020677] hidraw: raw HID events driver (C) Jiri Kosina
[    1.027003] ahci 0000:00:17.0: version 3.0
[    1.027274] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
[    1.027276] ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio slum part deso sadm sds apst 
[    1.027965] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    1.027970] r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
[    1.028459] scsi host0: ahci
[    1.028622] scsi host1: ahci
[    1.028681] ata1: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d100 irq 125
[    1.028683] ata2: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d180 irq 125
[    1.029581] [drm] Initialized
[    1.037590] r8169 0000:01:00.0 eth0: RTL8168h/8111h at 0xffff9f6880cc1000, 2c:60:0c:ff:58:7a, XID 14100800 IRQ 126
[    1.037592] r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    1.054323] [drm] Memory usable by graphics device = 4096M
[    1.054325] checking generic (90000000 410000) vs hw (90000000 10000000)
[    1.054326] fb: switching to inteldrmfb from VESA VGA
[    1.054349] Console: switching to colour dummy device 80x25
[    1.054458] [drm] Replacing VGA console driver
[    1.060523] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.060524] [drm] Driver supports precise vblank timestamp query.
[    1.060528] r8169 0000:01:00.0 enp1s0: renamed from eth0
[    1.068822] [drm] Finished loading i915/skl_dmc_ver1_26.bin (v1.26)
[    1.069215] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.075812] [drm] GuC firmware load skipped
[    1.088583] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    1.088834] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    1.088938] [drm] Initialized i915 1.6.0 20161121 for 0000:00:02.0 on minor 0
[    1.100689] fbcon: inteldrmfb (fb0) is primary device
[    1.100750] Console: switching to colour frame buffer device 170x48
[    1.100764] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    1.272571] usb 1-5: new full-speed USB device number 2 using xhci_hcd
[    1.341358] ata2: SATA link down (SStatus 4 SControl 300)
[    1.341394] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.342288] ata1.00: ATA-9: WDC WD10JPVX-22JC3T0, 01.01A01, max UDMA/133
[    1.342289] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    1.343269] ata1.00: configured for UDMA/133
[    1.343663] scsi 0:0:0:0: Direct-Access     ATA      WDC WD10JPVX-22J 1A01 PQ: 0 ANSI: 5
[    1.372838] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.372959] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[    1.372961] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.372977] sd 0:0:0:0: [sda] Write Protect is off
[    1.372978] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.373054] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.414545] usb 1-5: New USB device found, idVendor=04ca, idProduct=3015
[    1.414546] usb 1-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.444007]  sda: sda1 sda2 < sda5 >
[    1.444997] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.592463] usb 1-8: new high-speed USB device number 3 using xhci_hcd
[    1.732913] usb 1-8: New USB device found, idVendor=0bda, idProduct=0129
[    1.732915] usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.732916] usb 1-8: Product: USB2.0-CRW
[    1.732916] usb 1-8: Manufacturer: Generic
[    1.732917] usb 1-8: SerialNumber: 20100201396000000
[    1.736438] usbcore: registered new interface driver rtsx_usb
[    1.952488] clocksource: Switched to clocksource tsc
[    2.095103] random: fast init done
[    2.106612] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[    2.816897] [drm] RC6 on
[    4.169832] systemd[1]: systemd 229 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
[    4.169938] systemd[1]: Detected architecture x86-64.
[    4.186610] systemd[1]: Set hostname to <user-Aspire-E5-574>.
[    5.044574] random: crng init done
[    5.410974] systemd[1]: Reached target Encrypted Volumes.
[    5.411049] systemd[1]: Listening on fsck to fsckd communication Socket.
[    5.411086] systemd[1]: Started Trigger resolvconf update for networkd DNS.
[    5.411181] systemd[1]: Created slice System Slice.
[    5.411219] systemd[1]: Listening on udev Control Socket.
[    5.411370] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    5.411378] systemd[1]: Reached target User and Group Name Lookups.
[    6.595754] lp: driver loaded but no devices found
[    6.623859] ppdev: user-space parallel port driver
[   13.468572] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
[   13.492500] systemd-journald[300]: Received request to flush runtime journal from PID 1
[   13.577142] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[   13.588593] Bluetooth: Core ver 2.22
[   13.588605] NET: Registered protocol family 31
[   13.588606] Bluetooth: HCI device and connection manager initialized
[   13.588609] Bluetooth: HCI socket layer initialized
[   13.588610] Bluetooth: L2CAP socket layer initialized
[   13.588614] Bluetooth: SCO socket layer initialized
[   13.596588] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[   13.597414] usbcore: registered new interface driver btusb
[   13.602001] idma64 idma64.0: Found Intel integrated DMA 64-bit
[   13.605911] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   13.605987] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[   13.622551] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[   13.622552] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   13.622553] RAPL PMU: hw unit of domain package 2^-14 Joules
[   13.622554] RAPL PMU: hw unit of domain dram 2^-14 Joules
[   13.622554] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   13.622555] RAPL PMU: hw unit of domain psys 2^-14 Joules
[   13.634823] AVX2 version of gcm_enc/dec engaged.
[   13.634824] AES CTR mode by8 optimization enabled
[   13.680331] intel_rapl: Found RAPL domain package
[   13.680333] intel_rapl: Found RAPL domain core
[   13.680334] intel_rapl: Found RAPL domain uncore
[   13.680335] intel_rapl: Found RAPL domain dram
[   13.697001] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   13.746900] acer_wmi: Acer Laptop ACPI-WMI Extras
[   13.746912] acer_wmi: Function bitmap for Communication Button: 0x801
[   13.778571] acer_wmi: Enabling Launch Manager failed: 0xe4 - 0x0
[   13.778631] input: Acer WMI hotkeys as /devices/virtual/input/input6
[   13.779262] input: Acer BMA150 accelerometer as /devices/virtual/input/input7
[   13.857620] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   13.857622] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   13.857623] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   13.857623] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[   13.857624] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   13.857625] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x12
[   13.870577] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input8
[   13.870625] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[   13.870670] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[   13.870715] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[   13.961871] input: SYN1B81:01 06CB:7406 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-5/i2c-SYN1B81:01/0018:06CB:7406.0001/input/input13
[   13.961948] hid-multitouch 0018:06CB:7406.0001: input,hidraw0: I2C HID v1.00 Mouse [SYN1B81:01 06CB:7406] on i2c-SYN1B81:01
[   14.308814] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[   14.481131] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   14.481138] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   14.481141] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
[   14.481143] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   14.624923] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[   14.624952] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[   14.647207] ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 11ad:0806
[   14.647209] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   14.647615] ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
[   14.794091] audit: type=1400 audit(1496176978.320:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=675 comm="apparmor_parser"
[   14.794095] audit: type=1400 audit(1496176978.320:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=675 comm="apparmor_parser"
[   14.794097] audit: type=1400 audit(1496176978.320:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=675 comm="apparmor_parser"
[   14.794099] audit: type=1400 audit(1496176978.320:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=675 comm="apparmor_parser"
[   14.794249] audit: type=1400 audit(1496176978.320:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=674 comm="apparmor_parser"
[   14.794252] audit: type=1400 audit(1496176978.320:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=674 comm="apparmor_parser"
[   14.795163] audit: type=1400 audit(1496176978.320:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/ippusbxd" pid=680 comm="apparmor_parser"
[   14.795479] audit: type=1400 audit(1496176978.320:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=678 comm="apparmor_parser"
[   14.796938] audit: type=1400 audit(1496176978.324:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=682 comm="apparmor_parser"
[   14.797626] audit: type=1400 audit(1496176978.324:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=679 comm="apparmor_parser"
[   14.833752] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 93da0176
[   14.938288] wl: loading out-of-tree module taints kernel.
[   14.938291] wl: module license 'MIXED/Proprietary' taints kernel.
[   14.938292] Disabling lock debugging due to kernel taint
[   14.939801] wl: module verification failed: signature and/or required key missing - tainting kernel
[   15.139954] Adding 8251388k swap on /dev/sda5.  Priority:-1 extents:1 across:8251388k FS
[   15.797186] snd_hda_intel 0000:00:1f.3: control 2:0:0:PCM Playback Volume:0 is already present
[   16.394337] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   16.394338] Bluetooth: BNEP filters: protocol multicast
[   16.394340] Bluetooth: BNEP socket layer initialized
[   16.606193] ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   16.611790] ath: EEPROM regdomain: 0x6c
[   16.611791] ath: EEPROM indicates we should expect a direct regpair map
[   16.611792] ath: Country alpha2 being used: 00
[   16.611792] ath: Regpair used: 0x6c
[   17.001106] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   18.470663] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   18.470995] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471006] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   18.471040] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000081/00002000
[   18.471064] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   18.471084] pcieport 0000:00:1c.5:    [ 7] Bad DLLP              
[   18.471104] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471108] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471109] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471112] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471113] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471117] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471118] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471122] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504745] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504758] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   18.504794] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
[   18.504818] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   18.504839] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504843] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504844] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504848] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504849] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504852] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504853] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504857] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504858] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504862] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504862] pcieport 0000:00:1c.5: AER: Corrected error received: id=00e5
[   18.504866] pcieport 0000:00:1c.5: can't find device of ID00e5
[   20.398620] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   20.401806] IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
[   20.491337] r8169 0000:01:00.0 enp1s0: link down
[   20.491416] IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
[   20.805011] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   30.121978] wlp2s0: authenticate with c8:d3:a3:57:a9:3a
[   30.152495] wlp2s0: send auth to c8:d3:a3:57:a9:3a (try 1/3)
[   30.158285] wlp2s0: authenticated
[   30.160453] wlp2s0: associate with c8:d3:a3:57:a9:3a (try 1/3)
[   30.165023] wlp2s0: RX AssocResp from c8:d3:a3:57:a9:3a (capab=0x431 status=0 aid=4)
[   30.166957] wlp2s0: associated
[   30.166988] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   30.169172] ath: EEPROM regdomain: 0x8348
[   30.169173] ath: EEPROM indicates we should expect a country code
[   30.169174] ath: doing EEPROM country->regdmn map search
[   30.169174] ath: country maps to regdmn code: 0x3a
[   30.169175] ath: Country alpha2 being used: US
[   30.169175] ath: Regpair used: 0x3a
[   30.169176] ath: regdomain 0x8348 dynamically updated by country IE
[   41.539992] Bluetooth: RFCOMM TTY layer initialized
[   41.539997] Bluetooth: RFCOMM socket layer initialized
[   41.540001] Bluetooth: RFCOMM ver 1.11

-- Logs begin at Tue 2017-05-30 16:56:28 EDT, end at Tue 2017-05-30 16:57:25 EDT. --
May 30 16:56:28 user-Aspire-E5-574 systemd-journald[312]: Runtime journal (/run/log/journal/) is 8.0M, max 78.4M, 70.4M free.
May 30 16:56:28 user-Aspire-E5-574 kernel: Linux version 4.10.0-14-generic (buildd@lgw01-10) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #16~16.04.1-Ubuntu SMP Fri Mar 17 17:28:20 UTC 2017 (Ubuntu 4.10.0-14.16~16.04.1-generic 4.10.3)
May 30 16:56:28 user-Aspire-E5-574 kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
May 30 16:56:28 user-Aspire-E5-574 kernel: KERNEL supported cpus:
May 30 16:56:28 user-Aspire-E5-574 kernel:   Intel GenuineIntel
May 30 16:56:28 user-Aspire-E5-574 kernel:   AMD AuthenticAMD
May 30 16:56:28 user-Aspire-E5-574 kernel:   Centaur CentaurHauls
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: BIOS-provided physical RAM map:
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000000100000-0x000000007834dfff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000007834e000-0x000000007834efff] ACPI NVS
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000007834f000-0x0000000078378fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078379000-0x0000000078427fff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078428000-0x0000000078d28fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078d29000-0x0000000085c3dfff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000085c3e000-0x000000008662dfff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000008662e000-0x0000000087fadfff] ACPI NVS
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087fae000-0x0000000087ffdfff] ACPI data
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087ffe000-0x0000000087ffefff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087fff000-0x00000000880fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000089000000-0x000000008c7fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffffffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000100000000-0x00000002727fffff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: NX (Execute Disable) protection: active
May 30 16:56:28 user-Aspire-E5-574 kernel: SMBIOS 2.8 present.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMI: Acer Aspire E5-574/Zoro_SL , BIOS V1.03 08/28/2015
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: last_pfn = 0x272800 max_arch_pfn = 0x400000000
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR default type: uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR fixed ranges enabled:
May 30 16:56:28 user-Aspire-E5-574 kernel:   00000-9FFFF write-back
May 30 16:56:28 user-Aspire-E5-574 kernel:   A0000-BFFFF uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   C0000-E7FFF write-protect
May 30 16:56:28 user-Aspire-E5-574 kernel:   E8000-EFFFF write-combining
May 30 16:56:28 user-Aspire-E5-574 kernel:   F0000-FFFFF write-protect
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR variable ranges enabled:
May 30 16:56:28 user-Aspire-E5-574 kernel:   0 base 0000000000 mask 7C00000000 write-back
May 30 16:56:28 user-Aspire-E5-574 kernel:   1 base 0087FFF000 mask 7FFFFFF000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   2 base 0088000000 mask 7FF8000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   3 base 0090000000 mask 7FF0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   4 base 00A0000000 mask 7FE0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   5 base 00C0000000 mask 7FC0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   6 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   7 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   8 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   9 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
May 30 16:56:28 user-Aspire-E5-574 kernel: total RAM covered: 14463M
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 64K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 128K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 256K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 512K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 1M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 2M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 4M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 8M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 16M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 32M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 64M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 128M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 256M         num_reg: 6          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 512M         num_reg: 7          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 1G         num_reg: 8          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 2G         num_reg: 8          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 128K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 256K         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 512K         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 1M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 2M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 4M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 8M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 16M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 32M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 64M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 128M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 256M         num_reg: 6          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 512M         num_reg: 7          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 1G         num_reg: 8          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 2G         num_reg: 8          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 256K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 512K         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 1M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 2M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 4M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 8M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 16M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 32M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 64M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 128M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 256M         num_reg: 6          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 512M         num_reg: 7          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 1G         num_reg: 8          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 2G         num_reg: 8          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 512K         num_reg: 10          lose cover RAM: 8389116K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 1M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 2M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 4M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 8M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 16M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 32M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 64M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 128M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 256M         num_reg: 6          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 512M         num_reg: 7          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 1G         num_reg: 8          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 2G         num_reg: 8          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 1M         num_reg: 10          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 2M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 4M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 8M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 16M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 32M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 64M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 128M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 256M         num_reg: 6          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 512M         num_reg: 7          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 1G         num_reg: 8          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 2G         num_reg: 8          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 2M         num_reg: 9          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 4M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 8M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 16M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 32M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 64M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 128M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 256M         num_reg: 6          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 512M         num_reg: 7          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 1G         num_reg: 8          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 2G         num_reg: 8          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 4M         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 8M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 16M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 32M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 64M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 128M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 256M         num_reg: 6          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 512M         num_reg: 7          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 1G         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 2G         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 8M         num_reg: 7          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 16M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 32M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 64M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 128M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 256M         num_reg: 6          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 512M         num_reg: 7          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 1G         num_reg: 8          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 2G         num_reg: 8          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 16M         num_reg: 6          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 32M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 64M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 128M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 256M         num_reg: 6          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 512M         num_reg: 7          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 1G         num_reg: 8          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 2G         num_reg: 8          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 32M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 64M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 128M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 256M         num_reg: 6          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 512M         num_reg: 7          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 1G         num_reg: 8          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 2G         num_reg: 8          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 64M         num_reg: 4          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 128M         num_reg: 5          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 256M         num_reg: 6          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 512M         num_reg: 7          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 1G         num_reg: 8          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 2G         num_reg: 8          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 128M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 256M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 256M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1G         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1G         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2G         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel: mtrr_cleanup: can not find optimal value
May 30 16:56:28 user-Aspire-E5-574 kernel: please specify mtrr_gran_size/mtrr_chunk_size
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: update [mem 0x87fff000-0xffffffff] usable ==> reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: last_pfn = 0x87fff max_arch_pfn = 0x400000000
May 30 16:56:28 user-Aspire-E5-574 kernel: found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf] mapped at [ffff9203c00fe1b0]
May 30 16:56:28 user-Aspire-E5-574 kernel: Scanning 1 areas for low memory corruption
May 30 16:56:28 user-Aspire-E5-574 kernel: Base memory trampoline at [ffff9203c0098000] 98000 size 24576
May 30 16:56:28 user-Aspire-E5-574 kernel: Using GB pages for direct mapping
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44227000, 0x44227fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44228000, 0x44228fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44229000, 0x44229fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422a000, 0x4422afff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422b000, 0x4422bfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422c000, 0x4422cfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422d000, 0x4422dfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422e000, 0x4422efff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422f000, 0x4422ffff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44230000, 0x44230fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: RAMDISK: [mem 0x33006000-0x357fafff]
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Early table checksum verification disabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: RSDP 0x00000000000FE020 000024 (v02 ACRSYS)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: XSDT 0x0000000087FDF188 0000F4 (v01 ACRSYS ACRPRDCT 00000000      01000013)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FACP 0x0000000087FE4000 00010C (v05 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DSDT 0x0000000087FC7000 016421 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FACS 0x0000000087F7C000 000040
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: TCPA 0x0000000087FFC000 000032 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: UEFI 0x0000000087FFB000 000236 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: UEFI 0x0000000087FFA000 000042 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF9000 0004B7 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF8000 00004B (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: TPM2 0x0000000087FF7000 000034 (v03 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF2000 0040CA (v01 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: MSDM 0x0000000087FF1000 000055 (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FEC000 004E73 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBGP 0x0000000087FEB000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBG2 0x0000000087FEA000 000054 (v00 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FE9000 0004CA (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: ASF! 0x0000000087FE8000 0000A5 (v32 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: ASPT 0x0000000087FE7000 000034 (v07 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: BOOT 0x0000000087FE6000 000028 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBGP 0x0000000087FE5000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: HPET 0x0000000087FE3000 000038 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LPIT 0x0000000087FE2000 000094 (v01 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: APIC 0x0000000087FE1000 0000BC (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: MCFG 0x0000000087FE0000 00003C (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FDE000 00019A (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FC6000 0004A3 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FC5000 000E58 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DMAR 0x0000000087FC4000 0000CC (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FPDT 0x0000000087FC3000 000044 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Local APIC address 0xfee00000
May 30 16:56:28 user-Aspire-E5-574 kernel: No NUMA configuration found
May 30 16:56:28 user-Aspire-E5-574 kernel: Faking a node at [mem 0x0000000000000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NODE_DATA(0) allocated [mem 0x2727d3000-0x2727fdfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: Zone ranges:
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal   [mem 0x0000000100000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   Device   empty
May 30 16:56:28 user-Aspire-E5-574 kernel: Movable zone start for each node
May 30 16:56:28 user-Aspire-E5-574 kernel: Early memory node ranges
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000000001000-0x000000000009dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000000100000-0x000000007834dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000078379000-0x0000000078427fff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000078d29000-0x0000000085c3dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000087ffe000-0x0000000087ffefff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000100000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: Initmem setup node 0 [mem 0x0000000000001000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: On node 0 totalpages: 2063024
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 64 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 21 pages reserved
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 3997 pages, LIFO batch:0
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32 zone: 8461 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32 zone: 541459 pages, LIFO batch:31
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal zone: 23712 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal zone: 1517568 pages, LIFO batch:31
May 30 16:56:28 user-Aspire-E5-574 kernel: Reserving Intel graphics memory at 0x000000008a800000-0x000000008c7fffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PM-Timer IO Port: 0x1808
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Local APIC address 0xfee00000
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: IRQ0 used by override.
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: IRQ9 used by override.
May 30 16:56:28 user-Aspire-E5-574 kernel: Using ACPI (MADT) for SMP configuration information
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Allowing 4 CPUs, 0 hotplug CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x7834e000-0x7834efff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x7834f000-0x78378fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x78428000-0x78d28fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x85c3e000-0x8662dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x8662e000-0x87fadfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x87fae000-0x87ffdfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x87fff000-0x880fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x88100000-0x88ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x89000000-0x8c7fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x8c800000-0xdfffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfe800000-0xfeafffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfee01000-0xff9fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xffa00000-0xffffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: [mem 0x8c800000-0xdfffffff] available for PCI devices
May 30 16:56:28 user-Aspire-E5-574 kernel: Booting paravirtualized kernel on bare hardware
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
May 30 16:56:28 user-Aspire-E5-574 kernel: percpu: Embedded 36 pages/cpu @ffff920632400000 s107800 r8192 d31464 u524288
May 30 16:56:28 user-Aspire-E5-574 kernel: pcpu-alloc: s107800 r8192 d31464 u524288 alloc=1*2097152
May 30 16:56:28 user-Aspire-E5-574 kernel: pcpu-alloc: [0] 0 1 2 3 
May 30 16:56:28 user-Aspire-E5-574 kernel: Built 1 zonelists in Node order, mobility grouping on.  Total pages: 2030766
May 30 16:56:28 user-Aspire-E5-574 kernel: Policy zone: Normal
May 30 16:56:28 user-Aspire-E5-574 kernel: Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
May 30 16:56:28 user-Aspire-E5-574 kernel: PID hash table entries: 4096 (order: 3, 32768 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Calgary: detecting Calgary via BIOS EBDA area
May 30 16:56:28 user-Aspire-E5-574 kernel: Calgary: Unable to locate Rio Grande table in EBDA - bailing!
May 30 16:56:28 user-Aspire-E5-574 kernel: Memory: 7992568K/8252096K available (9033K kernel code, 1665K rwdata, 3832K rodata, 2224K init, 2364K bss, 259528K reserved, 0K cma-reserved)
May 30 16:56:28 user-Aspire-E5-574 kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
May 30 16:56:28 user-Aspire-E5-574 kernel: Hierarchical RCU implementation.
May 30 16:56:28 user-Aspire-E5-574 kernel:         Build-time adjustment of leaf fanout to 64.
May 30 16:56:28 user-Aspire-E5-574 kernel:         RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
May 30 16:56:28 user-Aspire-E5-574 kernel: RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
May 30 16:56:28 user-Aspire-E5-574 kernel: NR_IRQS:524544 nr_irqs:1024 16
May 30 16:56:28 user-Aspire-E5-574 kernel: vt handoff: transparent VT on vt#7
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: colour dummy device 80x25
May 30 16:56:28 user-Aspire-E5-574 kernel: console [tty0] enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet clockevent registered
May 30 16:56:28 user-Aspire-E5-574 kernel: tsc: Detected 2400.000 MHz processor
May 30 16:56:28 user-Aspire-E5-574 kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.00 BogoMIPS (lpj=9600000)
May 30 16:56:28 user-Aspire-E5-574 kernel: pid_max: default: 32768 minimum: 301
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Core revision 20160930
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: 9 ACPI AML tables successfully acquired and loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: Security Framework initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Yama: becoming mindful.
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU: Physical Processor ID: 0
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU: Processor Core ID: 0
May 30 16:56:28 user-Aspire-E5-574 kernel: ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
May 30 16:56:28 user-Aspire-E5-574 kernel: ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
May 30 16:56:28 user-Aspire-E5-574 kernel: mce: CPU supports 8 MCE banks
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU0: Thermal monitoring enabled (TM1)
May 30 16:56:28 user-Aspire-E5-574 kernel: process: using mwait in idle threads
May 30 16:56:28 user-Aspire-E5-574 kernel: Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
May 30 16:56:28 user-Aspire-E5-574 kernel: Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing SMP alternatives memory: 32K
May 30 16:56:28 user-Aspire-E5-574 kernel: ftrace: allocating 34183 entries in 134 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Max logical packages: 2
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: Host address width 39
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: DRHD base: 0x000000fed90000 flags: 0x0
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: DRHD base: 0x000000fed91000 flags: 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: RMRR base: 0x0000008652a000 end: 0x00000086549fff
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: RMRR base: 0x0000008a000000 end: 0x0000008c7fffff
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: HPET id 0 under DRHD base 0xfed91000
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: Enabled IRQ remapping in xapic mode
May 30 16:56:28 user-Aspire-E5-574 kernel: x2apic: IRQ remapping doesn't support X2APIC mode
May 30 16:56:28 user-Aspire-E5-574 kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
May 30 16:56:28 user-Aspire-E5-574 kernel: TSC deadline timer enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: CPU0: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz (family: 0x6, model: 0x4e, stepping: 0x3)
May 30 16:56:28 user-Aspire-E5-574 kernel: Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
May 30 16:56:28 user-Aspire-E5-574 kernel: ... version:                4
May 30 16:56:28 user-Aspire-E5-574 kernel: ... bit width:              48
May 30 16:56:28 user-Aspire-E5-574 kernel: ... generic registers:      4
May 30 16:56:28 user-Aspire-E5-574 kernel: ... value mask:             0000ffffffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ... max period:             00007fffffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ... fixed-purpose events:   3
May 30 16:56:28 user-Aspire-E5-574 kernel: ... event mask:             000000070000000f
May 30 16:56:28 user-Aspire-E5-574 kernel: NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
May 30 16:56:28 user-Aspire-E5-574 kernel: smp: Bringing up secondary CPUs ...
May 30 16:56:28 user-Aspire-E5-574 kernel: x86: Booting SMP configuration:
May 30 16:56:28 user-Aspire-E5-574 kernel: .... node  #0, CPUs:      #1 #2 #3
May 30 16:56:28 user-Aspire-E5-574 kernel: smp: Brought up 1 node, 4 CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Total of 4 processors activated (19200.00 BogoMIPS)
May 30 16:56:28 user-Aspire-E5-574 kernel: devtmpfs: initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/mm: Memory block size: 128MB
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.selinux
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64EXEC
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64TRANSMUTE
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64MMAP
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.ima
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.capability
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registering ACPI NVS region [mem 0x7834e000-0x7834efff] (4096 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registering ACPI NVS region [mem 0x8662e000-0x87fadfff] (26738688 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: futex hash table entries: 1024 (order: 4, 65536 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: pinctrl core: initialized pinctrl subsystem
May 30 16:56:28 user-Aspire-E5-574 kernel: RTC time: 20:56:22, date: 05/30/17
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 16
May 30 16:56:28 user-Aspire-E5-574 kernel: cpuidle: using governor ladder
May 30 16:56:28 user-Aspire-E5-574 kernel: cpuidle: using governor menu
May 30 16:56:28 user-Aspire-E5-574 kernel: PCCT header not found.
May 30 16:56:28 user-Aspire-E5-574 kernel: Simple Boot Flag at 0x44 set to 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: bus type PCI registered
May 30 16:56:28 user-Aspire-E5-574 kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
May 30 16:56:28 user-Aspire-E5-574 kernel: pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using configuration type 1 for base access
May 30 16:56:28 user-Aspire-E5-574 kernel: HugeTLB registered 1 GB page size, pre-allocated 0 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: HugeTLB registered 2 MB page size, pre-allocated 0 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Module Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Processor Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Processor Aggregator Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Executed 18 blocks of module-level executable AML code
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF9206286E3800 00061E (v02 PmRef  Cpu0Ist  00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF920628133C00 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF9206286E3000 0005AA (v02 PmRef  ApIst    00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF920628135000 000119 (v02 PmRef  ApCst    00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI : EC: EC started
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Interpreter enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: (supports S0 S3 S4 S5)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Using IOAPIC for interrupt routing
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI host bridge to bus 0000:00
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0x8c800000-0xdfffffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [bus 00-fe]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64bit pref]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: reg 0x10: [mem 0xa1300000-0xa130ffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: PME# supported from D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.2: reg 0x10: [mem 0xa132a000-0xa132afff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:15.0: reg 0x10: [mem 0xa132b000-0xa132bfff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: reg 0x10: [mem 0xa132c000-0xa132cfff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: PME# supported from D3hot
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x10: [mem 0xa1328000-0xa1329fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x14: [mem 0xa132f000-0xa132f0ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x18: [io  0x4080-0x4087]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x1c: [io  0x4088-0x408b]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x20: [io  0x4060-0x407f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x24: [mem 0xa132d000-0xa132d7ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: PME# supported from D3hot
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.2: reg 0x10: [mem 0xa1324000-0xa1327fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: reg 0x10: [mem 0xa1320000-0xa1323fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: reg 0x20: [mem 0xa1310000-0xa131ffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: PME# supported from D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: reg 0x10: [mem 0xa132e000-0xa132e0ff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: reg 0x20: [io  0x4040-0x405f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x18: [mem 0xa1204000-0xa1204fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x20: [mem 0xa1200000-0xa1203fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: supports D1 D2
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: [168c:0042] type 00 class 0x028000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: reg 0x10: [mem 0xa1000000-0xa11fffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PCI bridge to [bus 02]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: platform MSFT0101:00: failed to claim resource 1
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi MSFT0101:00: platform device creation failed: -16
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Enabled 7 GPEs in block 00 to 7F
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI Warning: GPE type mismatch (level/edge) (20160930/evxface-826)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI : EC: event unblocked
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions and events
May 30 16:56:28 user-Aspire-E5-574 kernel: SCSI subsystem initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: libata version 3.00 loaded.
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: setting as boot VGA device
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: bridge control possible
May 30 16:56:28 user-Aspire-E5-574 kernel: vgaarb: loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: bus type USB registered
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver usbfs
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver hub
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new device driver usb
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using ACPI for IRQ routing
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: pci_cache_line_size set to 64 bytes
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x0009e800-0x0009ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x7834e000-0x7bffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x78428000-0x7bffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x85c3e000-0x87ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x87fff000-0x87ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x272800000-0x273ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel: Initializing
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  domain hash size = 128
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  unlabeled traffic allowed by default
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet0: 8 comparators, 64-bit 24.000000 MHz counter
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: Switched to clocksource hpet
May 30 16:56:28 user-Aspire-E5-574 kernel: VFS: Disk quotas dquot_6.6.0
May 30 16:56:28 user-Aspire-E5-574 kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor Filesystem Enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp: PnP ACPI init
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe410000-0xfe7fffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:01: [io  0x2000-0x20fe] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x0680-0x069f] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x1800-0x18fe] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x164e-0x164f] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:04: [io  0x1854-0x1857] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0303 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed90000-0xfed93fff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed45000-0xfed8ffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xff000000-0xffffffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfee00000-0xfeefffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0x8c800000-0x8c81ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp: PnP ACPI: found 8 devices
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PCI bridge to [bus 02]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 7 [mem 0x8c800000-0xdfffffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:02: resource 1 [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 2
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP established hash table entries: 65536 (order: 7, 524288 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP: Hash tables configured (established 65536 bind 65536)
May 30 16:56:28 user-Aspire-E5-574 kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 1
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: CLS 64 bytes, default 64
May 30 16:56:28 user-Aspire-E5-574 kernel: Unpacking initramfs...
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing initrd memory: 40916K
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: ACPI device "device:6a" under DMAR at fed91000 as 00:15.0
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
May 30 16:56:28 user-Aspire-E5-574 kernel: software IO TLB [mem 0x81c3e000-0x85c3e000] (64MB) mapped at [ffff920441c3e000-ffff920445c3dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22983777dd9, max_idle_ns: 440795300422 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: Scanning for low memory corruption every 60 seconds
May 30 16:56:28 user-Aspire-E5-574 kernel: audit: initializing netlink subsys (disabled)
May 30 16:56:28 user-Aspire-E5-574 kernel: audit: type=2000 audit(1496177782.916:1): initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Initialise system trusted keyrings
May 30 16:56:28 user-Aspire-E5-574 kernel: workingset: timestamp_bits=36 max_order=21 bucket_order=0
May 30 16:56:28 user-Aspire-E5-574 kernel: zbud: loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: squashfs: version 4.0 (2009/01/31) Phillip Lougher
May 30 16:56:28 user-Aspire-E5-574 kernel: fuse init (API version 7.26)
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type asymmetric registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Asymmetric key parser 'x509' registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler noop registered
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler deadline registered
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler cfq registered (default)
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.0: AER enabled with IRQ 122
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER enabled with IRQ 123
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.0: Signaling PME with IRQ 122
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: Signaling PME with IRQ 123
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: mode is 1366x768x32, linelength=5504, pages=0
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: scrolling: redraw
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: framebuffer at 0x90000000, mapped to 0xffffb69281800000, using 4160k, total 4160k
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour frame buffer device 170x48
May 30 16:56:28 user-Aspire-E5-574 kernel: fb0: VESA VGA frame buffer device
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: MWAIT substates: 0x11142120
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: v0.4.1 model 0x4E
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: lapic_timer_reliable_states 0xffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: AC Adapter [ACAD] (off-line)
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Power Button [PWRB]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Sleep Button [SLPB]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Lid Switch [LID0]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Power Button [PWRF]
May 30 16:56:28 user-Aspire-E5-574 kernel: (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
May 30 16:56:28 user-Aspire-E5-574 kernel: thermal LNXTHERM:00: registered as thermal_zone0
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Thermal Zone [TZ01] (38 C)
May 30 16:56:28 user-Aspire-E5-574 kernel: GHES: HEST is not enabled!
May 30 16:56:28 user-Aspire-E5-574 kernel: Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Battery Slot [BAT1] (battery present)
May 30 16:56:28 user-Aspire-E5-574 kernel: Linux agpgart interface v0.103
May 30 16:56:28 user-Aspire-E5-574 kernel: loop: module loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: libphy: Fixed MDIO Bus: probed
May 30 16:56:28 user-Aspire-E5-574 kernel: tun: Universal TUN/TAP device driver, 1.6
May 30 16:56:28 user-Aspire-E5-574 kernel: tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
May 30 16:56:28 user-Aspire-E5-574 kernel: PPP generic driver version 2.4.2
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci-pci: EHCI PCI platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci-platform: EHCI generic platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci-pci: OHCI PCI platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci-platform: OHCI generic platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: uhci_hcd: USB Universal Host Controller Interface driver
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00109810
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: Product: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: SerialNumber: 0000:00:14.0
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 1-0:1.0: USB hub found
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 1-0:1.0: 12 ports detected
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: Product: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: SerialNumber: 0000:00:14.0
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 2-0:1.0: USB hub found
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 2-0:1.0: 6 ports detected
May 30 16:56:28 user-Aspire-E5-574 kernel: i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
May 30 16:56:28 user-Aspire-E5-574 kernel: i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
May 30 16:56:28 user-Aspire-E5-574 kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
May 30 16:56:28 user-Aspire-E5-574 kernel: mousedev: PS/2 mouse device common for all mice
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: RTC can wake from S4
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
May 30 16:56:28 user-Aspire-E5-574 kernel: i2c /dev entries driver
May 30 16:56:28 user-Aspire-E5-574 kernel: device-mapper: uevent: version 1.0.3
May 30 16:56:28 user-Aspire-E5-574 kernel: device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_pstate: Intel P-state driver initializing
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_pstate: HWP enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ledtrig-cpu: registered to indicate activity on CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 10
May 30 16:56:28 user-Aspire-E5-574 kernel: Segment Routing with IPv6
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 17
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type dns_resolver registered
May 30 16:56:28 user-Aspire-E5-574 kernel: microcode: sig=0x406e3, pf=0x80, revision=0x33
May 30 16:56:28 user-Aspire-E5-574 kernel: microcode: Microcode Update Driver: v2.2.
May 30 16:56:28 user-Aspire-E5-574 kernel: registered taskstats version 1
May 30 16:56:28 user-Aspire-E5-574 kernel: Loading compiled-in X.509 certificates
May 30 16:56:28 user-Aspire-E5-574 kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
May 30 16:56:28 user-Aspire-E5-574 kernel: Loaded X.509 cert 'Build time autogenerated kernel key: 9b4fdbf663ae6c34cad42981a5d67e8ef42b1abf'
May 30 16:56:28 user-Aspire-E5-574 kernel: zswap: loaded using pool lzo/zbud
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type big_key registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type trusted registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type encrypted registered
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor sha1 policy hashing enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ima: No TPM chip found, activating TPM-bypass! (rc=-19)
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: HMAC attrs: 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel:   Magic number: 1:263:954
May 30 16:56:28 user-Aspire-E5-574 kernel: memory memory7: hash matches
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: setting system clock to 2017-05-30 20:56:23 UTC (1496177783)
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
May 30 16:56:28 user-Aspire-E5-574 kernel: EDD information not available.
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Hibernation image not present or could not be loaded.
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 2224K
May 30 16:56:28 user-Aspire-E5-574 kernel: Write protecting the kernel read-only data: 14336k
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 1192K
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 264K
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: FUJITSU Extended Socket Network Device Driver - version 1.2 - Copyright (c) 2015 FUJITSU LIMITED
May 30 16:56:28 user-Aspire-E5-574 kernel: wmi: Mapper loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: hidraw: raw HID events driver (C) Jiri Kosina
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: version 3.0
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio slum part deso sadm sds apst 
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi host0: ahci
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 eth0: RTL8168h/8111h at 0xffffb69280c99000, 2c:60:0c:ff:58:7a, XID 14100800 IRQ 126
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi host1: ahci
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d100 irq 125
May 30 16:56:28 user-Aspire-E5-574 kernel: ata2: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d180 irq 125
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Memory usable by graphics device = 4096M
May 30 16:56:28 user-Aspire-E5-574 kernel: checking generic (90000000 410000) vs hw (90000000 10000000)
May 30 16:56:28 user-Aspire-E5-574 kernel: fb: switching to inteldrmfb from VESA VGA
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour dummy device 80x25
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Replacing VGA console driver
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Driver supports precise vblank timestamp query.
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 enp1s0: renamed from eth0
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Finished loading i915/skl_dmc_ver1_26.bin (v1.26)
May 30 16:56:28 user-Aspire-E5-574 kernel: i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] GuC firmware load skipped
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Initialized i915 1.6.0 20161121 for 0000:00:02.0 on minor 0
May 30 16:56:28 user-Aspire-E5-574 kernel: fbcon: inteldrmfb (fb0) is primary device
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour frame buffer device 170x48
May 30 16:56:28 user-Aspire-E5-574 kernel: i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: new full-speed USB device number 2 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: ata2: SATA link down (SStatus 4 SControl 300)
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: ATA-9: WDC WD10JPVX-22JC3T0, 01.01A01, max UDMA/133
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: configured for UDMA/133
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi 0:0:0:0: Direct-Access     ATA      WDC WD10JPVX-22J 1A01 PQ: 0 ANSI: 5
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] 4096-byte physical blocks
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Write Protect is off
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: New USB device found, idVendor=04ca, idProduct=3015
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
May 30 16:56:28 user-Aspire-E5-574 kernel:  sda: sda1 sda2 < sda5 >
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Attached SCSI disk
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: new high-speed USB device number 3 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: New USB device found, idVendor=04f2, idProduct=b526
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: Product: HD WebCam
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: Manufacturer: SunplusIT INC.
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: new high-speed USB device number 4 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: Switched to clocksource tsc
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: New USB device found, idVendor=0bda, idProduct=0129
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=3
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: Product: USB2.0-CRW
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: Manufacturer: Generic
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: SerialNumber: 20100201396000000
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver rtsx_usb
May 30 16:56:28 user-Aspire-E5-574 kernel: random: fast init done
May 30 16:56:28 user-Aspire-E5-574 kernel: EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] RC6 on
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: systemd 229 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Detected architecture x86-64.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Set hostname to <user-Aspire-E5-574>.
May 30 16:56:28 user-Aspire-E5-574 kernel: random: crng init done
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Created slice System Slice.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on udev Control Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Reached target Encrypted Volumes.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on fsck to fsckd communication Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on Syslog Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Reached target Remote File Systems (Pre).
May 30 16:56:28 user-Aspire-E5-574 systemd-journald[312]: Journal started
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Started Create Static Device Nodes in /dev.
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Starting udev Kernel Device Manager...
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Started Nameserver information manager.
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Reached target Network (Pre).
May 30 16:56:29 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'lp'
May 30 16:56:29 user-Aspire-E5-574 kernel: lp: driver loaded but no devices found
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.photos.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/epiphany.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.audience.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.noise.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/midori.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/var/spool/cups/tmp/cups-dbus-notifier-lockfile: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/lib/modprobe.d/blacklist_linux-hwe_4.8.0-52-generic.conf: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/pygtk.pth: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/_dbus_bindings.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/sbin/wicd: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/bin/wicd-gtk: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/pygtk.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/_dbus_glib_bindings.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'ppdev'
May 30 16:56:30 user-Aspire-E5-574 kernel: ppdev: user-space parallel port driver
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_compat.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_compat.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_expat_introspect_parser.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_version.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_dbus.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_version.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/bus.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/exceptions.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/exceptions.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/types.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/service.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/decorators.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/types.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_dbus.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/bus.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/connection.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/connection.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/lowlevel.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/lowlevel.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/proxies.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/proxies.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_expat_introspect_parser.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/service.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/decorators.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/glib.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/glib.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/_gio.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/unix.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pango.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/atk.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pangocairo.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/_gobject.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/constants.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/constants.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/propertyhelper.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/propertyhelper.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/applications/wicd.desktop: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/cairo/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/cairo/_cairo.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/_glib.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/option.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/option.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/_gtk.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/_lazyutils.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/deprecation.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pynotify/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pynotify/_pynotify.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/backend.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/configmanager.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/dbusmanager.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/logfile.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wpath.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/misc.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/networking.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wpath.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/networking.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/misc.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/translations.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/translations.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wnettools.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/locale/en/LC_MESSAGES/wicd.mo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/backend.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wnettools.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/logfile.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/configmanager.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/dbusmanager.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/backends/be-external.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/backends/be-external.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/daemon/wicd-daemon.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/daemon/monitor.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/wicd-client.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/gui.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/netentry.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/prefs.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/guiutil.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/icons/hicolor/22x22/status/no-signal.png: No such file or directory
May 30 16:56:35 user-Aspire-E5-574 loadkeys[310]: Loading /etc/console-setup/cached.kmap.gz
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Set console keymap.
May 30 16:56:35 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'parport_pc'
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load Kernel Modules.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Apply Kernel Variables...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Mounting FUSE Control File System...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Mounted FUSE Control File System.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Apply Kernel Variables.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started udev Kernel Device Manager.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Remount Root and Kernel File Systems...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Remount Root and Kernel File Systems.
May 30 16:56:35 user-Aspire-E5-574 kernel: EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save Random Seed...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting udev Coldplug all Devices...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Reached target Local File Systems (Pre).
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Flush Journal to Persistent Storage...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Reached target Local File Systems.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Set console font and keymap...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting LSB: AppArmor initialization...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load/Save Random Seed.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started udev Coldplug all Devices.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Show Plymouth Boot Screen...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 kernel: (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Created slice system-systemd\x2dbacklight.slice.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save Screen Backlight Brightness of backlight:intel_backlight...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load/Save Screen Backlight Brightness of backlight:intel_backlight.
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: Core ver 2.22
May 30 16:56:35 user-Aspire-E5-574 kernel: NET: Registered protocol family 31
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: HCI device and connection manager initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: HCI socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: L2CAP socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: SCO socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: usbcore: registered new interface driver btusb
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Flush Journal to Persistent Storage.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Create Volatile Files and Directories...
May 30 16:56:35 user-Aspire-E5-574 systemd-tmpfiles[449]: [/usr/lib/tmpfiles.d/var.conf:14] Duplicate line for path "/var/log", ignoring.
May 30 16:56:35 user-Aspire-E5-574 kernel: intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain package 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain dram 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain psys 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: idma64 idma64.0: Found Intel integrated DMA 64-bit
May 30 16:56:35 user-Aspire-E5-574 kernel: mei_me 0000:00:16.0: enabling device (0000 -> 0002)
May 30 16:56:35 user-Aspire-E5-574 kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
May 30 16:56:35 user-Aspire-E5-574 kernel: AVX2 version of gcm_enc/dec engaged.
May 30 16:56:35 user-Aspire-E5-574 kernel: AES CTR mode by8 optimization enabled
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Show Plymouth Boot Screen.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Forward Password Requests to Plymouth Directory Watch.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save RF Kill Switch Status...
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain package
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain core
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain uncore
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain dram
May 30 16:56:35 user-Aspire-E5-574 kernel: snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Acer Laptop ACPI-WMI Extras
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Function bitmap for Communication Button: 0x801
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Enabling Launch Manager failed: 0xe4 - 0x0
May 30 16:56:35 user-Aspire-E5-574 kernel: input: Acer WMI hotkeys as /devices/virtual/input/input6
May 30 16:56:35 user-Aspire-E5-574 kernel: input: Acer BMA150 accelerometer as /devices/virtual/input/input7
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Load/Save RF Kill Switch Status.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Set console font and keymap.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Create Volatile Files and Directories.
May 30 16:56:36 user-Aspire-E5-574 kernel: input: SYN1B81:01 06CB:7406 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-5/i2c-SYN1B81:01/0018:06CB:7406.0001/input/input9
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Created slice system-getty.slice.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Update UTMP about System Boot/Shutdown...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:36 user-Aspire-E5-574 kernel: hid-multitouch 0018:06CB:7406.0001: input,hidraw0: I2C HID v1.00 Mouse [SYN1B81:01 06CB:7406] on i2c-SYN1B81:01
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    inputs:
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:      Mic=0x12
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[435]: checking bus 1, device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8"
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[433]: checking bus 1, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-7"
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[433]: bus: 1, device: 3 was not an MTP device
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[435]: bus: 1, device: 4 was not an MTP device
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Network Time Synchronization...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Network Time Synchronization.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Reached target System Time Synchronized.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Reached target Sound Card.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]:  * Starting AppArmor profiles
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]: Skipping profile in /etc/apparmor.d/disable: usr.bin.firefox
May 30 16:56:36 user-Aspire-E5-574 audit[688]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=688 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.465:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=688 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[684]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[684]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]: Skipping profile in /etc/apparmor.d/disable: usr.sbin.rsyslogd
May 30 16:56:36 user-Aspire-E5-574 audit[692]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=692 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd//third_party" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[690]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/ippusbxd" pid=690 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=692 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-previewer" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-previewer//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-thumbnailer" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-thumbnailer//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]:    ...done.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started LSB: AppArmor initialization.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Raise network interfaces...
May 30 16:56:36 user-Aspire-E5-574 kernel: media: Linux media interface: v0.10
May 30 16:56:36 user-Aspire-E5-574 kernel: Linux video capture interface: v2.00
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Update UTMP about System Boot/Shutdown.
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: loading out-of-tree module taints kernel.
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: module license 'MIXED/Proprietary' taints kernel.
May 30 16:56:36 user-Aspire-E5-574 kernel: Disabling lock debugging due to kernel taint
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: module verification failed: signature and/or required key missing - tainting kernel
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 11ad:0806
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Raise network interfaces.
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 93da0176
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo: Found UVC 1.00 device HD WebCam (04f2:b526)
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Extension 4 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Extension 3 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Processing 2 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Camera 1 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: input: HD WebCam as /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/input/input18
May 30 16:56:37 user-Aspire-E5-574 kernel: usbcore: registered new interface driver uvcvideo
May 30 16:56:37 user-Aspire-E5-574 kernel: USB Video Class driver (1.1.1)
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Found device WDC_WD10JPVX-22JC3T0 5.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Activating swap /dev/disk/by-uuid/ed851cfe-c339-42a0-809a-7675c6df2640...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Activated swap /dev/disk/by-uuid/ed851cfe-c339-42a0-809a-7675c6df2640.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Swap.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target System Initialization.
May 30 16:56:37 user-Aspire-E5-574 kernel: Adding 8251388k swap on /dev/sda5.  Priority:-1 extents:1 across:8251388k FS
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on UUID daemon activation socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started ACPI Events Check.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Paths.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on ACPID Listen Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: apt-daily.timer: Adding 8h 17min 42.036508s random time.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Daily apt activities.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Daily Cleanup of Temporary Directories.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Timers.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on D-Bus System Message Bus Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Sockets.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Basic System.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Speech Dispatcher...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Detect the available GPUs and deal with any system changes...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: automatic crash report generation...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: daemon to balance interrupts for SMP systems...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started D-Bus System Message Bus.
May 30 16:56:37 user-Aspire-E5-574 dbus-daemon[761]: Unknown username "geoclue" in message bus configuration file
May 30 16:56:37 user-Aspire-E5-574 dbus[761]: [system] AppArmor D-Bus mediation is enabled
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Network Manager...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Restore /etc/resolv.conf if the system crashed before the ppp link was shut down...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Save/Restore Sound Card State...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started ACPI event daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Modem Manager...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting IIO Sensor Proxy service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Accounts Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Bluetooth service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Record successful boot for GRUB...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Set the CPU Frequency Scaling governor to "ondemand"...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Thermal Daemon Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Login Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Permit User Sessions...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started crash report submission daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Regular background program processing daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Starts and stops Wicd...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting System Logging Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Restore /etc/resolv.conf if the system crashed before the ppp link was shut down.
May 30 16:56:37 user-Aspire-E5-574 cron[796]: (CRON) INFO (pidfile fd = 3)
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Permit User Sessions.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Starts and stops Wicd.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Save/Restore Sound Card State.
May 30 16:56:37 user-Aspire-E5-574 speech-dispatcher[757]:  * speech-dispatcher disabled; edit /etc/default/speech-dispatcher
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Speech Dispatcher.
May 30 16:56:37 user-Aspire-E5-574 irqbalance[760]:  * Starting SMP IRQ Balancer: irqbalance
May 30 16:56:37 user-Aspire-E5-574 apport[759]:  * Starting automatic crash report generation: apport
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Set the CPU Frequency Scaling governor to "ondemand".
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: New seat seat0.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Login Service.
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event3 (Power Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event5 (Video Bus)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event0 (Power Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event2 (Lid Switch)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event1 (Sleep Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event6 (Acer WMI hotkeys)
May 30 16:56:37 user-Aspire-E5-574 cron[796]: (CRON) INFO (Running @reboot jobs)
May 30 16:56:37 user-Aspire-E5-574 apport[759]:    ...done.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: automatic crash report generation.
May 30 16:56:37 user-Aspire-E5-574 acpid[777]: starting up with netlink and the input layer
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Found user 'avahi' (UID 110) and group 'avahi' (GID 119).
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully dropped root privileges.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: avahi-daemon 0.6.32-rc starting up.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Avahi mDNS/DNS-SD Stack.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully called chroot().
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully dropped remaining capabilities.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Make remote CUPS printers available locally.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: No service file found in /etc/avahi/services.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started System Logging Service.
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: Error: can't open /lib/modules/4.10.0-14-generic/updates/dkms
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: Error: can't open /lib/modules/4.10.0-14-generic/updates/dkms
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: update-alternatives: error: no alternatives for x86_64-linux-gnu_gfxcore_conf
May 30 16:56:38 user-Aspire-E5-574 avahi-daemon[792]: Network interface enumeration completed.
May 30 16:56:38 user-Aspire-E5-574 avahi-daemon[792]: Server startup complete. Host name is user-Aspire-E5-574.local. Local service cookie is 1551720669.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Detect the available GPUs and deal with any system changes.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Light Display Manager...
May 30 16:56:38 user-Aspire-E5-574 acpid[777]: 9 rules loaded
May 30 16:56:38 user-Aspire-E5-574 acpid[777]: waiting for events: event logging is off
May 30 16:56:38 user-Aspire-E5-574 irqbalance[760]:    ...done.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started LSB: daemon to balance interrupts for SMP systems.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Bluetooth daemon 5.37
May 30 16:56:38 user-Aspire-E5-574 ModemManager[779]: <info>  ModemManager (version 1.4.12) starting in system bus...
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Bluetooth service.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Starting SDP server
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Reached target Bluetooth.
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP filters: protocol multicast
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP socket layer initialized
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service'
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Bluetooth management interface 1.14 initialized
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Failed to obtain handles for "Service Changed" characteristic
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Error adding Link Loss service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Current Time Service could not be registered
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: gatt-time-server: Input/output error (5)
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Sap driver initialization failed.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: sap-server: Operation not permitted (1)
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Hostname Service...
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.hostname1'
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Hostname Service.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started IIO Sensor Proxy service.
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.PolicyKit1' unit='polkitd.service'
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Authenticate and Authorize Users to Run Privileged Tasks...
May 30 16:56:38 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: EEPROM regdomain: 0x6c
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: EEPROM indicates we should expect a direct regpair map
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: Country alpha2 being used: 00
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: Regpair used: 0x6c
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started LSB: Record successful boot for GRUB.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Thermal Daemon Service.
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: 22 CPUID levels; family:model:stepping 0x6:4e:3 (6:78:3)
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: Polling mode is enabled: 4
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: sysfs read failed constraint_0_max_power_uw
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: sysfs read failed max_brightness
May 30 16:56:39 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Received SIGRTMIN+21 from PID 242 (plymouthd).
May 30 16:56:39 user-Aspire-E5-574 polkitd[875]: started daemon version 0.105 using authority implementation `local' version `0.105'
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.PolicyKit1'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Authenticate and Authorize Users to Run Privileged Tasks.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Light Display Manager.
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] Using lock path: /var/lock/whoopsie/lock
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] Could not get the Network Manager state:
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.NetworkManager was not provided by any .service files
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Modem Manager.
May 30 16:56:39 user-Aspire-E5-574 accounts-daemon[781]: started daemon version 0.6.40
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Accounts Service.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7791] NetworkManager (version 1.2.6) is starting...
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7791] Read config: /etc/NetworkManager/NetworkManager.conf (etc: default-wifi-powersave-on.conf)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7864] manager[0x269c200]: monitoring kernel firmware directory '/lib/firmware'.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7865] monitoring ifupdown state file '/run/network/ifstate'.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7882] dns-mgr[0x2695150]: init: dns=dnsmasq, rc-manager=resolvconf, plugin=dnsmasq
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.8022] rfkill3: found WiFi radio killswitch (at /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/ieee80211/phy0/rfkill3) (driver ath10k_pci)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.8023] rfkill1: found WiFi radio killswitch (at /sys/devices/platform/acer-wmi/rfkill/rfkill1) (platform driver acer-wmi)
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Network Manager.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Network.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting /etc/rc.local Compatibility...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Unattended Upgrades Shutdown.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting OpenVPN service...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started /etc/rc.local Compatibility.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started OpenVPN service.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Hold until boot process finishes up...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Hold until boot process finishes up.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Getty on tty1.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Login Prompts.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Multi-User System.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Graphical Interface.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Update UTMP about System Runlevel Changes...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Stop ureadahead data collection 45s after completed startup.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Set console scheme...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Update UTMP about System Runlevel Changes.
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Network Manager Script Dispatcher Service...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Set console scheme.
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Network Manager Script Dispatcher Service.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Startup finished in 3.739s (kernel) + 13.713s (userspace) = 17.452s.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9911] init!
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9912]       interface-parser: parsing file /etc/network/interfaces
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9913]       interface-parser: finished parsing file /etc/network/interfaces
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9913] management mode: unmanaged
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9917] devices added (path: /sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/net/enp1s0, iface: enp1s0)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9917] device added (path: /sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/net/enp1s0, iface: enp1s0): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] devices added (path: /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/net/wlp2s0, iface: wlp2s0)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] device added (path: /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/net/wlp2s0, iface: wlp2s0): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] devices added (path: /sys/devices/virtual/net/lo, iface: lo)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] device added (path: /sys/devices/virtual/net/lo, iface: lo): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] end _init.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] settings: loaded plugin ifupdown: (C) 2008 Canonical Ltd.  To report bugs please use the NetworkManager mailing list. (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-settings-plugin-ifupdown.so)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9919] settings: loaded plugin keyfile: (c) 2007 - 2015 Red Hat, Inc.  To report bugs please use the NetworkManager mailing list.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9921] SettingsPlugin-Ofono: init!
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <warn>  [1496177799.9921] SettingsPlugin-Ofono: file doesn't exist: /var/lib/ofono
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] SettingsPlugin-Ofono: end _init.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] settings: loaded plugin ofono: (C) 2013-2016 Canonical Ltd.  To report bugs please use the NetworkManager mailing list. (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-settings-plugin-ofono.so)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] (40678304) ... get_connections.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] (40678304) ... get_connections (managed=false): return empty list.
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.1914] keyfile: new connection /etc/NetworkManager/system-connections/eduroam 2 (13f1e190-46da-49cd-8556-c690ea729ba1,"eduroam 2")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2010] keyfile: new connection /etc/NetworkManager/system-connections/eduroam 1 (69427423-4838-4c4a-bb60-a799b55ce7be,"eduroam 1")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2105] keyfile: new connection /etc/NetworkManager/system-connections/BELL119 (2c505b60-49da-4418-ac1c-f1ec15f9e21c,"BELL119")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2199] keyfile: new connection /etc/NetworkManager/system-connections/CottageLife (bc88a399-ea61-4910-8a1d-f38e4671ed25,"CottageLife")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2296] keyfile: new connection /etc/NetworkManager/system-connections/THE DUCK POND (263af686-5308-46f1-80bc-6d5981b10d80,"THE DUCK POND")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2393] keyfile: new connection /etc/NetworkManager/system-connections/eduroam (213ec9ef-0a49-428a-a367-0b9ab9ebdd3f,"eduroam")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2487] keyfile: new connection /etc/NetworkManager/system-connections/SM-G920W89738 (b840d057-a69a-4fa8-90a1-33d44cf4e790,"SM-G920W89738")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2582] keyfile: new connection /etc/NetworkManager/system-connections/uOttawa (e66e1e51-57f3-47ae-990d-13ae3137f3f3,"uOttawa")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2675] keyfile: new connection /etc/NetworkManager/system-connections/TallPenguin-guest (c04505f7-13ed-4635-bfbe-3b5a67cb4bb7,"TallPenguin-guest")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] SettingsPlugin-Ofono: (40678528) ... get_connections.
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] SettingsPlugin-Ofono: (40678528) connections count: 0
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] get unmanaged devices count: 0
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2704] settings: hostname: using hostnamed
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2705] settings: hostname changed from (none) to "user-Aspire-E5-574"
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2706] Using DHCP client 'dhclient'
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2706] manager: WiFi enabled by radio killswitch; enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2707] manager: WWAN enabled by radio killswitch; enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2708] manager: Networking is enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVxlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 nm-dispatcher[927]: req:1 'hostname': new request (2 scripts)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 nm-dispatcher[927]: req:1 'hostname': start running ordered scripts...
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVethFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMTunFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMMacvlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMIPTunnelFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMInfinibandFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMEthernetFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMBridgeFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMBondFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2847] Loaded device plugin: NMBluezManager (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-bluetooth.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2850] Loaded device plugin: NMWwanFactory (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-wwan.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2853] Loaded device plugin: NMAtmManager (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-adsl.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2856] Loaded device plugin: NMWifiFactory (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-wifi.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3042] manager: (enp1s0): new Ethernet device (/org/freedesktop/NetworkManager/Devices/0)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3050] keyfile: add connection in-memory (c242874a-290f-326a-bf74-d66f731c8920,"Wired connection 1")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3054] settings: (enp1s0): created default wired connection 'Wired connection 1'
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3063] device (enp1s0): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: nm_device_get_device_type: assertion 'NM_IS_DEVICE (self)' failed
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4138] device (lo): link connected
May 30 16:56:40 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 enp1s0: link down
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4143] manager: (lo): new Generic device (/org/freedesktop/NetworkManager/Devices/1)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4147] (wlp2s0): using nl80211 for WiFi device control
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4370] device (wlp2s0): driver supports Access Point (AP) mode
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4377] manager: (wlp2s0): new 802.11 WiFi device (/org/freedesktop/NetworkManager/Devices/2)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4387] device (wlp2s0): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00002001/00002000
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM adding faulty module: pam_kwallet.so
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM adding faulty module: pam_kwallet5.so
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: pam_unix(lightdm-greeter:session): session opened for user lightdm by (uid=0)
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Created slice User Slice of lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Starting User Manager for UID 108...
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Started Session c1 of user lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: pam_unix(systemd-user:session): session opened for user lightdm by (uid=0)
May 30 16:56:41 user-Aspire-E5-574 systemd-logind[788]: New session c1 of user lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Paths.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Timers.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Sockets.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Basic System.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Default.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Startup finished in 26ms.
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Started User Manager for UID 108.
May 30 16:56:41 user-Aspire-E5-574 ModemManager[779]: <info>  Couldn't find support for device at '/sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0': not supported by any plugin
May 30 16:56:41 user-Aspire-E5-574 ModemManager[779]: <info>  Couldn't find support for device at '/sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0': not supported by any plugin
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: Activating service name='org.a11y.atspi.Registry'
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: ** (process:964): WARNING **: Failed to register client: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.gnome.SessionManager was not provided by any .service files
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: Successfully activated service 'org.a11y.atspi.Registry'
May 30 16:56:42 user-Aspire-E5-574 org.a11y.atspi.Registry[976]: SpiRegistry daemon is running with well-known name - org.a11y.atspi.Registry
May 30 16:56:42 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:42 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='fi.w1.wpa_supplicant1' unit='wpa_supplicant.service'
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3785] urfkill disappeared from the bus
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3794] bluez: use BlueZ version 5
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3796] ofono is now available
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3800] ModemManager available in the bus
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <warn>  [1496177802.3802] failed to enumerate oFono devices: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.ofono was not provided by any .service files
May 30 16:56:42 user-Aspire-E5-574 systemd[1]: Starting WPA supplicant...
May 30 16:56:42 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'fi.w1.wpa_supplicant1'
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: Successfully initialized wpa_supplicant
May 30 16:56:42 user-Aspire-E5-574 systemd[1]: Started WPA supplicant.
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.5239] supplicant: wpa_supplicant running
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.5239] device (wlp2s0): supplicant interface state: init -> starting
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: dbus: wpa_dbus_get_object_properties: failed to get object properties: (none) none
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: dbus: Failed to construct signal
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: Could not read interface p2p-dev-wlp2s0 flags: No such device
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.6181] device (wlp2s0): supplicant interface state: starting -> ready
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.6182] device (wlp2s0): state change: unavailable -> disconnected (reason 'supplicant-available') [20 30 42]
May 30 16:56:42 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:43 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.UPower' unit='upower.service'
May 30 16:56:43 user-Aspire-E5-574 systemd[1]: Starting Daemon for power management...
May 30 16:56:44 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.UPower'
May 30 16:56:44 user-Aspire-E5-574 systemd[1]: Started Daemon for power management.
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM adding faulty module: pam_kwallet.so
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM adding faulty module: pam_kwallet5.so
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: pam_succeed_if(lightdm:auth): requirement "user ingroup nopasswdlogin" not met by user "user"
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.UDisks2' unit='udisks2.service'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting Disk Manager...
May 30 16:56:45 user-Aspire-E5-574 udisksd[1035]: udisks daemon version 2.1.7 starting
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.UDisks2'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Started Disk Manager.
May 30 16:56:45 user-Aspire-E5-574 udisksd[1035]: Acquired the name org.freedesktop.UDisks2 on the system message bus
May 30 16:56:45 user-Aspire-E5-574 org.gtk.vfs.AfcVolumeMonitor[961]: Volume monitor alive
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.ColorManager' unit='colord.service'
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.PackageKit' unit='packagekit.service'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting Manage, Install and Generate Color Profiles...
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting PackageKit Daemon...
May 30 16:56:45 user-Aspire-E5-574 PackageKit[1064]: daemon start
May 30 16:56:46 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.ColorManager'
May 30 16:56:46 user-Aspire-E5-574 systemd[1]: Started Manage, Install and Generate Color Profiles.
May 30 16:56:46 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.PackageKit'
May 30 16:56:46 user-Aspire-E5-574 systemd[1]: Started PackageKit Daemon.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2758] manager: startup complete
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2785] device (wlp2s0): supplicant interface state: ready -> inactive
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2789] policy: auto-activating connection 'CottageLife'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2829] device (wlp2s0): Activation: starting connection 'CottageLife' (bc88a399-ea61-4910-8a1d-f38e4671ed25)
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2831] device (wlp2s0): state change: disconnected -> prepare (reason 'none') [30 40 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2832] manager: NetworkManager state is now CONNECTING
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2840] device (wlp2s0): state change: prepare -> config (reason 'none') [40 50 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2842] device (wlp2s0): Activation: (wifi) access point 'CottageLife' has security, but secrets are required.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2842] device (wlp2s0): state change: config -> need-auth (reason 'none') [50 60 0]
May 30 16:56:47 user-Aspire-E5-574 whoopsie[793]: [16:56:47] offline
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2904] device (wlp2s0): state change: need-auth -> prepare (reason 'none') [60 40 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3063] device (wlp2s0): state change: prepare -> config (reason 'none') [40 50 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3065] device (wlp2s0): Activation: (wifi) connection 'CottageLife' has security, and secrets exist.  No new secrets needed.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'ssid' value 'CottageLife'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'scan_ssid' value '1'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'key_mgmt' value 'WPA-PSK'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'auth_alg' value 'OPEN'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'psk' value '<omitted>'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3071] sup-iface[0x271f140,wlp2s0]: config: set interface ap_scan to 1
May 30 16:56:50 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177810.5717] manager: WiFi hardware radio set enabled
May 30 16:56:50 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177810.5717] manager: WWAN hardware radio set enabled
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: SME: Trying to authenticate with c8:d3:a3:57:a9:3a (SSID='CottageLife' freq=2412 MHz)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: authenticate with c8:d3:a3:57:a9:3a
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9656] device (wlp2s0): supplicant interface state: inactive -> authenticating
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: send auth to c8:d3:a3:57:a9:3a (try 1/3)
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: Trying to associate with c8:d3:a3:57:a9:3a (SSID='CottageLife' freq=2412 MHz)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: authenticated
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: associate with c8:d3:a3:57:a9:3a (try 1/3)
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9767] device (wlp2s0): supplicant interface state: authenticating -> associating
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: Associated with c8:d3:a3:57:a9:3a
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: RX AssocResp from c8:d3:a3:57:a9:3a (capab=0x431 status=0 aid=4)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: associated
May 30 16:56:51 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: p2p-dev-wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=COUNTRY_IE type=COUNTRY alpha2=US
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: EEPROM regdomain: 0x8348
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: EEPROM indicates we should expect a country code
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: doing EEPROM country->regdmn map search
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: country maps to regdmn code: 0x3a
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: Country alpha2 being used: US
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: Regpair used: 0x3a
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: regdomain 0x8348 dynamically updated by country IE
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9861] device (wlp2s0): supplicant interface state: associating -> associated
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9939] device (wlp2s0): supplicant interface state: associated -> 4-way handshake
May 30 16:56:52 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: WPA: Key negotiation completed with c8:d3:a3:57:a9:3a [PTK=CCMP GTK=CCMP]
May 30 16:56:52 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: CTRL-EVENT-CONNECTED - Connection to c8:d3:a3:57:a9:3a completed [id=0 id_str=]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0715] device (wlp2s0): supplicant interface state: 4-way handshake -> completed
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0716] device (wlp2s0): Activation: (wifi) Stage 2 of 5 (Device Configure) successful.  Connected to wireless network 'CottageLife'.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0716] device (wlp2s0): state change: config -> ip-config (reason 'none') [50 70 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0840] dhcp4 (wlp2s0): activation: beginning transaction (timeout in 45 seconds)
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.1122] dhcp4 (wlp2s0): dhclient started with pid 1091
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: DHCPREQUEST of 192.168.0.104 on wlp2s0 to 255.255.255.255 port 67 (xid=0x6e71c271)
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: DHCPACK of 192.168.0.104 from 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3641]   address 192.168.0.104
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3641]   plen 24 (255.255.255.0)
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   gateway 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   server identifier 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   lease time 86400
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   nameserver '192.168.0.1'
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642] dhcp4 (wlp2s0): state changed unknown -> bound
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: Joining mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: New relevant interface wlp2s0.IPv4 for mDNS.
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: Registering new address record for 192.168.0.104 on wlp2s0.IPv4.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3654] device (wlp2s0): state change: ip-config -> ip-check (reason 'none') [70 80 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3659] device (wlp2s0): state change: ip-check -> secondaries (reason 'none') [80 90 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3662] device (wlp2s0): state change: secondaries -> activated (reason 'none') [90 100 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3663] manager: NetworkManager state is now CONNECTED_LOCAL
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: bound to 192.168.0.104 -- renewal in 35092 seconds.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4960] manager: NetworkManager state is now CONNECTED_GLOBAL
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4961] policy: set 'CottageLife' (wlp2s0) as default for IPv4 routing and DNS
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4962] dns-plugin[0x26adce0]: starting dnsmasq...
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Cannot reach: https://daisy.ubuntu.com
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.5309] dns-mgr: Writing DNS information to /sbin/resolvconf
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: started, version 2.75 cache disabled
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: compile time options: IPv6 GNU-getopt DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack ipset auth DNSSEC loop-detect inotify
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: DBus support enabled: connected to system bus
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: warning: no upstream servers configured
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.8299] device (wlp2s0): Activation: successful, device activated.
May 30 16:56:52 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
May 30 16:56:52 user-Aspire-E5-574 systemd[1]: Starting Network Manager Script Dispatcher Service...
May 30 16:56:52 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
May 30 16:56:52 user-Aspire-E5-574 systemd[1]: Started Network Manager Script Dispatcher Service.
May 30 16:56:52 user-Aspire-E5-574 nm-dispatcher[1140]: req:1 'up' [wlp2s0]: new request (2 scripts)
May 30 16:56:52 user-Aspire-E5-574 nm-dispatcher[1140]: req:1 'up' [wlp2s0]: start running ordered scripts...
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.8438] dnsmasq[0x26adce0]: dnsmasq appeared as :1.40
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: setting upstream servers from DBus
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] The default IPv4 route is: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: using nameserver 192.168.0.1#53(via wlp2s0)
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Not a paid data plan: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Found usable connection: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Joining mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: New relevant interface wlp2s0.IPv6 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Registering new address record for fe80::1adf:41d2:b6ce:4ebf on wlp2s0.*.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Got SIGTERM, quitting.
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Stopping Avahi mDNS/DNS-SD Stack...
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Leaving mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Leaving mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: avahi-daemon 0.6.32-rc exiting.
May 30 16:56:53 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.Avahi' unit='dbus-org.freedesktop.Avahi.service'
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Stopped Avahi mDNS/DNS-SD Stack.
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]: Warning: Stopping avahi-daemon.service, but it can still be activated by:
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]:   avahi-daemon.socket
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Process 792 died: No such process; trying to remove PID file. (/var/run/avahi-daemon//pid)
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Found user 'avahi' (UID 110) and group 'avahi' (GID 119).
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully dropped root privileges.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: avahi-daemon 0.6.32-rc starting up.
May 30 16:56:53 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.Avahi'
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Started Avahi mDNS/DNS-SD Stack.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully called chroot().
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully dropped remaining capabilities.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: No service file found in /etc/avahi/services.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Joining mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: New relevant interface wlp2s0.IPv6 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Joining mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: New relevant interface wlp2s0.IPv4 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Network interface enumeration completed.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Registering new address record for fe80::1adf:41d2:b6ce:4ebf on wlp2s0.*.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Registering new address record for 192.168.0.104 on wlp2s0.IPv4.
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: Avahi detected that your currently configured local DNS server serves
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: a domain .local. This is inherently incompatible with Avahi and thus
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: Avahi disabled itself. If you want to use Avahi in this network, please
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: contact your administrator and convince him to use a different DNS domain,
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: since .local should be used exclusively for Zeroconf technology.
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: For more information, see http://avahi.org/wiki/AvahiAndUnicastDotLocal
May 30 16:56:53 user-Aspire-E5-574 CapNetAssist[1244]: DetectCaptivePortal script triggered
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]: <15>May 30 16:56:53 CapNetAssist: DetectCaptivePortal script triggered
May 30 16:56:54 user-Aspire-E5-574 whoopsie[793]: [16:56:54] online
May 30 16:56:54 user-Aspire-E5-574 avahi-daemon[1192]: Server startup complete. Host name is user-Aspire-E5-574.local. Local service cookie is 594944426.
May 30 16:56:56 user-Aspire-E5-574 org.gtk.vfs.Daemon[961]: A connection to the bus can't be made
May 30 16:56:56 user-Aspire-E5-574 org.a11y.Bus[961]: No protocol specified
May 30 16:56:56 user-Aspire-E5-574 lightdm[945]: pam_unix(lightdm-greeter:session): session closed for user lightdm
May 30 16:56:56 user-Aspire-E5-574 lightdm[1028]: pam_unix(lightdm:session): session opened for user user by (uid=0)
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Created slice User Slice of user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Starting User Manager for UID 1000...
May 30 16:56:56 user-Aspire-E5-574 systemd-logind[788]: New session c2 of user user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: pam_unix(systemd-user:session): session opened for user user by (uid=0)
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Started Session c2 of user user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Timers.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Sockets.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Paths.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Basic System.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Default.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Startup finished in 9ms.
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Started User Manager for UID 1000.
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: ** (gnome-session-check-accelerated:1364): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-2Rqez5ypTX: Connection refused
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Error while executing session-migration: Failed to execute child process "session-migration" (No such file or directory)
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Error while executing session-migration: Failed to execute child process "session-migration" (No such file or directory)
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Could not parse desktop file gnome-user-share-pantheon.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Could not parse desktop file gnome-user-share-pantheon.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Could not parse desktop file wicd-tray.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Could not parse desktop file wicd-tray.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: ** (gnome-settings-daemon:1372): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-2Rqez5ypTX: Connection refused
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: org.gnome.settings-daemon.plugins.power manage-dpms-defaults is false.
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: Using settings found in org.pantheon.dpms (0 seconds = Never).
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Standby: 900 seconds
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Suspend: 0 seconds
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Off: 0 seconds
May 30 16:56:57 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service'
May 30 16:56:57 user-Aspire-E5-574 systemd[1]: Starting RealtimeKit Scheduling Policy Service...
May 30 16:56:57 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.RealtimeKit1'
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully called chroot.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully dropped privileges.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully limited resources.
May 30 16:56:57 user-Aspire-E5-574 systemd[1]: Started RealtimeKit Scheduling Policy Service.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Watchdog thread running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Canary thread running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1422 of process 1422 (n/a) owned by '1000' high priority at nice level -11.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 1 threads of 1 processes of 1 users.
May 30 16:56:57 user-Aspire-E5-574 org.gtk.vfs.AfcVolumeMonitor[1335]: Volume monitor alive
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 1 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1462 of process 1422 (n/a) owned by '1000' RT at priority 5.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 2 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 2 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1463 of process 1422 (n/a) owned by '1000' RT at priority 5.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 3 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 bluetoothd[783]: Endpoint registered: sender=:1.56 path=/MediaEndpoint/A2DPSource
May 30 16:56:58 user-Aspire-E5-574 bluetoothd[783]: Endpoint registered: sender=:1.56 path=/MediaEndpoint/A2DPSink
May 30 16:56:58 user-Aspire-E5-574 pulseaudio[1422]: [pulseaudio] backend-ofono.c: Failed to register as a handsfree audio agent with ofono: org.freedesktop.DBus.Error.ServiceUnknown: The name org.ofono was not provided by any .service files
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1465 of process 1465 (n/a) owned by '1000' high priority at nice level -11.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 4 threads of 2 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 pulseaudio[1465]: [pulseaudio] pid.c: Daemon already running.
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM TTY layer initialized
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM socket layer initialized
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM ver 1.11
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.locale1' unit='dbus-org.freedesktop.locale1.service'
May 30 16:56:58 user-Aspire-E5-574 systemd[1]: Starting Locale Service...
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.locale1'
May 30 16:56:58 user-Aspire-E5-574 systemd[1]: Started Locale Service.
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Trying to re-add keybinding "switch-to-workspace-last".
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Trying to re-add keybinding "move-to-workspace-last".
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: ** (gala:1473): WARNING **: Preferences.vala:192: '/usr/share/themes/elementary/plank/dock.theme' is read-only!
May 30 16:56:59 user-Aspire-E5-574 gnome-session-binary[1262]: Entering running state
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Activating service name='org.a11y.atspi.Registry'
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: initctl: UPSTART_SESSION isn't set in the environment. Unable to locate the Upstart instance.
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Successfully activated service 'org.a11y.atspi.Registry'
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: SpiRegistry daemon is running with well-known name - org.a11y.atspi.Registry
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: ** (at-spi2-registryd:1510): WARNING **: Failed to register client: GDBus.Error:org.gnome.SessionManager.AlreadyRegistered: Unable to register client
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: ** (at-spi2-registryd:1510): WARNING **: Unable to register client with session manager
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.pantheon.ParentalControls' unit='pantheon-parental-controls.service'
May 30 16:56:59 user-Aspire-E5-574 systemd[1]: Starting Pantheon Parental Controls Daemon...
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 pantheon-parental-controls-daemon[1525]: ** (pantheon-parental-controls-daemon:1525): CRITICAL **: pc_daemon_session_handler_get_id: assertion 'self != NULL' failed
May 30 16:56:59 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.pantheon.ParentalControls'
May 30 16:56:59 user-Aspire-E5-574 systemd[1]: Started Pantheon Parental Controls Daemon.
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 polkitd(authority=local)[875]: Registered Authentication Agent for unix-session:c2 (system bus name :1.66 [/usr/libexec/policykit-1-pantheon/pantheon-agent-polkit], object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8)
May 30 16:57:02 user-Aspire-E5-574 org.gnome.zeitgeist.Engine[1335]: [20:57:02.281690 WARNING] zeitgeist-daemon.vala:329: Failed to execute child process "zeitgeist-datahub" (No such file or directory)
May 30 16:57:02 user-Aspire-E5-574 org.gnome.evolution.dataserver.Sources5[1335]: (evolution-source-registry:1585): e-data-server-WARNING **: e_module_load_all_in_directory: Error opening directory '/usr/lib/evolution-data-server/credential-modules': No such file or directory
May 30 16:57:03 user-Aspire-E5-574 gnome-session[1262]: ** (gala:1473): WARNING **: Preferences.vala:192: '/usr/share/themes/elementary/plank/dock.theme' is read-only!
May 30 16:57:05 user-Aspire-E5-574 dbus[761]: [system] Rejected send message, 1 matched rules; type="method_call", sender=":1.61" (uid=1000 pid=1513 comm="wingpanel ") interface="org.freedesktop.DBus.Properties" member="GetAll" error name="(unset)" requested_reply="0" destination="org.freedesktop.DBus" (bus)
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: get-packages transaction /469_dddaecac from uid 1000 finished with success after 3279ms
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
May 30 16:57:08 user-Aspire-E5-574 systemd-timesyncd[636]: Synchronized to time server 91.189.89.198:123 (ntp.ubuntu.com).
May 30 16:57:16 user-Aspire-E5-574 org.gnome.zeitgeist.SimpleIndexer[1335]: ** (zeitgeist-fts:1603): WARNING **: Unable to get info on application://synapse.desktop
May 30 16:57:16 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Buggy client sent a _NET_ACTIVE_WINDOW message with a timestamp of 0 for 0x220000a (pantheon-t)
May 30 16:57:18 user-Aspire-E5-574 PackageKit[1064]: refresh-cache transaction /470_beccecaa from uid 1000 finished with success after 11108ms
May 30 16:57:21 user-Aspire-E5-574 PackageKit[1064]: get-updates transaction /471_ceababdb from uid 1000 finished with success after 2209ms
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Starting Stop ureadahead data collection...
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Stopped Read required files in advance.
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Started Stop ureadahead data collection.


----- End forwarded message -----

--mbkavmqd6oeumzo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="success_dmesg.txt"

[    0.000000] Linux version 4.10.0-14-generic (buildd@lgw01-10) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #16~16.04.1-Ubuntu SMP Fri Mar 17 17:28:20 UTC 2017 (Ubuntu 4.10.0-14.16~16.04.1-generic 4.10.3)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007834dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000007834e000-0x000000007834efff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000007834f000-0x0000000078378fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000078379000-0x0000000078427fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000078428000-0x0000000078d28fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000078d29000-0x0000000085c3dfff] usable
[    0.000000] BIOS-e820: [mem 0x0000000085c3e000-0x000000008662dfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000008662e000-0x0000000087fadfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000087fae000-0x0000000087ffdfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000087ffe000-0x0000000087ffefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000087fff000-0x00000000880fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000089000000-0x000000008c7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002727fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: Acer Aspire E5-574/Zoro_SL , BIOS V1.03 08/28/2015
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x272800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-E7FFF write-protect
[    0.000000]   E8000-EFFFF write-combining
[    0.000000]   F0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask 7C00000000 write-back
[    0.000000]   1 base 0087FFF000 mask 7FFFFFF000 uncachable
[    0.000000]   2 base 0088000000 mask 7FF8000000 uncachable
[    0.000000]   3 base 0090000000 mask 7FF0000000 uncachable
[    0.000000]   4 base 00A0000000 mask 7FE0000000 uncachable
[    0.000000]   5 base 00C0000000 mask 7FC0000000 uncachable
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
[    0.000000] total RAM covered: 14463M
[    0.000000]  gran_size: 64K 	chunk_size: 64K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 64K 	chunk_size: 128K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 256K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 60K
[    0.000000]  gran_size: 64K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 60K
[    0.000000]  gran_size: 128K 	chunk_size: 128K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 128K 	chunk_size: 256K 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 124K
[    0.000000]  gran_size: 128K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 124K
[    0.000000]  gran_size: 256K 	chunk_size: 256K 	num_reg: 10  	lose cover RAM: 12583164K
[    0.000000]  gran_size: 256K 	chunk_size: 512K 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 252K
[    0.000000]  gran_size: 256K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 252K
[    0.000000]  gran_size: 512K 	chunk_size: 512K 	num_reg: 10  	lose cover RAM: 8389116K
[    0.000000]  gran_size: 512K 	chunk_size: 1M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 508K
[    0.000000]  gran_size: 512K 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 508K
[    0.000000]  gran_size: 1M 	chunk_size: 1M 	num_reg: 10  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 2M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 1020K
[    0.000000]  gran_size: 1M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 1020K
[    0.000000]  gran_size: 2M 	chunk_size: 2M 	num_reg: 9  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 4M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 2044K
[    0.000000]  gran_size: 2M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 2044K
[    0.000000]  gran_size: 4M 	chunk_size: 4M 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 8M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 4M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 4092K
[    0.000000]  gran_size: 8M 	chunk_size: 8M 	num_reg: 7  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 16M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 8188K
[    0.000000]  gran_size: 8M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 8188K
[    0.000000]  gran_size: 16M 	chunk_size: 16M 	num_reg: 6  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 16380K
[    0.000000]  gran_size: 16M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 16380K
[    0.000000]  gran_size: 32M 	chunk_size: 32M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 64M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 32764K
[    0.000000]  gran_size: 32M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 32764K
[    0.000000]  gran_size: 64M 	chunk_size: 64M 	num_reg: 4  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 128M 	num_reg: 5  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 256M 	num_reg: 6  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 512M 	num_reg: 7  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 1G 	num_reg: 8  	lose cover RAM: 65532K
[    0.000000]  gran_size: 64M 	chunk_size: 2G 	num_reg: 8  	lose cover RAM: 65532K
[    0.000000]  gran_size: 128M 	chunk_size: 128M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 256M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 128M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 256M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 256M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 512M 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 512M 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 1G 	chunk_size: 1G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 1G 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000]  gran_size: 2G 	chunk_size: 2G 	num_reg: 3  	lose cover RAM: 131068K
[    0.000000] mtrr_cleanup: can not find optimal value
[    0.000000] please specify mtrr_gran_size/mtrr_chunk_size
[    0.000000] e820: update [mem 0x87fff000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0x87fff max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf] mapped at [ffff93d0800fe1b0]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff93d080098000] 98000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] BRK [0x07827000, 0x07827fff] PGTABLE
[    0.000000] BRK [0x07828000, 0x07828fff] PGTABLE
[    0.000000] BRK [0x07829000, 0x07829fff] PGTABLE
[    0.000000] BRK [0x0782a000, 0x0782afff] PGTABLE
[    0.000000] BRK [0x0782b000, 0x0782bfff] PGTABLE
[    0.000000] BRK [0x0782c000, 0x0782cfff] PGTABLE
[    0.000000] BRK [0x0782d000, 0x0782dfff] PGTABLE
[    0.000000] BRK [0x0782e000, 0x0782efff] PGTABLE
[    0.000000] BRK [0x0782f000, 0x0782ffff] PGTABLE
[    0.000000] BRK [0x07830000, 0x07830fff] PGTABLE
[    0.000000] RAMDISK: [mem 0x33006000-0x357fafff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000FE020 000024 (v02 ACRSYS)
[    0.000000] ACPI: XSDT 0x0000000087FDF188 0000F4 (v01 ACRSYS ACRPRDCT 00000000      01000013)
[    0.000000] ACPI: FACP 0x0000000087FE4000 00010C (v05 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: DSDT 0x0000000087FC7000 016421 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: FACS 0x0000000087F7C000 000040
[    0.000000] ACPI: TCPA 0x0000000087FFC000 000032 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFB000 000236 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFA000 000042 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF9000 0004B7 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF8000 00004B (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: TPM2 0x0000000087FF7000 000034 (v03 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF2000 0040CA (v01 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: MSDM 0x0000000087FF1000 000055 (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FEC000 004E73 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FEB000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: DBG2 0x0000000087FEA000 000054 (v00 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FE9000 0004CA (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: ASF! 0x0000000087FE8000 0000A5 (v32 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: ASPT 0x0000000087FE7000 000034 (v07 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: BOOT 0x0000000087FE6000 000028 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FE5000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: HPET 0x0000000087FE3000 000038 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: LPIT 0x0000000087FE2000 000094 (v01 ACRSYS ACRPRDCT 00000000 1025 00040000)
[    0.000000] ACPI: APIC 0x0000000087FE1000 0000BC (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: MCFG 0x0000000087FE0000 00003C (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FDE000 00019A (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FC6000 0004A3 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FC5000 000E58 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
[    0.000000] ACPI: DMAR 0x0000000087FC4000 0000CC (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
[    0.000000] ACPI: FPDT 0x0000000087FC3000 000044 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x00000002727fffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x2727d3000-0x2727fdfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000007834dfff]
[    0.000000]   node   0: [mem 0x0000000078379000-0x0000000078427fff]
[    0.000000]   node   0: [mem 0x0000000078d29000-0x0000000085c3dfff]
[    0.000000]   node   0: [mem 0x0000000087ffe000-0x0000000087ffefff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x00000002727fffff]
[    0.000000] On node 0 totalpages: 2063024
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3997 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 8461 pages used for memmap
[    0.000000]   DMA32 zone: 541459 pages, LIFO batch:31
[    0.000000]   Normal zone: 23712 pages used for memmap
[    0.000000]   Normal zone: 1517568 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics memory at 0x000000008a800000-0x000000008c7fffff
[    0.000000] ACPI: PM-Timer IO Port: 0x1808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x7834e000-0x7834efff]
[    0.000000] PM: Registered nosave memory: [mem 0x7834f000-0x78378fff]
[    0.000000] PM: Registered nosave memory: [mem 0x78428000-0x78d28fff]
[    0.000000] PM: Registered nosave memory: [mem 0x85c3e000-0x8662dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x8662e000-0x87fadfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87fae000-0x87ffdfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87fff000-0x880fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x88100000-0x88ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x89000000-0x8c7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x8c800000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe800000-0xfeafffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xff9fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffa00000-0xffffffff]
[    0.000000] e820: [mem 0x8c800000-0xdfffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
[    0.000000] percpu: Embedded 36 pages/cpu @ffff93d2f2400000 s107800 r8192 d31464 u524288
[    0.000000] pcpu-alloc: s107800 r8192 d31464 u524288 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 2030766
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 7992568K/8252096K available (9033K kernel code, 1665K rwdata, 3832K rodata, 2224K init, 2364K bss, 259528K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
[    0.000000] NR_IRQS:524544 nr_irqs:1024 16
[    0.000000] vt handoff: transparent VT on vt#7
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Detected 2400.000 MHz processor
[    0.000025] Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.00 BogoMIPS (lpj=9600000)
[    0.000027] pid_max: default: 32768 minimum: 301
[    0.000036] ACPI: Core revision 20160930
[    0.029431] ACPI: 9 ACPI AML tables successfully acquired and loaded
[    0.029457] Security Framework initialized
[    0.029458] Yama: becoming mindful.
[    0.029471] AppArmor: AppArmor initialized
[    0.029902] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.031413] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.032100] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.032108] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.032323] CPU: Physical Processor ID: 0
[    0.032323] CPU: Processor Core ID: 0
[    0.032327] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.032327] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.032332] mce: CPU supports 8 MCE banks
[    0.032341] CPU0: Thermal monitoring enabled (TM1)
[    0.032356] process: using mwait in idle threads
[    0.032358] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.032359] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.032465] Freeing SMP alternatives memory: 32K
[    0.034176] ftrace: allocating 34183 entries in 134 pages
[    0.051036] smpboot: Max logical packages: 2
[    0.051046] DMAR: Host address width 39
[    0.051047] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.051052] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
[    0.051053] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.051056] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.051057] DMAR: RMRR base: 0x0000008652a000 end: 0x00000086549fff
[    0.051058] DMAR: RMRR base: 0x0000008a000000 end: 0x0000008c7fffff
[    0.051059] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.051060] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.051061] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.051062] DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
[    0.051062] DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
[    0.052501] DMAR-IR: Enabled IRQ remapping in xapic mode
[    0.052502] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.056538] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.096230] TSC deadline timer enabled
[    0.096234] smpboot: CPU0: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz (family: 0x6, model: 0x4e, stepping: 0x3)
[    0.096282] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.096312] ... version:                4
[    0.096313] ... bit width:              48
[    0.096313] ... generic registers:      4
[    0.096314] ... value mask:             0000ffffffffffff
[    0.096314] ... max period:             00007fffffffffff
[    0.096314] ... fixed-purpose events:   3
[    0.096315] ... event mask:             000000070000000f
[    0.097159] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
[    0.097171] smp: Bringing up secondary CPUs ...
[    0.097229] x86: Booting SMP configuration:
[    0.097230] .... node  #0, CPUs:      #1 #2 #3
[    0.098927] smp: Brought up 1 node, 4 CPUs
[    0.098929] smpboot: Total of 4 processors activated (19200.00 BogoMIPS)
[    0.103126] devtmpfs: initialized
[    0.103177] x86/mm: Memory block size: 128MB
[    0.105341] evm: security.selinux
[    0.105342] evm: security.SMACK64
[    0.105342] evm: security.SMACK64EXEC
[    0.105343] evm: security.SMACK64TRANSMUTE
[    0.105343] evm: security.SMACK64MMAP
[    0.105343] evm: security.ima
[    0.105344] evm: security.capability
[    0.105394] PM: Registering ACPI NVS region [mem 0x7834e000-0x7834efff] (4096 bytes)
[    0.105395] PM: Registering ACPI NVS region [mem 0x8662e000-0x87fadfff] (26738688 bytes)
[    0.105756] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.105764] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.105801] pinctrl core: initialized pinctrl subsystem
[    0.105961] RTC time: 20:42:43, date: 05/30/17
[    0.106037] NET: Registered protocol family 16
[    0.118854] cpuidle: using governor ladder
[    0.130872] cpuidle: using governor menu
[    0.130874] PCCT header not found.
[    0.130910] Simple Boot Flag at 0x44 set to 0x1
[    0.130927] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.130927] ACPI: bus type PCI registered
[    0.130928] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.130988] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.131017] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.131021] pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
[    0.131290] PCI: Using configuration type 1 for base access
[    0.151013] HugeTLB registered 1 GB page size, pre-allocated 0 pages
[    0.151014] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.151232] ACPI: Added _OSI(Module Device)
[    0.151232] ACPI: Added _OSI(Processor Device)
[    0.151233] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.151234] ACPI: Added _OSI(Processor Aggregator Device)
[    0.152513] ACPI: Executed 18 blocks of module-level executable AML code
[    0.160438] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.163993] ACPI: Dynamic OEM Table Load:
[    0.164045] ACPI: SSDT 0xFFFF93D2E86E6800 00061E (v02 PmRef  Cpu0Ist  00003000 INTL 20130117)
[    0.164295] ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
[    0.165322] ACPI: Dynamic OEM Table Load:
[    0.165331] ACPI: SSDT 0xFFFF93D2E8133800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20130117)
[    0.166030] ACPI: Dynamic OEM Table Load:
[    0.166039] ACPI: SSDT 0xFFFF93D2E86E6000 0005AA (v02 PmRef  ApIst    00003000 INTL 20130117)
[    0.166527] ACPI: Dynamic OEM Table Load:
[    0.166534] ACPI: SSDT 0xFFFF93D2E8134200 000119 (v02 PmRef  ApCst    00003000 INTL 20130117)
[    0.168212] ACPI : EC: EC started
[    0.168642] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
[    0.168643] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.168645] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions
[    0.168645] ACPI: Interpreter enabled
[    0.168693] ACPI: (supports S0 S3 S4 S5)
[    0.168693] ACPI: Using IOAPIC for interrupt routing
[    0.168730] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.185611] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.185617] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.188381] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
[    0.188382] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.190302] PCI host bridge to bus 0000:00
[    0.190304] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.190305] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.190306] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.190307] pci_bus 0000:00: root bus resource [mem 0x8c800000-0xdfffffff window]
[    0.190308] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.190309] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.190316] pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
[    0.191087] pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
[    0.191096] pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
[    0.191101] pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64bit pref]
[    0.191106] pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.191937] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.191957] pci 0000:00:14.0: reg 0x10: [mem 0xa1300000-0xa130ffff 64bit]
[    0.192030] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.192781] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.192818] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.192837] pci 0000:00:14.2: reg 0x10: [mem 0xa132a000-0xa132afff 64bit]
[    0.193653] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.193677] pci 0000:00:15.0: reg 0x10: [mem 0xa132b000-0xa132bfff 64bit]
[    0.194548] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.194570] pci 0000:00:16.0: reg 0x10: [mem 0xa132c000-0xa132cfff 64bit]
[    0.194649] pci 0000:00:16.0: PME# supported from D3hot
[    0.195442] pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
[    0.195458] pci 0000:00:17.0: reg 0x10: [mem 0xa1328000-0xa1329fff]
[    0.195466] pci 0000:00:17.0: reg 0x14: [mem 0xa132f000-0xa132f0ff]
[    0.195474] pci 0000:00:17.0: reg 0x18: [io  0x4080-0x4087]
[    0.195482] pci 0000:00:17.0: reg 0x1c: [io  0x4088-0x408b]
[    0.195490] pci 0000:00:17.0: reg 0x20: [io  0x4060-0x407f]
[    0.195497] pci 0000:00:17.0: reg 0x24: [mem 0xa132d000-0xa132d7ff]
[    0.195543] pci 0000:00:17.0: PME# supported from D3hot
[    0.196328] pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
[    0.196396] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.197166] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.197213] pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
[    0.197280] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.198046] pci 0000:00:1c.5: System wakeup disabled by ACPI
[    0.198093] pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
[    0.198962] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.198975] pci 0000:00:1f.2: reg 0x10: [mem 0xa1324000-0xa1327fff]
[    0.199802] pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
[    0.199826] pci 0000:00:1f.3: reg 0x10: [mem 0xa1320000-0xa1323fff 64bit]
[    0.199861] pci 0000:00:1f.3: reg 0x20: [mem 0xa1310000-0xa131ffff 64bit]
[    0.199914] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.200669] pci 0000:00:1f.3: System wakeup disabled by ACPI
[    0.200706] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.200753] pci 0000:00:1f.4: reg 0x10: [mem 0xa132e000-0xa132e0ff 64bit]
[    0.200822] pci 0000:00:1f.4: reg 0x20: [io  0x4040-0x405f]
[    0.201714] pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
[    0.201733] pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
[    0.201761] pci 0000:01:00.0: reg 0x18: [mem 0xa1204000-0xa1204fff 64bit]
[    0.201778] pci 0000:01:00.0: reg 0x20: [mem 0xa1200000-0xa1203fff 64bit]
[    0.201874] pci 0000:01:00.0: supports D1 D2
[    0.201875] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.201929] pci 0000:01:00.0: System wakeup disabled by ACPI
[    0.211062] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.211064] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.211067] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.211381] pci 0000:02:00.0: [168c:0042] type 00 class 0x028000
[    0.211607] pci 0000:02:00.0: reg 0x10: [mem 0xa1000000-0xa11fffff 64bit]
[    0.213046] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.213498] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.223235] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.223239] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.224409] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224460] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.224509] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224557] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224605] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224653] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224700] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.224748] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.225052] platform MSFT0101:00: failed to claim resource 1
[    0.225056] acpi MSFT0101:00: platform device creation failed: -16
[    0.225144] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.225263] ACPI Warning: GPE type mismatch (level/edge) (20160930/evxface-826)
[    0.225278] ACPI : EC: event unblocked
[    0.225290] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.225291] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions and events
[    0.225532] SCSI subsystem initialized
[    0.225567] libata version 3.00 loaded.
[    0.225604] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.225606] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.225608] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.225609] vgaarb: loaded
[    0.225625] ACPI: bus type USB registered
[    0.225639] usbcore: registered new interface driver usbfs
[    0.225646] usbcore: registered new interface driver hub
[    0.225658] usbcore: registered new device driver usb
[    0.225739] PCI: Using ACPI for IRQ routing
[    0.253772] PCI: pci_cache_line_size set to 64 bytes
[    0.254119] e820: reserve RAM buffer [mem 0x0009e800-0x0009ffff]
[    0.254120] e820: reserve RAM buffer [mem 0x7834e000-0x7bffffff]
[    0.254121] e820: reserve RAM buffer [mem 0x78428000-0x7bffffff]
[    0.254122] e820: reserve RAM buffer [mem 0x85c3e000-0x87ffffff]
[    0.254123] e820: reserve RAM buffer [mem 0x87fff000-0x87ffffff]
[    0.254123] e820: reserve RAM buffer [mem 0x272800000-0x273ffffff]
[    0.254201] NetLabel: Initializing
[    0.254201] NetLabel:  domain hash size = 128
[    0.254202] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.254215] NetLabel:  unlabeled traffic allowed by default
[    0.254320] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.254324] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.256365] clocksource: Switched to clocksource hpet
[    0.262875] VFS: Disk quotas dquot_6.6.0
[    0.262888] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.262968] AppArmor: AppArmor Filesystem Enabled
[    0.263001] pnp: PnP ACPI init
[    0.263152] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.263153] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.263154] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.263155] system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
[    0.263156] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.263158] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.263159] system 00:00: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.263162] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263483] system 00:01: [io  0x2000-0x20fe] has been reserved
[    0.263485] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263628] system 00:02: [io  0x0680-0x069f] has been reserved
[    0.263632] system 00:02: [io  0xffff] has been reserved
[    0.263633] system 00:02: [io  0xffff] has been reserved
[    0.263634] system 00:02: [io  0xffff] has been reserved
[    0.263635] system 00:02: [io  0x1800-0x18fe] has been reserved
[    0.263636] system 00:02: [io  0x164e-0x164f] has been reserved
[    0.263638] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263736] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.263770] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.263772] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.263796] pnp 00:05: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.265027] system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.265028] system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.265030] system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.265031] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.265591] system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.265592] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.265593] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.265595] system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
[    0.265596] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.265597] system 00:07: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.265598] system 00:07: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.265599] system 00:07: [mem 0xff000000-0xffffffff] could not be reserved
[    0.265600] system 00:07: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.265601] system 00:07: [mem 0x8c800000-0x8c81ffff] has been reserved
[    0.265603] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.265822] pnp: PnP ACPI: found 8 devices
[    0.272667] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.272685] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.272688] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.272691] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.272697] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.272700] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.272707] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.272708] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.272709] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.272710] pci_bus 0000:00: resource 7 [mem 0x8c800000-0xdfffffff window]
[    0.272711] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff window]
[    0.272712] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    0.272713] pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
[    0.272714] pci_bus 0000:02: resource 1 [mem 0xa1000000-0xa11fffff]
[    0.272830] NET: Registered protocol family 2
[    0.272989] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    0.273096] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.273192] TCP: Hash tables configured (established 65536 bind 65536)
[    0.273211] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.273234] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.273273] NET: Registered protocol family 1
[    0.273284] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.275057] PCI: CLS 64 bytes, default 64
[    0.275095] Unpacking initramfs...
[    0.920773] Freeing initrd memory: 40916K
[    0.920810] DMAR: ACPI device "device:6a" under DMAR at fed91000 as 00:15.0
[    0.920821] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.920823] software IO TLB [mem 0x81c3e000-0x85c3e000] (64MB) mapped at [ffff93d101c3e000-ffff93d105c3dfff]
[    0.920968] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22983777dd9, max_idle_ns: 440795300422 ns
[    0.921051] Scanning for low memory corruption every 60 seconds
[    0.921338] audit: initializing netlink subsys (disabled)
[    0.921389] audit: type=2000 audit(1496176963.916:1): initialized
[    0.921760] Initialise system trusted keyrings
[    0.921854] workingset: timestamp_bits=36 max_order=21 bucket_order=0
[    0.923169] zbud: loaded
[    0.923552] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.923748] fuse init (API version 7.26)
[    0.925388] Key type asymmetric registered
[    0.925388] Asymmetric key parser 'x509' registered
[    0.925418] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.925448] io scheduler noop registered
[    0.925449] io scheduler deadline registered
[    0.925455] io scheduler cfq registered (default)
[    0.926013] pcieport 0000:00:1c.0: AER enabled with IRQ 122
[    0.926029] pcieport 0000:00:1c.5: AER enabled with IRQ 123
[    0.926040] pcieport 0000:00:1c.0: Signaling PME with IRQ 122
[    0.926048] pcieport 0000:00:1c.5: Signaling PME with IRQ 123
[    0.926089] vesafb: mode is 1366x768x32, linelength=5504, pages=0
[    0.926089] vesafb: scrolling: redraw
[    0.926090] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.926103] vesafb: framebuffer at 0x90000000, mapped to 0xffff9f6881800000, using 4160k, total 4160k
[    0.926178] Console: switching to colour frame buffer device 170x48
[    0.926193] fb0: VESA VGA frame buffer device
[    0.926203] intel_idle: MWAIT substates: 0x11142120
[    0.926203] intel_idle: v0.4.1 model 0x4E
[    0.926407] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.926949] ACPI: AC Adapter [ACAD] (off-line)
[    0.927004] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.927007] ACPI: Power Button [PWRB]
[    0.927034] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    0.927036] ACPI: Sleep Button [SLPB]
[    0.927085] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    0.927105] ACPI: Lid Switch [LID0]
[    0.927134] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    0.927135] ACPI: Power Button [PWRF]
[    0.927475] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    0.927519] thermal LNXTHERM:00: registered as thermal_zone0
[    0.927520] ACPI: Thermal Zone [TZ01] (40 C)
[    0.927565] GHES: HEST is not enabled!
[    0.927636] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.928188] ACPI: Battery Slot [BAT1] (battery present)
[    0.929075] Linux agpgart interface v0.103
[    0.930856] loop: module loaded
[    0.930997] libphy: Fixed MDIO Bus: probed
[    0.930998] tun: Universal TUN/TAP device driver, 1.6
[    0.930998] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.931031] PPP generic driver version 2.4.2
[    0.931066] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.931068] ehci-pci: EHCI PCI platform driver
[    0.931077] ehci-platform: EHCI generic platform driver
[    0.931084] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.931085] ohci-pci: OHCI PCI platform driver
[    0.931091] ohci-platform: OHCI generic platform driver
[    0.931095] uhci_hcd: USB Universal Host Controller Interface driver
[    0.931260] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.931265] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    0.932355] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00109810
[    0.932359] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.932458] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.932459] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.932460] usb usb1: Product: xHCI Host Controller
[    0.932461] usb usb1: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
[    0.932461] usb usb1: SerialNumber: 0000:00:14.0
[    0.932583] hub 1-0:1.0: USB hub found
[    0.932597] hub 1-0:1.0: 12 ports detected
[    0.940798] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.940801] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    0.940826] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    0.940827] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.940828] usb usb2: Product: xHCI Host Controller
[    0.940829] usb usb2: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
[    0.940829] usb usb2: SerialNumber: 0000:00:14.0
[    0.940919] hub 2-0:1.0: USB hub found
[    0.940927] hub 2-0:1.0: 6 ports detected
[    0.945013] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    0.945013] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    0.947202] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.947287] mousedev: PS/2 mouse device common for all mice
[    0.947450] rtc_cmos 00:03: RTC can wake from S4
[    0.947820] rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
[    0.947901] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    0.947905] i2c /dev entries driver
[    0.947951] device-mapper: uevent: version 1.0.3
[    0.948003] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    0.948006] intel_pstate: Intel P-state driver initializing
[    0.948279] intel_pstate: HWP enabled
[    0.948314] ledtrig-cpu: registered to indicate activity on CPUs
[    0.948702] NET: Registered protocol family 10
[    0.952051] Segment Routing with IPv6
[    0.952065] NET: Registered protocol family 17
[    0.952086] Key type dns_resolver registered
[    0.952330] microcode: sig=0x406e3, pf=0x80, revision=0x33
[    0.952407] microcode: Microcode Update Driver: v2.2.
[    0.952534] registered taskstats version 1
[    0.952540] Loading compiled-in X.509 certificates
[    0.954549] Loaded X.509 cert 'Build time autogenerated kernel key: 9b4fdbf663ae6c34cad42981a5d67e8ef42b1abf'
[    0.954564] zswap: loaded using pool lzo/zbud
[    0.955356] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    0.965160] Key type big_key registered
[    0.965178] Key type trusted registered
[    0.967182] Key type encrypted registered
[    0.967184] AppArmor: AppArmor sha1 policy hashing enabled
[    0.967186] ima: No TPM chip found, activating TPM-bypass! (rc=-19)
[    0.967198] evm: HMAC attrs: 0x1
[    0.967884]   Magic number: 1:57:752
[    0.967898] tty ttyS3: hash matches
[    0.968067] rtc_cmos 00:03: setting system clock to 2017-05-30 20:42:44 UTC (1496176964)
[    0.968151] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
[    0.968152] EDD information not available.
[    0.968202] PM: Hibernation image not present or could not be loaded.
[    0.969537] Freeing unused kernel memory: 2224K
[    0.969538] Write protecting the kernel read-only data: 14336k
[    0.969958] Freeing unused kernel memory: 1192K
[    0.970447] Freeing unused kernel memory: 264K
[    0.976917] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.986917] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.986972] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.986980] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    0.987330] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.987351] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988104] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988114] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988461] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988507] random: udevadm: uninitialized urandom read (16 bytes read)
[    0.988539] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.007233] FUJITSU Extended Socket Network Device Driver - version 1.2 - Copyright (c) 2015 FUJITSU LIMITED
[    1.009451] wmi: Mapper loaded
[    1.020677] hidraw: raw HID events driver (C) Jiri Kosina
[    1.027003] ahci 0000:00:17.0: version 3.0
[    1.027274] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
[    1.027276] ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio slum part deso sadm sds apst 
[    1.027965] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    1.027970] r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
[    1.028459] scsi host0: ahci
[    1.028622] scsi host1: ahci
[    1.028681] ata1: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d100 irq 125
[    1.028683] ata2: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d180 irq 125
[    1.029581] [drm] Initialized
[    1.037590] r8169 0000:01:00.0 eth0: RTL8168h/8111h at 0xffff9f6880cc1000, 2c:60:0c:ff:58:7a, XID 14100800 IRQ 126
[    1.037592] r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    1.054323] [drm] Memory usable by graphics device = 4096M
[    1.054325] checking generic (90000000 410000) vs hw (90000000 10000000)
[    1.054326] fb: switching to inteldrmfb from VESA VGA
[    1.054349] Console: switching to colour dummy device 80x25
[    1.054458] [drm] Replacing VGA console driver
[    1.060523] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.060524] [drm] Driver supports precise vblank timestamp query.
[    1.060528] r8169 0000:01:00.0 enp1s0: renamed from eth0
[    1.068822] [drm] Finished loading i915/skl_dmc_ver1_26.bin (v1.26)
[    1.069215] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.075812] [drm] GuC firmware load skipped
[    1.088583] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    1.088834] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    1.088938] [drm] Initialized i915 1.6.0 20161121 for 0000:00:02.0 on minor 0
[    1.100689] fbcon: inteldrmfb (fb0) is primary device
[    1.100750] Console: switching to colour frame buffer device 170x48
[    1.100764] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    1.272571] usb 1-5: new full-speed USB device number 2 using xhci_hcd
[    1.341358] ata2: SATA link down (SStatus 4 SControl 300)
[    1.341394] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.342288] ata1.00: ATA-9: WDC WD10JPVX-22JC3T0, 01.01A01, max UDMA/133
[    1.342289] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    1.343269] ata1.00: configured for UDMA/133
[    1.343663] scsi 0:0:0:0: Direct-Access     ATA      WDC WD10JPVX-22J 1A01 PQ: 0 ANSI: 5
[    1.372838] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.372959] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[    1.372961] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.372977] sd 0:0:0:0: [sda] Write Protect is off
[    1.372978] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.373054] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.414545] usb 1-5: New USB device found, idVendor=04ca, idProduct=3015
[    1.414546] usb 1-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.444007]  sda: sda1 sda2 < sda5 >
[    1.444997] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.592463] usb 1-8: new high-speed USB device number 3 using xhci_hcd
[    1.732913] usb 1-8: New USB device found, idVendor=0bda, idProduct=0129
[    1.732915] usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.732916] usb 1-8: Product: USB2.0-CRW
[    1.732916] usb 1-8: Manufacturer: Generic
[    1.732917] usb 1-8: SerialNumber: 20100201396000000
[    1.736438] usbcore: registered new interface driver rtsx_usb
[    1.952488] clocksource: Switched to clocksource tsc
[    2.095103] random: fast init done
[    2.106612] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[    2.816897] [drm] RC6 on
[    4.169832] systemd[1]: systemd 229 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
[    4.169938] systemd[1]: Detected architecture x86-64.
[    4.186610] systemd[1]: Set hostname to <user-Aspire-E5-574>.
[    5.044574] random: crng init done
[    5.410974] systemd[1]: Reached target Encrypted Volumes.
[    5.411049] systemd[1]: Listening on fsck to fsckd communication Socket.
[    5.411086] systemd[1]: Started Trigger resolvconf update for networkd DNS.
[    5.411181] systemd[1]: Created slice System Slice.
[    5.411219] systemd[1]: Listening on udev Control Socket.
[    5.411370] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    5.411378] systemd[1]: Reached target User and Group Name Lookups.
[    6.595754] lp: driver loaded but no devices found
[    6.623859] ppdev: user-space parallel port driver
[   13.468572] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
[   13.492500] systemd-journald[300]: Received request to flush runtime journal from PID 1
[   13.577142] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[   13.588593] Bluetooth: Core ver 2.22
[   13.588605] NET: Registered protocol family 31
[   13.588606] Bluetooth: HCI device and connection manager initialized
[   13.588609] Bluetooth: HCI socket layer initialized
[   13.588610] Bluetooth: L2CAP socket layer initialized
[   13.588614] Bluetooth: SCO socket layer initialized
[   13.596588] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[   13.597414] usbcore: registered new interface driver btusb
[   13.602001] idma64 idma64.0: Found Intel integrated DMA 64-bit
[   13.605911] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   13.605987] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[   13.622551] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[   13.622552] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   13.622553] RAPL PMU: hw unit of domain package 2^-14 Joules
[   13.622554] RAPL PMU: hw unit of domain dram 2^-14 Joules
[   13.622554] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   13.622555] RAPL PMU: hw unit of domain psys 2^-14 Joules
[   13.634823] AVX2 version of gcm_enc/dec engaged.
[   13.634824] AES CTR mode by8 optimization enabled
[   13.680331] intel_rapl: Found RAPL domain package
[   13.680333] intel_rapl: Found RAPL domain core
[   13.680334] intel_rapl: Found RAPL domain uncore
[   13.680335] intel_rapl: Found RAPL domain dram
[   13.697001] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   13.746900] acer_wmi: Acer Laptop ACPI-WMI Extras
[   13.746912] acer_wmi: Function bitmap for Communication Button: 0x801
[   13.778571] acer_wmi: Enabling Launch Manager failed: 0xe4 - 0x0
[   13.778631] input: Acer WMI hotkeys as /devices/virtual/input/input6
[   13.779262] input: Acer BMA150 accelerometer as /devices/virtual/input/input7
[   13.857620] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   13.857622] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   13.857623] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   13.857623] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[   13.857624] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   13.857625] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x12
[   13.870577] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input8
[   13.870625] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[   13.870670] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[   13.870715] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[   13.961871] input: SYN1B81:01 06CB:7406 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-5/i2c-SYN1B81:01/0018:06CB:7406.0001/input/input13
[   13.961948] hid-multitouch 0018:06CB:7406.0001: input,hidraw0: I2C HID v1.00 Mouse [SYN1B81:01 06CB:7406] on i2c-SYN1B81:01
[   14.308814] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[   14.481131] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   14.481138] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   14.481141] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
[   14.481143] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   14.624923] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[   14.624952] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[   14.647207] ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 11ad:0806
[   14.647209] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   14.647615] ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
[   14.794091] audit: type=1400 audit(1496176978.320:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=675 comm="apparmor_parser"
[   14.794095] audit: type=1400 audit(1496176978.320:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=675 comm="apparmor_parser"
[   14.794097] audit: type=1400 audit(1496176978.320:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=675 comm="apparmor_parser"
[   14.794099] audit: type=1400 audit(1496176978.320:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=675 comm="apparmor_parser"
[   14.794249] audit: type=1400 audit(1496176978.320:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=674 comm="apparmor_parser"
[   14.794252] audit: type=1400 audit(1496176978.320:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=674 comm="apparmor_parser"
[   14.795163] audit: type=1400 audit(1496176978.320:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/ippusbxd" pid=680 comm="apparmor_parser"
[   14.795479] audit: type=1400 audit(1496176978.320:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=678 comm="apparmor_parser"
[   14.796938] audit: type=1400 audit(1496176978.324:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=682 comm="apparmor_parser"
[   14.797626] audit: type=1400 audit(1496176978.324:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=679 comm="apparmor_parser"
[   14.833752] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 93da0176
[   14.938288] wl: loading out-of-tree module taints kernel.
[   14.938291] wl: module license 'MIXED/Proprietary' taints kernel.
[   14.938292] Disabling lock debugging due to kernel taint
[   14.939801] wl: module verification failed: signature and/or required key missing - tainting kernel
[   15.139954] Adding 8251388k swap on /dev/sda5.  Priority:-1 extents:1 across:8251388k FS
[   15.797186] snd_hda_intel 0000:00:1f.3: control 2:0:0:PCM Playback Volume:0 is already present
[   16.394337] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   16.394338] Bluetooth: BNEP filters: protocol multicast
[   16.394340] Bluetooth: BNEP socket layer initialized
[   16.606193] ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   16.611790] ath: EEPROM regdomain: 0x6c
[   16.611791] ath: EEPROM indicates we should expect a direct regpair map
[   16.611792] ath: Country alpha2 being used: 00
[   16.611792] ath: Regpair used: 0x6c
[   17.001106] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   18.470663] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   18.470995] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471006] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   18.471040] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000081/00002000
[   18.471064] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   18.471084] pcieport 0000:00:1c.5:    [ 7] Bad DLLP              
[   18.471104] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471108] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471109] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471112] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471113] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471117] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.471118] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.471122] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504745] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504758] pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
[   18.504794] pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
[   18.504818] pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
[   18.504839] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504843] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504844] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504848] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504849] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504852] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504853] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504857] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504858] pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
[   18.504862] pcieport 0000:00:1c.5: can't find device of ID00e5
[   18.504862] pcieport 0000:00:1c.5: AER: Corrected error received: id=00e5
[   18.504866] pcieport 0000:00:1c.5: can't find device of ID00e5
[   20.398620] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   20.401806] IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
[   20.491337] r8169 0000:01:00.0 enp1s0: link down
[   20.491416] IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
[   20.805011] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   30.121978] wlp2s0: authenticate with c8:d3:a3:57:a9:3a
[   30.152495] wlp2s0: send auth to c8:d3:a3:57:a9:3a (try 1/3)
[   30.158285] wlp2s0: authenticated
[   30.160453] wlp2s0: associate with c8:d3:a3:57:a9:3a (try 1/3)
[   30.165023] wlp2s0: RX AssocResp from c8:d3:a3:57:a9:3a (capab=0x431 status=0 aid=4)
[   30.166957] wlp2s0: associated
[   30.166988] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   30.169172] ath: EEPROM regdomain: 0x8348
[   30.169173] ath: EEPROM indicates we should expect a country code
[   30.169174] ath: doing EEPROM country->regdmn map search
[   30.169174] ath: country maps to regdmn code: 0x3a
[   30.169175] ath: Country alpha2 being used: US
[   30.169175] ath: Regpair used: 0x3a
[   30.169176] ath: regdomain 0x8348 dynamically updated by country IE
[   41.539992] Bluetooth: RFCOMM TTY layer initialized
[   41.539997] Bluetooth: RFCOMM socket layer initialized
[   41.540001] Bluetooth: RFCOMM ver 1.11

--mbkavmqd6oeumzo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="success_journalctl.txt"

-- Logs begin at Tue 2017-05-30 16:56:28 EDT, end at Tue 2017-05-30 16:57:25 EDT. --
May 30 16:56:28 user-Aspire-E5-574 systemd-journald[312]: Runtime journal (/run/log/journal/) is 8.0M, max 78.4M, 70.4M free.
May 30 16:56:28 user-Aspire-E5-574 kernel: Linux version 4.10.0-14-generic (buildd@lgw01-10) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) ) #16~16.04.1-Ubuntu SMP Fri Mar 17 17:28:20 UTC 2017 (Ubuntu 4.10.0-14.16~16.04.1-generic 4.10.3)
May 30 16:56:28 user-Aspire-E5-574 kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
May 30 16:56:28 user-Aspire-E5-574 kernel: KERNEL supported cpus:
May 30 16:56:28 user-Aspire-E5-574 kernel:   Intel GenuineIntel
May 30 16:56:28 user-Aspire-E5-574 kernel:   AMD AuthenticAMD
May 30 16:56:28 user-Aspire-E5-574 kernel:   Centaur CentaurHauls
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: BIOS-provided physical RAM map:
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000000100000-0x000000007834dfff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000007834e000-0x000000007834efff] ACPI NVS
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000007834f000-0x0000000078378fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078379000-0x0000000078427fff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078428000-0x0000000078d28fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000078d29000-0x0000000085c3dfff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000085c3e000-0x000000008662dfff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x000000008662e000-0x0000000087fadfff] ACPI NVS
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087fae000-0x0000000087ffdfff] ACPI data
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087ffe000-0x0000000087ffefff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000087fff000-0x00000000880fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000089000000-0x000000008c7fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffffffff] reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS-e820: [mem 0x0000000100000000-0x00000002727fffff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: NX (Execute Disable) protection: active
May 30 16:56:28 user-Aspire-E5-574 kernel: SMBIOS 2.8 present.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMI: Acer Aspire E5-574/Zoro_SL , BIOS V1.03 08/28/2015
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: last_pfn = 0x272800 max_arch_pfn = 0x400000000
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR default type: uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR fixed ranges enabled:
May 30 16:56:28 user-Aspire-E5-574 kernel:   00000-9FFFF write-back
May 30 16:56:28 user-Aspire-E5-574 kernel:   A0000-BFFFF uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   C0000-E7FFF write-protect
May 30 16:56:28 user-Aspire-E5-574 kernel:   E8000-EFFFF write-combining
May 30 16:56:28 user-Aspire-E5-574 kernel:   F0000-FFFFF write-protect
May 30 16:56:28 user-Aspire-E5-574 kernel: MTRR variable ranges enabled:
May 30 16:56:28 user-Aspire-E5-574 kernel:   0 base 0000000000 mask 7C00000000 write-back
May 30 16:56:28 user-Aspire-E5-574 kernel:   1 base 0087FFF000 mask 7FFFFFF000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   2 base 0088000000 mask 7FF8000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   3 base 0090000000 mask 7FF0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   4 base 00A0000000 mask 7FE0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   5 base 00C0000000 mask 7FC0000000 uncachable
May 30 16:56:28 user-Aspire-E5-574 kernel:   6 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   7 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   8 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel:   9 disabled
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
May 30 16:56:28 user-Aspire-E5-574 kernel: total RAM covered: 14463M
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 64K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 128K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 256K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 512K         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 1M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 2M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 4M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 8M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 16M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 32M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 64M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 128M         num_reg: 5          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 256M         num_reg: 6          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 512M         num_reg: 7          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 1G         num_reg: 8          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64K         chunk_size: 2G         num_reg: 8          lose cover RAM: 60K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 128K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 256K         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 512K         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 1M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 2M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 4M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 8M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 16M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 32M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 64M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 128M         num_reg: 5          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 256M         num_reg: 6          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 512M         num_reg: 7          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 1G         num_reg: 8          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128K         chunk_size: 2G         num_reg: 8          lose cover RAM: 124K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 256K         num_reg: 10          lose cover RAM: 12583164K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 512K         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 1M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 2M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 4M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 8M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 16M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 32M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 64M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 128M         num_reg: 5          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 256M         num_reg: 6          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 512M         num_reg: 7          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 1G         num_reg: 8          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256K         chunk_size: 2G         num_reg: 8          lose cover RAM: 252K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 512K         num_reg: 10          lose cover RAM: 8389116K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 1M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 2M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 4M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 8M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 16M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 32M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 64M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 128M         num_reg: 5          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 256M         num_reg: 6          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 512M         num_reg: 7          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 1G         num_reg: 8          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512K         chunk_size: 2G         num_reg: 8          lose cover RAM: 508K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 1M         num_reg: 10          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 2M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 4M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 8M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 16M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 32M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 64M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 128M         num_reg: 5          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 256M         num_reg: 6          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 512M         num_reg: 7          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 1G         num_reg: 8          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1M         chunk_size: 2G         num_reg: 8          lose cover RAM: 1020K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 2M         num_reg: 9          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 4M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 8M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 16M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 32M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 64M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 128M         num_reg: 5          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 256M         num_reg: 6          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 512M         num_reg: 7          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 1G         num_reg: 8          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2M         chunk_size: 2G         num_reg: 8          lose cover RAM: 2044K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 4M         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 8M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 16M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 32M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 64M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 128M         num_reg: 5          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 256M         num_reg: 6          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 512M         num_reg: 7          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 1G         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 4M         chunk_size: 2G         num_reg: 8          lose cover RAM: 4092K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 8M         num_reg: 7          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 16M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 32M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 64M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 128M         num_reg: 5          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 256M         num_reg: 6          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 512M         num_reg: 7          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 1G         num_reg: 8          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 8M         chunk_size: 2G         num_reg: 8          lose cover RAM: 8188K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 16M         num_reg: 6          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 32M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 64M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 128M         num_reg: 5          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 256M         num_reg: 6          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 512M         num_reg: 7          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 1G         num_reg: 8          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 16M         chunk_size: 2G         num_reg: 8          lose cover RAM: 16380K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 32M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 64M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 128M         num_reg: 5          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 256M         num_reg: 6          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 512M         num_reg: 7          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 1G         num_reg: 8          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 32M         chunk_size: 2G         num_reg: 8          lose cover RAM: 32764K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 64M         num_reg: 4          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 128M         num_reg: 5          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 256M         num_reg: 6          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 512M         num_reg: 7          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 1G         num_reg: 8          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 64M         chunk_size: 2G         num_reg: 8          lose cover RAM: 65532K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 128M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 256M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 128M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 256M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 256M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 512M         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 512M         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1G         chunk_size: 1G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 1G         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel:  gran_size: 2G         chunk_size: 2G         num_reg: 3          lose cover RAM: 131068K
May 30 16:56:28 user-Aspire-E5-574 kernel: mtrr_cleanup: can not find optimal value
May 30 16:56:28 user-Aspire-E5-574 kernel: please specify mtrr_gran_size/mtrr_chunk_size
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: update [mem 0x87fff000-0xffffffff] usable ==> reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: last_pfn = 0x87fff max_arch_pfn = 0x400000000
May 30 16:56:28 user-Aspire-E5-574 kernel: found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf] mapped at [ffff9203c00fe1b0]
May 30 16:56:28 user-Aspire-E5-574 kernel: Scanning 1 areas for low memory corruption
May 30 16:56:28 user-Aspire-E5-574 kernel: Base memory trampoline at [ffff9203c0098000] 98000 size 24576
May 30 16:56:28 user-Aspire-E5-574 kernel: Using GB pages for direct mapping
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44227000, 0x44227fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44228000, 0x44228fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44229000, 0x44229fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422a000, 0x4422afff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422b000, 0x4422bfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422c000, 0x4422cfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422d000, 0x4422dfff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422e000, 0x4422efff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x4422f000, 0x4422ffff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: BRK [0x44230000, 0x44230fff] PGTABLE
May 30 16:56:28 user-Aspire-E5-574 kernel: RAMDISK: [mem 0x33006000-0x357fafff]
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Early table checksum verification disabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: RSDP 0x00000000000FE020 000024 (v02 ACRSYS)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: XSDT 0x0000000087FDF188 0000F4 (v01 ACRSYS ACRPRDCT 00000000      01000013)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FACP 0x0000000087FE4000 00010C (v05 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DSDT 0x0000000087FC7000 016421 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FACS 0x0000000087F7C000 000040
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: TCPA 0x0000000087FFC000 000032 (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: UEFI 0x0000000087FFB000 000236 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: UEFI 0x0000000087FFA000 000042 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF9000 0004B7 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF8000 00004B (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: TPM2 0x0000000087FF7000 000034 (v03 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FF2000 0040CA (v01 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: MSDM 0x0000000087FF1000 000055 (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FEC000 004E73 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBGP 0x0000000087FEB000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBG2 0x0000000087FEA000 000054 (v00 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FE9000 0004CA (v02 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: ASF! 0x0000000087FE8000 0000A5 (v32 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: ASPT 0x0000000087FE7000 000034 (v07 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: BOOT 0x0000000087FE6000 000028 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DBGP 0x0000000087FE5000 000034 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: HPET 0x0000000087FE3000 000038 (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LPIT 0x0000000087FE2000 000094 (v01 ACRSYS ACRPRDCT 00000000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: APIC 0x0000000087FE1000 0000BC (v03 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: MCFG 0x0000000087FE0000 00003C (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FDE000 00019A (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FC6000 0004A3 (v02 ACRSYS ACRPRDCT 00001000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0x0000000087FC5000 000E58 (v02 ACRSYS ACRPRDCT 00003000 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: DMAR 0x0000000087FC4000 0000CC (v01 ACRSYS ACRPRDCT 00000001 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: FPDT 0x0000000087FC3000 000044 (v01 ACRSYS ACRPRDCT 00000002 1025 00040000)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Local APIC address 0xfee00000
May 30 16:56:28 user-Aspire-E5-574 kernel: No NUMA configuration found
May 30 16:56:28 user-Aspire-E5-574 kernel: Faking a node at [mem 0x0000000000000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NODE_DATA(0) allocated [mem 0x2727d3000-0x2727fdfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: Zone ranges:
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal   [mem 0x0000000100000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   Device   empty
May 30 16:56:28 user-Aspire-E5-574 kernel: Movable zone start for each node
May 30 16:56:28 user-Aspire-E5-574 kernel: Early memory node ranges
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000000001000-0x000000000009dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000000100000-0x000000007834dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000078379000-0x0000000078427fff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000078d29000-0x0000000085c3dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000087ffe000-0x0000000087ffefff]
May 30 16:56:28 user-Aspire-E5-574 kernel:   node   0: [mem 0x0000000100000000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: Initmem setup node 0 [mem 0x0000000000001000-0x00000002727fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: On node 0 totalpages: 2063024
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 64 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 21 pages reserved
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA zone: 3997 pages, LIFO batch:0
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32 zone: 8461 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   DMA32 zone: 541459 pages, LIFO batch:31
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal zone: 23712 pages used for memmap
May 30 16:56:28 user-Aspire-E5-574 kernel:   Normal zone: 1517568 pages, LIFO batch:31
May 30 16:56:28 user-Aspire-E5-574 kernel: Reserving Intel graphics memory at 0x000000008a800000-0x000000008c7fffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PM-Timer IO Port: 0x1808
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Local APIC address 0xfee00000
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
May 30 16:56:28 user-Aspire-E5-574 kernel: IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: IRQ0 used by override.
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: IRQ9 used by override.
May 30 16:56:28 user-Aspire-E5-574 kernel: Using ACPI (MADT) for SMP configuration information
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Allowing 4 CPUs, 0 hotplug CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x7834e000-0x7834efff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x7834f000-0x78378fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x78428000-0x78d28fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x85c3e000-0x8662dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x8662e000-0x87fadfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x87fae000-0x87ffdfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x87fff000-0x880fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x88100000-0x88ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x89000000-0x8c7fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0x8c800000-0xdfffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfe800000-0xfeafffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xfee01000-0xff9fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registered nosave memory: [mem 0xffa00000-0xffffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: [mem 0x8c800000-0xdfffffff] available for PCI devices
May 30 16:56:28 user-Aspire-E5-574 kernel: Booting paravirtualized kernel on bare hardware
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
May 30 16:56:28 user-Aspire-E5-574 kernel: percpu: Embedded 36 pages/cpu @ffff920632400000 s107800 r8192 d31464 u524288
May 30 16:56:28 user-Aspire-E5-574 kernel: pcpu-alloc: s107800 r8192 d31464 u524288 alloc=1*2097152
May 30 16:56:28 user-Aspire-E5-574 kernel: pcpu-alloc: [0] 0 1 2 3 
May 30 16:56:28 user-Aspire-E5-574 kernel: Built 1 zonelists in Node order, mobility grouping on.  Total pages: 2030766
May 30 16:56:28 user-Aspire-E5-574 kernel: Policy zone: Normal
May 30 16:56:28 user-Aspire-E5-574 kernel: Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.10.0-14-generic root=UUID=66cbcc70-1c66-4745-8848-f37ea41490c7 ro quiet splash vt.handoff=7
May 30 16:56:28 user-Aspire-E5-574 kernel: PID hash table entries: 4096 (order: 3, 32768 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Calgary: detecting Calgary via BIOS EBDA area
May 30 16:56:28 user-Aspire-E5-574 kernel: Calgary: Unable to locate Rio Grande table in EBDA - bailing!
May 30 16:56:28 user-Aspire-E5-574 kernel: Memory: 7992568K/8252096K available (9033K kernel code, 1665K rwdata, 3832K rodata, 2224K init, 2364K bss, 259528K reserved, 0K cma-reserved)
May 30 16:56:28 user-Aspire-E5-574 kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
May 30 16:56:28 user-Aspire-E5-574 kernel: Hierarchical RCU implementation.
May 30 16:56:28 user-Aspire-E5-574 kernel:         Build-time adjustment of leaf fanout to 64.
May 30 16:56:28 user-Aspire-E5-574 kernel:         RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
May 30 16:56:28 user-Aspire-E5-574 kernel: RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
May 30 16:56:28 user-Aspire-E5-574 kernel: NR_IRQS:524544 nr_irqs:1024 16
May 30 16:56:28 user-Aspire-E5-574 kernel: vt handoff: transparent VT on vt#7
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: colour dummy device 80x25
May 30 16:56:28 user-Aspire-E5-574 kernel: console [tty0] enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet clockevent registered
May 30 16:56:28 user-Aspire-E5-574 kernel: tsc: Detected 2400.000 MHz processor
May 30 16:56:28 user-Aspire-E5-574 kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.00 BogoMIPS (lpj=9600000)
May 30 16:56:28 user-Aspire-E5-574 kernel: pid_max: default: 32768 minimum: 301
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Core revision 20160930
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: 9 ACPI AML tables successfully acquired and loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: Security Framework initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Yama: becoming mindful.
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU: Physical Processor ID: 0
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU: Processor Core ID: 0
May 30 16:56:28 user-Aspire-E5-574 kernel: ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
May 30 16:56:28 user-Aspire-E5-574 kernel: ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
May 30 16:56:28 user-Aspire-E5-574 kernel: mce: CPU supports 8 MCE banks
May 30 16:56:28 user-Aspire-E5-574 kernel: CPU0: Thermal monitoring enabled (TM1)
May 30 16:56:28 user-Aspire-E5-574 kernel: process: using mwait in idle threads
May 30 16:56:28 user-Aspire-E5-574 kernel: Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
May 30 16:56:28 user-Aspire-E5-574 kernel: Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing SMP alternatives memory: 32K
May 30 16:56:28 user-Aspire-E5-574 kernel: ftrace: allocating 34183 entries in 134 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Max logical packages: 2
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: Host address width 39
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: DRHD base: 0x000000fed90000 flags: 0x0
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: DRHD base: 0x000000fed91000 flags: 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: RMRR base: 0x0000008652a000 end: 0x00000086549fff
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: RMRR base: 0x0000008a000000 end: 0x0000008c7fffff
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: HPET id 0 under DRHD base 0xfed91000
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR-IR: Enabled IRQ remapping in xapic mode
May 30 16:56:28 user-Aspire-E5-574 kernel: x2apic: IRQ remapping doesn't support X2APIC mode
May 30 16:56:28 user-Aspire-E5-574 kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
May 30 16:56:28 user-Aspire-E5-574 kernel: TSC deadline timer enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: CPU0: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz (family: 0x6, model: 0x4e, stepping: 0x3)
May 30 16:56:28 user-Aspire-E5-574 kernel: Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
May 30 16:56:28 user-Aspire-E5-574 kernel: ... version:                4
May 30 16:56:28 user-Aspire-E5-574 kernel: ... bit width:              48
May 30 16:56:28 user-Aspire-E5-574 kernel: ... generic registers:      4
May 30 16:56:28 user-Aspire-E5-574 kernel: ... value mask:             0000ffffffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ... max period:             00007fffffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ... fixed-purpose events:   3
May 30 16:56:28 user-Aspire-E5-574 kernel: ... event mask:             000000070000000f
May 30 16:56:28 user-Aspire-E5-574 kernel: NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
May 30 16:56:28 user-Aspire-E5-574 kernel: smp: Bringing up secondary CPUs ...
May 30 16:56:28 user-Aspire-E5-574 kernel: x86: Booting SMP configuration:
May 30 16:56:28 user-Aspire-E5-574 kernel: .... node  #0, CPUs:      #1 #2 #3
May 30 16:56:28 user-Aspire-E5-574 kernel: smp: Brought up 1 node, 4 CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: smpboot: Total of 4 processors activated (19200.00 BogoMIPS)
May 30 16:56:28 user-Aspire-E5-574 kernel: devtmpfs: initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/mm: Memory block size: 128MB
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.selinux
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64EXEC
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64TRANSMUTE
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.SMACK64MMAP
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.ima
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: security.capability
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registering ACPI NVS region [mem 0x7834e000-0x7834efff] (4096 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Registering ACPI NVS region [mem 0x8662e000-0x87fadfff] (26738688 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: futex hash table entries: 1024 (order: 4, 65536 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: pinctrl core: initialized pinctrl subsystem
May 30 16:56:28 user-Aspire-E5-574 kernel: RTC time: 20:56:22, date: 05/30/17
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 16
May 30 16:56:28 user-Aspire-E5-574 kernel: cpuidle: using governor ladder
May 30 16:56:28 user-Aspire-E5-574 kernel: cpuidle: using governor menu
May 30 16:56:28 user-Aspire-E5-574 kernel: PCCT header not found.
May 30 16:56:28 user-Aspire-E5-574 kernel: Simple Boot Flag at 0x44 set to 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: bus type PCI registered
May 30 16:56:28 user-Aspire-E5-574 kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
May 30 16:56:28 user-Aspire-E5-574 kernel: pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using configuration type 1 for base access
May 30 16:56:28 user-Aspire-E5-574 kernel: HugeTLB registered 1 GB page size, pre-allocated 0 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: HugeTLB registered 2 MB page size, pre-allocated 0 pages
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Module Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Processor Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Added _OSI(Processor Aggregator Device)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Executed 18 blocks of module-level executable AML code
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF9206286E3800 00061E (v02 PmRef  Cpu0Ist  00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF920628133C00 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF9206286E3000 0005AA (v02 PmRef  ApIst    00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Dynamic OEM Table Load:
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: SSDT 0xFFFF920628135000 000119 (v02 PmRef  ApCst    00003000 INTL 20130117)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI : EC: EC started
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Interpreter enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: (supports S0 S3 S4 S5)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Using IOAPIC for interrupt routing
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI host bridge to bus 0000:00
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0x8c800000-0xdfffffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: root bus resource [bus 00-fe]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64bit pref]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: reg 0x10: [mem 0xa1300000-0xa130ffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: PME# supported from D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:14.2: reg 0x10: [mem 0xa132a000-0xa132afff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:15.0: reg 0x10: [mem 0xa132b000-0xa132bfff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: reg 0x10: [mem 0xa132c000-0xa132cfff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:16.0: PME# supported from D3hot
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x10: [mem 0xa1328000-0xa1329fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x14: [mem 0xa132f000-0xa132f0ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x18: [io  0x4080-0x4087]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x1c: [io  0x4088-0x408b]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x20: [io  0x4060-0x407f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: reg 0x24: [mem 0xa132d000-0xa132d7ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:17.0: PME# supported from D3hot
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.2: reg 0x10: [mem 0xa1324000-0xa1327fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: reg 0x10: [mem 0xa1320000-0xa1323fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: reg 0x20: [mem 0xa1310000-0xa131ffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: PME# supported from D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.3: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: reg 0x10: [mem 0xa132e000-0xa132e0ff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1f.4: reg 0x20: [io  0x4040-0x405f]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x18: [mem 0xa1204000-0xa1204fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: reg 0x20: [mem 0xa1200000-0xa1203fff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: supports D1 D2
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:01:00.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: [168c:0042] type 00 class 0x028000
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: reg 0x10: [mem 0xa1000000-0xa11fffff 64bit]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:02:00.0: System wakeup disabled by ACPI
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PCI bridge to [bus 02]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
May 30 16:56:28 user-Aspire-E5-574 kernel: platform MSFT0101:00: failed to claim resource 1
May 30 16:56:28 user-Aspire-E5-574 kernel: acpi MSFT0101:00: platform device creation failed: -16
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Enabled 7 GPEs in block 00 to 7F
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI Warning: GPE type mismatch (level/edge) (20160930/evxface-826)
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI : EC: event unblocked
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50, EC_CMD/EC_SC=0x66, EC_DATA=0x62
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to handle transactions and events
May 30 16:56:28 user-Aspire-E5-574 kernel: SCSI subsystem initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: libata version 3.00 loaded.
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: setting as boot VGA device
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: vgaarb: bridge control possible
May 30 16:56:28 user-Aspire-E5-574 kernel: vgaarb: loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: bus type USB registered
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver usbfs
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver hub
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new device driver usb
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: Using ACPI for IRQ routing
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: pci_cache_line_size set to 64 bytes
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x0009e800-0x0009ffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x7834e000-0x7bffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x78428000-0x7bffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x85c3e000-0x87ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x87fff000-0x87ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: e820: reserve RAM buffer [mem 0x272800000-0x273ffffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel: Initializing
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  domain hash size = 128
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
May 30 16:56:28 user-Aspire-E5-574 kernel: NetLabel:  unlabeled traffic allowed by default
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
May 30 16:56:28 user-Aspire-E5-574 kernel: hpet0: 8 comparators, 64-bit 24.000000 MHz counter
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: Switched to clocksource hpet
May 30 16:56:28 user-Aspire-E5-574 kernel: VFS: Disk quotas dquot_6.6.0
May 30 16:56:28 user-Aspire-E5-574 kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor Filesystem Enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp: PnP ACPI init
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: [mem 0xfe410000-0xfe7fffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:01: [io  0x2000-0x20fe] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x0680-0x069f] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0xffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x1800-0x18fe] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: [io  0x164e-0x164f] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:04: [io  0x1854-0x1857] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0303 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed90000-0xfed93fff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfed45000-0xfed8ffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xff000000-0xffffffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0xfee00000-0xfeefffff] could not be reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: [mem 0x8c800000-0x8c81ffff] has been reserved
May 30 16:56:28 user-Aspire-E5-574 kernel: system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
May 30 16:56:28 user-Aspire-E5-574 kernel: pnp: PnP ACPI: found 8 devices
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5: PCI bridge to [bus 02]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 7 [mem 0x8c800000-0xdfffffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff window]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: pci_bus 0000:02: resource 1 [mem 0xa1000000-0xa11fffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 2
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP established hash table entries: 65536 (order: 7, 524288 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: TCP: Hash tables configured (established 65536 bind 65536)
May 30 16:56:28 user-Aspire-E5-574 kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 1
May 30 16:56:28 user-Aspire-E5-574 kernel: pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI: CLS 64 bytes, default 64
May 30 16:56:28 user-Aspire-E5-574 kernel: Unpacking initramfs...
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing initrd memory: 40916K
May 30 16:56:28 user-Aspire-E5-574 kernel: DMAR: ACPI device "device:6a" under DMAR at fed91000 as 00:15.0
May 30 16:56:28 user-Aspire-E5-574 kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
May 30 16:56:28 user-Aspire-E5-574 kernel: software IO TLB [mem 0x81c3e000-0x85c3e000] (64MB) mapped at [ffff920441c3e000-ffff920445c3dfff]
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22983777dd9, max_idle_ns: 440795300422 ns
May 30 16:56:28 user-Aspire-E5-574 kernel: Scanning for low memory corruption every 60 seconds
May 30 16:56:28 user-Aspire-E5-574 kernel: audit: initializing netlink subsys (disabled)
May 30 16:56:28 user-Aspire-E5-574 kernel: audit: type=2000 audit(1496177782.916:1): initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: Initialise system trusted keyrings
May 30 16:56:28 user-Aspire-E5-574 kernel: workingset: timestamp_bits=36 max_order=21 bucket_order=0
May 30 16:56:28 user-Aspire-E5-574 kernel: zbud: loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: squashfs: version 4.0 (2009/01/31) Phillip Lougher
May 30 16:56:28 user-Aspire-E5-574 kernel: fuse init (API version 7.26)
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type asymmetric registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Asymmetric key parser 'x509' registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler noop registered
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler deadline registered
May 30 16:56:28 user-Aspire-E5-574 kernel: io scheduler cfq registered (default)
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.0: AER enabled with IRQ 122
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER enabled with IRQ 123
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.0: Signaling PME with IRQ 122
May 30 16:56:28 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: Signaling PME with IRQ 123
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: mode is 1366x768x32, linelength=5504, pages=0
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: scrolling: redraw
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
May 30 16:56:28 user-Aspire-E5-574 kernel: vesafb: framebuffer at 0x90000000, mapped to 0xffffb69281800000, using 4160k, total 4160k
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour frame buffer device 170x48
May 30 16:56:28 user-Aspire-E5-574 kernel: fb0: VESA VGA frame buffer device
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: MWAIT substates: 0x11142120
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: v0.4.1 model 0x4E
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_idle: lapic_timer_reliable_states 0xffffffff
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: AC Adapter [ACAD] (off-line)
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Power Button [PWRB]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Sleep Button [SLPB]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Lid Switch [LID0]
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Power Button [PWRF]
May 30 16:56:28 user-Aspire-E5-574 kernel: (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
May 30 16:56:28 user-Aspire-E5-574 kernel: thermal LNXTHERM:00: registered as thermal_zone0
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Thermal Zone [TZ01] (38 C)
May 30 16:56:28 user-Aspire-E5-574 kernel: GHES: HEST is not enabled!
May 30 16:56:28 user-Aspire-E5-574 kernel: Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Battery Slot [BAT1] (battery present)
May 30 16:56:28 user-Aspire-E5-574 kernel: Linux agpgart interface v0.103
May 30 16:56:28 user-Aspire-E5-574 kernel: loop: module loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: libphy: Fixed MDIO Bus: probed
May 30 16:56:28 user-Aspire-E5-574 kernel: tun: Universal TUN/TAP device driver, 1.6
May 30 16:56:28 user-Aspire-E5-574 kernel: tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
May 30 16:56:28 user-Aspire-E5-574 kernel: PPP generic driver version 2.4.2
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci-pci: EHCI PCI platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ehci-platform: EHCI generic platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci-pci: OHCI PCI platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: ohci-platform: OHCI generic platform driver
May 30 16:56:28 user-Aspire-E5-574 kernel: uhci_hcd: USB Universal Host Controller Interface driver
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x00109810
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: Product: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb1: SerialNumber: 0000:00:14.0
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 1-0:1.0: USB hub found
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 1-0:1.0: 12 ports detected
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: Product: xHCI Host Controller
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: Manufacturer: Linux 4.10.0-14-generic xhci-hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb usb2: SerialNumber: 0000:00:14.0
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 2-0:1.0: USB hub found
May 30 16:56:28 user-Aspire-E5-574 kernel: hub 2-0:1.0: 6 ports detected
May 30 16:56:28 user-Aspire-E5-574 kernel: i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
May 30 16:56:28 user-Aspire-E5-574 kernel: i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
May 30 16:56:28 user-Aspire-E5-574 kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
May 30 16:56:28 user-Aspire-E5-574 kernel: mousedev: PS/2 mouse device common for all mice
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: RTC can wake from S4
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
May 30 16:56:28 user-Aspire-E5-574 kernel: i2c /dev entries driver
May 30 16:56:28 user-Aspire-E5-574 kernel: device-mapper: uevent: version 1.0.3
May 30 16:56:28 user-Aspire-E5-574 kernel: device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_pstate: Intel P-state driver initializing
May 30 16:56:28 user-Aspire-E5-574 kernel: intel_pstate: HWP enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ledtrig-cpu: registered to indicate activity on CPUs
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 10
May 30 16:56:28 user-Aspire-E5-574 kernel: Segment Routing with IPv6
May 30 16:56:28 user-Aspire-E5-574 kernel: NET: Registered protocol family 17
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type dns_resolver registered
May 30 16:56:28 user-Aspire-E5-574 kernel: microcode: sig=0x406e3, pf=0x80, revision=0x33
May 30 16:56:28 user-Aspire-E5-574 kernel: microcode: Microcode Update Driver: v2.2.
May 30 16:56:28 user-Aspire-E5-574 kernel: registered taskstats version 1
May 30 16:56:28 user-Aspire-E5-574 kernel: Loading compiled-in X.509 certificates
May 30 16:56:28 user-Aspire-E5-574 kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
May 30 16:56:28 user-Aspire-E5-574 kernel: Loaded X.509 cert 'Build time autogenerated kernel key: 9b4fdbf663ae6c34cad42981a5d67e8ef42b1abf'
May 30 16:56:28 user-Aspire-E5-574 kernel: zswap: loaded using pool lzo/zbud
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type big_key registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type trusted registered
May 30 16:56:28 user-Aspire-E5-574 kernel: Key type encrypted registered
May 30 16:56:28 user-Aspire-E5-574 kernel: AppArmor: AppArmor sha1 policy hashing enabled
May 30 16:56:28 user-Aspire-E5-574 kernel: ima: No TPM chip found, activating TPM-bypass! (rc=-19)
May 30 16:56:28 user-Aspire-E5-574 kernel: evm: HMAC attrs: 0x1
May 30 16:56:28 user-Aspire-E5-574 kernel:   Magic number: 1:263:954
May 30 16:56:28 user-Aspire-E5-574 kernel: memory memory7: hash matches
May 30 16:56:28 user-Aspire-E5-574 kernel: rtc_cmos 00:03: setting system clock to 2017-05-30 20:56:23 UTC (1496177783)
May 30 16:56:28 user-Aspire-E5-574 kernel: BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
May 30 16:56:28 user-Aspire-E5-574 kernel: EDD information not available.
May 30 16:56:28 user-Aspire-E5-574 kernel: PM: Hibernation image not present or could not be loaded.
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 2224K
May 30 16:56:28 user-Aspire-E5-574 kernel: Write protecting the kernel read-only data: 14336k
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 1192K
May 30 16:56:28 user-Aspire-E5-574 kernel: Freeing unused kernel memory: 264K
May 30 16:56:28 user-Aspire-E5-574 kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: systemd-udevd: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: random: udevadm: uninitialized urandom read (16 bytes read)
May 30 16:56:28 user-Aspire-E5-574 kernel: FUJITSU Extended Socket Network Device Driver - version 1.2 - Copyright (c) 2015 FUJITSU LIMITED
May 30 16:56:28 user-Aspire-E5-574 kernel: wmi: Mapper loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: hidraw: raw HID events driver (C) Jiri Kosina
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: version 3.0
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
May 30 16:56:28 user-Aspire-E5-574 kernel: ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio slum part deso sadm sds apst 
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Initialized
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi host0: ahci
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 eth0: RTL8168h/8111h at 0xffffb69280c99000, 2c:60:0c:ff:58:7a, XID 14100800 IRQ 126
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi host1: ahci
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d100 irq 125
May 30 16:56:28 user-Aspire-E5-574 kernel: ata2: SATA max UDMA/133 abar m2048@0xa132d000 port 0xa132d180 irq 125
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Memory usable by graphics device = 4096M
May 30 16:56:28 user-Aspire-E5-574 kernel: checking generic (90000000 410000) vs hw (90000000 10000000)
May 30 16:56:28 user-Aspire-E5-574 kernel: fb: switching to inteldrmfb from VESA VGA
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour dummy device 80x25
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Replacing VGA console driver
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Driver supports precise vblank timestamp query.
May 30 16:56:28 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 enp1s0: renamed from eth0
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Finished loading i915/skl_dmc_ver1_26.bin (v1.26)
May 30 16:56:28 user-Aspire-E5-574 kernel: i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] GuC firmware load skipped
May 30 16:56:28 user-Aspire-E5-574 kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
May 30 16:56:28 user-Aspire-E5-574 kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] Initialized i915 1.6.0 20161121 for 0000:00:02.0 on minor 0
May 30 16:56:28 user-Aspire-E5-574 kernel: fbcon: inteldrmfb (fb0) is primary device
May 30 16:56:28 user-Aspire-E5-574 kernel: Console: switching to colour frame buffer device 170x48
May 30 16:56:28 user-Aspire-E5-574 kernel: i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: new full-speed USB device number 2 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: ata2: SATA link down (SStatus 4 SControl 300)
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: ATA-9: WDC WD10JPVX-22JC3T0, 01.01A01, max UDMA/133
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
May 30 16:56:28 user-Aspire-E5-574 kernel: ata1.00: configured for UDMA/133
May 30 16:56:28 user-Aspire-E5-574 kernel: scsi 0:0:0:0: Direct-Access     ATA      WDC WD10JPVX-22J 1A01 PQ: 0 ANSI: 5
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] 4096-byte physical blocks
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Write Protect is off
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: New USB device found, idVendor=04ca, idProduct=3015
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
May 30 16:56:28 user-Aspire-E5-574 kernel:  sda: sda1 sda2 < sda5 >
May 30 16:56:28 user-Aspire-E5-574 kernel: sd 0:0:0:0: [sda] Attached SCSI disk
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: new high-speed USB device number 3 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: New USB device found, idVendor=04f2, idProduct=b526
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: Product: HD WebCam
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-7: Manufacturer: SunplusIT INC.
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: new high-speed USB device number 4 using xhci_hcd
May 30 16:56:28 user-Aspire-E5-574 kernel: clocksource: Switched to clocksource tsc
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: New USB device found, idVendor=0bda, idProduct=0129
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=3
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: Product: USB2.0-CRW
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: Manufacturer: Generic
May 30 16:56:28 user-Aspire-E5-574 kernel: usb 1-8: SerialNumber: 20100201396000000
May 30 16:56:28 user-Aspire-E5-574 kernel: usbcore: registered new interface driver rtsx_usb
May 30 16:56:28 user-Aspire-E5-574 kernel: random: fast init done
May 30 16:56:28 user-Aspire-E5-574 kernel: EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
May 30 16:56:28 user-Aspire-E5-574 kernel: [drm] RC6 on
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: systemd 229 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Detected architecture x86-64.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Set hostname to <user-Aspire-E5-574>.
May 30 16:56:28 user-Aspire-E5-574 kernel: random: crng init done
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Created slice System Slice.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on udev Control Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Reached target Encrypted Volumes.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on fsck to fsckd communication Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Listening on Syslog Socket.
May 30 16:56:28 user-Aspire-E5-574 systemd[1]: Reached target Remote File Systems (Pre).
May 30 16:56:28 user-Aspire-E5-574 systemd-journald[312]: Journal started
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Started Create Static Device Nodes in /dev.
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Starting udev Kernel Device Manager...
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Started Nameserver information manager.
May 30 16:56:29 user-Aspire-E5-574 systemd[1]: Reached target Network (Pre).
May 30 16:56:29 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'lp'
May 30 16:56:29 user-Aspire-E5-574 kernel: lp: driver loaded but no devices found
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.photos.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/epiphany.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.audience.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/org.pantheon.noise.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/home/user/.config/plank/dock1/launchers/midori.dockitem: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/var/spool/cups/tmp/cups-dbus-notifier-lockfile: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/lib/modprobe.d/blacklist_linux-hwe_4.8.0-52-generic.conf: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/pygtk.pth: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/_dbus_bindings.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/sbin/wicd: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/bin/wicd-gtk: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/pygtk.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/_dbus_glib_bindings.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'ppdev'
May 30 16:56:30 user-Aspire-E5-574 kernel: ppdev: user-space parallel port driver
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_compat.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_compat.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_expat_introspect_parser.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_version.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_dbus.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_version.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/bus.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/exceptions.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/exceptions.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/types.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/service.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/decorators.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/types.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_dbus.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/bus.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/connection.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/connection.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/lowlevel.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/lowlevel.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/proxies.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/proxies.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/_expat_introspect_parser.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/service.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/decorators.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/glib.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/dbus/mainloop/glib.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/_gio.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gio/unix.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pango.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/atk.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pangocairo.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/_gobject.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/constants.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/constants.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/propertyhelper.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gobject/propertyhelper.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/applications/wicd.desktop: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/cairo/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/cairo/_cairo.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/_glib.x86_64-linux-gnu.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/option.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/glib/option.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/_gtk.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/_lazyutils.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/gtk/deprecation.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pynotify/__init__.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/gtk-2.0/pynotify/_pynotify.so: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/__init__.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/backend.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/configmanager.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/dbusmanager.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/logfile.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wpath.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/misc.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/networking.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wpath.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/networking.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/misc.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/translations.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/translations.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wnettools.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/locale/en/LC_MESSAGES/wicd.mo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/backend.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/wnettools.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/logfile.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/configmanager.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/lib/python2.7/dist-packages/wicd/dbusmanager.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/backends/be-external.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/backends/be-external.pyo: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/daemon/wicd-daemon.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/daemon/monitor.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/wicd-client.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/gui.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/netentry.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/prefs.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/gtk/guiutil.py: No such file or directory
May 30 16:56:30 user-Aspire-E5-574 ureadahead[307]: ureadahead:/usr/share/wicd/icons/hicolor/22x22/status/no-signal.png: No such file or directory
May 30 16:56:35 user-Aspire-E5-574 loadkeys[310]: Loading /etc/console-setup/cached.kmap.gz
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Set console keymap.
May 30 16:56:35 user-Aspire-E5-574 systemd-modules-load[302]: Inserted module 'parport_pc'
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load Kernel Modules.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Apply Kernel Variables...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Mounting FUSE Control File System...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Mounted FUSE Control File System.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Apply Kernel Variables.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started udev Kernel Device Manager.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Remount Root and Kernel File Systems...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Remount Root and Kernel File Systems.
May 30 16:56:35 user-Aspire-E5-574 kernel: EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save Random Seed...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting udev Coldplug all Devices...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Reached target Local File Systems (Pre).
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Flush Journal to Persistent Storage...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Reached target Local File Systems.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Set console font and keymap...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting LSB: AppArmor initialization...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load/Save Random Seed.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started udev Coldplug all Devices.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Show Plymouth Boot Screen...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 kernel: (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Created slice system-systemd\x2dbacklight.slice.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save Screen Backlight Brightness of backlight:intel_backlight...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Load/Save Screen Backlight Brightness of backlight:intel_backlight.
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: Core ver 2.22
May 30 16:56:35 user-Aspire-E5-574 kernel: NET: Registered protocol family 31
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: HCI device and connection manager initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: HCI socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: L2CAP socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: Bluetooth: SCO socket layer initialized
May 30 16:56:35 user-Aspire-E5-574 kernel: usbcore: registered new interface driver btusb
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Flush Journal to Persistent Storage.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Create Volatile Files and Directories...
May 30 16:56:35 user-Aspire-E5-574 systemd-tmpfiles[449]: [/usr/lib/tmpfiles.d/var.conf:14] Duplicate line for path "/var/log", ignoring.
May 30 16:56:35 user-Aspire-E5-574 kernel: intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain package 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain dram 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: RAPL PMU: hw unit of domain psys 2^-14 Joules
May 30 16:56:35 user-Aspire-E5-574 kernel: idma64 idma64.0: Found Intel integrated DMA 64-bit
May 30 16:56:35 user-Aspire-E5-574 kernel: mei_me 0000:00:16.0: enabling device (0000 -> 0002)
May 30 16:56:35 user-Aspire-E5-574 kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
May 30 16:56:35 user-Aspire-E5-574 kernel: AVX2 version of gcm_enc/dec engaged.
May 30 16:56:35 user-Aspire-E5-574 kernel: AES CTR mode by8 optimization enabled
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Show Plymouth Boot Screen.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Forward Password Requests to Plymouth Directory Watch.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Load/Save RF Kill Switch Status...
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain package
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain core
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain uncore
May 30 16:56:35 user-Aspire-E5-574 kernel: intel_rapl: Found RAPL domain dram
May 30 16:56:35 user-Aspire-E5-574 kernel: snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Acer Laptop ACPI-WMI Extras
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Function bitmap for Communication Button: 0x801
May 30 16:56:35 user-Aspire-E5-574 kernel: acer_wmi: Enabling Launch Manager failed: 0xe4 - 0x0
May 30 16:56:35 user-Aspire-E5-574 kernel: input: Acer WMI hotkeys as /devices/virtual/input/input6
May 30 16:56:35 user-Aspire-E5-574 kernel: input: Acer BMA150 accelerometer as /devices/virtual/input/input7
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:35 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Load/Save RF Kill Switch Status.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Set console font and keymap.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Create Volatile Files and Directories.
May 30 16:56:36 user-Aspire-E5-574 kernel: input: SYN1B81:01 06CB:7406 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-5/i2c-SYN1B81:01/0018:06CB:7406.0001/input/input9
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Created slice system-getty.slice.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Update UTMP about System Boot/Shutdown...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Braille Device Support.
May 30 16:56:36 user-Aspire-E5-574 kernel: hid-multitouch 0018:06CB:7406.0001: input,hidraw0: I2C HID v1.00 Mouse [SYN1B81:01 06CB:7406] on i2c-SYN1B81:01
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:    inputs:
May 30 16:56:36 user-Aspire-E5-574 kernel: snd_hda_codec_realtek hdaudioC0D0:      Mic=0x12
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
May 30 16:56:36 user-Aspire-E5-574 kernel: input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[435]: checking bus 1, device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8"
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[433]: checking bus 1, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-7"
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[433]: bus: 1, device: 3 was not an MTP device
May 30 16:56:36 user-Aspire-E5-574 mtp-probe[435]: bus: 1, device: 4 was not an MTP device
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Network Time Synchronization...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Tell Plymouth To Write Out Runtime Data...
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Network Time Synchronization.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Reached target System Time Synchronized.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Reached target Sound Card.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Tell Plymouth To Write Out Runtime Data.
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]:  * Starting AppArmor profiles
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]: Skipping profile in /etc/apparmor.d/disable: usr.bin.firefox
May 30 16:56:36 user-Aspire-E5-574 audit[688]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=688 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.465:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=688 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[685]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[684]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[684]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]: Skipping profile in /etc/apparmor.d/disable: usr.sbin.rsyslogd
May 30 16:56:36 user-Aspire-E5-574 audit[692]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=692 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[689]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd//third_party" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[690]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/ippusbxd" pid=690 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=685 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=684 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=692 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 kernel: audit: type=1400 audit(1496177796.469:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd" pid=689 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-previewer" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-previewer//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-thumbnailer" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 audit[686]: AVC apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince-thumbnailer//sanitized_helper" pid=686 comm="apparmor_parser"
May 30 16:56:36 user-Aspire-E5-574 apparmor[368]:    ...done.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started LSB: AppArmor initialization.
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Starting Raise network interfaces...
May 30 16:56:36 user-Aspire-E5-574 kernel: media: Linux media interface: v0.10
May 30 16:56:36 user-Aspire-E5-574 kernel: Linux video capture interface: v2.00
May 30 16:56:36 user-Aspire-E5-574 systemd[1]: Started Update UTMP about System Boot/Shutdown.
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
May 30 16:56:36 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: loading out-of-tree module taints kernel.
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: module license 'MIXED/Proprietary' taints kernel.
May 30 16:56:36 user-Aspire-E5-574 kernel: Disabling lock debugging due to kernel taint
May 30 16:56:36 user-Aspire-E5-574 kernel: wl: module verification failed: signature and/or required key missing - tainting kernel
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
May 30 16:56:36 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 11ad:0806
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Raise network interfaces.
May 30 16:56:37 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 93da0176
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo: Found UVC 1.00 device HD WebCam (04f2:b526)
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Extension 4 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Extension 3 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Processing 2 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: uvcvideo 1-7:1.0: Entity type for entity Camera 1 was not initialized!
May 30 16:56:37 user-Aspire-E5-574 kernel: input: HD WebCam as /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/input/input18
May 30 16:56:37 user-Aspire-E5-574 kernel: usbcore: registered new interface driver uvcvideo
May 30 16:56:37 user-Aspire-E5-574 kernel: USB Video Class driver (1.1.1)
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Found device WDC_WD10JPVX-22JC3T0 5.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Activating swap /dev/disk/by-uuid/ed851cfe-c339-42a0-809a-7675c6df2640...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Activated swap /dev/disk/by-uuid/ed851cfe-c339-42a0-809a-7675c6df2640.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Swap.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target System Initialization.
May 30 16:56:37 user-Aspire-E5-574 kernel: Adding 8251388k swap on /dev/sda5.  Priority:-1 extents:1 across:8251388k FS
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on UUID daemon activation socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started ACPI Events Check.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Paths.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on ACPID Listen Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: apt-daily.timer: Adding 8h 17min 42.036508s random time.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Daily apt activities.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Daily Cleanup of Temporary Directories.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Timers.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on D-Bus System Message Bus Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Sockets.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Reached target Basic System.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Speech Dispatcher...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Detect the available GPUs and deal with any system changes...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: automatic crash report generation...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: daemon to balance interrupts for SMP systems...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started D-Bus System Message Bus.
May 30 16:56:37 user-Aspire-E5-574 dbus-daemon[761]: Unknown username "geoclue" in message bus configuration file
May 30 16:56:37 user-Aspire-E5-574 dbus[761]: [system] AppArmor D-Bus mediation is enabled
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Network Manager...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Restore /etc/resolv.conf if the system crashed before the ppp link was shut down...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Save/Restore Sound Card State...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started ACPI event daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Modem Manager...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting IIO Sensor Proxy service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Accounts Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Bluetooth service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Record successful boot for GRUB...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Set the CPU Frequency Scaling governor to "ondemand"...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Thermal Daemon Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Login Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started CUPS Scheduler.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Permit User Sessions...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started crash report submission daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Regular background program processing daemon.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting LSB: Starts and stops Wicd...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Starting System Logging Service...
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Restore /etc/resolv.conf if the system crashed before the ppp link was shut down.
May 30 16:56:37 user-Aspire-E5-574 cron[796]: (CRON) INFO (pidfile fd = 3)
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Permit User Sessions.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Starts and stops Wicd.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Save/Restore Sound Card State.
May 30 16:56:37 user-Aspire-E5-574 speech-dispatcher[757]:  * speech-dispatcher disabled; edit /etc/default/speech-dispatcher
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Speech Dispatcher.
May 30 16:56:37 user-Aspire-E5-574 irqbalance[760]:  * Starting SMP IRQ Balancer: irqbalance
May 30 16:56:37 user-Aspire-E5-574 apport[759]:  * Starting automatic crash report generation: apport
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: Set the CPU Frequency Scaling governor to "ondemand".
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: New seat seat0.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Login Service.
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event3 (Power Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event5 (Video Bus)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event0 (Power Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event2 (Lid Switch)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event1 (Sleep Button)
May 30 16:56:37 user-Aspire-E5-574 systemd-logind[788]: Watching system buttons on /dev/input/event6 (Acer WMI hotkeys)
May 30 16:56:37 user-Aspire-E5-574 cron[796]: (CRON) INFO (Running @reboot jobs)
May 30 16:56:37 user-Aspire-E5-574 apport[759]:    ...done.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started LSB: automatic crash report generation.
May 30 16:56:37 user-Aspire-E5-574 acpid[777]: starting up with netlink and the input layer
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Found user 'avahi' (UID 110) and group 'avahi' (GID 119).
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully dropped root privileges.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: avahi-daemon 0.6.32-rc starting up.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Avahi mDNS/DNS-SD Stack.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully called chroot().
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: Successfully dropped remaining capabilities.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started Make remote CUPS printers available locally.
May 30 16:56:37 user-Aspire-E5-574 avahi-daemon[792]: No service file found in /etc/avahi/services.
May 30 16:56:37 user-Aspire-E5-574 systemd[1]: Started System Logging Service.
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: /etc/modprobe.d is not a file
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: Error: can't open /lib/modules/4.10.0-14-generic/updates/dkms
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: Error: can't open /lib/modules/4.10.0-14-generic/updates/dkms
May 30 16:56:38 user-Aspire-E5-574 gpu-manager[758]: update-alternatives: error: no alternatives for x86_64-linux-gnu_gfxcore_conf
May 30 16:56:38 user-Aspire-E5-574 avahi-daemon[792]: Network interface enumeration completed.
May 30 16:56:38 user-Aspire-E5-574 avahi-daemon[792]: Server startup complete. Host name is user-Aspire-E5-574.local. Local service cookie is 1551720669.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Detect the available GPUs and deal with any system changes.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Light Display Manager...
May 30 16:56:38 user-Aspire-E5-574 acpid[777]: 9 rules loaded
May 30 16:56:38 user-Aspire-E5-574 acpid[777]: waiting for events: event logging is off
May 30 16:56:38 user-Aspire-E5-574 irqbalance[760]:    ...done.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started LSB: daemon to balance interrupts for SMP systems.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Bluetooth daemon 5.37
May 30 16:56:38 user-Aspire-E5-574 ModemManager[779]: <info>  ModemManager (version 1.4.12) starting in system bus...
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Bluetooth service.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Starting SDP server
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Reached target Bluetooth.
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP filters: protocol multicast
May 30 16:56:38 user-Aspire-E5-574 kernel: Bluetooth: BNEP socket layer initialized
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service'
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Bluetooth management interface 1.14 initialized
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Failed to obtain handles for "Service Changed" characteristic
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Error adding Link Loss service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Current Time Service could not be registered
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: gatt-time-server: Input/output error (5)
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Not enough free handles to register service
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: Sap driver initialization failed.
May 30 16:56:38 user-Aspire-E5-574 bluetoothd[783]: sap-server: Operation not permitted (1)
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Hostname Service...
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.hostname1'
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started Hostname Service.
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Started IIO Sensor Proxy service.
May 30 16:56:38 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.PolicyKit1' unit='polkitd.service'
May 30 16:56:38 user-Aspire-E5-574 systemd[1]: Starting Authenticate and Authorize Users to Run Privileged Tasks...
May 30 16:56:38 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: EEPROM regdomain: 0x6c
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: EEPROM indicates we should expect a direct regpair map
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: Country alpha2 being used: 00
May 30 16:56:38 user-Aspire-E5-574 kernel: ath: Regpair used: 0x6c
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started LSB: Record successful boot for GRUB.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Thermal Daemon Service.
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: 22 CPUID levels; family:model:stepping 0x6:4e:3 (6:78:3)
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: Polling mode is enabled: 4
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: sysfs read failed constraint_0_max_power_uw
May 30 16:56:39 user-Aspire-E5-574 thermald[786]: sysfs read failed max_brightness
May 30 16:56:39 user-Aspire-E5-574 kernel: ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Received SIGRTMIN+21 from PID 242 (plymouthd).
May 30 16:56:39 user-Aspire-E5-574 polkitd[875]: started daemon version 0.105 using authority implementation `local' version `0.105'
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.PolicyKit1'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Authenticate and Authorize Users to Run Privileged Tasks.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Light Display Manager.
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] Using lock path: /var/lock/whoopsie/lock
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] Could not get the Network Manager state:
May 30 16:56:39 user-Aspire-E5-574 whoopsie[793]: [16:56:39] GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.NetworkManager was not provided by any .service files
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Modem Manager.
May 30 16:56:39 user-Aspire-E5-574 accounts-daemon[781]: started daemon version 0.6.40
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Accounts Service.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7791] NetworkManager (version 1.2.6) is starting...
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7791] Read config: /etc/NetworkManager/NetworkManager.conf (etc: default-wifi-powersave-on.conf)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7864] manager[0x269c200]: monitoring kernel firmware directory '/lib/firmware'.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7865] monitoring ifupdown state file '/run/network/ifstate'.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.7882] dns-mgr[0x2695150]: init: dns=dnsmasq, rc-manager=resolvconf, plugin=dnsmasq
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.8022] rfkill3: found WiFi radio killswitch (at /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/ieee80211/phy0/rfkill3) (driver ath10k_pci)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.8023] rfkill1: found WiFi radio killswitch (at /sys/devices/platform/acer-wmi/rfkill/rfkill1) (platform driver acer-wmi)
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Network Manager.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Network.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting /etc/rc.local Compatibility...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Unattended Upgrades Shutdown.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting OpenVPN service...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started /etc/rc.local Compatibility.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started OpenVPN service.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Hold until boot process finishes up...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Hold until boot process finishes up.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Getty on tty1.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Login Prompts.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Multi-User System.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Reached target Graphical Interface.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Update UTMP about System Runlevel Changes...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Stop ureadahead data collection 45s after completed startup.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Set console scheme...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Update UTMP about System Runlevel Changes.
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Starting Network Manager Script Dispatcher Service...
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Set console scheme.
May 30 16:56:39 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Started Network Manager Script Dispatcher Service.
May 30 16:56:39 user-Aspire-E5-574 systemd[1]: Startup finished in 3.739s (kernel) + 13.713s (userspace) = 17.452s.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9911] init!
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9912]       interface-parser: parsing file /etc/network/interfaces
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9913]       interface-parser: finished parsing file /etc/network/interfaces
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9913] management mode: unmanaged
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9917] devices added (path: /sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/net/enp1s0, iface: enp1s0)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9917] device added (path: /sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/net/enp1s0, iface: enp1s0): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] devices added (path: /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/net/wlp2s0, iface: wlp2s0)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] device added (path: /sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0/net/wlp2s0, iface: wlp2s0): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] devices added (path: /sys/devices/virtual/net/lo, iface: lo)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] device added (path: /sys/devices/virtual/net/lo, iface: lo): no ifupdown configuration found.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] end _init.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9918] settings: loaded plugin ifupdown: (C) 2008 Canonical Ltd.  To report bugs please use the NetworkManager mailing list. (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-settings-plugin-ifupdown.so)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9919] settings: loaded plugin keyfile: (c) 2007 - 2015 Red Hat, Inc.  To report bugs please use the NetworkManager mailing list.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9921] SettingsPlugin-Ofono: init!
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <warn>  [1496177799.9921] SettingsPlugin-Ofono: file doesn't exist: /var/lib/ofono
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] SettingsPlugin-Ofono: end _init.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] settings: loaded plugin ofono: (C) 2013-2016 Canonical Ltd.  To report bugs please use the NetworkManager mailing list. (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-settings-plugin-ofono.so)
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] (40678304) ... get_connections.
May 30 16:56:39 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177799.9922] (40678304) ... get_connections (managed=false): return empty list.
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.1914] keyfile: new connection /etc/NetworkManager/system-connections/eduroam 2 (13f1e190-46da-49cd-8556-c690ea729ba1,"eduroam 2")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2010] keyfile: new connection /etc/NetworkManager/system-connections/eduroam 1 (69427423-4838-4c4a-bb60-a799b55ce7be,"eduroam 1")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2105] keyfile: new connection /etc/NetworkManager/system-connections/BELL119 (2c505b60-49da-4418-ac1c-f1ec15f9e21c,"BELL119")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2199] keyfile: new connection /etc/NetworkManager/system-connections/CottageLife (bc88a399-ea61-4910-8a1d-f38e4671ed25,"CottageLife")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2296] keyfile: new connection /etc/NetworkManager/system-connections/THE DUCK POND (263af686-5308-46f1-80bc-6d5981b10d80,"THE DUCK POND")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2393] keyfile: new connection /etc/NetworkManager/system-connections/eduroam (213ec9ef-0a49-428a-a367-0b9ab9ebdd3f,"eduroam")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2487] keyfile: new connection /etc/NetworkManager/system-connections/SM-G920W89738 (b840d057-a69a-4fa8-90a1-33d44cf4e790,"SM-G920W89738")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2582] keyfile: new connection /etc/NetworkManager/system-connections/uOttawa (e66e1e51-57f3-47ae-990d-13ae3137f3f3,"uOttawa")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2675] keyfile: new connection /etc/NetworkManager/system-connections/TallPenguin-guest (c04505f7-13ed-4635-bfbe-3b5a67cb4bb7,"TallPenguin-guest")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] SettingsPlugin-Ofono: (40678528) ... get_connections.
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] SettingsPlugin-Ofono: (40678528) connections count: 0
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2693] get unmanaged devices count: 0
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2704] settings: hostname: using hostnamed
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2705] settings: hostname changed from (none) to "user-Aspire-E5-574"
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2706] Using DHCP client 'dhclient'
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2706] manager: WiFi enabled by radio killswitch; enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2707] manager: WWAN enabled by radio killswitch; enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2708] manager: Networking is enabled by state file
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVxlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 nm-dispatcher[927]: req:1 'hostname': new request (2 scripts)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 nm-dispatcher[927]: req:1 'hostname': start running ordered scripts...
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMVethFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMTunFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2709] Loaded device plugin: NMMacvlanFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMIPTunnelFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMInfinibandFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMEthernetFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMBridgeFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2710] Loaded device plugin: NMBondFactory (internal)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2847] Loaded device plugin: NMBluezManager (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-bluetooth.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2850] Loaded device plugin: NMWwanFactory (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-wwan.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2853] Loaded device plugin: NMAtmManager (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-adsl.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.2856] Loaded device plugin: NMWifiFactory (/usr/lib/x86_64-linux-gnu/NetworkManager/libnm-device-plugin-wifi.so)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3042] manager: (enp1s0): new Ethernet device (/org/freedesktop/NetworkManager/Devices/0)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3050] keyfile: add connection in-memory (c242874a-290f-326a-bf74-d66f731c8920,"Wired connection 1")
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3054] settings: (enp1s0): created default wired connection 'Wired connection 1'
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.3063] device (enp1s0): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: nm_device_get_device_type: assertion 'NM_IS_DEVICE (self)' failed
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4138] device (lo): link connected
May 30 16:56:40 user-Aspire-E5-574 kernel: r8169 0000:01:00.0 enp1s0: link down
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): enp1s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4143] manager: (lo): new Generic device (/org/freedesktop/NetworkManager/Devices/1)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4147] (wlp2s0): using nl80211 for WiFi device control
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4370] device (wlp2s0): driver supports Access Point (AP) mode
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4377] manager: (wlp2s0): new 802.11 WiFi device (/org/freedesktop/NetworkManager/Devices/2)
May 30 16:56:40 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177800.4387] device (wlp2s0): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
May 30 16:56:40 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00002001/00002000
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: id=00e5
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, id=00e5(Receiver ID)
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
May 30 16:56:40 user-Aspire-E5-574 kernel: pcieport 0000:00:1c.5:    [ 0] Receiver Error         (First)
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM adding faulty module: pam_kwallet.so
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: PAM adding faulty module: pam_kwallet5.so
May 30 16:56:41 user-Aspire-E5-574 lightdm[945]: pam_unix(lightdm-greeter:session): session opened for user lightdm by (uid=0)
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Created slice User Slice of lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Starting User Manager for UID 108...
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Started Session c1 of user lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: pam_unix(systemd-user:session): session opened for user lightdm by (uid=0)
May 30 16:56:41 user-Aspire-E5-574 systemd-logind[788]: New session c1 of user lightdm.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Paths.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Timers.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Sockets.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Basic System.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Reached target Default.
May 30 16:56:41 user-Aspire-E5-574 systemd[948]: Startup finished in 26ms.
May 30 16:56:41 user-Aspire-E5-574 systemd[1]: Started User Manager for UID 108.
May 30 16:56:41 user-Aspire-E5-574 ModemManager[779]: <info>  Couldn't find support for device at '/sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0': not supported by any plugin
May 30 16:56:41 user-Aspire-E5-574 ModemManager[779]: <info>  Couldn't find support for device at '/sys/devices/pci0000:00/0000:00:1c.5/0000:02:00.0': not supported by any plugin
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: Activating service name='org.a11y.atspi.Registry'
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: ** (process:964): WARNING **: Failed to register client: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.gnome.SessionManager was not provided by any .service files
May 30 16:56:42 user-Aspire-E5-574 org.a11y.Bus[961]: Successfully activated service 'org.a11y.atspi.Registry'
May 30 16:56:42 user-Aspire-E5-574 org.a11y.atspi.Registry[976]: SpiRegistry daemon is running with well-known name - org.a11y.atspi.Registry
May 30 16:56:42 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:42 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='fi.w1.wpa_supplicant1' unit='wpa_supplicant.service'
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3785] urfkill disappeared from the bus
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3794] bluez: use BlueZ version 5
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3796] ofono is now available
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.3800] ModemManager available in the bus
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <warn>  [1496177802.3802] failed to enumerate oFono devices: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.ofono was not provided by any .service files
May 30 16:56:42 user-Aspire-E5-574 systemd[1]: Starting WPA supplicant...
May 30 16:56:42 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'fi.w1.wpa_supplicant1'
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: Successfully initialized wpa_supplicant
May 30 16:56:42 user-Aspire-E5-574 systemd[1]: Started WPA supplicant.
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.5239] supplicant: wpa_supplicant running
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.5239] device (wlp2s0): supplicant interface state: init -> starting
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: dbus: wpa_dbus_get_object_properties: failed to get object properties: (none) none
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: dbus: Failed to construct signal
May 30 16:56:42 user-Aspire-E5-574 wpa_supplicant[989]: Could not read interface p2p-dev-wlp2s0 flags: No such device
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.6181] device (wlp2s0): supplicant interface state: starting -> ready
May 30 16:56:42 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177802.6182] device (wlp2s0): state change: unavailable -> disconnected (reason 'supplicant-available') [20 30 42]
May 30 16:56:42 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
May 30 16:56:43 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.UPower' unit='upower.service'
May 30 16:56:43 user-Aspire-E5-574 systemd[1]: Starting Daemon for power management...
May 30 16:56:44 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.UPower'
May 30 16:56:44 user-Aspire-E5-574 systemd[1]: Started Daemon for power management.
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM adding faulty module: pam_kwallet.so
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: PAM adding faulty module: pam_kwallet5.so
May 30 16:56:45 user-Aspire-E5-574 lightdm[1028]: pam_succeed_if(lightdm:auth): requirement "user ingroup nopasswdlogin" not met by user "user"
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.UDisks2' unit='udisks2.service'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting Disk Manager...
May 30 16:56:45 user-Aspire-E5-574 udisksd[1035]: udisks daemon version 2.1.7 starting
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.UDisks2'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Started Disk Manager.
May 30 16:56:45 user-Aspire-E5-574 udisksd[1035]: Acquired the name org.freedesktop.UDisks2 on the system message bus
May 30 16:56:45 user-Aspire-E5-574 org.gtk.vfs.AfcVolumeMonitor[961]: Volume monitor alive
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.ColorManager' unit='colord.service'
May 30 16:56:45 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.PackageKit' unit='packagekit.service'
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting Manage, Install and Generate Color Profiles...
May 30 16:56:45 user-Aspire-E5-574 systemd[1]: Starting PackageKit Daemon...
May 30 16:56:45 user-Aspire-E5-574 PackageKit[1064]: daemon start
May 30 16:56:46 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.ColorManager'
May 30 16:56:46 user-Aspire-E5-574 systemd[1]: Started Manage, Install and Generate Color Profiles.
May 30 16:56:46 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.PackageKit'
May 30 16:56:46 user-Aspire-E5-574 systemd[1]: Started PackageKit Daemon.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2758] manager: startup complete
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2785] device (wlp2s0): supplicant interface state: ready -> inactive
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2789] policy: auto-activating connection 'CottageLife'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2829] device (wlp2s0): Activation: starting connection 'CottageLife' (bc88a399-ea61-4910-8a1d-f38e4671ed25)
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2831] device (wlp2s0): state change: disconnected -> prepare (reason 'none') [30 40 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2832] manager: NetworkManager state is now CONNECTING
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2840] device (wlp2s0): state change: prepare -> config (reason 'none') [40 50 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2842] device (wlp2s0): Activation: (wifi) access point 'CottageLife' has security, but secrets are required.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2842] device (wlp2s0): state change: config -> need-auth (reason 'none') [50 60 0]
May 30 16:56:47 user-Aspire-E5-574 whoopsie[793]: [16:56:47] offline
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.2904] device (wlp2s0): state change: need-auth -> prepare (reason 'none') [60 40 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3063] device (wlp2s0): state change: prepare -> config (reason 'none') [40 50 0]
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3065] device (wlp2s0): Activation: (wifi) connection 'CottageLife' has security, and secrets exist.  No new secrets needed.
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'ssid' value 'CottageLife'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'scan_ssid' value '1'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'key_mgmt' value 'WPA-PSK'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'auth_alg' value 'OPEN'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3066] Config: added 'psk' value '<omitted>'
May 30 16:56:47 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177807.3071] sup-iface[0x271f140,wlp2s0]: config: set interface ap_scan to 1
May 30 16:56:50 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177810.5717] manager: WiFi hardware radio set enabled
May 30 16:56:50 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177810.5717] manager: WWAN hardware radio set enabled
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: SME: Trying to authenticate with c8:d3:a3:57:a9:3a (SSID='CottageLife' freq=2412 MHz)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: authenticate with c8:d3:a3:57:a9:3a
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9656] device (wlp2s0): supplicant interface state: inactive -> authenticating
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: send auth to c8:d3:a3:57:a9:3a (try 1/3)
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: Trying to associate with c8:d3:a3:57:a9:3a (SSID='CottageLife' freq=2412 MHz)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: authenticated
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: associate with c8:d3:a3:57:a9:3a (try 1/3)
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9767] device (wlp2s0): supplicant interface state: authenticating -> associating
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: Associated with c8:d3:a3:57:a9:3a
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: RX AssocResp from c8:d3:a3:57:a9:3a (capab=0x431 status=0 aid=4)
May 30 16:56:51 user-Aspire-E5-574 kernel: wlp2s0: associated
May 30 16:56:51 user-Aspire-E5-574 kernel: IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
May 30 16:56:51 user-Aspire-E5-574 wpa_supplicant[989]: p2p-dev-wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=COUNTRY_IE type=COUNTRY alpha2=US
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: EEPROM regdomain: 0x8348
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: EEPROM indicates we should expect a country code
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: doing EEPROM country->regdmn map search
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: country maps to regdmn code: 0x3a
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: Country alpha2 being used: US
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: Regpair used: 0x3a
May 30 16:56:51 user-Aspire-E5-574 kernel: ath: regdomain 0x8348 dynamically updated by country IE
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9861] device (wlp2s0): supplicant interface state: associating -> associated
May 30 16:56:51 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177811.9939] device (wlp2s0): supplicant interface state: associated -> 4-way handshake
May 30 16:56:52 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: WPA: Key negotiation completed with c8:d3:a3:57:a9:3a [PTK=CCMP GTK=CCMP]
May 30 16:56:52 user-Aspire-E5-574 wpa_supplicant[989]: wlp2s0: CTRL-EVENT-CONNECTED - Connection to c8:d3:a3:57:a9:3a completed [id=0 id_str=]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0715] device (wlp2s0): supplicant interface state: 4-way handshake -> completed
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0716] device (wlp2s0): Activation: (wifi) Stage 2 of 5 (Device Configure) successful.  Connected to wireless network 'CottageLife'.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0716] device (wlp2s0): state change: config -> ip-config (reason 'none') [50 70 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.0840] dhcp4 (wlp2s0): activation: beginning transaction (timeout in 45 seconds)
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.1122] dhcp4 (wlp2s0): dhclient started with pid 1091
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: DHCPREQUEST of 192.168.0.104 on wlp2s0 to 255.255.255.255 port 67 (xid=0x6e71c271)
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: DHCPACK of 192.168.0.104 from 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3641]   address 192.168.0.104
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3641]   plen 24 (255.255.255.0)
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   gateway 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   server identifier 192.168.0.1
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   lease time 86400
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642]   nameserver '192.168.0.1'
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3642] dhcp4 (wlp2s0): state changed unknown -> bound
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: Joining mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: New relevant interface wlp2s0.IPv4 for mDNS.
May 30 16:56:52 user-Aspire-E5-574 avahi-daemon[792]: Registering new address record for 192.168.0.104 on wlp2s0.IPv4.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3654] device (wlp2s0): state change: ip-config -> ip-check (reason 'none') [70 80 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3659] device (wlp2s0): state change: ip-check -> secondaries (reason 'none') [80 90 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3662] device (wlp2s0): state change: secondaries -> activated (reason 'none') [90 100 0]
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.3663] manager: NetworkManager state is now CONNECTED_LOCAL
May 30 16:56:52 user-Aspire-E5-574 dhclient[1091]: bound to 192.168.0.104 -- renewal in 35092 seconds.
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4960] manager: NetworkManager state is now CONNECTED_GLOBAL
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4961] policy: set 'CottageLife' (wlp2s0) as default for IPv4 routing and DNS
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.4962] dns-plugin[0x26adce0]: starting dnsmasq...
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Cannot reach: https://daisy.ubuntu.com
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.5309] dns-mgr: Writing DNS information to /sbin/resolvconf
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: started, version 2.75 cache disabled
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: compile time options: IPv6 GNU-getopt DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack ipset auth DNSSEC loop-detect inotify
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: DBus support enabled: connected to system bus
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: warning: no upstream servers configured
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.8299] device (wlp2s0): Activation: successful, device activated.
May 30 16:56:52 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
May 30 16:56:52 user-Aspire-E5-574 systemd[1]: Starting Network Manager Script Dispatcher Service...
May 30 16:56:52 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
May 30 16:56:52 user-Aspire-E5-574 systemd[1]: Started Network Manager Script Dispatcher Service.
May 30 16:56:52 user-Aspire-E5-574 nm-dispatcher[1140]: req:1 'up' [wlp2s0]: new request (2 scripts)
May 30 16:56:52 user-Aspire-E5-574 nm-dispatcher[1140]: req:1 'up' [wlp2s0]: start running ordered scripts...
May 30 16:56:52 user-Aspire-E5-574 NetworkManager[774]: <info>  [1496177812.8438] dnsmasq[0x26adce0]: dnsmasq appeared as :1.40
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: setting upstream servers from DBus
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] The default IPv4 route is: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:52 user-Aspire-E5-574 dnsmasq[1100]: using nameserver 192.168.0.1#53(via wlp2s0)
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Not a paid data plan: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:52 user-Aspire-E5-574 whoopsie[793]: [16:56:52] Found usable connection: /org/freedesktop/NetworkManager/ActiveConnection/0
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Joining mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: New relevant interface wlp2s0.IPv6 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Registering new address record for fe80::1adf:41d2:b6ce:4ebf on wlp2s0.*.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Got SIGTERM, quitting.
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Stopping Avahi mDNS/DNS-SD Stack...
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Leaving mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: Leaving mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[792]: avahi-daemon 0.6.32-rc exiting.
May 30 16:56:53 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.Avahi' unit='dbus-org.freedesktop.Avahi.service'
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Stopped Avahi mDNS/DNS-SD Stack.
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]: Warning: Stopping avahi-daemon.service, but it can still be activated by:
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]:   avahi-daemon.socket
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Process 792 died: No such process; trying to remove PID file. (/var/run/avahi-daemon//pid)
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Found user 'avahi' (UID 110) and group 'avahi' (GID 119).
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully dropped root privileges.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: avahi-daemon 0.6.32-rc starting up.
May 30 16:56:53 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.Avahi'
May 30 16:56:53 user-Aspire-E5-574 systemd[1]: Started Avahi mDNS/DNS-SD Stack.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully called chroot().
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Successfully dropped remaining capabilities.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: No service file found in /etc/avahi/services.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Joining mDNS multicast group on interface wlp2s0.IPv6 with address fe80::1adf:41d2:b6ce:4ebf.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: New relevant interface wlp2s0.IPv6 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Joining mDNS multicast group on interface wlp2s0.IPv4 with address 192.168.0.104.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: New relevant interface wlp2s0.IPv4 for mDNS.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Network interface enumeration completed.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Registering new address record for fe80::1adf:41d2:b6ce:4ebf on wlp2s0.*.
May 30 16:56:53 user-Aspire-E5-574 avahi-daemon[1192]: Registering new address record for 192.168.0.104 on wlp2s0.IPv4.
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: Avahi detected that your currently configured local DNS server serves
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: a domain .local. This is inherently incompatible with Avahi and thus
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: Avahi disabled itself. If you want to use Avahi in this network, please
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: contact your administrator and convince him to use a different DNS domain,
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: since .local should be used exclusively for Zeroconf technology.
May 30 16:56:53 user-Aspire-E5-574 avahi[1193]: For more information, see http://avahi.org/wiki/AvahiAndUnicastDotLocal
May 30 16:56:53 user-Aspire-E5-574 CapNetAssist[1244]: DetectCaptivePortal script triggered
May 30 16:56:53 user-Aspire-E5-574 nm-dispatcher[1140]: <15>May 30 16:56:53 CapNetAssist: DetectCaptivePortal script triggered
May 30 16:56:54 user-Aspire-E5-574 whoopsie[793]: [16:56:54] online
May 30 16:56:54 user-Aspire-E5-574 avahi-daemon[1192]: Server startup complete. Host name is user-Aspire-E5-574.local. Local service cookie is 594944426.
May 30 16:56:56 user-Aspire-E5-574 org.gtk.vfs.Daemon[961]: A connection to the bus can't be made
May 30 16:56:56 user-Aspire-E5-574 org.a11y.Bus[961]: No protocol specified
May 30 16:56:56 user-Aspire-E5-574 lightdm[945]: pam_unix(lightdm-greeter:session): session closed for user lightdm
May 30 16:56:56 user-Aspire-E5-574 lightdm[1028]: pam_unix(lightdm:session): session opened for user user by (uid=0)
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Created slice User Slice of user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Starting User Manager for UID 1000...
May 30 16:56:56 user-Aspire-E5-574 systemd-logind[788]: New session c2 of user user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: pam_unix(systemd-user:session): session opened for user user by (uid=0)
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Started Session c2 of user user.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Timers.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Sockets.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Paths.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Basic System.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Reached target Default.
May 30 16:56:56 user-Aspire-E5-574 systemd[1254]: Startup finished in 9ms.
May 30 16:56:56 user-Aspire-E5-574 systemd[1]: Started User Manager for UID 1000.
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: ** (gnome-session-check-accelerated:1364): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-2Rqez5ypTX: Connection refused
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Error while executing session-migration: Failed to execute child process "session-migration" (No such file or directory)
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Error while executing session-migration: Failed to execute child process "session-migration" (No such file or directory)
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Could not parse desktop file gnome-user-share-pantheon.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Could not parse desktop file gnome-user-share-pantheon.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: gnome-session-binary[1262]: WARNING: Could not parse desktop file wicd-tray.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session-binary[1262]: WARNING: Could not parse desktop file wicd-tray.desktop or it references a not found TryExec binary
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: ** (gnome-settings-daemon:1372): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-2Rqez5ypTX: Connection refused
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: org.gnome.settings-daemon.plugins.power manage-dpms-defaults is false.
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]: Using settings found in org.pantheon.dpms (0 seconds = Never).
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Standby: 900 seconds
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Suspend: 0 seconds
May 30 16:56:57 user-Aspire-E5-574 gnome-session[1262]:     Off: 0 seconds
May 30 16:56:57 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.RealtimeKit1' unit='rtkit-daemon.service'
May 30 16:56:57 user-Aspire-E5-574 systemd[1]: Starting RealtimeKit Scheduling Policy Service...
May 30 16:56:57 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.RealtimeKit1'
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully called chroot.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully dropped privileges.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully limited resources.
May 30 16:56:57 user-Aspire-E5-574 systemd[1]: Started RealtimeKit Scheduling Policy Service.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Watchdog thread running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Canary thread running.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1422 of process 1422 (n/a) owned by '1000' high priority at nice level -11.
May 30 16:56:57 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 1 threads of 1 processes of 1 users.
May 30 16:56:57 user-Aspire-E5-574 org.gtk.vfs.AfcVolumeMonitor[1335]: Volume monitor alive
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 1 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1462 of process 1422 (n/a) owned by '1000' RT at priority 5.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 2 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 2 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1463 of process 1422 (n/a) owned by '1000' RT at priority 5.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 3 threads of 1 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 bluetoothd[783]: Endpoint registered: sender=:1.56 path=/MediaEndpoint/A2DPSource
May 30 16:56:58 user-Aspire-E5-574 bluetoothd[783]: Endpoint registered: sender=:1.56 path=/MediaEndpoint/A2DPSink
May 30 16:56:58 user-Aspire-E5-574 pulseaudio[1422]: [pulseaudio] backend-ofono.c: Failed to register as a handsfree audio agent with ofono: org.freedesktop.DBus.Error.ServiceUnknown: The name org.ofono was not provided by any .service files
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Successfully made thread 1465 of process 1465 (n/a) owned by '1000' high priority at nice level -11.
May 30 16:56:58 user-Aspire-E5-574 rtkit-daemon[1423]: Supervising 4 threads of 2 processes of 1 users.
May 30 16:56:58 user-Aspire-E5-574 pulseaudio[1465]: [pulseaudio] pid.c: Daemon already running.
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM TTY layer initialized
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM socket layer initialized
May 30 16:56:58 user-Aspire-E5-574 kernel: Bluetooth: RFCOMM ver 1.11
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.freedesktop.locale1' unit='dbus-org.freedesktop.locale1.service'
May 30 16:56:58 user-Aspire-E5-574 systemd[1]: Starting Locale Service...
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 gnome-session[1262]: (gnome-settings-daemon:1372): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:58 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.freedesktop.locale1'
May 30 16:56:58 user-Aspire-E5-574 systemd[1]: Started Locale Service.
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (gala:1473): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Trying to re-add keybinding "switch-to-workspace-last".
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Trying to re-add keybinding "move-to-workspace-last".
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: ** (gala:1473): WARNING **: Preferences.vala:192: '/usr/share/themes/elementary/plank/dock.theme' is read-only!
May 30 16:56:59 user-Aspire-E5-574 gnome-session-binary[1262]: Entering running state
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Activating service name='org.a11y.atspi.Registry'
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: initctl: UPSTART_SESSION isn't set in the environment. Unable to locate the Upstart instance.
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: Successfully activated service 'org.a11y.atspi.Registry'
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: SpiRegistry daemon is running with well-known name - org.a11y.atspi.Registry
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (pantheon-parental-controls-client:1495): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: ** (at-spi2-registryd:1510): WARNING **: Failed to register client: GDBus.Error:org.gnome.SessionManager.AlreadyRegistered: Unable to register client
May 30 16:56:59 user-Aspire-E5-574 org.a11y.atspi.Registry[1403]: ** (at-spi2-registryd:1510): WARNING **: Unable to register client with session manager
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (wingpanel:1513): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 dbus[761]: [system] Activating via systemd: service name='org.pantheon.ParentalControls' unit='pantheon-parental-controls.service'
May 30 16:56:59 user-Aspire-E5-574 systemd[1]: Starting Pantheon Parental Controls Daemon...
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (light-locker:1494): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 gnome-session[1262]: (nm-applet:1499): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 pantheon-parental-controls-daemon[1525]: ** (pantheon-parental-controls-daemon:1525): CRITICAL **: pc_daemon_session_handler_get_id: assertion 'self != NULL' failed
May 30 16:56:59 user-Aspire-E5-574 dbus[761]: [system] Successfully activated service 'org.pantheon.ParentalControls'
May 30 16:56:59 user-Aspire-E5-574 systemd[1]: Started Pantheon Parental Controls Daemon.
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:56:59 user-Aspire-E5-574 org.ayatana.bamf[1335]: (bamfdaemon:1537): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2045:14: 'min-height' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2046:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 gnome-session[1262]: (pantheon-agent-polkit:1502): Gtk-WARNING **: Theme parsing error: gtk-widgets.css:2051:13: 'min-width' is not a valid property name
May 30 16:57:00 user-Aspire-E5-574 polkitd(authority=local)[875]: Registered Authentication Agent for unix-session:c2 (system bus name :1.66 [/usr/libexec/policykit-1-pantheon/pantheon-agent-polkit], object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8)
May 30 16:57:02 user-Aspire-E5-574 org.gnome.zeitgeist.Engine[1335]: [20:57:02.281690 WARNING] zeitgeist-daemon.vala:329: Failed to execute child process "zeitgeist-datahub" (No such file or directory)
May 30 16:57:02 user-Aspire-E5-574 org.gnome.evolution.dataserver.Sources5[1335]: (evolution-source-registry:1585): e-data-server-WARNING **: e_module_load_all_in_directory: Error opening directory '/usr/lib/evolution-data-server/credential-modules': No such file or directory
May 30 16:57:03 user-Aspire-E5-574 gnome-session[1262]: ** (gala:1473): WARNING **: Preferences.vala:192: '/usr/share/themes/elementary/plank/dock.theme' is read-only!
May 30 16:57:05 user-Aspire-E5-574 dbus[761]: [system] Rejected send message, 1 matched rules; type="method_call", sender=":1.61" (uid=1000 pid=1513 comm="wingpanel ") interface="org.freedesktop.DBus.Properties" member="GetAll" error name="(unset)" requested_reply="0" destination="org.freedesktop.DBus" (bus)
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: get-packages transaction /469_dddaecac from uid 1000 finished with success after 3279ms
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)
May 30 16:57:07 user-Aspire-E5-574 PackageKit[1064]: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
May 30 16:57:08 user-Aspire-E5-574 systemd-timesyncd[636]: Synchronized to time server 91.189.89.198:123 (ntp.ubuntu.com).
May 30 16:57:16 user-Aspire-E5-574 org.gnome.zeitgeist.SimpleIndexer[1335]: ** (zeitgeist-fts:1603): WARNING **: Unable to get info on application://synapse.desktop
May 30 16:57:16 user-Aspire-E5-574 gnome-session[1262]: Window manager warning: Buggy client sent a _NET_ACTIVE_WINDOW message with a timestamp of 0 for 0x220000a (pantheon-t)
May 30 16:57:18 user-Aspire-E5-574 PackageKit[1064]: refresh-cache transaction /470_beccecaa from uid 1000 finished with success after 11108ms
May 30 16:57:21 user-Aspire-E5-574 PackageKit[1064]: get-updates transaction /471_ceababdb from uid 1000 finished with success after 2209ms
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Starting Stop ureadahead data collection...
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Stopped Read required files in advance.
May 30 16:57:25 user-Aspire-E5-574 systemd[1]: Started Stop ureadahead data collection.

--mbkavmqd6oeumzo3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--mbkavmqd6oeumzo3--
