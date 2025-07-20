Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED5C83F1A
	for <ath10k@archiver.kernel.org>; Sun, 20 Jul 2025 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xjVSLZuv0o0l1y7ZfSWiHIhHW8W40xj46tm+AH/rBNs=; b=GxYMsgLM+iTumr++/SDG0nuCES
	P18wMVxwwXWYbkmvb1ggszwPaAw4TbWTHl4/Gl8gcDO7OcU1CJ0BdDIA54BZfF5VwlSU4nJ/M5vyn
	V9aEA/qvhiybiYWmJdseHA4xfYYICL14Gld8H4qLUMVHJTigFmQXeqBoCPwsr4DWnf7RuJafBuQr0
	uCi8Xu3IF91qQIf1kPDo/lFfDPi14sb9ZToxVTbYH72NzBTqoJIKGvZMbpMlBQpoARa2HI/35vwaQ
	31Lj7aTh2VnYKNOA5iQ94kRSexpKih1/YsXLYYVBnDSE5si1lWYtPdVOUZTeBmzSZot6FUHCVzoMs
	p9Ewr8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVJ2-0000000FPAS-3Nhm;
	Sun, 20 Jul 2025 14:46:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVJ0-0000000FP9t-35CA
	for ath10k@lists.infradead.org;
	Sun, 20 Jul 2025 14:46:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KCo10s031667
	for <ath10k@lists.infradead.org>; Sun, 20 Jul 2025 14:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xjVSLZuv0o0l1y7ZfSWiHI
	hHW8W40xj46tm+AH/rBNs=; b=jxK3wqsZ2FREWmvh/L/FvUhjD0OPecXKjU3/BE
	FTW5Ap/UBgjYbHsLMhlbaWs3g6+REkFiftdyTyDpMLuYesrC4aefeEgBOUMIo5J6
	lJyvpfw2UrDdmM1bQAVrUotd2nKj/p1kJBgY2VoR2GlqxdG0Tdz39pyOJoqVBb/A
	1YyPd0l7TYTeRAL3LWzDHmP4qjAZ/f5oDx1wq8n9WHorNjxvMbKpThdsluw6odI2
	GwPa89E4WBt9KxGmQZSZVGUE94eYNRtKcC2EANRIziEG4ZRu89AWZXHvzbSVp9j+
	CyQnvLStxNVCaFDB3jRT735vpu1eZ5td7HbThrEytii2cXKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048taarr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 20 Jul 2025 14:46:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e1e474f8so5175241b3a.2
        for <ath10k@lists.infradead.org>; Sun, 20 Jul 2025 07:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753022779; x=1753627579;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjVSLZuv0o0l1y7ZfSWiHIhHW8W40xj46tm+AH/rBNs=;
        b=PUsCDIvW3KGdk/OXqFgPCKRITnaQ+rVs9XI2K4kk0dra/LzJ4K6/RVZr5iMEM12i8S
         EM8EPJRP1Chttz81dLc0aixjU8GVlSzTLOJUKridWcccAWCg38EPfYT/UjZpvdlxI4Dq
         4Spxxr4nbmxD0iwVROjBizCRlaxzrSRJ68PI2dy3FWOZbHW/H0IEq5Mwyg6OCyc84Z4G
         1bddPkd4HBzzMCgANIRqtrhYaG2Is5a3u13SUHcJgTZI9J93zfGxI8bK8+6Pk/niKfXV
         JJEgrx4IjelERMNjtwG5hABDXzCvLc8Lf3IBOPb2j6HoqTcCifru1KHj1SWqVqV7j6cv
         o8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVt8ZRMJ4xg657d7sD+Wre8luQbMTmLzTj5SBg0I7vxNygFVtovoR5wUa8v9b5mOHz8FOkigzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXDP/r+qcw0z4aPxIyKu1dACmWFyxPgzGxTYy66P7vgM8tF/jQ
	XWeNDn26Sa5qlvIzDB510/hao1o9RKx9K3WQ7sKjupW0/FhSEv+qauc00WJ7qPHt2r8bYEtGrM9
	kiHRD7V+55+jnX731FuVZb41pagq8t+8hqXtFHPqc4Ma2Zk3EdgJYhnKyOad55juCNQBKmdtJ
