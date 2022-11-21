Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EA0C4332F
	for <ath10k@archiver.kernel.org>; Mon, 21 Nov 2022 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wMb077BHKee8oRG6qLL/To10cZZHLTX7hp6VB9t+dU=; b=yehDI6EWn/U3wz
	ptvX+gEXQ8e3IvlztX057Jo1L0X4dvv+L1xFi0mncRaWs6Zz8/OesrcoXshMe+dvWMH/O/uDIBFKl
	OsSFNx4pedixJo7BWT71y40qKeeTgU69c+Nmj+WOyWaf+izpe5GN7sere440/cs6wutkDpZf7zU75
	IW4pK7QDFEcj1O+rjE0NuqHX40o9Q+ewEP0ugWe7rLYFJMoXxLbWk4K++11T6JBrbsJdr6QOfL5uD
	HOJTIFSBWgVIaY2WE/BSpbZ8hSpXNN/t7G9rpgAE9+bPgCKVHVzjtsdLdxr/ne0rhVDv0VvKneuvP
	vjTmIKPV1OFvVjgJy97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7SG-00EFzn-4x; Mon, 21 Nov 2022 14:07:24 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7NM-00ECaF-0Q; Mon, 21 Nov 2022 14:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1669039340; x=1700575340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7FbkFUUwW8f1lkbeYVGTNASH9BSWg8uSE/T9xxdn1m8=;
  b=po4MhVFNoVYDDKELfqhwa63yF6eYA8n1IT6Zjo8kd133Tg3RsidnC7PX
   6npulL0M7PFMyyFqRSMULEjXOZ3qvrseDjTotQ4oaDrqBuFK0TTaj3cgL
   v5N6ABEJTQU+cr0h1A+2jNHg6QstCXkczf7UAmboZqp4g0UfXz5Q5789+
   s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Nov 2022 06:02:19 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 06:02:18 -0800
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 21 Nov 2022 06:02:15 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Elliot Berman <quic_eberman@quicinc.com>, Murali Nalajala
	<quic_mnalajal@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, "Srivatsa
 Vaddagiri" <quic_svaddagi@quicinc.com>, Carl van Schaik
	<quic_cvanscha@quicinc.com>, Prakruthi Deepak Heragu
	<quic_pheragu@quicinc.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet
	<corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	<ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v7 18/20] firmware: qcom_scm: Use fixed width src vm bitmap
Date: Mon, 21 Nov 2022 06:00:07 -0800
Message-ID: <20221121140009.2353512-19-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121140009.2353512-1-quic_eberman@quicinc.com>
References: <20221121140009.2353512-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_060220_128462_440FC96C 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The maximum VMID for assign_mem is 63. Use a u64 to represent this
bitmap instead of architecture-dependent "unsigned int" which varies in
size on 32-bit and 64-bit platforms.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---

