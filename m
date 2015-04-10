Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgZ1T-0001qk-5I
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 13:31:04 +0000
Received: by layy10 with SMTP id y10so13319467lay.0
 for <ath10k@lists.infradead.org>; Fri, 10 Apr 2015 06:30:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: ibss crypto fixes
Date: Fri, 10 Apr 2015 13:23:19 +0000
Message-Id: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
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

I've mainly tested this on kvalo/pending branch.
Currently master branch contains 0f611d28fc2e
("mac80211: count interfaces correctly for
combination checks") which breaks IBSS in
wpa_supplicant due to P2P Device and interface
combinations. This has been pointed out in the
following thread:

 [1]: http://thread.gmane.org/gmane.linux.kernel.wireless.general/135570/focus=136643

If someone's interested in running ath10k IBSS
make sure to use kernel prior to 4.0, revert the
mentioned mac80211 patch or apply wpa_supplicant
workaround patch from [1].


Janusz Dziedzic (1):
  ath10k: enable ibss-rsn

Michal Kazior (3):
  ath10k: don't use reassoc flag
  ath10k: fix multiple key static wep with ibss
  ath10k: set def key idx for ibss

 drivers/net/wireless/ath/ath10k/mac.c | 44 +++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
