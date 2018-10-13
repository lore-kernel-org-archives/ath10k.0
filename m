Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8DX-0001Lc-DG
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 00:55:47 +0000
Received: by mail-pg1-x542.google.com with SMTP id f8-v6so6573084pgq.5
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 17:55:33 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/4] ath10k: snoc: relax voltage requirements
Date: Fri, 12 Oct 2018 17:55:03 -0700
Message-Id: <20181013005504.46399-3-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
References: <20181013005504.46399-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

I rarely see drivers specify precise voltage requirements like this, but
if we really have to...let's at least give a little wiggle room. Board
designs (and accompanying device trees) may not provide exactly the
voltage listed here, and we shouldn't fail to probe just because of
this.

Round these ranges down to the nearest volt, and provide a 0.05V margin.
The regulator should provide its own supported ranges, which will
helpfully intersect with these ranges.

I would just as well remove these ranges entirely, but if I understand
correctly, there's some reason that QCOM SoC's like to set zero /
non-zero voltages.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b63ae8b006b4..5a8e87339df2 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -47,10 +47,10 @@ static char *const ce_name[] = {
 };
 
 static struct ath10k_vreg_info vreg_cfg[] = {
-	{NULL, "vdd-0.8-cx-mx", 800000, 800000, 0, 0, false},
-	{NULL, "vdd-1.8-xo", 1800000, 1800000, 0, 0, false},
-	{NULL, "vdd-1.3-rfa", 1304000, 1304000, 0, 0, false},
-	{NULL, "vdd-3.3-ch0", 3312000, 3312000, 0, 0, false},
+	{NULL, "vdd-0.8-cx-mx", 800000, 850000, 0, 0, false},
+	{NULL, "vdd-1.8-xo", 1800000, 1850000, 0, 0, false},
+	{NULL, "vdd-1.3-rfa", 1300000, 1350000, 0, 0, false},
+	{NULL, "vdd-3.3-ch0", 3300000, 3350000, 0, 0, false},
 };
 
 static struct ath10k_clk_info clk_cfg[] = {
-- 
2.19.1.331.ge82ca0e54c-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