Note this will have build conflicts with
https://lore.kernel.org/all/20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-2-f7c65d6f0e55@linaro.org/
which would also need an "unsigned int" -> "u64" in struct qcom_mpss_dsm_mem:perms.

 drivers/firmware/qcom_scm.c           | 12 +++++++-----
 drivers/misc/fastrpc.c                |  6 ++++--
 drivers/net/wireless/ath/ath10k/qmi.c |  4 ++--
 drivers/remoteproc/qcom_q6v5_mss.c    |  8 ++++----
 drivers/soc/qcom/rmtfs_mem.c          |  2 +-
 include/linux/qcom_scm.h              |  2 +-
 6 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index cdbfe54c8146..92763dce6477 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -898,7 +898,7 @@ static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
  * Return negative errno on failure or 0 on success with @srcvm updated.
  */
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-			unsigned int *srcvm,
+			u64 *srcvm,
 			const struct qcom_scm_vmperm *newvm,
 			unsigned int dest_cnt)
 {
@@ -915,9 +915,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	__le32 *src;
 	void *ptr;
 	int ret, i, b;
-	unsigned long srcvm_bits = *srcvm;
+	u64 srcvm_bits = *srcvm;
 
-	src_sz = hweight_long(srcvm_bits) * sizeof(*src);
+	src_sz = hweight64(srcvm_bits) * sizeof(*src);
 	mem_to_map_sz = sizeof(*mem_to_map);
 	dest_sz = dest_cnt * sizeof(*destvm);
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
@@ -930,8 +930,10 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	/* Fill source vmid detail */
 	src = ptr;
 	i = 0;
-	for_each_set_bit(b, &srcvm_bits, BITS_PER_LONG)
-		src[i++] = cpu_to_le32(b);
+	for (b = 0; b < BITS_PER_TYPE(u64); b++) {
+		if (srcvm_bits & BIT(b))
+			src[i++] = cpu_to_le32(b);
+	}
 
 	/* Fill details of mem buff to map */
 	mem_to_map = ptr + ALIGN(src_sz, SZ_64);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7ff0b63c25e3..2ad388f99fe1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -299,11 +299,13 @@ static void fastrpc_free_map(struct kref *ref)
 		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
 			struct qcom_scm_vmperm perm;
 			int err = 0;
+			u64 src;
 
+			src = BIT(map->fl->cctx->vmperms[0].vmid);
 			perm.vmid = QCOM_SCM_VMID_HLOS;
 			perm.perm = QCOM_SCM_PERM_RWX;
 			err = qcom_scm_assign_mem(map->phys, map->size,
-				&(map->fl->cctx->vmperms[0].vmid), &perm, 1);
+				&src, &perm, 1);
 			if (err) {
 				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
 						map->phys, map->size, err);
@@ -744,7 +746,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		 * If subsystem VMIDs are defined in DTSI, then do
 		 * hyp_assign from HLOS to those VM(s)
 		 */
-		unsigned int perms = BIT(QCOM_SCM_VMID_HLOS);
+		u64 perms = BIT(QCOM_SCM_VMID_HLOS);
 
 		map->attr = attr;
 		err = qcom_scm_assign_mem(map->phys, (u64)map->size, &perms,
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 66cb7a1e628a..6d1d87e1cdde 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -28,7 +28,7 @@ static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
 {
 	struct qcom_scm_vmperm dst_perms[3];
 	struct ath10k *ar = qmi->ar;
-	unsigned int src_perms;
+	u64 src_perms;
 	u32 perm_count;
 	int ret;
 
@@ -60,7 +60,7 @@ static int ath10k_qmi_unmap_msa_permission(struct ath10k_qmi *qmi,
 {
 	struct qcom_scm_vmperm dst_perms;
 	struct ath10k *ar = qmi->ar;
-	unsigned int src_perms;
+	u64 src_perms;
 	int ret;
 
 	src_perms = BIT(QCOM_SCM_VMID_MSS_MSA) | BIT(QCOM_SCM_VMID_WLAN);
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index fddb63cffee0..9e8bde7a7ec4 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -227,8 +227,8 @@ struct q6v5 {
 	bool has_qaccept_regs;
 	bool has_ext_cntl_regs;
 	bool has_vq6;
-	int mpss_perm;
-	int mba_perm;
+	u64 mpss_perm;
+	u64 mba_perm;
 	const char *hexagon_mdt_image;
 	int version;
 };
@@ -404,7 +404,7 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 	}
 }
 
-static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
+static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, u64 *current_perm,
 				   bool local, bool remote, phys_addr_t addr,
 				   size_t size)
 {
@@ -939,7 +939,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 	struct page *page;
 	dma_addr_t phys;
 	void *metadata;
-	int mdata_perm;
+	u64 mdata_perm;
 	int xferop_ret;
 	size_t size;
 	void *vaddr;
diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index 0feaae357821..69991e47aa23 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -30,7 +30,7 @@ struct qcom_rmtfs_mem {
 
 	unsigned int client_id;
 
-	unsigned int perms;
+	u64 perms;
 };
 
 static ssize_t qcom_rmtfs_mem_show(struct device *dev,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index f8335644a01a..77f7b5837216 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -96,7 +96,7 @@ extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
 					  u32 cp_nonpixel_start,
 					  u32 cp_nonpixel_size);
 extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-			       unsigned int *src,
+			       u64 *src,
 			       const struct qcom_scm_vmperm *newvm,
 			       unsigned int dest_cnt);
 
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
