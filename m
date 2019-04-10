Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7CK-0003Lt-Bn
 for ath10k@lists.infradead.org; Wed, 10 Apr 2019 06:59:05 +0000
Date: Wed, 10 Apr 2019 09:56:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Message-ID: <20190410065627.GF6095@kadam>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-4-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410031720.11067-4-alastair@au1.ibm.com>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, alastair@d-silva.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Wed, Apr 10, 2019 at 01:17:19PM +1000, Alastair D'Silva wrote:
> @@ -107,7 +108,7 @@ EXPORT_SYMBOL(bin2hex);
>   * string if enough space had been available.
>   */
>  int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int groupsize,
> -		       char *linebuf, size_t linebuflen, bool ascii)
> +		       char *linebuf, size_t linebuflen, u64 flags)
>  {
>  	const u8 *ptr = buf;
>  	int ngroups;
> @@ -184,7 +185,7 @@ int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int groupsize,
>  		if (j)
>  			lx--;
>  	}
> -	if (!ascii)
> +	if (!flags & HEXDUMP_ASCII)
            ^^^^^^^^^^^^^^^^^^^^^^
This is a precedence bug.  It should be if (!(flags & HEXDUMP_ASCII)).


>  		goto nil;
>  

regards,
dan carpenter



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