X-Gm-Gg: ASbGnct5kwM11bk1B165ddUznUbWy8m3qda/KdhvOdnwEy6jgxriEyPMd1FTDrLwFMR
	VDIk5TGPNINdpNSB8CM2A9pjRbb7whPfgo6xl+POuHcGvFJ3fxosAkusfeKmsNngN3Bpo1bmHTm
	6Ox5UKJaz5SBDI9KEAsyqpdLyLBKRGxVm5a8XlLkiSn/k6cH7QLRREhYFFFKXUHEPy8Qgr+2pAU
	PcuZff038HpOPIbSx9a+jFkFPAwx4Ca9s3Kn1jUb1muICyzVSBFKCGDwM8PvEWPzqGyzYusJfyP
	RZdw6qDfpJVXV1X3mbXpzWtqVXfchhQEdIxVuCyotAO9WzA0mjyiQNETPuMdu0GVVO39G5s4g7I
	D
X-Received: by 2002:a05:6a20:729a:b0:231:7dcc:f449 with SMTP id adf61e73a8af0-2381153ef10mr27191944637.18.1753022779330;
        Sun, 20 Jul 2025 07:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlA5oox/CgRP/D9vKcoxmGsTqGvE2VXR1KcrTRmjRb6uqqi16UWkvuapOOpShICdBz7boybA==
X-Received: by 2002:a05:6a20:729a:b0:231:7dcc:f449 with SMTP id adf61e73a8af0-2381153ef10mr27191912637.18.1753022778824;
        Sun, 20 Jul 2025 07:46:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb156a04sm4152377b3a.70.2025.07.20.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 07:46:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 07:46:15 -0700
Subject: [PATCH ath-next] wifi: ath10k: Prefer {} to {0} in initializers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ath10k-zero-brace-v1-1-c1ee818d6238@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADYBfWgC/4XNQQ6CMBAF0KuQri3ptECLK+9hXJQySKNSbZGgh
 LvbdK2ymeTnz7xZSEBvMZB9thCPkw3WDTHALiOm18MZqW1jJpzxkklQVI89sAt9o3e08dog5aL
 SpZJ1q4wg8e7usbNzMo8krtMB55GcYtPbMDr/Ss8mSP0fdwIKVAJ2pSq0rFEfXAj546mvxt1ue
 RwJnfgmxCOkoJJVZ+oKzS9IbEIiQloAQ2agbmTxBVrX9QPwJ0BcVQEAAA==
