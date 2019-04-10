Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE8yk-0004R4-Ki
 for ath10k@lists.infradead.org; Wed, 10 Apr 2019 08:53:12 +0000
Received: by mail-pf1-x443.google.com with SMTP id b3so1069090pfd.1
 for <ath10k@lists.infradead.org>; Wed, 10 Apr 2019 01:53:09 -0700 (PDT)
Date: Wed, 10 Apr 2019 17:53:05 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH 4/4] lib/hexdump.c: Allow multiple groups to be separated
 by lines '|'
Message-ID: <20190410085305.GA4937@jagdpanzerIV>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410031720.11067-5-alastair@au1.ibm.com>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, alastair@d-silva.org, intel-gfx@lists.freedesktop.org, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On (04/10/19 13:17), Alastair D'Silva wrote:
> With the wider display format, it can become hard to identify how many
> bytes into the line you are looking at.
> 
> The patch adds new flags to hex_dump_to_buffer() and print_hex_dump() to
> print vertical lines to separate every N groups of bytes.
> 
> eg.
> buf:00000000: 454d414e 43415053|4e495f45 00584544  NAMESPAC|E_INDEX.
> buf:00000010: 00000000 00000002|00000000 00000000  ........|........

What if the output had |-s in it?  |||||||||

	-ss

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
