Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D58C10F05
	for <ath10k@archiver.kernel.org>; Mon, 11 Dec 2023 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P6svbHPe1xhQ2a5tmtFOScoB76jiukn6yl06BmdXNE=; b=lj8qFvebM+NsdXNdLiMJ0YdvA/
	83oYeG7fUULtibwZ9PS3ICNh8lRFfF3ch0ADpu1OyCXfR4Fe+tOEwD97ZBrv/Vxz4r4PUmnFbiwMM
	Gy4n4eJm+qtMWFLRk6JHXQMXYxCWJnT9j72zNPaH6mr5B4KDzunKVTn6SQYHfBU9k08bbkbhHQ+Kx
	tVma/6o6Ow7MXFPT5GfyIoLpwaVLXDK3PZEjYGr5cExM7a5uCS2hrMsYvKbKkCUi25FWBmwwyyzms
	vZVvFnVACN/AnEVQOhdOH7gYT5Ii16rWjKD9GXuEaiK/kT7u+lA12NdvktSgHJvZ8gtjKysc5Ak0y
	oCqS8xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDw-006Ojq-1W;
	Mon, 11 Dec 2023 17:37:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkDr-006OeZ-3A
	for ath10k@lists.infradead.org;
	Mon, 11 Dec 2023 17:37:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBGxMN0014743;
	Mon, 11 Dec 2023 17:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9P6svbHPe1xhQ2a5tmtFOScoB76jiukn6yl06BmdXNE=; b=D6
	rcwEmhxO1QDJdyXcZIrlbf2qSWpPA5I7V4rpt/w5tN9aIPp/Vpa4bXNtUm4L8Hs1
	ZvxT6ff3pa6/EfSlsp9mdjjYbGN5yeOqktiQaUTb5yviS7Z07H3fuCdr7XI7YkwD
	cgKWsbnlMhUxNpPPh1TME459RR6eJvXi+Vrjpf349FXD8jAodFZbjuW0AQtYTzqI
	4DugnV3Fj97TFr4NpUvxk7WFw3giT/d1+vECXTDeakjaRpxMB2T7GkThmHPyr0C1
	NtGKrFEjBkWGP3i1SvmXl+mtCgtFr1CBt4y9O4QBPXDGDyubpOfQE1OQwbSEHXq4
	usLIKRBfOtVv2FmQMIxA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25u0ss0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 17:37:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBHbZA3015404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 17:37:35 GMT
Received: from [10.110.106.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 09:37:34 -0800
Message-ID: <f66bf357-f3bd-47e6-abc8-350332022cb9@quicinc.com>
Date: Mon, 11 Dec 2023 09:37:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: fix NULL pointer dereference in
 ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
Content-Language: en-US
To: Xingyuan Mo <hdthky0@gmail.com>, Kalle Valo <kvalo@kernel.org>,
        "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>
CC: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>
References: <20231208043433.271449-1-hdthky0@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231208043433.271449-1-hdthky0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b2uF9TwZ0pmLlshCjoBg_EmFOyEqGiPh
X-Proofpoint-GUID: b2uF9TwZ0pmLlshCjoBg_EmFOyEqGiPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=749 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093740_071107_E58D25BB 
X-CRM114-Status: UNSURE (   6.44  )
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

On 12/7/2023 8:34 PM, Xingyuan Mo wrote:
> We should check whether the WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT tlv is
> present before accessing it, otherwise a null pointer deference error will
> occur.
> 
> Fixes: dc405152bb64 ("ath10k: handle mgmt tx completion event")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


