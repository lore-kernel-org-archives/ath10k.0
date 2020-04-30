Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 00/15] gcc-10 warning fixes
Date: Thu, 30 Apr 2020 23:30:42 +0200
Message-Id: <20200430213101.135134-1-arnd@arndb.de>
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
To: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, Bob Copeland <me@bobcopeland.com>, Alexei Starovoitov <ast@kernel.org>, Amitkumar Karwar <amitkarwar@gmail.com>, netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, linux-scsi@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, James Smart <james.smart@broadcom.com>, ath10k@lists.infradead.org, coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jens Axboe <axboe@fb.com>, linux-nvme@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Neil Horman <nhorman@tuxdriver.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-karma-devel@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Here are a couple of fixes for warnings introduced with gcc-10.
If you wish to reproduce these, you can find the compiler I used
at [1].

If you like the fixes, please apply them directly into maintainer
trees. I expect that we will also need them to be backported
into stable kernels later.

I disabled -Wrestrict on gcc in my local test tree, but with
the patches from this series and the ones I have already sent,
I see no gcc-10 specific warnings in linux-next when doing
many randconfig builds for arm/arm64/x86.

      Arnd

Arnd Bergmann (15):
  crypto - Avoid free() namespace collision
  iwlwifi: mvm: fix gcc-10 zero-length-bounds warning
  mwifiex: avoid -Wstringop-overflow warning
  ath10k: fix gcc-10 zero-length-bounds warnings
  bpf: avoid gcc-10 stringop-overflow warning
  netfilter: conntrack: avoid gcc-10 zero-length-bounds warning
  drop_monitor: work around gcc-10 stringop-overflow warning
  usb: ehci: avoid gcc-10 zero-length-bounds warning
  udf: avoid gcc-10 zero-length-bounds warnings
  hpfs: avoid gcc-10 zero-length-bounds warning
  omfs: avoid gcc-10 stringop-overflow warning
  media: s5k5baf: avoid gcc-10 zero-length-bounds warning
  scsi: sas: avoid gcc-10 zero-length-bounds warning
  isci: avoid gcc-10 zero-length-bounds warning
  nvme: avoid gcc-10 zero-length-bounds warning

 crypto/lrw.c                                  |  6 +--
 crypto/xts.c                                  |  6 +--
 drivers/media/i2c/s5k5baf.c                   |  4 +-
 drivers/net/wireless/ath/ath10k/htt.h         |  4 +-
 .../net/wireless/intel/iwlwifi/fw/api/tx.h    | 14 +++----
 .../net/wireless/marvell/mwifiex/sta_cmd.c    | 39 ++++++++-----------
 drivers/nvme/host/fc.c                        |  2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c            |  4 +-
 drivers/scsi/isci/task.h                      |  7 ++--
 drivers/scsi/libsas/sas_task.c                |  3 +-
 fs/hpfs/anode.c                               |  7 +++-
 fs/omfs/file.c                                | 12 +++---
 fs/omfs/omfs_fs.h                             |  2 +-
 fs/udf/ecma_167.h                             |  2 +-
 fs/udf/super.c                                |  2 +-
 include/linux/filter.h                        |  6 +--
 include/linux/usb/ehci_def.h                  | 12 ++++--
 include/net/netfilter/nf_conntrack.h          |  2 +-
 net/core/drop_monitor.c                       | 11 ++++--
 net/netfilter/nf_conntrack_core.c             |  4 +-
 20 files changed, 76 insertions(+), 73 deletions(-)

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10.0.20200413/

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Intel Linux Wireless <linuxwifi@intel.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>
Cc: James Smart <james.smart@broadcom.com>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: Bob Copeland <me@bobcopeland.com>
Cc: Jan Kara <jack@suse.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Neil Horman <nhorman@tuxdriver.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-nvme@lists.infradead.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-karma-devel@lists.sourceforge.net
Cc: bpf@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
Cc: coreteam@netfilter.org



-- 
2.26.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
