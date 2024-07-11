Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F6C3DA42
	for <ath10k@archiver.kernel.org>; Thu, 11 Jul 2024 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfMfUBJl7OBMOT3++1P4Z26+bZ+k1VaHOjDB21+Bems=; b=rLTTIFiWXTATSXo7r14YhKcN88
	UYTgd0OYyaoJKe9hPfs5U5y2MAsGQGFe4PMu7/DmhOM1ZYxBTlTz8UhZvragCuvHqz9lj6BVAIhEj
	fvYFgTh0UtOHk3cFwOsmcLuBA04NMbEzhXsUc3+jg2Czjf3jLy6iE4uNLsoVko0IX5DPhM/Vc9LW2
	aNS7jZ+rGImSpLfODFRDMT66saKcfXoqpPhVEXpV2eWKPGsgloAciSPrFN24b0oeAbr7HB0B37MpI
	382TTiSoT8qpo+E0Np2740evb2eV67iGrQaT1CTeREUGdgHpED63aEH0dRTY7WNGrECnPbVJtJMB2
	fJfUJ1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjAA-0000000COc1-42j2;
	Thu, 11 Jul 2024 02:04:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjA8-0000000CObD-0T4L
	for ath10k@lists.infradead.org;
	Thu, 11 Jul 2024 02:04:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AKv75F023320;
	Thu, 11 Jul 2024 02:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfMfUBJl7OBMOT3++1P4Z26+bZ+k1VaHOjDB21+Bems=; b=c5x+LXqztknlb+Lf
	G2BdLcpTzzP+lhytRZyKWNUsLH1qb1o4CUO/yj1RIREXVvVngxAgW+/0kIKFxSyT
	LiA/rJnUzqY0GSGu21oUFO6VBbO0b8hzSe1vBt1OxasM6mSb1gvfPE32haczDPjk
	0J7HaiDnjCMTN4YJPZhqVunfa8kh2duGA+xUCQ8QmnYcoSL81pfiHM6xFUWJ68D5
	IUDEqC0wXv4ywQo6wyklsdH18SjglV+I4WpQPf1GyI0flw0uqfQPX8Wtp0DZ8Bz+
	D0rDRMSsP9rEQj3YDH98uhbH8rIVYfPN1WeLFOUg5c1auS6m029bHPwVsmKQp7ma
	LwAbLA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hjje8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B23wgb001656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:03:58 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 10 Jul 2024 19:03:56 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 1/2] wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
Date: Thu, 11 Jul 2024 10:03:43 +0800
Message-ID: <20240711020344.98040-2-quic_bqiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: dHvZnhozxAdSbF7qxIuVuoKd5iRlv9Vf
X-Proofpoint-GUID: dHvZnhozxAdSbF7qxIuVuoKd5iRlv9Vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_20,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_190400_175485_7709867C 
X-CRM114-Status: GOOD (  12.30  )
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

In supported_vht_mcs_rate_nss1, the rate for MCS9 & VHT20 is defined as
{780,  867}, this does not align with firmware's definition and therefore
fails the verification in ath10k_mac_get_rate_flags_vht():

	invalid vht params rate 960 100kbps nss 1 mcs 9

Change it to {865,  960} to align with firmware, so this issue could be
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
index a5da32e87106..3c34f3d8e555 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9121,7 +9121,7 @@ static const struct ath10k_index_vht_data_rate_type supported_vht_mcs_rate_nss1[
 	{6,  {2633, 2925}, {1215, 1350}, {585,  650} },
 	{7,  {2925, 3250}, {1350, 1500}, {650,  722} },
 	{8,  {3510, 3900}, {1620, 1800}, {780,  867} },
-	{9,  {3900, 4333}, {1800, 2000}, {780,  867} }
+	{9,  {3900, 4333}, {1800, 2000}, {865,  960} }
 };
 
 /*MCS parameters with Nss = 2 */
-- 
2.25.1


