Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaORL-0003oZ-JI
 for ath10k@lists.infradead.org; Tue, 24 Mar 2015 13:00:19 +0000
Received: by lbcmq2 with SMTP id mq2so29993902lbc.0
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2015 05:59:53 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: improve set_bitrate_mask
Date: Tue, 24 Mar 2015 12:57:14 +0000
Message-Id: <1427201836-7741-1-git-send-email-michal.kazior@tieto.com>
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

This makes set_bitrate_mask more flexible by
allowing more than applying simple single rate or
max nss limits.

This still isn't ideal and VHT MCSs can't be set
separately (only a few range-options are allowed).

This depends on:
 * ath10k: add multi-channel support
 * ath10k: cleanups 2015-03-20

Based on:
 * Kalle's pending branch + multi-channel support

This will not apply cleanly without multi-channel
support and conflict resolution will be
non-trivial.

Michal Kazior (2):
  ath10k: clean up set_bitrate_mask handling
  ath10k: implement more versatile set_bitrate_mask

 drivers/net/wireless/ath/ath10k/core.h |   4 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 705 +++++++++++++++++++--------------
 2 files changed, 419 insertions(+), 290 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
