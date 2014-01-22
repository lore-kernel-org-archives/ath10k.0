Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W65gJ-0005oK-Ex
 for ath10k@lists.infradead.org; Wed, 22 Jan 2014 21:49:57 +0000
Received: by mail-ig0-f181.google.com with SMTP id j1so2948758iga.2
 for <ath10k@lists.infradead.org>; Wed, 22 Jan 2014 13:49:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52E02B28.6020503@candelatech.com>
References: <52E02B28.6020503@candelatech.com>
Date: Wed, 22 Jan 2014 16:49:26 -0500
Message-ID: <CAA93jw7GShkaY_w5gmbyHpO_rEP_j3hfFRbGZhCB6JBqK0VVzw@mail.gmail.com>
Subject: Re: BAR error, failed to get chip id.
From: Dave Taht <dave.taht@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

On Wed, Jan 22, 2014 at 3:33 PM, Ben Greear <greearb@candelatech.com> wrote:
>
> I see this fairly often on module reload.  Firmware is modified
> by me, based on 10.1.389, so if there are firmware fixes since then
> that address this problem I would not know of it.  Kernel is ath-testing,
> with some local changes, but nothing pertaining to the pci code.

I have had pci issues on an older atom box, not on a newer nuc.

Can try that box again to see what happens.

>
>
> Kernel 3.13.0-rc8-wl-ath+ on an x86_64 (ttyS0)
>
> ct523-9292 login: ath10k_pci 0000:05:00.0: BAR 0: error updating (0xf4400=
004 !=3D 0xffffffff)
> ath10k_pci 0000:05:00.0: BAR 0: error updating (high 0x000000 !=3D 0xffff=
ffff)
> ath10k: Failed to get chip id: -110
>
>
> After this, it takes a power cycle to get the system working again.
>
> Anyone seen similar?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k



-- =

Dave T=E4ht

Fixing bufferbloat with cerowrt: http://www.teklibre.com/cerowrt/subscribe.=
html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
