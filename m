Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ushosting.nmnhosting.com ([66.55.73.32])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hfwjs-0004mW-NV
 for ath10k@lists.infradead.org; Wed, 26 Jun 2019 01:28:46 +0000
Message-ID: <ef3aac0cb37fd7bb421db313e839809fd7649d05.camel@d-silva.org>
Subject: Re: [PATCH v4 5/7] lib/hexdump.c: Allow multiple groups to be
 separated by lines '|'
From: "Alastair D'Silva" <alastair@d-silva.org>
Date: Wed, 26 Jun 2019 11:28:01 +1000
In-Reply-To: <c364c36338d385eba60c523828ad8995c792ae4d.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-6-alastair@au1.ibm.com>
 <c364c36338d385eba60c523828ad8995c792ae4d.camel@perches.com>
MIME-Version: 1.0
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
To: Joe Perches <joe@perches.com>
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@ACULAB.COM>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Mon, 2019-06-24 at 22:37 -0700, Joe Perches wrote:
> On Tue, 2019-06-25 at 13:17 +1000, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > With the wider display format, it can become hard to identify how
> > many
> > bytes into the line you are looking at.
> > 
> > The patch adds new flags to hex_dump_to_buffer() and
> > print_hex_dump() to
> > print vertical lines to separate every N groups of bytes.
> > 
> > eg.
> > buf:00000000: 454d414e 43415053|4e495f45
> > 00584544  NAMESPAC|E_INDEX.
> > buf:00000010: 00000000 00000002|00000000
> > 00000000  ........|........
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >  include/linux/printk.h |  3 +++
> >  lib/hexdump.c          | 59 ++++++++++++++++++++++++++++++++++++
> > ------
> >  2 files changed, 54 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> []
> > @@ -485,6 +485,9 @@ enum {
> >  
> >  #define HEXDUMP_ASCII			BIT(0)
> >  #define HEXDUMP_SUPPRESS_REPEATED	BIT(1)
> > +#define HEXDUMP_2_GRP_LINES		BIT(2)
> > +#define HEXDUMP_4_GRP_LINES		BIT(3)
> > +#define HEXDUMP_8_GRP_LINES		BIT(4)
> 
> These aren't really bits as only one value should be set
> as 8 overrides 4 and 4 overrides 2.

This should be the other way around, as we should be emitting alternate
seperators based on the smallest grouping (2 implies 4 and 8, and 4
implies 8). I'll fix the logic.

I can't come up with a better way to represent these without making the
API more complex, if you have a suggestion, I'm happy to hear it.

> 
> I would also expect this to be a value of 2 in your above
> example, rather than 8.  It's described as groups not bytes.
> 
> The example is showing a what would normally be a space ' '
> separator as a vertical bar '|' every 2nd grouping.
> 

The above example shows a group size of 4 bytes, and
HEXDUMP_2_GRP_LINES set, with 2 groups being 8 bytes.

I'll make that clearer in the commit message.

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva    
Twitter: @EvilDeece
blog: http://alastair.d-silva.org



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
