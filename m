Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ushosting.nmnhosting.com ([66.55.73.32])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ5VH-0005a6-JU
 for ath10k@lists.infradead.org; Mon, 13 May 2019 07:36:09 +0000
From: "Alastair D'Silva" <alastair@d-silva.org>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
 <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
Subject: RE: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
Date: Mon, 13 May 2019 17:35:47 +1000
Message-ID: <04de01d5095e$7f6af730$7e40e590$@d-silva.org>
MIME-Version: 1.0
Content-Language: en-au
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
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>, 'Alastair D'Silva' <alastair@au1.ibm.com>
Cc: 'Linux Fbdev development list' <linux-fbdev@vger.kernel.org>, 'Stanislaw Gruszka' <sgruszka@redhat.com>, 'Petr Mladek' <pmladek@suse.com>, 'David Airlie' <airlied@linux.ie>, 'Joonas Lahtinen' <joonas.lahtinen@linux.intel.com>, 'DRI Development' <dri-devel@lists.freedesktop.org>, 'driverdevel' <devel@driverdev.osuosl.org>, 'scsi' <linux-scsi@vger.kernel.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, 'Intel Graphics Development' <intel-gfx@lists.freedesktop.org>, 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Jose Abreu' <Jose.Abreu@synopsys.com>, 'Tom Lendacky' <thomas.lendacky@amd.com>, "'James E.J. Bottomley'" <jejb@linux.ibm.com>, 'Jani Nikula' <jani.nikula@linux.intel.com>, 'Linux FS Devel' <linux-fsdevel@vger.kernel.org>, 'Steven Rostedt' <rostedt@goodmis.org>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Benson Leung' <bleung@chromium.org>, 'Kalle Valo' <kvalo@codeaurora.org>, 'Karsten Keil' <isdn@linux-pingi.de>, "'Martin K. Petersen'" <martin.petersen@oracle.com>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>, 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>, 'David Laight' <David.Laight@aculab.com>, 'Daniel Vetter' <daniel@ffwll.ch>, 'netdev' <netdev@vger.kernel.org>, 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>, 'Andrew Morton' <akpm@linux-foundation.org>, "'David S. Miller'" <davem@davemloft.net>, 'Alexander Viro' <viro@zeniv.linux.org.uk>

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Monday, 13 May 2019 5:01 PM
> To: Alastair D'Silva <alastair@au1.ibm.com>
> Cc: alastair@d-silva.org; Jani Nikula <jani.nikula@linux.intel.com>; Joonas
> Lahtinen <joonas.lahtinen@linux.intel.com>; Rodrigo Vivi
> <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Dan Carpenter <dan.carpenter@oracle.com>; Karsten
> Keil <isdn@linux-pingi.de>; Jassi Brar <jassisinghbrar@gmail.com>; Tom
> Lendacky <thomas.lendacky@amd.com>; David S. Miller
> <davem@davemloft.net>; Jose Abreu <Jose.Abreu@synopsys.com>; Kalle
> Valo <kvalo@codeaurora.org>; Stanislaw Gruszka <sgruszka@redhat.com>;
> Benson Leung <bleung@chromium.org>; Enric Balletbo i Serra
> <enric.balletbo@collabora.com>; James E.J. Bottomley
> <jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>;
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Alexander Viro
> <viro@zeniv.linux.org.uk>; Petr Mladek <pmladek@suse.com>; Sergey
> Senozhatsky <sergey.senozhatsky@gmail.com>; Steven Rostedt
> <rostedt@goodmis.org>; David Laight <David.Laight@aculab.com>; Andrew
> Morton <akpm@linux-foundation.org>; Intel Graphics Development <intel-
> gfx@lists.freedesktop.org>; DRI Development <dri-
> devel@lists.freedesktop.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; netdev <netdev@vger.kernel.org>;
> ath10k@lists.infradead.org; linux-wireless <linux-wireless@vger.kernel.org>;
> scsi <linux-scsi@vger.kernel.org>; Linux Fbdev development list <linux-
> fbdev@vger.kernel.org>; driverdevel <devel@driverdev.osuosl.org>; Linux
> FS Devel <linux-fsdevel@vger.kernel.org>
> Subject: Re: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
> repeated bytes
> 
> Hi Alastair,
> 
> Thanks for your patch!

And thanks for your politeness :)

> 
> On Wed, May 8, 2019 at 9:04 AM Alastair D'Silva <alastair@au1.ibm.com>
> wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > Some buffers may only be partially filled with useful data, while the
> > rest is padded (typically with 0x00 or 0xff).
> >
> > This patch introduces a flag to allow the supression of lines of
> > repeated bytes,
> 
> Given print_hex_dump() operates on entities of groupsize (1, 2, 4, or 8)
> bytes, wouldn't it make more sense to consider repeated groups instead of
> repeated bytes?

Maybe, it would mean that subsequent addresses may not be a multiple of rowsize though, which is useful.

> > which are replaced with '** Skipped %u bytes of value 0x%x **'
> 
> Using a custom message instead of just "*", like "hexdump" uses, will require
> preprocessing the output when recovering the original binary data by
> feeding it to e.g. "xxd".
> This may sound worse than it is, though, as I never got "xxd" to work without
> preprocessing anyway ;-)

I think showing the details of the skipped values is useful when reading the output directly. In situations where binary extracts are desired, the feature can always be disabled.

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
