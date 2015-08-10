Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOpZ5-0000kM-W8
 for ath10k@lists.infradead.org; Mon, 10 Aug 2015 16:04:44 +0000
Received: by pacgr6 with SMTP id gr6so29844582pac.2
 for <ath10k@lists.infradead.org>; Mon, 10 Aug 2015 09:04:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALZPV0CebKaJO+jRj1okMAHvcufAjY+Hz=3YU12U-3N+9HfTeQ@mail.gmail.com>
References: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
 <CA+BoTQkvsrWBv8NceYuaK4mAnbg-bjzgB+voMAq7YNBcpUA8nw@mail.gmail.com>
 <CA+BoTQnvLqzTA8sthybeGTkPeEFYBkynTOGNQSdqh4SaUpqjBA@mail.gmail.com>
 <CALiJtcodKtPDHdu4diX-jmfxWdKtAiBfQunJQMbG_eYjrm3brg@mail.gmail.com>
 <CA+BoTQ=iM_8HWy1X8D9vqqxh=grnygy+mZtC6Q=YGjaZLSQmuA@mail.gmail.com>
 <CALiJtco-atqjBVi2jXxSFeoRQFRqu4jQu3vMmYNexkeEg6rHAQ@mail.gmail.com>
 <loom.20150810T055401-106@post.gmane.org>
 <CA+BoTQ=Rga-E3HMciQKdECHF=hNqBro_Pq=H8KH5Uy4rV0m58w@mail.gmail.com>
 <CALZPV0B9sVgbUrv6DTZ6t48QyHNQM_e0hV+mUC-svAZbvJK_vg@mail.gmail.com>
 <CA+BoTQkXnzHbmPCOd7YX7qN7mv4c3NNLZmLf3JYb_r+vA=sUvw@mail.gmail.com>
 <CALZPV0DsQXPfq3+O-8iF4H8i1-164s2jRdvmQjMMnW-qd7reFA@mail.gmail.com>
 <CA+BoTQmb-2arpqmxmiWoTL9OFFtU9hEsrHdCmfAsWiNzE=5C-A@mail.gmail.com>
 <CALZPV0D6hVGgw9bO0W+uz3vCw3WqaGXwnH6SpdQ1+JjBMS6ghQ@mail.gmail.com>
 <CA+BoTQn=09AWB-ZZNGYQo2X1CUYnnwxcROW09QgXpn9y8P_0oA@mail.gmail.com>
 <CALZPV0CebKaJO+jRj1okMAHvcufAjY+Hz=3YU12U-3N+9HfTeQ@mail.gmail.com>
Date: Mon, 10 Aug 2015 12:04:22 -0400
Message-ID: <CALZPV0A-zUCh9YwEvOrfiCPF8J3ED6ihOBW3J3D_zCnLAmyzWg@mail.gmail.com>
Subject: Re: qca6164 support
From: Anish Tondwalkar <twilightrook@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

kernel is definitely patched...


[    5.544894] ath10k_pci 0000:03:00.0: Direct firmware load for
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[    5.544897] ath10k_pci 0000:03:00.0: Falling back to user helper


[...]

[   59.341227] r8169 0000:02:00.0 enp2s0: link down
[   65.621229] This the patched kernel -Anish
[   66.765815] ath10k_pci 0000:03:00.0: firmware crashed! (uuid
68f55675-f554-45a8-8c9f-eecac09a5cb9)
[   66.765868] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff, 168c:0041:17aa:3545) fw killer-n1525-fw api 5 htt-ver 0.0
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
[   66.765871] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[   66.767894] ath10k_pci 0000:03:00.0: firmware register dump:
[   66.767920] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3
0x000A012D 0x00955B31
[   66.767942] ath10k_pci 0000:03:00.0: [04]: 0x000A012D 0x00060330
0x00000016 0x84785006
[   66.767966] ath10k_pci 0000:03:00.0: [08]: 0x00000000 0x00400000
0x00400600 0x00000001
[   66.767989] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0x00000000
0x00931C61 0x00931C7D
[   66.768010] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009286B6
0x00931E74 0x00000000
[   66.768032] ath10k_pci 0000:03:00.0: [20]: 0x400A012D 0x0040E2B0
0x00955A00 0x00404590
[   66.768054] ath10k_pci 0000:03:00.0: [24]: 0x809287D9 0x0040E310
0x7A508DF8 0xC00A012D
[   66.768076] ath10k_pci 0000:03:00.0: [28]: 0x809288D7 0x0040E340
0x00000000 0xFFF08040
[   66.768098] ath10k_pci 0000:03:00.0: [32]: 0x809290FE 0x0040E360
0x00400000 0x00400600
[   66.768120] ath10k_pci 0000:03:00.0: [36]: 0x80929205 0x0040E380
0x00000000 0x00400600
[   66.768144] ath10k_pci 0000:03:00.0: [40]: 0x40928024 0x0040E3B0
0x0040D3D0 0x0040D3D0
[   66.768166] ath10k_pci 0000:03:00.0: [44]: 0x00000000 0x0040E3D0
0x009BB001 0x00040020
[   66.768188] ath10k_pci 0000:03:00.0: [48]: 0x00401BF0 0x00000001
0x00404B9C 0x00400000
[   66.768211] ath10k_pci 0000:03:00.0: [52]: 0x40928024 0x0040E3B0
0x0040D3D0 0x0040D3D0
[   66.768233] ath10k_pci 0000:03:00.0: [56]: 0xF2D10700 0xE4B458C2
0x85CC6B13 0xE8728F30
[   67.764773] ath10k_pci 0000:03:00.0: failed to receive control
response completion, polling..
[   68.765592] ath10k_pci 0000:03:00.0: ctl_resp never came in (-110)
[   68.765667] ath10k_pci 0000:03:00.0: failed to connect to HTC: -110
[   68.846102] ath10k_pci 0000:03:00.0: could not init core (-110)
[   68.846156] ath10k_pci 0000:03:00.0: could not probe fw (-110)
[   68.858977] ath10k_pci 0000:03:00.0: cannot restart a device that
hasn't been started

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
