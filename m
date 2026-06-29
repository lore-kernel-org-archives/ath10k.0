Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B352C44500
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DOrP+13n2r9IDt8ZthsIsCnr8SMGAaiiGyaW0EBJGw=; b=0trZ2CkYhH1CtKAjYobLWZpSNh
	pjGPdy7W0QSM2lNuxyi4nhoIA2BeXGcLUPBNPMW00R38LRwi1OaSGpILAkcCVACifC7ZsWeR6iiW4
	83PeBNwKi9m6YJldal8QeKpFdFiOsmWEO9nQq5hLnm49rzVXZsim3aPdwVaL3T4l/eURbNO5dgbOF
	PELK+iPqjj0SaT1O5nCSb4yG3oEhU/aI21afTqLjCMr4FT6dwQfp2tgjTqzDE5EyKkHKL9oyM+qJY
	BnOoDqcVwqckOHRP+BoQF6N8+ElABxBQQNAw2xOqHqchWRP/z+RXqXN/MH5zW3k8JBjb1EVgT2xan
	+4y7rESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBcg-0000000EeHW-46eS;
	Mon, 29 Jun 2026 13:02:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBce-0000000EeGh-3vyT
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 13:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FA53437EE;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24256C2BCF5;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782738120;
	bh=xx4TGRoHeCiwJHWjQM49gAjDXE32Br0YcWA3bhIo3Wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qm7ceUTzXHlN8SIptoMoUyBKbb0JVzonYKJT6BiWguaGtgJw8hKot/5o+MNAOhWxx
	 XPNo2G9lGBBB5WYfhF1+6Cnsj3oM97zWYguQ/jj5BduIxoIvlle95C8z4NUdcXHyZH
	 45K0eb0MLxu0vbfaYYNjWXH8v5k3mJ6tGguS8BEJJfB6tsPEjszQZjp4P0+3sWVkjH
	 X74G66ubGswXJWjesQJMl+EI3DjSSop3nc8LfDNM7cVO/xVoMlR+H94Vz64P+ogsLO
	 +ibVsCXEh3we3cjKEUrmGuQeKI/p0K0LTji0nvwtPVo1ZBXGb7Qa2G441UETXPTPqT
	 H98drubut+w6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FB4C43458;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 29 Jun 2026 17:01:46 +0400
Subject: [PATCH v2 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
To: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738117; l=3544;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=XS/86bbAZYqgGIBLjxmoRBNcmPWUtnPMjtvIgqx2KuM=;
 b=wUQZ3Vjvc6iPxxNUzz+rvmhYBaO+O/qsxfLVoxKq+VJ5nkc9TxIFALHvjEiiOdoldIIKETc7E
 8CfZYM4NXI1CERADEKuTVyBMNCsHzzwcxmzdgyWgE9cD481G+zfNhgX
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: george.moussalem@outlook.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
modes which are required to be configured through a Secure Channel
Manager (SCM) call to TrustZone. However, not all Trusted Execution
Environment (QSEE) images support this call, so first check if the call
is available.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 49 ++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..e26f54e5033b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1094,6 +1094,55 @@ bool qcom_scm_pas_supported(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
 
+static int __qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_BT_PWR_MODE,
+		.arginfo = QCOM_SCM_ARGS(2),
+		.args[0] = pas_id,
+		.args[1] = val,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret ? : res.result[0];
+}
+
+/**
+ * qcom_scm_pas_set_bluetooth_power_mode() - Configure power optimization mode
+ *					     for the Bluetooth subsystem (BTSS)
+ * @pas_id:	peripheral authentication service id
+ * @val:	0x0 for normal operation, 0x4 for ECO mode
+ *
+ * Return: 0 on success, negative errno on failure.
+ * Returns -EOPNOTSUPP if the firmware configuration call is unavailable.
+ */
+int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val)
+{
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					  QCOM_SCM_PIL_PAS_BT_PWR_MODE))
+		return -EOPNOTSUPP;
+
+	return __qcom_scm_pas_set_bluetooth_power_mode(pas_id, val);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_set_bluetooth_power_mode);
+
 static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..5579df5a2aca 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..76de4b69580b 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -93,6 +93,7 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 						  size_t *output_rt_size);
 
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
+int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.53.0



