Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOiFo-0007JT-MC
 for ath10k@lists.infradead.org; Mon, 10 Aug 2015 08:16:22 +0000
Received: by wicja10 with SMTP id ja10so27321005wic.1
 for <ath10k@lists.infradead.org>; Mon, 10 Aug 2015 01:15:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALZPV0B9sVgbUrv6DTZ6t48QyHNQM_e0hV+mUC-svAZbvJK_vg@mail.gmail.com>
References: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
 <CA+BoTQkvsrWBv8NceYuaK4mAnbg-bjzgB+voMAq7YNBcpUA8nw@mail.gmail.com>
 <CA+BoTQnvLqzTA8sthybeGTkPeEFYBkynTOGNQSdqh4SaUpqjBA@mail.gmail.com>
 <CALiJtcodKtPDHdu4diX-jmfxWdKtAiBfQunJQMbG_eYjrm3brg@mail.gmail.com>
 <CA+BoTQ=iM_8HWy1X8D9vqqxh=grnygy+mZtC6Q=YGjaZLSQmuA@mail.gmail.com>
 <CALiJtco-atqjBVi2jXxSFeoRQFRqu4jQu3vMmYNexkeEg6rHAQ@mail.gmail.com>
 <loom.20150810T055401-106@post.gmane.org>
 <CA+BoTQ=Rga-E3HMciQKdECHF=hNqBro_Pq=H8KH5Uy4rV0m58w@mail.gmail.com>
 <CALZPV0B9sVgbUrv6DTZ6t48QyHNQM_e0hV+mUC-svAZbvJK_vg@mail.gmail.com>
Date: Mon, 10 Aug 2015 10:15:59 +0200
Message-ID: <CA+BoTQkXnzHbmPCOd7YX7qN7mv4c3NNLZmLf3JYb_r+vA=sUvw@mail.gmail.com>
Subject: Re: qca6164 support
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
To: Anish Tondwalkar <twilightrook@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10 August 2015 at 08:41, Anish Tondwalkar <twilightrook@gmail.com> wrote:
> No dice. Do note that I'm on 0014 not 003e, so I wouldn't expect that
> to work. This is using sumdog's board.bin and firmware-4.bin saved as
> both firmware-4.bin and firmware-5.bin (I think Victor's patched
> kernel uses -5 rather than -4). Here's dmesg:
[...]
> [   62.884606] ath10k_pci 0000:03:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/board-pci-168c:0041:17aa:3545.bin failed with
> error -2
> [   62.884609] ath10k_pci 0000:03:00.0: Falling back to user helper
> [   70.304540] r8169 0000:02:00.0 enp2s0: link up
> [  122.932551] ath10k_pci 0000:03:00.0: failed to load spec board
> file, falling back to generic: -11
> [ 124.112139] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
> 8a379073-8ebc-49bc-a0a3-dcdcaa2f375a)
> [  124.112154] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
> 0x003405ff, 168c:0041:17aa:3545 fallback) fw killer-n1525-fw api 5
> htt-ver 0.0 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> features
> [ 124.112156] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0
> dfs 0 testmode 0
> [  124.114175] ath10k_pci 0000:03:00.0: firmware register dump:
> [  124.114177] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
> 0x000A012D 0x00955B31
> [  124.114179] ath10k_pci 0000:03:00.0: [04]: 0x000A012D 0x00060330
> 0x00000016 0x84785006
> [  124.114181] ath10k_pci 0000:03:00.0: [08]: 0x00000000 0x00400000
> 0x00400600 0x00000001
> [  124.114182] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
> 0x00931C61 0x00931C7D
> [  124.114184] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009287BD
> 0x00931DBA 0x00000000
> [  124.114186] ath10k_pci 0000:03:00.0: [20]: 0x400A012D 0x0040E2B0
> 0x00955A00 0x00404590
> [  124.114187] ath10k_pci 0000:03:00.0: [24]: 0x809287D9 0x0040E310
> 0x7A508DF8 0xC00A012D
> [  124.114189] ath10k_pci 0000:03:00.0: [28]: 0x809288D7 0x0040E340
> 0x00000000 0xFFF08040
> [  124.114191] ath10k_pci 0000:03:00.0: [32]: 0x809290FE 0x0040E360
> 0x00400000 0x00400600
> [  124.114192] ath10k_pci 0000:03:00.0: [36]: 0x80929205 0x0040E380
> 0x00000000 0x00400600
> [  124.114194] ath10k_pci 0000:03:00.0: [40]: 0x40928024 0x0040E3B0
> 0x0040D3D0 0x0040D3D0
> [  124.114196] ath10k_pci 0000:03:00.0: [44]: 0x00000000 0x0040E3D0
> 0x009BB001 0x00040020
> [  124.114197] ath10k_pci 0000:03:00.0: [48]: 0x00401BF0 0x00000001
> 0x00404B9C 0x00400000
> [  124.114199] ath10k_pci 0000:03:00.0: [52]: 0x40928024 0x0040E3B0
> 0x0040D3D0 0x0040D3D0
> [  124.114201] ath10k_pci 0000:03:00.0: [56]: 0xFAD50700 0xE43458C2
> 0x9DCD6B13 0x887A8F31
> [  125.110848] ath10k_pci 0000:03:00.0: failed to receive control
> response completion, polling..

This register dump (0x000A012D) suggests you dont have the necessary
patch for qca6164. Both qca6164 and qca6174 sould work fine with the
same firmware.

Do note that firmware -X numbering yields no functional changes.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
