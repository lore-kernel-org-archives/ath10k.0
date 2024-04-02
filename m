Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D8C6FD1F
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gx3PZFcSWFHU4TY02tA6oCnE7KhZTs0zAG7El9eKypE=; b=XYUBrmLVjsZWjppnWk+IaNFLnK
	ltOXVm2slsiXcjDo94b23wX3EvsYRx70RkiiZ8cvWhIStCA2l/4u3qq7YqwlW9AkT0xDekBZcleae
	Q0LmOxZPlt2eW9788HLNlNG4WZvK5Nh7uArXszEO46dWSa105I05nqGgup6EWSmUpD+bwUYbNK2Iq
	UfoO9YjAtKvg3xaDa/J8gUxBssXoVCiJhkFJq4YNU1BN9/5aFcc+hP85oml4zvStjAJPtjz/Uk0Ge
	XWb6BpJ5PYgM8d/amewhx7VnYjGp+4pLPEe+gIZVBZKkex+0pUOhieKe92DSr7yYPwGxU8rnrK5ni
	vKVdgrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnkm-0000000DDkt-44Lb;
	Tue, 02 Apr 2024 23:41:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnkk-0000000DDk2-361t
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 23:41:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432MSBEj008798;
	Tue, 2 Apr 2024 23:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gx3PZFcSWFHU4TY02tA6oCnE7KhZTs0zAG7El9eKypE=; b=DQ
	mavJ29FARd64t9UeVH9AUcLCv4R4GiRGK72pwlctjr0ethhm4GAxlMZ/8+qRWXf7
	Q/m8XsXI6FriDSUtMsxJLloMh/WeZL7Be6yU172BxU+9JeO3I1jRxLw2ZHKCehIB
	Oee3MpWKVRh6Rd1wl039L3QFwQohPOz8ESgMczFCcvd2+KCI9CEkEzMJP8y1SyxD
	99IyyNz8ssLYGEdWqWFFNF2rzi/9ovT6xQJaupPXdz7mtdbMdbVHSkvfX9nlN0AH
	2R2RG6lkUy6jS1Ly9xZ8TTrCx+q1W5kHp3M6AKmusXvLALA+EUsKViEXd9wlg1XQ
	SSGweXG9yTMGiB4nz4vg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8pj4gmwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 23:41:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432NfEW3000862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 23:41:14 GMT
Received: from [10.110.49.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 16:41:13 -0700
Message-ID: <e7cc2eb0-c5fe-43a1-85a3-1f42c5e28dad@quicinc.com>
Date: Tue, 2 Apr 2024 16:41:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990
 devices
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Yongqin Liu <yongqin.liu@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
 <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pkc1wUj_NbdeQFyAVHSIWvqTpZWu5x-p
X-Proofpoint-GUID: pkc1wUj_NbdeQFyAVHSIWvqTpZWu5x-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_164118_946409_DFCD073D 
X-CRM114-Status: GOOD (  13.54  )
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

On 3/29/2024 9:48 PM, Dmitry Baryshkov wrote:
> On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> The ath10k driver fails to properly handle fallback from board-2.bin to
>> board.bin for WCN3990 cards. This happens because the
>> ath10k_hw_params_list doesn't include .fw.board* parameters for the
>> WCN3990 platform.
>>
>> Add board data configuration for WCN3990. While we are at it, merge
>> common pieces of BDF support: drop .board and .eboard names from struct
>> ath10k_hw_params_fw and use the common name instead.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Dmitry Baryshkov (3):
>>       wifi: ath10k: populate board data for WCN3990
>>       wifi: ath10k: drop chip-specific board data file name
>>       wifi: ath10k: drop fw.eboard file name
>>
>>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>>  4 files changed, 14 insertions(+), 45 deletions(-)
>> ---
>> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
>> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> 
> Kalle, Jeff, is there anything pending on me on this series?
> 
Nothing from me -- this is outside my area of expertise so I'm deferring to Kalle.

Kalle?


