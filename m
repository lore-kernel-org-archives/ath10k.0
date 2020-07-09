Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtYNQ-0006pm-G5
 for ath10k@lists.infradead.org; Thu, 09 Jul 2020 15:22:21 +0000
Received: by mail-pf1-x441.google.com with SMTP id j20so1163015pfe.5
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2020 08:22:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/2] ath10k: Get rid of "per_ce_irq" hw param
Date: Thu,  9 Jul 2020 08:21:05 -0700
Message-Id: <20200709082024.v2.2.I083faa4e62e69f863311c89ae5eb28ec5a229b70@changeid>
In-Reply-To: <20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
References: <20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
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
To: kvalo@codeaurora.org, ath10k@lists.infradead.org
Cc: saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, pillair@codeaurora.org, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, kuabhs@google.com

As of the patch ("ath10k: Keep track of which interrupts fired, don't
poll them") we now have no users of this hardware parameter.  Remove
it.

Suggested-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("ath10k: Get rid of "per_ce_irq" hw param") new for v2.

 drivers/net/wireless/ath/ath10k/core.c | 13 -------------
 drivers/net/wireless/ath/ath10k/hw.h   |  3 ---
 2 files changed, 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22b6937ac225..9104496a5125 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -119,7 +119,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -155,7 +154,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -220,7 +218,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -255,7 +252,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -290,7 +286,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -328,7 +323,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -369,7 +363,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -417,7 +410,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -462,7 +454,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -497,7 +488,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -534,7 +524,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -603,7 +592,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = 0x20,
 		.target_64bit = false,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
-		.per_ce_irq = false,
 		.shadow_reg_support = false,
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
@@ -631,7 +619,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.num_wds_entries = TARGET_HL_TLV_NUM_WDS_ENTRIES,
 		.target_64bit = true,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL_DUAL_MAC,
-		.per_ce_irq = true,
 		.shadow_reg_support = true,
 		.rri_on_ddr = true,
 		.hw_filter_reset_required = false,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index f16edcb9f326..c6ded21f5ed6 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -593,9 +593,6 @@ struct ath10k_hw_params {
 	/* Target rx ring fill level */
 	u32 rx_ring_fill_level;
 
-	/* target supporting per ce IRQ */
-	bool per_ce_irq;
-
 	/* target supporting shadow register for ce write */
 	bool shadow_reg_support;
 
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
