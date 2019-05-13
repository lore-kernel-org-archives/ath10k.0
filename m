Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ4xj-0007LF-LY
 for ath10k@lists.infradead.org; Mon, 13 May 2019 07:01:28 +0000
Received: by mail-vs1-f65.google.com with SMTP id q64so7352118vsd.1
 for <ath10k@lists.infradead.org>; Mon, 13 May 2019 00:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
In-Reply-To: <20190508070148.23130-4-alastair@au1.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2019 09:01:14 +0200
Message-ID: <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
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
To: Alastair D'Silva <alastair@au1.ibm.com>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, DRI Development <dri-devel@lists.freedesktop.org>, driverdevel <devel@driverdev.osuosl.org>, scsi <linux-scsi@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, alastair@d-silva.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@aculab.com>, Daniel Vetter <daniel@ffwll.ch>, netdev <netdev@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>

Hi Alastair,

Thanks for your patch!

On Wed, May 8, 2019 at 9:04 AM Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Some buffers may only be partially filled with useful data, while the rest
> is padded (typically with 0x00 or 0xff).
>
> This patch introduces a flag to allow the supression of lines of repeated
> bytes,

Given print_hex_dump() operates on entities of groupsize (1, 2, 4, or 8)
bytes, wouldn't it make more sense to consider repeated groups instead
of repeated bytes?

> which are replaced with '** Skipped %u bytes of value 0x%x **'

Using a custom message instead of just "*", like "hexdump" uses, will
require preprocessing the output when recovering the original binary
data by feeding it to e.g. "xxd".
This may sound worse than it is, though, as I never got "xxd" to work
without preprocessing anyway ;-)

    $ cat $(type -p unhexdump)
    #!/bin/sh
    sed 's/^[0-9a-f]*//' $1 | xxd -r -p | dd conv=swab

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
