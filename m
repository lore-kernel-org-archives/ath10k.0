Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMF2Z-0001My-1C
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:12:44 +0000
Received: by mail-lf0-x236.google.com with SMTP id c192so26225581lfe.2
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:12:21 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: add basic hostq support
Date: Thu, 21 Jan 2016 14:13:22 +0100
Message-Id: <1453382007-24622-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
References: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
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

There's a new firmware feature which uses a shared
DMA memory so host can share it's per-sta per-tid
queue size which is then subsequently used for
firmware to assist in deciding which frames to put
on the intermediate host-device tx queue.

This patchset adds only basic support to make
the firmware supporting the feature happy and
running at all. Without it firmware would freeze
shortly after booting.

More patches will follow some time later to add
the "new data path" logic.


v2:
 * fix gfp allocation [Ben]


Michal Kazior (5):
  ath10k: rename some HTT events
  ath10k: add new htt definitions
  ath10k: add new FW_FEATURE_PEER_FLOW_CONTROL
  ath10k: clean up cont frag desc init code
  ath10k: implement basic support for new tx path firmware

 drivers/net/wireless/ath/ath10k/core.c   |   1 +
 drivers/net/wireless/ath/ath10k/core.h   |   9 ++
 drivers/net/wireless/ath/ath10k/htt.c    |   8 +-
 drivers/net/wireless/ath/ath10k/htt.h    | 169 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/htt_rx.c |   8 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 146 +++++++++++++++++++++-----
 6 files changed, 302 insertions(+), 39 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
