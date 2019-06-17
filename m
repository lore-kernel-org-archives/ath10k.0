Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hch2x-0005z3-C4
 for ath10k@lists.infradead.org; Mon, 17 Jun 2019 02:07:02 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H26r8b011801
 for <ath10k@lists.infradead.org>; Sun, 16 Jun 2019 22:06:57 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5vdd7gpn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ath10k@lists.infradead.org>; Sun, 16 Jun 2019 22:06:57 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ath10k@lists.infradead.org> from <alastair@au1.ibm.com>;
 Mon, 17 Jun 2019 03:06:51 +0100
From: "Alastair D'Silva" <alastair@au1.ibm.com>
Subject: [PATCH v3 0/7] Hexdump Enhancements
Date: Mon, 17 Jun 2019 12:04:23 +1000
MIME-Version: 1.0
Message-Id: <20190617020430.8708-1-alastair@au1.ibm.com>
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
To: alastair@d-silva.org
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@ACULAB.COM>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

From: Alastair D'Silva <alastair@d-silva.org>

Apologies for the large CC list, it's a heads up for those responsible
for subsystems where a prototype change in generic code causes a change
in those subsystems.

This series enhances hexdump.

These improve the readability of the dumped data in certain situations
(eg. wide terminals are available, many lines of empty bytes exist, etc).

The default behaviour of hexdump is unchanged, however, the prototype
for hex_dump_to_buffer() has changed, and print_hex_dump() has been
renamed to print_hex_dump_ext(), with a wrapper replacing it for
compatibility with existing code, which would have been too invasive to
change.

Hexdump selftests have be run & confirmed passed.

Changelog:
V3:
 - Fix inline documention
 - use BIT macros
 - use u32 rather than u64 for flags
V2:
 - Fix failing selftests
 - Fix precedence bug in 'Replace ascii bool in hex_dump_to_buffer...'
 - Remove hardcoded new lengths & instead relax the checks in
   hex_dump_to_buffer, allocating the buffer from the heap instead of the
   stack.
 - Replace the skipping of lines of 0x00/0xff with skipping lines of
   repeated characters, announcing what has been skipped.
 - Add spaces as an optional N-group separator
 - Allow byte ordering to be maintained when HEXDUMP_RETAIN_BYTE_ORDERING
   is set.
 - Updated selftests to cover 'Relax rowsize checks' &
   'Optionally retain byte ordering'

Alastair D'Silva (7):
  lib/hexdump.c: Fix selftests
  lib/hexdump.c: Relax rowsize checks in hex_dump_to_buffer
  lib/hexdump.c: Optionally suppress lines of repeated bytes
  lib/hexdump.c: Replace ascii bool in hex_dump_to_buffer with flags
  lib/hexdump.c: Allow multiple groups to be separated by lines '|'
  lib/hexdump.c: Allow multiple groups to be separated by spaces
  lib/hexdump.c: Optionally retain byte ordering

 drivers/gpu/drm/i915/intel_engine_cs.c        |   2 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c       |   6 +-
 drivers/mailbox/mailbox-test.c                |   2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      |   2 +-
 .../net/ethernet/synopsys/dwc-xlgmac-common.c |   2 +-
 drivers/net/wireless/ath/ath10k/debug.c       |   3 +-
 .../net/wireless/intel/iwlegacy/3945-mac.c    |   2 +-
 drivers/platform/chrome/wilco_ec/debugfs.c    |   2 +-
 drivers/scsi/scsi_logging.c                   |   8 +-
 drivers/staging/fbtft/fbtft-core.c            |   2 +-
 fs/seq_file.c                                 |   3 +-
 include/linux/printk.h                        |  34 ++-
 lib/hexdump.c                                 | 260 +++++++++++++++---
 lib/test_hexdump.c                            | 146 +++++++---
 14 files changed, 372 insertions(+), 102 deletions(-)

-- 
2.21.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
