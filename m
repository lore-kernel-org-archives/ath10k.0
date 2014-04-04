Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2WS-0006tP-00
 for ath10k@lists.infradead.org; Fri, 04 Apr 2014 11:43:01 +0000
Received: by mail-wg0-f52.google.com with SMTP id k14so3267890wgh.11
 for <ath10k@lists.infradead.org>; Fri, 04 Apr 2014 04:42:38 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/2] ath10k: fix radar/cac
Date: Fri,  4 Apr 2014 13:28:44 +0200
Message-Id: <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
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

This loosely depends on `ath10k: refactor monitor
code`. Without it patch this patchset introduces
some (harmless) runtime warnings.

This v2 introduces a non-functional patch to avoid
forward declaration. The [1/2] has a little
conflict with `ath10k: refactor monitor code`
which renames ath10k_monitor_stop() to
ath10k_monitor_vdev_stop().

Part of the original CAC problem is also addressed
in `mac80211: fix radar_enabled propagation`.


Michal Kazior (2):
  ath10k: reorder functions
  ath10k: refactor radar detection code

 drivers/net/wireless/ath/ath10k/core.h |   4 +
 drivers/net/wireless/ath/ath10k/mac.c  | 224 +++++++++++++++------------------
 2 files changed, 106 insertions(+), 122 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
