Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcUad-000550-4z
 for ath10k@lists.infradead.org; Tue, 22 Apr 2014 06:54:00 +0000
Received: by mail-wg0-f43.google.com with SMTP id x13so3424454wgg.2
 for <ath10k@lists.infradead.org>; Mon, 21 Apr 2014 23:53:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53518697.4090406@candelatech.com>
References: <53518697.4090406@candelatech.com>
Date: Tue, 22 Apr 2014 08:53:32 +0200
Message-ID: <CA+BoTQmbdYXJy_VOmoRZrLd+nLpAB6LuHp6QGYmG=-rCJuecmg@mail.gmail.com>
Subject: Re: Anyone else see host machine lockups?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 18 April 2014 22:09, Ben Greear <greearb@candelatech.com> wrote:
> We can reliably lock up a host system (no splats, no mention of
> firmware crashes, system just dies) when we bring up or down a
> bunch of vifs in a system with 3 radios in a PC.
>
> Anyone else seeing similar?

From what I understand this seems to be faulty CUS hardware design.
The problem occurs when trying to perform cold reset on target device
which sometimes leads to voltage drops/spikes which in turn breaks
PCI-E link. Some host controllers apparently can't deal with it and
hang the whole machine (e.g. Thinkpad T430), while others just lose
connectivity with the device and need re-plugging (e.g. Dell E6420) or
display a splat and need to be restarted before given PCI-E slot can
be used again (e.g. AP135's "Data bus error").


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
