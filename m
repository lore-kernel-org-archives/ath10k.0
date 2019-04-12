Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwmb-0002Eu-FF
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 14:03:59 +0000
Date: Fri, 12 Apr 2019 16:03:53 +0200
From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 2/4] lib/hexdump.c: Optionally suppress lines of filler
 bytes
Message-ID: <20190412140353.mgvksn3yk6n65hbk@pathway.suse.cz>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-3-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410031720.11067-3-alastair@au1.ibm.com>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, alastair@d-silva.org, intel-gfx@lists.freedesktop.org, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Wed 2019-04-10 13:17:18, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Some buffers may only be partially filled with useful data, while the rest
> is padded (typically with 0x00 or 0xff).
> 
> This patch introduces flags which allow lines of padding bytes to be
> suppressed, making the output easier to interpret: HEXDUMP_SUPPRESS_0X00,
> HEXDUMP_SUPPRESS_0XFF
> 
> The first and last lines are not suppressed by default, so the function
> always outputs something. This behaviour can be further controlled with
> the HEXDUMP_SUPPRESS_FIRST & HEXDUMP_SUPPRESS_LAST flags.
> 
> An inline wrapper function is provided for backwards compatibility with
> existing code, which maintains the original behaviour.
> 

> diff --git a/lib/hexdump.c b/lib/hexdump.c
> index b8a164814744..2f3bafb55a44 100644
> --- a/lib/hexdump.c
> +++ b/lib/hexdump.c
> +void print_hex_dump_ext(const char *level, const char *prefix_str,
> +			int prefix_type, int rowsize, int groupsize,
> +			const void *buf, size_t len, u64 flags)
>  {
>  	const u8 *ptr = buf;
> -	int i, linelen, remaining = len;
> +	int i, remaining = len;
>  	unsigned char linebuf[64 * 3 + 2 + 64 + 1];
> +	bool first_line = true;
>  
>  	if (rowsize != 16 && rowsize != 32 && rowsize != 64)
>  		rowsize = 16;
>  
>  	for (i = 0; i < len; i += rowsize) {
> -		linelen = min(remaining, rowsize);
> +		bool skip = false;
> +		int linelen = min(remaining, rowsize);
> +
>  		remaining -= rowsize;
>  
> +		if (flags & HEXDUMP_SUPPRESS_0X00)
> +			skip = buf_is_all(ptr + i, linelen, 0x00);
> +
> +		if (!skip && (flags & HEXDUMP_SUPPRESS_0XFF))
> +			skip = buf_is_all(ptr + i, linelen, 0xff);
> +
> +		if (first_line && !(flags & HEXDUMP_SUPPRESS_FIRST))
> +			skip = false;
> +
> +		if (remaining <= 0 && !(flags & HEXDUMP_SUPPRESS_LAST))
> +			skip = false;
> +
> +		if (skip)
> +			continue;

IMHO, quietly skipping lines could cause a lot of confusion,
espcially when the address is not printed.

I wonder how it would look like when we print something like:

    --- skipped XX lines full of 0x00 ---

Then we might even remove the SUPPRESS_FIRST, SUPPRESS_LAST
and the ambiguous QUIET flags.

> +
> +		first_line = false;

This should be above the if (skip).

> +
>  		hex_dump_to_buffer(ptr + i, linelen, rowsize, groupsize,
> -				   linebuf, sizeof(linebuf), ascii);
> +				   linebuf, sizeof(linebuf),
> +				   flags & HEXDUMP_ASCII);
>  
>  		switch (prefix_type) {
>  		case DUMP_PREFIX_ADDRESS:
> @@ -272,7 +316,7 @@ void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
>  		}
>  	}
>  }
> -EXPORT_SYMBOL(print_hex_dump);
> +EXPORT_SYMBOL(print_hex_dump_ext);

We should still export even the original function that
is still used everywhere.

Best Regards,
Petr

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
