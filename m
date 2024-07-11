Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95785C3DA41
	for <ath10k@archiver.kernel.org>; Thu, 11 Jul 2024 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yjJYdCqpfHav+VyOOUwBQNwQQoaukTopIsHU5xpJzzU=; b=aj+iCJMckadjC6HdZkbjGzGXTk
	pzUC0NJtXweS5XVM0yLHxndxlBez7knx6x5g/Dx0QpQONDNRkRxUs6aSDAcdTa1YT9litc3tbvBOB
	qhOjJBfNjVkrTr/0w8+RqTvIvCFu3fB50Z2wOPAlC+x0Ap/7U4O5OkAFffJDS/AirxId8vLGZABO0
	JywAnpR68490Pt5TLHUKmwTSYi/GQ4JE65OmlPB4kz0qsIR0Q71Lv0TAR0roSaG/RSq1c4YNXBwNQ
	C+j4fkgtgVsGVdQHlS1AHJmmMN8S2JZuHeQVz5IbLexP6x572UiYsIAfq1qs4a1kS8ZpICgAE8yTv
	3WXec2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjA9-0000000CObZ-1WLr;
	Thu, 11 Jul 2024 02:04:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRjA6-0000000COar-20Yk
	for ath10k@lists.infradead.org;
	Thu, 11 Jul 2024 02:04:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AKvp4Y024099;
	Thu, 11 Jul 2024 02:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yjJYdCqpfHav+VyOOUwBQN
	wQQoaukTopIsHU5xpJzzU=; b=bEs2F9av1S/yhiZt2hN03oQBZ6r0dB4oa2AzqG
	6Kq7A5Z/mdx8AdQc3Y0FIjaZ+B7fU5afYJygc8EIipU+dF2kK0E0xGD7fRajyEyc
	4ATHz+xPmXoywRjiudbQx5SQh3agsJeJqQzo/tg0ElYbzrSgNEw02u81z6g5cF4i
	+Bru2SAS9h9pQD552UVDsvT8oYjRjWCjMCoCz4BxeDMCXGayz/GUkfcKU+au4vEM
	0rlf0xF/tpqBl6czjBofvGMvzV6pKQfFHzYn7fYE9m0gDswucKl+GMWXvLKY5TVf
	g5jNrzAkaX7E4WodbltvUDJmBzPHTIW4+wpoKHB6dioXyfDQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hjje6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:03:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B23uIa028042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 02:03:56 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 10 Jul 2024 19:03:55 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/2] wifi: ath10k: fix invalid VHT parameters
Date: Thu, 11 Jul 2024 10:03:42 +0800
Message-ID: <20240711020344.98040-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FhsEVbkxKeBDKWEHhuZF08YQFpR1hcIF
X-Proofpoint-GUID: FhsEVbkxKeBDKWEHhuZF08YQFpR1hcIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_20,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=673 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_190358_641745_A9CE38D1 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

supported_vht_mcs_rate_nss1 and supported_vht_mcs_rate_nss2 in host do not
align with firmware's definitions, resulting in some warnings. Fix them.

Baochen Qiang (2):
  wifi: ath10k: fix invalid VHT parameters in
    supported_vht_mcs_rate_nss1
  wifi: ath10k: fix invalid VHT parameters in
    supported_vht_mcs_rate_nss2

 drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.25.1


