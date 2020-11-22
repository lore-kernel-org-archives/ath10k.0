Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgyyF-00071L-6D
 for ath10k@lists.infradead.org; Sun, 22 Nov 2020 23:40:40 +0000
Received: by mail-lj1-x244.google.com with SMTP id y10so618947ljc.7
 for <ath10k@lists.infradead.org>; Sun, 22 Nov 2020 15:40:38 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH net-next 2/2] ath10k: Constify static qmi structs
Date: Mon, 23 Nov 2020 00:40:31 +0100
Message-Id: <20201122234031.33432-3-rikard.falkeborn@gmail.com>
In-Reply-To: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
References: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
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
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

qmi_msg_handler[] and ath10k_qmi_ops are only used as input arguments
to qmi_handle_init() which accepts const pointers to both qmi_ops and
qmi_msg_handler. Make them const to allow the compiler to put them in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index ae6b1f402adf..07e478f9a808 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -917,7 +917,7 @@ static void ath10k_qmi_msa_ready_ind(struct qmi_handle *qmi_hdl,
 	ath10k_qmi_driver_event_post(qmi, ATH10K_QMI_EVENT_MSA_READY_IND, NULL);
 }
 
-static struct qmi_msg_handler qmi_msg_handler[] = {
+static const struct qmi_msg_handler qmi_msg_handler[] = {
 	{
 		.type = QMI_INDICATION,
 		.msg_id = QMI_WLFW_FW_READY_IND_V01,
@@ -981,7 +981,7 @@ static void ath10k_qmi_del_server(struct qmi_handle *qmi_hdl,
 					     NULL);
 }
 
-static struct qmi_ops ath10k_qmi_ops = {
+static const struct qmi_ops ath10k_qmi_ops = {
 	.new_server = ath10k_qmi_new_server,
 	.del_server = ath10k_qmi_del_server,
 };
-- 
2.29.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
