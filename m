Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgyyF-00071J-69
 for ath10k@lists.infradead.org; Sun, 22 Nov 2020 23:40:41 +0000
Received: by mail-lj1-x241.google.com with SMTP id y10so618886ljc.7
 for <ath10k@lists.infradead.org>; Sun, 22 Nov 2020 15:40:38 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH net-next 1/2] soc: qcom: ipa: Constify static qmi structs
Date: Mon, 23 Nov 2020 00:40:30 +0100
Message-Id: <20201122234031.33432-2-rikard.falkeborn@gmail.com>
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

These are only used as input arguments to qmi_handle_init() which
accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/net/ipa/ipa_qmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index 5090f0f923ad..d2c3f273c233 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -168,7 +168,7 @@ static void ipa_server_bye(struct qmi_handle *qmi, unsigned int node)
 	ipa_qmi->indication_sent = false;
 }
 
-static struct qmi_ops ipa_server_ops = {
+static const struct qmi_ops ipa_server_ops = {
 	.bye		= ipa_server_bye,
 };
 
@@ -234,7 +234,7 @@ static void ipa_server_driver_init_complete(struct qmi_handle *qmi,
 }
 
 /* The server handles two request message types sent by the modem. */
-static struct qmi_msg_handler ipa_server_msg_handlers[] = {
+static const struct qmi_msg_handler ipa_server_msg_handlers[] = {
 	{
 		.type		= QMI_REQUEST,
 		.msg_id		= IPA_QMI_INDICATION_REGISTER,
@@ -261,7 +261,7 @@ static void ipa_client_init_driver(struct qmi_handle *qmi,
 }
 
 /* The client handles one response message type sent by the modem. */
-static struct qmi_msg_handler ipa_client_msg_handlers[] = {
+static const struct qmi_msg_handler ipa_client_msg_handlers[] = {
 	{
 		.type		= QMI_RESPONSE,
 		.msg_id		= IPA_QMI_INIT_DRIVER,
@@ -463,7 +463,7 @@ ipa_client_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
 	return 0;
 }
 
-static struct qmi_ops ipa_client_ops = {
+static const struct qmi_ops ipa_client_ops = {
 	.new_server	= ipa_client_new_server,
 };
 
-- 
2.29.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
