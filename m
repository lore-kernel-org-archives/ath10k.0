Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ushosting.nmnhosting.com ([167.160.173.127])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFytY-0004TX-Ko
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 10:31:26 +0000
From: "Alastair D'Silva" <alastair@d-silva.org>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-4-alastair@au1.ibm.com>
 <20190412141211.lvnz6wb7mwkykmxf@pathway.suse.cz>
 <093301d4f187$da0756a0$8e1603e0$@d-silva.org>
 <20190415092424.qos7d54nbyr5hphu@pathway.suse.cz>
In-Reply-To: <20190415092424.qos7d54nbyr5hphu@pathway.suse.cz>
Subject: RE: [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Date: Mon, 15 Apr 2019 20:07:10 +1000
Message-ID: <0da301d4f373$01d5bb80$05813280$@d-silva.org>
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
To: 'Petr Mladek' <pmladek@suse.com>
Cc: linux-fbdev@vger.kernel.org, 'Stanislaw Gruszka' <sgruszka@redhat.com>, 'David Airlie' <airlied@linux.ie>, 'Joonas Lahtinen' <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, 'Jose Abreu' <Jose.Abreu@synopsys.com>, 'Tom Lendacky' <thomas.lendacky@amd.com>, "'James E.J. Bottomley'" <jejb@linux.ibm.com>, 'Jani Nikula' <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, 'Steven Rostedt' <rostedt@goodmis.org>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Benson Leung' <bleung@chromium.org>, 'Kalle Valo' <kvalo@codeaurora.org>, 'Karsten Keil' <isdn@linux-pingi.de>, 'Alastair D'Silva' <alastair@au1.ibm.com>, "'Martin K. Petersen'" <martin.petersen@oracle.com>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>, 'Daniel Vetter' <daniel@ffwll.ch>, netdev@vger.kernel.org, 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>, 'Andrew Morton' <akpm@linux-foundation.org>, "'David S. Miller'" <davem@davemloft.net>, 'Alexander Viro' <viro@zeniv.linux.org.uk>

> -----Original Message-----
> From: Petr Mladek <pmladek@suse.com>
> Sent: Monday, 15 April 2019 7:24 PM
> To: Alastair D'Silva <alastair@d-silva.org>
> Cc: 'Alastair D'Silva' <alastair@au1.ibm.com>; 'Jani Nikula'
> <jani.nikula@linux.intel.com>; 'Joonas Lahtinen'
> <joonas.lahtinen@linux.intel.com>; 'Rodrigo Vivi'
<rodrigo.vivi@intel.com>;
> 'David Airlie' <airlied@linux.ie>; 'Daniel Vetter' <daniel@ffwll.ch>;
'Karsten
> Keil' <isdn@linux-pingi.de>; 'Jassi Brar' <jassisinghbrar@gmail.com>; 'Tom
> Lendacky' <thomas.lendacky@amd.com>; 'David S. Miller'
> <davem@davemloft.net>; 'Jose Abreu' <Jose.Abreu@synopsys.com>; 'Kalle
> Valo' <kvalo@codeaurora.org>; 'Stanislaw Gruszka' <sgruszka@redhat.com>;
> 'Benson Leung' <bleung@chromium.org>; 'Enric Balletbo i Serra'
> <enric.balletbo@collabora.com>; 'James E.J. Bottomley'
> <jejb@linux.ibm.com>; 'Martin K. Petersen' <martin.petersen@oracle.com>;
> 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>; 'Alexander Viro'
> <viro@zeniv.linux.org.uk>; 'Sergey Senozhatsky'
> <sergey.senozhatsky@gmail.com>; 'Steven Rostedt'
> <rostedt@goodmis.org>; 'Andrew Morton' <akpm@linux-foundation.org>;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> scsi@vger.kernel.org; linux-fbdev@vger.kernel.org;
> devel@driverdev.osuosl.org; linux-fsdevel@vger.kernel.org
> Subject: Re: [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
> hex_dump_to_buffer with flags
> 
> On Sat 2019-04-13 09:31:27, Alastair D'Silva wrote:
> > > -----Original Message-----
> > > From: Petr Mladek <pmladek@suse.com>
> > > Sent: Saturday, 13 April 2019 12:12 AM
> > > To: Alastair D'Silva <alastair@au1.ibm.com>
> > > Cc: alastair@d-silva.org; Jani Nikula <jani.nikula@linux.intel.com>;
> > Joonas
> > > Lahtinen <joonas.lahtinen@linux.intel.com>; Rodrigo Vivi
> > > <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>; Daniel
> > > Vetter <daniel@ffwll.ch>; Karsten Keil <isdn@linux-pingi.de>; Jassi
> > > Brar <jassisinghbrar@gmail.com>; Tom Lendacky
> > > <thomas.lendacky@amd.com>; David S. Miller
> <davem@davemloft.net>;
> > > Jose Abreu <Jose.Abreu@synopsys.com>; Kalle Valo
> > > <kvalo@codeaurora.org>; Stanislaw Gruszka <sgruszka@redhat.com>;
> > > Benson Leung <bleung@chromium.org>; Enric Balletbo i Serra
> > > <enric.balletbo@collabora.com>; James E.J. Bottomley
> > > <jejb@linux.ibm.com>; Martin K. Petersen
> > > <martin.petersen@oracle.com>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>; Alexander Viro
> > > <viro@zeniv.linux.org.uk>; Sergey Senozhatsky
> > > <sergey.senozhatsky@gmail.com>; Steven Rostedt
> > > <rostedt@goodmis.org>; Andrew Morton <akpm@linux-
> foundation.org>;
> > > intel- gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > > linux- kernel@vger.kernel.org; netdev@vger.kernel.org;
> > > ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> > > scsi@vger.kernel.org; linux-fbdev@vger.kernel.org;
> > > devel@driverdev.osuosl.org; linux-fsdevel@vger.kernel.org
> > > Subject: Re: [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
> > > hex_dump_to_buffer with flags
> > >
> > > On Wed 2019-04-10 13:17:19, Alastair D'Silva wrote:
> > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > >
> > > > In order to support additional features in hex_dump_to_buffer,
> > > > replace the ascii bool parameter with flags.
> > > >
> > > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > > ---
> > > >  drivers/gpu/drm/i915/intel_engine_cs.c            |  2 +-
> > > >  drivers/isdn/hardware/mISDN/mISDNisar.c           |  6 ++++--
> > > >  drivers/mailbox/mailbox-test.c                    |  2 +-
> > > >  drivers/net/ethernet/amd/xgbe/xgbe-drv.c          |  2 +-
> > > >  drivers/net/ethernet/synopsys/dwc-xlgmac-common.c |  2 +-
> > > >  drivers/net/wireless/ath/ath10k/debug.c           |  3 ++-
> > > >  drivers/net/wireless/intel/iwlegacy/3945-mac.c    |  2 +-
> > > >  drivers/platform/chrome/wilco_ec/debugfs.c        |  3 ++-
> > > >  drivers/scsi/scsi_logging.c                       |  8 +++-----
> > > >  drivers/staging/fbtft/fbtft-core.c                |  2 +-
> > > >  fs/seq_file.c                                     |  3 ++-
> > > >  include/linux/printk.h                            |  2 +-
> > > >  lib/hexdump.c                                     | 15
++++++++-------
> > > >  lib/test_hexdump.c                                |  5 +++--
> > > >  14 files changed, 31 insertions(+), 26 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/intel_engine_cs.c
> > > > b/drivers/gpu/drm/i915/intel_engine_cs.c
> > > > index 49fa43ff02ba..fb133e729f9a 100644
> > > > --- a/drivers/gpu/drm/i915/intel_engine_cs.c
> > > > +++ b/drivers/gpu/drm/i915/intel_engine_cs.c
> > > > @@ -1318,7 +1318,7 @@ static void hexdump(struct drm_printer *m,
> > > > const
> > > void *buf, size_t len)
> > > >  		WARN_ON_ONCE(hex_dump_to_buffer(buf + pos, len -
> > > pos,
> > > >  						rowsize,
sizeof(u32),
> > > >  						line, sizeof(line),
> > > > -						false) >=
sizeof(line));
> > > > +						0) >= sizeof(line));
> > >
> > > It might be more clear when we define:
> > >
> > > #define HEXDUMP_BINARY 0
> >
> > This feels unnecessary, and weird. Omitting the flag won't disable the
> > hex output (as expected), and if you don't want hex output why call
> > hexdump in the first place?
> 
> Why do we have HEXDUMP_ASCII then?
> Why is the above funtion not using HEXDUMP_ASCII?
> Who would call it with (HEXDUMP_ASCII | HEXDUMP_BINARY)?

The ASCII flag controls the optional ASCII output, and replaces the boolean
that existed prior. A user would enable it in the same situations where they
currently pass true for the ascii parameter.

In the above example the author only wants the hex output, while in other
situations, both hex & ASCII output is desirable. If you just want ASCII
output, the caller should just use a printk or one of it's wrappers.

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
