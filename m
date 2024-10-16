Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926B5D2A520
	for <ath10k@archiver.kernel.org>; Wed, 16 Oct 2024 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seIIshYJlqe/FATEkYnojoUiTE4TpzoHzavH6e9Q2W4=; b=hU3AyOqDxCwWq/krNsdfASSWZH
	XRVSqCqQIfdOEhKmpGWnSHHySqr/6lS+DI7SMa256hZWPFcIokqrfpcsb9ELbV14fcd8EhQTkabca
	HNZupEFo4QA/+njUF88jEBPpV/dy8263UCMhlHaWQJohbXKbNbjdDcoXdlolFFf9BA3EK81cBC0s4
	C5Dpgj3YyJhDXW9kP47M1pVqj9O+KvJAUUkF+BpwG3/gjhDb7o/16ngRLcrWtTcFKkibfF1VrBjuL
	jVbhSD1+TVtkQ7HuCsdb0mkeFtowSK6aaSeDC46KtL/h4vJwTspTJIQLlnL9JzK+qm/UdHMODc50s
	LNCL1PaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15D6-0000000C6cJ-1rFc;
	Wed, 16 Oct 2024 14:41:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15BK-0000000C6Iw-2M3x
	for ath10k@lists.infradead.org;
	Wed, 16 Oct 2024 14:39:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q7V0007485;
	Wed, 16 Oct 2024 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seIIshYJlqe/FATEkYnojoUiTE4TpzoHzavH6e9Q2W4=; b=RCtZaUa8lmof9Eae
	eYjx5c0ZrNjwbjCv2MPeHfDTp4OcuIfbOCp9A1HKbcwqKanpom7dyd5ghrxV8Ik3
	d7650oVYlTCNlggFqOXiepyMixJsJTDDsI5/xNiZFybOxgNeGCS6+LsyD9mzTLmp
	CPqkAR7OnVda6JunvNC/gTspDGa9aPf+fvirsN9CU2sKUgZTa9wBjVURtNYntnvE
	HAB8KcuDoagjcrIS5DTfSzDDBIy4KC2TzJckuYS2rmcv9rOzR6pWfc89Tip1UoKk
	PcXKuHoKJzk04nrXJCsTj0g9xoyOyQcW9FCPhRSVb4SR4k9IEMOxDTtIEfnt5fhc
	9q/bYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy51gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:39:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GEdJ74029797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:39:19 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 07:39:19 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath10k@lists.infradead.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20241015064103.6060-1-quic_mpubbise@quicinc.com>
References: <20241015064103.6060-1-quic_mpubbise@quicinc.com>
Subject: Re: [PATCH ath-current] wifi: ath10k: Fix memory leak in
 management tx
Message-ID: <172908955957.387396.967405971287918715.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 07:39:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6jRpfr4888X-lCbk4JcUpt9CoRAxHb4Q
X-Proofpoint-ORIG-GUID: 6jRpfr4888X-lCbk4JcUpt9CoRAxHb4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=679 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_073922_752827_E4E10CA2 
X-CRM114-Status: UNSURE (   7.56  )
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


On Tue, 15 Oct 2024 12:11:03 +0530, Manikanta Pubbisetty wrote:
> In the current logic, memory is allocated for storing the MSDU context
> during management packet TX but this memory is not being freed during
> management TX completion. Similar leaks are seen in the management TX
> cleanup logic.
> 
> Kmemleak reports this problem as below,
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Fix memory leak in management tx
      commit: e15d84b3bba187aa372dff7c58ce1fd5cb48a076

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


