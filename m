Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0335C3DA49
	for <ath10k@archiver.kernel.org>; Thu, 11 Jul 2024 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIN7cDUxMEh5z0Kmkl+tZgmrDUumJllCqGWH4WUXIh4=; b=ENeE6QkMSehusWn+RqjXVS872k
	s9D1G2E4zWB6LQiv2X5b0rYyKydGyzF2M/o74ZawsjRTLdAhzApagJCh/63VQBGzXN6JAnEmfZVn4
	m7EzyPOjbrvxS4oy6T1vmaRU15E3iBubq1CqKBTmwwfIj6edrSZU1Iyi2y3RsH3JzMKWHueXvj4aj
	pvsDaWjgNIFZjBjdItkRnAJCaTNFjuLIT5GbMJfUb6pfJeWX45NeWiCrzu6h81MSr1y3DyjysdzQj
	mH7Q+sCyTiZPf2oVGddbpuDlbywYIJP05Y3DdBPQutyS9P6zzqNrx1pY3hRzmqPwKUaxFAOp5XjDD
	WwIKE+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjAE-0000000COcJ-40uI;
	Thu, 11 Jul 2024 02:04:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjAA-0000000COba-2Pbq
	for ath10k@lists.infradead.org;
	Thu, 11 Jul 2024 02:04:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AKuttx013692;
	Thu, 11 Jul 2024 02:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIN7cDUxMEh5z0Kmkl+tZgmrDUumJllCqGWH4WUXIh4=; b=d6zcb1DXa3p4fu9A
	ZeaBYIJS8Ju4H5m0s6kSMdny6GeIWJpitG80n+pfttfm8y+18RHXuZjq4TP/rpIq
	RsEtFPOLRyEAUKWXeetToT3y4aLf3rOXwheiuCe/VBR1smOjFXGTwn/gF1/vI9kj
	ryEONpawRBRAC0LJ5yaNu9kLyk22kxmFircfvhdDCSbrHkGEms+YekC9oAccKG4m
	7NxbXpB1jnvHXnoLtPFWt5d9wJ8/b09t35a8uvpBLxw666Qg7zv58VptRNt8iPG7
	x5NhKx0gS4Ag80j4KtY1JJXstMh/C9SInYSKwE6F15P0OK4MMVEDJiS7Rqp/q5lA
	nfmpIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we92ue8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:04:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B23x9q021057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:03:59 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 10 Jul 2024 19:03:58 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 2/2] wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2
Date: Thu, 11 Jul 2024 10:03:44 +0800
Message-ID: <20240711020344.98040-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711020344.98040-1-quic_bqiang@quicinc.com>
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yfQ-Gq3ZQltLysfPyiY1bEgZUQQZP6cn
X-Proofpoint-GUID: yfQ-Gq3ZQltLysfPyiY1bEgZUQQZP6cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_20,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407110012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_190402_747494_E97502EC 
X-CRM114-Status: GOOD (  12.61  )
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

In supported_vht_mcs_rate_nss2, the rate for MCS9 & VHT20 is defined as
{1560, 1733}, this does not align with firmware's definition and therefore
fails the verification in ath10k_mac_get_rate_flags_vht():

	invalid vht params rate 1730 100kbps nss 2 mcs 9
and:
	invalid vht params rate 1920 100kbps nss 2 mcs 9

Change it to {1730,  1920} to align with firmware, so this issue could be
fixed.

Since ath10k_hw_params::supports_peer_stats_info is enabled only for
QCA6174, this change does not affect other chips.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1

Fixes: 3344b99d69ab ("ath10k: add bitrate parse for peer stats info")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/lkml/fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3c34f3d8e555..e62b251405fc 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9136,7 +9136,7 @@ static const struct ath10k_index_vht_data_rate_type supported_vht_mcs_rate_nss2[
 	{6,  {5265, 5850}, {2430, 2700}, {1170, 1300} },
 	{7,  {5850, 6500}, {2700, 3000}, {1300, 1444} },
 	{8,  {7020, 7800}, {3240, 3600}, {1560, 1733} },
-	{9,  {7800, 8667}, {3600, 4000}, {1560, 1733} }
+	{9,  {7800, 8667}, {3600, 4000}, {1730, 1920} }
 };
 
 static void ath10k_mac_get_rate_flags_ht(struct ath10k *ar, u32 rate, u8 nss, u8 mcs,
-- 
2.25.1


