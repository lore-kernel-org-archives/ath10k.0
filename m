Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxQF-0006b7-Pn
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:57:13 +0000
Received: by lbblx11 with SMTP id lx11so53748573lbb.3
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 06:56:46 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/9] ath10k: cleanups 2015-03-20
Date: Fri, 20 Mar 2015 13:54:06 +0000
Message-Id: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
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

Hi,

Here's a bunch of cleanups and fixes associated
with tx/rx rate code.

Feel free to squash some of the patches if you
think it makes sense or let me know which ones you
want me to squash.

There are a few checkpatch warnings for going over
80 chars. I decided to leave them be to avoid code
wrapping which would make the code less readable
than it is now in my opinion.

I have 2 more patches for .set_bitrate_mask()
callback which depend on this patchset. Once you
apply this patchset to your `pending` branch let
me know, please, so I can push the rest with git
indexes your git repo will recognize.


Michal Kazior (9):
  ath10k: move rate definitions to file start
  ath10k: derive rate from bitrate
  ath10k: drop RATETAB_ENT macro
  ath10k: add hw rate definitions
  ath10k: use hw rate definitions for fixed rate
  ath10k: simplify fixed rate selection
  ath10k: rework legacy rx rate decoding
  ath10k: deduplicate bitrate to rate idx conversion
  ath10k: document ofdm/5ghz rate offset with a macro

 drivers/net/wireless/ath/ath10k/htt.h     |   1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  64 ++----------
 drivers/net/wireless/ath/ath10k/hw.h      |  21 ++++
 drivers/net/wireless/ath/ath10k/mac.c     | 161 ++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/mac.h     |   5 +
 drivers/net/wireless/ath/ath10k/rx_desc.h |  22 ++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  62 +-----------
 7 files changed, 163 insertions(+), 173 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
