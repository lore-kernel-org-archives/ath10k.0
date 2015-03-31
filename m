Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yctmw-0008FH-8p
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 10:52:55 +0000
Received: by lbbug6 with SMTP id ug6so9332005lbb.3
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 03:52:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/2] ath10k: improve set_bitrate_mask
Date: Tue, 31 Mar 2015 10:49:19 +0000
Message-Id: <1427798961-7334-1-git-send-email-michal.kazior@tieto.com>
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

v2:
 * fix ouf-of-bounds
 * rebased to master branch + multi-channel patches

This will not apply cleanly without multi-channel
support and conflict resolution will be
non-trivial.


Michal Kazior (2):
  ath10k: clean up set_bitrate_mask handling
  ath10k: implement more versatile set_bitrate_mask

 drivers/net/wireless/ath/ath10k/core.h |   4 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 708 +++++++++++++++++++--------------
 2 files changed, 421 insertions(+), 291 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
