Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Acp-0001dA-RY
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 03:13:45 +0000
Date: Fri, 22 Mar 2019 02:59:52 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_pdev_ctl_failsafe_check_event()
 can be static
Message-ID: <20190321185952.GA110059@lkp-hsx03>
References: <201903220231.XMGhENMe%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201903220231.XMGhENMe%lkp@intel.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org


Fixes: 886785f92306 ("ath11k: fix acs survey")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 18f441e..e95ad6c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5609,8 +5609,8 @@ void ath11k_update_stats_event(struct ath11k_base *ab, u8 *evt_buf, u32 len)
 /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the frequency scanned
  * is not part of BDF CTL(Conformance test limits) table entries.
  */
-void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt_buf,
-					  u32 len)
+static void ath11k_pdev_ctl_failsafe_check_event(struct ath11k_base *ab, u8 *evt_buf,
+						 u32 len)
 {
 	const void **tb;
 	const struct wmi_pdev_ctl_failsafe_chk_event *ev;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
