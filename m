Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B60C4332F
	for <ath10k@archiver.kernel.org>; Thu,  2 Nov 2023 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEW/HqJsKsmsScl4lCMuH8NMji20jBBiHDi4pBycqK4=; b=cXth70m9XImm02
	BJ8ibN2fcRSg9d5VuRWdvz8rpWQ7nZiNyUmsiqACpEw4ns+tnNRE5iLXNEOuuxGEYvSmpho4BgRlb
	PGrBWwbQyPEqcjy8nUhKC3y048gledLM9smO3QsmhGdf7eaFmXkx2mWzP86ElxfaPJlhTasn42Bn4
	3pIwtgJZhuya9j8kmY5+TpcdiDdLCMlSloWmWBqcHTpjp8XItzM6dcmAqFuC4hNEw67pz38/QW0Af
	ZYKEJTISPTvdyrdcXS7CNWJu3RVLBR0JbHM0Nmgq2moCdvLN/72Tm5sdAu9ncrITHuLicLY91zGWO
	Mz6sijlhZNOuh3ZudrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZDN-009i4N-2c;
	Thu, 02 Nov 2023 15:02:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZDJ-009i3v-0W
	for ath10k@lists.infradead.org;
	Thu, 02 Nov 2023 15:02:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A2CtjcZ019322;
	Thu, 2 Nov 2023 15:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i8bu6OzOOokKbxYJkmLoobVMCZTR7aocliOXz74c27k=;
 b=KjlrNpL/qkClJeY/Mh8TCVL+iQYbWgZgdkl5FCWESPs35Q9/uZfD46fhbBDWr/ysOUuZ
 4lI5NLPBnDV0vlokrL6vZ/RPWfLKaONYspiM8iFUDciJsoipMRnlsvl5asIxZY6nNdto
 hofeKmTu6SR1X89xq2GOOA3EI6zr1zYqAHwrYnTpSqlMfisZeRAyJFnd2MPlBZM114Oh
 dfONl4fOArju99wqin2o0aD1qMMUJhIdcx40uYB2AcyIjNI+tnMUhOtcK8HtXP4VR+U5
 3dcqteqyZLaZPtN19UyOdVaq5IaA9yKEickoFVytN866FPtP8OJtwd9xFZieb3aiZk9u WA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u47d50u4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 15:02:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A2F2FJW015062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Nov 2023 15:02:15 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 2 Nov
 2023 08:02:14 -0700
Message-ID: <f2f09cac-d364-46eb-9dbd-ca90ddea32f8@quicinc.com>
Date: Thu, 2 Nov 2023 08:02:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: simplify __ath10k_htt_tx_txq_recalc()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231102115459.69791-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231102115459.69791-1-dmantipov@yandex.ru>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QlkItmYuzlJ9bw7LUcS_z8gS3cugohJN
X-Proofpoint-ORIG-GUID: QlkItmYuzlJ9bw7LUcS_z8gS3cugohJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-02_04,2023-11-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=456 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311020121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_080229_344355_C1C3983C 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 11/2/2023 4:54 AM, Dmitry Antipov wrote:
> Since 'ieee80211_txq_get_depth()' allows NULL for 2nd and
> 3rd arguments, simplify '__ath10k_htt_tx_txq_recalc()' by
> dropping unused 'frame_cnt'. Compile tested only.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