X-Change-ID: 20250718-ath10k-zero-brace-236a5879d8c3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE0MiBTYWx0ZWRfX/1IqFqJXe58B
 z3tagRCwPv76NaVcKcjxOFwvm0UCbpg1t7Wee2UeyRws2T04C9S7PLn2WGrq3xQZKcjGv9/+15O
 Avdjs7hA1Uad0J73rahkEfoodAXOveiPZrZXoKAHhMtwqfRb+DecDja0vS0LsHm3eAsJY2xXHDl
 bfsXALukZTLNCIHCVuAbKnxB582ssBkPbJ4Tb5OfpzCRYdQboaib/sSWjHO0nufhz79WGxUdx69
 otXlP2ohdgAJRCqC7YjngZ2zXylVI7RREXHdKBEmWIK76YvV9Mod1kHLe+ikGxFl1gBYzBmYpqB
 qt6IV1ZMlPAt3Q4L47TIB5AUJz4wYjvWpu2HVzIpZnVG28pU2LJO2w+UUo3G+LiehqxULKUQ9Ly
 mfVIsroHfR8+dyWBoC9/B/gZcFj68alOqu4xIWvnDG84Vu8Knz8IXdVEXwobTqd79O2uHYos
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687d013d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LHJufyryw8ALvslwOl4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: hdHyF0vtV5a_hzd69g0V8vuYZk2TMVJk
X-Proofpoint-ORIG-GUID: hdHyF0vtV5a_hzd69g0V8vuYZk2TMVJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_074622_906899_556D6A52 
X-CRM114-Status: GOOD (  19.06  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Prefer {} to {0} in initializers since {} works even when the first
member is not a scalar.

Generated using:
sed -i 's/{[[:space:]]*0[[:space:]]*}/{}/g' drivers/net/wireless/ath/ath10k/*

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c        | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c       | 6 +++---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 7 ++++---
 drivers/net/wireless/ath/ath10k/htt_rx.c      | 8 ++++----
 drivers/net/wireless/ath/ath10k/htt_tx.c      | 4 ++--
 drivers/net/wireless/ath/ath10k/mac.c         | 8 ++++----
 drivers/net/wireless/ath/ath10k/pci.c         | 3 ++-
 7 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9c6c07598b3a12fd544d33c3cb893766c36eebc9..6f78f1752cd6ffcf8eb56621ba0e4978ac23e696 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1565,7 +1565,7 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 					 bool with_chip_id)
 {
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
-	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
+	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = {};
 
 	if (with_variant && ar->id.bdf_ext[0] != '\0')
 		scnprintf(variant, sizeof(variant), ",variant=%s",
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 6410d3961e76ca2b4191052277c2072638db4b8d..b7520220465a838ba700bb10bee2325ccc324d20 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -547,7 +547,7 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 					      size_t count, loff_t *ppos)
 {
 	struct ath10k *ar = file->private_data;
-	char buf[32] = {0};
+	char buf[32] = {};
 	ssize_t rc;
 	int ret;
 
@@ -983,7 +983,7 @@ static ssize_t ath10k_write_htt_max_amsdu_ampdu(struct file *file,
 {
 	struct ath10k *ar = file->private_data;
 	int res;
-	char buf[64] = {0};
+	char buf[64] = {};
 	unsigned int amsdu, ampdu;
 
 	res = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos,
@@ -1039,7 +1039,7 @@ static ssize_t ath10k_write_fw_dbglog(struct file *file,
 {
 	struct ath10k *ar = file->private_data;
 	int ret;
-	char buf[96] = {0};
+	char buf[96] = {};
 	unsigned int log_level;
 	u64 mask;
 
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 0f6de862c3a9ba8995a72ef451e90371dce0a978..b9fb192e0b48456cc21b281fec47ce607913ab02 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
@@ -244,7 +245,7 @@ static ssize_t ath10k_dbg_sta_write_addba(struct file *file,
 	struct ath10k *ar = arsta->arvif->ar;
 	u32 tid, buf_size;
 	int ret;
-	char buf[64] = {0};
+	char buf[64] = {};
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos,
 				     user_buf, count);
@@ -295,7 +296,7 @@ static ssize_t ath10k_dbg_sta_write_addba_resp(struct file *file,
 	struct ath10k *ar = arsta->arvif->ar;
 	u32 tid, status;
 	int ret;
-	char buf[64] = {0};
+	char buf[64] = {};
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos,
 				     user_buf, count);
@@ -345,7 +346,7 @@ static ssize_t ath10k_dbg_sta_write_delba(struct file *file,
 	struct ath10k *ar = arsta->arvif->ar;
 	u32 tid, initiator, reason;
 	int ret;
-	char buf[64] = {0};
+	char buf[64] = {};
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos,
 				     user_buf, count);
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f12243d6bee171eeccf4a57e8001cbddfd26733c..d7e429041065ad21ed699a7e75809817ba719830 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1884,7 +1884,7 @@ static bool ath10k_htt_rx_h_frag_pn_check(struct ath10k *ar,
 					  enum htt_rx_mpdu_encrypt_type enctype)
 {
 	struct ath10k_peer *peer;
-	union htt_rx_pn_t *last_pn, new_pn = {0};
+	union htt_rx_pn_t *last_pn, new_pn = {};
 	struct ieee80211_hdr *hdr;
 	u8 tid, frag_number;
 	u32 seq;
@@ -2402,7 +2402,7 @@ static bool ath10k_htt_rx_pn_check_replay_hl(struct ath10k *ar,
 	bool last_pn_valid, pn_invalid = false;
 	enum htt_txrx_sec_cast_type sec_index;
 	enum htt_security_types sec_type;
-	union htt_rx_pn_t new_pn = {0};
+	union htt_rx_pn_t new_pn = {};
 	struct htt_hl_rx_desc *rx_desc;
 	union htt_rx_pn_t *last_pn;
 	u32 rx_desc_info, tid;
@@ -2465,7 +2465,7 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	struct fw_rx_desc_hl *fw_desc;
 	enum htt_txrx_sec_cast_type sec_index;
 	enum htt_security_types sec_type;
-	union htt_rx_pn_t new_pn = {0};
+	union htt_rx_pn_t new_pn = {};
 	struct htt_hl_rx_desc *rx_desc;
 	struct ieee80211_hdr *hdr;
 	struct ieee80211_rx_status *rx_status;
@@ -2767,7 +2767,7 @@ static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
 	struct htt_rx_indication_hl *rx_hl;
 	enum htt_security_types sec_type;
 	u32 tid, frag, seq, rx_desc_info;
-	union htt_rx_pn_t new_pn = {0};
+	union htt_rx_pn_t new_pn = {};
 	struct htt_hl_rx_desc *rx_desc;
 	u16 peer_id, sc, hdr_space;
 	union htt_rx_pn_t *last_pn;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index c1ddd761af3e9ff987fcfd3a55b8747e48783b9e..d6f1d85ba8713d4343605082d91b96ea0df900e7 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -510,7 +510,7 @@ static int ath10k_htt_tx_clean_up_pending(int msdu_id, void *skb, void *ctx)
 {
 	struct ath10k *ar = ctx;
 	struct ath10k_htt *htt = &ar->htt;
-	struct htt_tx_done tx_done = {0};
+	struct htt_tx_done tx_done = {};
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT, "force cleanup msdu_id %u\n", msdu_id);
 
@@ -560,7 +560,7 @@ void ath10k_htt_op_ep_tx_credits(struct ath10k *ar)
 void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct ath10k_htt *htt = &ar->htt;
-	struct htt_tx_done tx_done = {0};
+	struct htt_tx_done tx_done = {};
 	struct htt_cmd_hdr *htt_hdr;
 	struct htt_data_tx_desc *desc_hdr = NULL;
 	u16 flags1 = 0;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 11569c18204c01c0d8d27ab731ce3c122d78f168..24dd794e31ea2ccd2f8c0481cda395dacce80ed5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3385,7 +3385,7 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 	struct ieee80211_supported_band **bands;
 	enum nl80211_band band;
 	struct ieee80211_channel *channel;
-	struct wmi_scan_chan_list_arg arg = {0};
+	struct wmi_scan_chan_list_arg arg = {};
 	struct wmi_channel_arg *ch;
 	bool passive;
 	int len;
@@ -4885,7 +4885,7 @@ static int ath10k_mac_get_vht_cap_bf_sound_dim(struct ath10k *ar)
 
 static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 {
-	struct ieee80211_sta_vht_cap vht_cap = {0};
+	struct ieee80211_sta_vht_cap vht_cap = {};
 	struct ath10k_hw_params *hw = &ar->hw_params;
 	u16 mcs_map;
 	u32 val;
@@ -4943,7 +4943,7 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 static struct ieee80211_sta_ht_cap ath10k_get_ht_cap(struct ath10k *ar)
 {
 	int i;
-	struct ieee80211_sta_ht_cap ht_cap = {0};
+	struct ieee80211_sta_ht_cap ht_cap = {};
 
 	if (!(ar->ht_cap_info & WMI_HT_CAP_ENABLED))
 		return ht_cap;
@@ -5175,7 +5175,7 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	struct ath10k *ar = hw->priv;
 	u32 param;
 	int ret = 0;
-	struct wmi_bb_timing_cfg_arg bb_timing = {0};
+	struct wmi_bb_timing_cfg_arg bb_timing = {};
 
 	/*
 	 * This makes sense only when restarting hw. It is harmless to call
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1e6d43285138ece619b9d7dc49f113a439e2085d..97b49bf4ad80916dd139acd5f5744922317191aa 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/pci.h>
@@ -63,7 +64,7 @@ static const struct pci_device_id ath10k_pci_id_table[] = {
 	{ PCI_VDEVICE(ATHEROS, QCA9984_1_0_DEVICE_ID) }, /* PCI-E QCA9984 V1 */
 	{ PCI_VDEVICE(ATHEROS, QCA9377_1_0_DEVICE_ID) }, /* PCI-E QCA9377 V1 */
 	{ PCI_VDEVICE(ATHEROS, QCA9887_1_0_DEVICE_ID) }, /* PCI-E QCA9887 */
-	{0}
+	{}
 };
 
 static const struct ath10k_pci_supp_chip ath10k_pci_supp_chips[] = {

---
base-commit: 9e8086b865ab458e4a1ae520aa3a4f304a0a0539
change-id: 20250718-ath10k-zero-brace-236a5879d8c3


