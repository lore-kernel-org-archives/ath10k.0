Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExSe-0003eL-Ae
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 14:47:25 +0000
Subject: Re: [Intel-gfx] [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-4-alastair@au1.ibm.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <929244ed-cc7f-b0f3-b5ac-50e798e83188@linux.intel.com>
Date: Fri, 12 Apr 2019 15:47:14 +0100
MIME-Version: 1.0
In-Reply-To: <20190410031720.11067-4-alastair@au1.ibm.com>
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>


On 10/04/2019 04:17, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> In order to support additional features in hex_dump_to_buffer, replace
> the ascii bool parameter with flags.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   drivers/gpu/drm/i915/intel_engine_cs.c            |  2 +-
>   drivers/isdn/hardware/mISDN/mISDNisar.c           |  6 ++++--
>   drivers/mailbox/mailbox-test.c                    |  2 +-
>   drivers/net/ethernet/amd/xgbe/xgbe-drv.c          |  2 +-
>   drivers/net/ethernet/synopsys/dwc-xlgmac-common.c |  2 +-
>   drivers/net/wireless/ath/ath10k/debug.c           |  3 ++-
>   drivers/net/wireless/intel/iwlegacy/3945-mac.c    |  2 +-
>   drivers/platform/chrome/wilco_ec/debugfs.c        |  3 ++-
>   drivers/scsi/scsi_logging.c                       |  8 +++-----
>   drivers/staging/fbtft/fbtft-core.c                |  2 +-
>   fs/seq_file.c                                     |  3 ++-
>   include/linux/printk.h                            |  2 +-
>   lib/hexdump.c                                     | 15 ++++++++-------
>   lib/test_hexdump.c                                |  5 +++--
>   14 files changed, 31 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_engine_cs.c b/drivers/gpu/drm/i915/intel_engine_cs.c
> index 49fa43ff02ba..fb133e729f9a 100644
> --- a/drivers/gpu/drm/i915/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/intel_engine_cs.c
> @@ -1318,7 +1318,7 @@ static void hexdump(struct drm_printer *m, const void *buf, size_t len)
>   		WARN_ON_ONCE(hex_dump_to_buffer(buf + pos, len - pos,
>   						rowsize, sizeof(u32),
>   						line, sizeof(line),
> -						false) >= sizeof(line));
> +						0) >= sizeof(line));
>   		drm_printf(m, "[%04zx] %s\n", pos, line);
>   
>   		prev = buf + pos;

i915 code here actually does something I think is more interesting than
HEXDUMP_SUPPRESS_0X**. It replaces any N repeating lines with a single star
marker. For example:

    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    *
    00000040 00000001 00000000 00000018 00000002 00000001 00000000 00000018 00000000
    00000060 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000003
    00000080 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    *
    000000c0 00000002 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    000000e0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    *

If or when you end up with this feature in your series you can therefore
replace the whole implementation of hexdump in the above file.

Regards,

Tvrtko

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
