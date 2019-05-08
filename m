Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOIk2-0005Ps-M9
 for ath10k@lists.infradead.org; Wed, 08 May 2019 09:20:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Date: Wed, 8 May 2019 09:19:51 +0000
Message-ID: <c98a499a4e824bcd824d5ad53d037c67@AcuMS.aculab.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-5-alastair@au1.ibm.com>
In-Reply-To: <20190508070148.23130-5-alastair@au1.ibm.com>
Content-Language: en-US
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
To: 'Alastair D'Silva' <alastair@au1.ibm.com>, "alastair@d-silva.org" <alastair@d-silva.org>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

From: Alastair D'Silva
> Sent: 08 May 2019 08:02
> To: alastair@d-silva.org
...
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -480,13 +480,13 @@ enum {
>  	DUMP_PREFIX_OFFSET
>  };
> 
> -extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
> -			      int groupsize, char *linebuf, size_t linebuflen,
> -			      bool ascii);
> -
>  #define HEXDUMP_ASCII			(1 << 0)
>  #define HEXDUMP_SUPPRESS_REPEATED	(1 << 1)

These ought to be BIT(0) and BIT(1)

> +extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
> +			      int groupsize, char *linebuf, size_t linebuflen,
> +			      u64 flags);

Why 'u64 flags' ?
How many flags do you envisage ??
Your HEXDUMP_ASCII (etc) flags are currently signed values and might
get sign extended causing grief.
'unsigned int flags' is probably sufficient.

I've not really looked at the code, it seems OTT in places though.

If someone copies it somewhere where the performance matters
(I've user space code which is dominated by its tracing!)
then you don't want all the function calls and conditionals
even if you want some of the functionality.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
