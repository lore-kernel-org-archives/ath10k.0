Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1oEP-0003dy-Be
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 04:32:30 +0000
Received: by wmvv187 with SMTP id v187so13634847wmv.1
 for <ath10k@lists.infradead.org>; Wed, 25 Nov 2015 20:32:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGf2gkP1vbE_0BHK2rW=dMCkboDB=61KZRyVikfZJn0DD2rG7g@mail.gmail.com>
References: <CAGf2gkP1vbE_0BHK2rW=dMCkboDB=61KZRyVikfZJn0DD2rG7g@mail.gmail.com>
Date: Thu, 26 Nov 2015 05:32:01 +0100
Message-ID: <CA+BoTQ=+JkK6MrRqrCEcJeWhQM4c7Fs1o-mn9wrc18RK6m0SjA@mail.gmail.com>
Subject: Re: Error while loading firmware
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Pratik Singhal <ps06756@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 18 November 2015 at 16:56, Pratik Singhal <ps06756@gmail.com> wrote:
> Hello, I am running ubuntu 15.10 with kernel 4.3.0-040300-generic.
> My device id is  Network controller [0280]: Qualcomm Atheros Device
> [168c:0041] (rev 20)
>
> I have succesfully copied firmware into
> /lib/firmware/ath10k/QCA6174/hw2.1 from the kvalo repository
> https://github.com/kvalo/ath10k-firmware
>
> Still, I am getting a error in loading the firmware files , here is
> the dmesg log :-
>
>
> [ 2725.480616] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8
> irq_mode 0 reset_mode 0
> [ 2725.715692] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
> [ 2725.715707] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/board-pci-168c:0041:17aa:3545.bin failed with
> error -2
> [ 2725.715709] ath10k_pci 0000:03:00.0: failed to load spec board
> file, falling back to generic: -2
> [ 2726.864851] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
> cbb6e322-6e8f-4ea6-b6ba-4811fc99fbcd)
> [ 2726.864869] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
> 0x003405ff, 168c:0041:17aa:3545 fallback) fw
> SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 htt-ver 0.0 wmi-op 4 htt-op 3 cal
> otp max-sta 32 raw 0 hwcrypto 1 features ignore-otp,no-4addr-pad
> [ 2726.864871] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1
> dfs 0 testmode 0
> [ 2726.867279] ath10k_pci 0000:03:00.0: firmware register dump:
> [ 2726.867282] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
> 0x000A012D 0x00955B31
> [ 2726.867284] ath10k_pci 0000:03:00.0: [04]: 0x000A012D 0x00060330
> 0x00000016 0x86785006
> [ 2726.867285] ath10k_pci 0000:03:00.0: [08]: 0x00000000 0x00400000
> 0x00400600 0x00000001
> [ 2726.867297] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
> 0x00931C61 0x00931C7D
> [ 2726.867299] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009286B6
> 0x00000000 0x00000000
> [ 2726.867301] ath10k_pci 0000:03:00.0: [20]: 0x400A012D 0x0040E2B0
> 0x00955A00 0x00404590
> [ 2726.867302] ath10k_pci 0000:03:00.0: [24]: 0x809287D9 0x0040E310
> 0x7A5092F8 0xC00A012D
> [ 2726.867304] ath10k_pci 0000:03:00.0: [28]: 0x809288D7 0x0040E340
> 0x00000000 0xFFF08040
> [ 2726.867306] ath10k_pci 0000:03:00.0: [32]: 0x809290FE 0x0040E360
> 0x00400000 0x00400600
> [ 2726.867309] ath10k_pci 0000:03:00.0: [36]: 0x80929205 0x0040E380
> 0x00000000 0x00400600
> [ 2726.867311] ath10k_pci 0000:03:00.0: [40]: 0x40928024 0x0040E3B0
> 0x0040D3D0 0x0040D3D0
> [ 2726.867312] ath10k_pci 0000:03:00.0: [44]: 0x00000000 0x0040E3D0
> 0x009BB001 0x00040020
> [ 2726.867314] ath10k_pci 0000:03:00.0: [48]: 0x00401BF0 0x00000001
> 0x00404B9C 0x00400000
> [ 2726.867316] ath10k_pci 0000:03:00.0: [52]: 0x40928024 0x0040E3B0
> 0x0040D3D0 0x0040D3D0
> [ 2726.867317] ath10k_pci 0000:03:00.0: [56]: 0x25059800 0x1A978ED8
> 0xDF817022 0x1BD728F5
> [ 2727.863873] ath10k_pci 0000:03:00.0: failed to receive control
> response completion, polling..
>
>
> If, I rename the board.bin file in hw2.1/ directory the 2nd error
> message is resolved but, where do I get this cal-pci-0000:03:00.0.bin
> file ?
>
> How should I resolve this error ?

You're using an incorrect board.bin file.

The qca6164 firmware has extra checks and expectations wrt that file.
If it gets one it doesn't like it crashes (note the 0x000A012D in the
register dump).

You'll need to extract the file from qca6164 windows driver or look
around on the mailing list archive and/or ubuntu launchpad. I'm pretty
sure this was already discussed somewhere..


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
