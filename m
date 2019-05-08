Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOIee-0003QG-Sq
 for ath10k@lists.infradead.org; Wed, 08 May 2019 09:14:26 +0000
Date: Wed, 8 May 2019 11:14:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Message-ID: <20190508091419.GA1615@kroah.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508070148.23130-5-alastair@au1.ibm.com>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, alastair@d-silva.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@aculab.com>, Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Wed, May 08, 2019 at 05:01:44PM +1000, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> In order to support additional features in hex_dump_to_buffer, replace
> the ascii bool parameter with flags.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/gpu/drm/i915/intel_engine_cs.c            |  2 +-
>  drivers/isdn/hardware/mISDN/mISDNisar.c           |  6 ++++--
>  drivers/mailbox/mailbox-test.c                    |  2 +-
>  drivers/net/ethernet/amd/xgbe/xgbe-drv.c          |  2 +-
>  drivers/net/ethernet/synopsys/dwc-xlgmac-common.c |  2 +-
>  drivers/net/wireless/ath/ath10k/debug.c           |  3 ++-
>  drivers/net/wireless/intel/iwlegacy/3945-mac.c    |  2 +-
>  drivers/platform/chrome/wilco_ec/debugfs.c        |  2 +-
>  drivers/scsi/scsi_logging.c                       |  8 +++-----
>  drivers/staging/fbtft/fbtft-core.c                |  2 +-
>  fs/seq_file.c                                     |  3 ++-
>  include/linux/printk.h                            |  8 ++++----
>  lib/hexdump.c                                     | 15 ++++++++-------
>  lib/test_hexdump.c                                |  5 +++--
>  14 files changed, 33 insertions(+), 29 deletions(-)

For staging stuff:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
