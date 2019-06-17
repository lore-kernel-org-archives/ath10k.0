Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH v3 2/7] lib/hexdump.c: Relax rowsize checks in
 hex_dump_to_buffer
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <20190617020430.8708-3-alastair@au1.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <94413756-c927-a4ca-dd59-47e3cc87d58d@infradead.org>
Date: Mon, 17 Jun 2019 15:47:03 -0700
MIME-Version: 1.0
In-Reply-To: <20190617020430.8708-3-alastair@au1.ibm.com>
Content-Language: en-US
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
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@ACULAB.COM>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

Hi,
Just a comment style nit below...

On 6/16/19 7:04 PM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch removes the hardcoded row limits and allows for
> other lengths. These lengths must still be a multiple of
> groupsize.
> 
> This allows structs that are not 16/32 bytes to display on
> a single line.
> 
> This patch also expands the self-tests to test row sizes
> up to 64 bytes (though they can now be arbitrarily long).
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  lib/hexdump.c      | 48 ++++++++++++++++++++++++++++--------------
>  lib/test_hexdump.c | 52 ++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 75 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/hexdump.c b/lib/hexdump.c
> index 81b70ed37209..3943507bc0e9 100644
> --- a/lib/hexdump.c
> +++ b/lib/hexdump.c

> @@ -246,17 +248,29 @@ void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
>  {
>  	const u8 *ptr = buf;
>  	int i, linelen, remaining = len;
> -	unsigned char linebuf[32 * 3 + 2 + 32 + 1];
> +	unsigned char *linebuf;
> +	unsigned int linebuf_len;
>  
> -	if (rowsize != 16 && rowsize != 32)
> -		rowsize = 16;
> +	if (rowsize % groupsize)
> +		rowsize -= rowsize % groupsize;
> +
> +	/* Worst case line length:
> +	 * 2 hex chars + space per byte in, 2 spaces, 1 char per byte in, NULL
> +	 */

According to Documentation/process/coding-style.rst:

The preferred style for long (multi-line) comments is:

.. code-block:: c

	/*
	 * This is the preferred style for multi-line
	 * comments in the Linux kernel source code.
	 * Please use it consistently.
	 *
	 * Description:  A column of asterisks on the left side,
	 * with beginning and ending almost-blank lines.
	 */


except in networking software.


> +	linebuf_len = rowsize * 3 + 2 + rowsize + 1;
> +	linebuf = kzalloc(linebuf_len, GFP_KERNEL);
> +	if (!linebuf) {
> +		printk("%s%shexdump: Could not alloc %u bytes for buffer\n",
> +			level, prefix_str, linebuf_len);
> +		return;
> +	}


-- 
~Randy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
