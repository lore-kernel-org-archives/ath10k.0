Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB600C4345F
	for <ath10k@archiver.kernel.org>; Mon, 22 Apr 2024 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o47mZLlbjZ8BBVjTLMZTKirpl7IfxMDSxPg8gdfsUBg=; b=ZUj2qJtI083h5UsoowZf7k5Oc7
	vmsg9D1P8ZvroWET7I5SZgYplVOEACza5uOeYjDwYuxMMYttpdJAdSnc0rNvojhWYd5zvawpzai++
	uzoVj+DSTOpbSSEvo4AAVo1TC2wjdOxfPl8QmyUxzibm2YngijIp5KXixFRsyWqN9o4f5W9XX6z0u
	uDiz8+06v3Y4KIfKS1jSY+S9+fpMQW2U1bT3orV6n9CXGq5yVNd8TehQNMVi+yCDC8uabQZLlGjf9
	VwsHoRusboLulG89q5fwvqcPzUMY45C+l7t8VbCfgU82M97Zex5ymQ6FP3XZ/413mPBsQnQgtP5DI
	0v7ZQRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywSf-0000000EHJk-1BEP;
	Mon, 22 Apr 2024 16:24:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywSc-0000000EHJH-1hpj
	for ath10k@lists.infradead.org;
	Mon, 22 Apr 2024 16:24:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MEFiH0003144;
	Mon, 22 Apr 2024 16:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=o47mZLlbjZ8BBVjTLMZTKirpl7IfxMDSxPg8gdfsUBg=; b=Qd
	fJ/DMgF1vS/8dT5Ux56kxuVWFO84nRCl+cHgO+bjd/ol555UR7K8CYJPpe0h99nf
	VvUg2XcJ4ZpdCdfIwL9WWNhi8kf7cgPtE3PWQngEMZ0Sxq8x+YECcG7IUO5NgrcF
	KatFZvj96TmPrKx5JB4zQNCkLXMiGTBuwOQyxhgDU8CHxSXJoxk8Ru40EN3Ls4hR
	bjcpM6iQ/xnz+q+RZ3D62GTY5MZAXEPMJGqfoZYXM/4D6e/y6Ao8o0vjYkrZ1nRd
	8N1px5e1zK05QSdz9ZhqqCPy0Bjow62xorOmRwpUCIqIU7NgbeG3+7dL/SzXUIoa
	T6WPLxu8yiQMkyMaHMWg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm5sx4xv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 16:24:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MGNxup010478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 16:23:59 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 09:23:58 -0700
Message-ID: <5a2bf374-0def-4c41-8260-20fd7428bad6@quicinc.com>
Date: Mon, 22 Apr 2024 09:23:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless v2] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, <kvalo@kernel.org>, <jjohnson@kernel.org>,
        <nathan@kernel.org>, <ndesaulniers@google.com>, <morbo@google.com>,
        <justinstitt@google.com>
CC: <c_mkenna@qti.qualcomm.com>, <linux-wireless@vger.kernel.org>,
        <ath10k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <20240422034243.938962-1-suhui@nfschina.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240422034243.938962-1-suhui@nfschina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dvO7Ruw17PXOuEqElGCj4QLG1BCbc9n0
X-Proofpoint-GUID: dvO7Ruw17PXOuEqElGCj4QLG1BCbc9n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=754 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_092406_596772_75C55AA3 
X-CRM114-Status: UNSURE (   8.93  )
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

On 4/21/2024 8:42 PM, Su Hui wrote:
> Clang Static Checker (scan-build) Warning:
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
> Value stored to 'ret' is never read.
> 
> Return 'ret' rather than 'count' when 'ret' stores an error code.
> By the way, remove some useless code.
> 
> Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
> Signed-off-by: Su Hui <suhui@nfschina.com>

(try that again)
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


