Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9XX2-0006TH-Aa
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 11:15:09 +0000
Received: by mail-wi0-f176.google.com with SMTP id ex7so1566595wid.3
 for <ath10k@lists.infradead.org>; Fri, 09 Jan 2015 03:14:45 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 0/8] ath10k: add multi-channel support
Date: Fri,  9 Jan 2015 12:14:01 +0100
Message-Id: <1420802049-11962-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

New wmi-tlv firmware and new hardware will support
multi-channel operation.

This prepares the driver by implementing chanctx,
improves tx queue locking and introduces initial
interface combinations.

I'm posting this as an RFC first because I'd like
to get some early feedback (if possible) while I
upstream other patches this patchset is basing on.


Michal Kazior (8):
  ath10k: defer AP self-peer removal wait
  ath10k: allow empty ssid vdev config
  ath10k: implement chanctx API
  ath10k: implement adaptive qcs command
  ath10k: protect ar->arvifs linking with data_lock
  ath10k: rework tx queue locking
  ath10k: implement tx pause wmi event
  ath10k: add proper wmi-tlv combinations

 drivers/net/wireless/ath/ath10k/core.c    |   1 +
 drivers/net/wireless/ath/ath10k/core.h    |  16 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  80 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c  |   9 +-
 drivers/net/wireless/ath/ath10k/mac.c     | 692 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/mac.h     |  57 +++
 drivers/net/wireless/ath/ath10k/txrx.c    |   6 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  16 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 118 ++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  46 ++
 drivers/net/wireless/ath/ath10k/wmi.c     |  18 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |   1 +
 12 files changed, 975 insertions(+), 85 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
