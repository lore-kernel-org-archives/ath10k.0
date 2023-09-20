Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA699C04FF0
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YL5UqBhyMGuqI/u+ebrly30vtA4OZebmGQG9cRxcUz0=; b=MyLUhKUkNSmntW
	Aho/tFEx9wtSjcQvXljop2Mqpy2YHn6xIBzbYrrCsk3E8Jte9HiXyNF/EYhCFTKZ30qErUQsl9HDX
	d3rPGGjYTkE60YYuUNoxCVeinOZD7EZoy9dnXoj42f7pAYxWnoIfhWuNJWB0vD+nHux0MUG4gKuWA
	3OJwJwnO8hS2UQJdprSDEtO56h+uHQjI+qcBKLFu49a3Wvf0dJQMIsu0pWyyXZRjg7hYGoFMUMRzP
	F+YeiGQmS9ym7okN+kMiH5tvct35vFFdjpAenhi2UOcgw9pnmkgpn7C70z1kPSwp09XJp25FEpBXV
	fHceED/i/xbUV4H4wtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2kG-003z8s-04;
	Wed, 20 Sep 2023 19:20:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2kD-003z83-0B
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 19:20:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KIIXR1032639;
	Wed, 20 Sep 2023 19:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eV9KmdTPjXbPKwDk+kKZIb1OxrwZjFE6wiw0HEgkmJM=;
 b=FtjLR2uqG/eX4peyxzj1j1Lkz/M/AnwJMhZPWvvydyfp1M96enqFGqiiAvMjMDewNyaw
 r7M9/A3I4rA9aBZLB2+C9h5+EsjAgJeKv8A9nkYvlKVoGDfhW5sPsnJm0Uk10EnMPdYt
 16sTJwqSufFvJj0pX9N+HnagbGQvrTuXzIa55na1vQtgatSJBa7dVYU+Aa+qfWfqTEcl
 pTjaCSAGYtKzHcFZDSfOw9kREvvkXq7qYgZvo9IWc9YiTHzufpH/Lu1nfePKwVg63T13
 /xXRSHaD2Qh5yiAAcB7Xlbowz1m5yVZEdb3IOquisTTI/dfJ/lTr5qO/jbDZTe83z4P5 AA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7r8w221d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:20:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJK96d020707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:20:09 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:20:09 -0700
Message-ID: <97f2ecdc-ad94-4a0e-81ae-83f61dbf0377@quicinc.com>
Date: Wed, 20 Sep 2023 12:20:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] wifi: ath10k: consistently use kstrtoX_from_user()
 functions
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <202309202242.GlXozks6-lkp@intel.com>
 <20230920154018.48314-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920154018.48314-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: umaSxl239mRyTXRDGmZmrsagXI8kez03
X-Proofpoint-ORIG-GUID: umaSxl239mRyTXRDGmZmrsagXI8kez03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=348 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_122017_267663_936FCF66 
X-CRM114-Status: GOOD (  11.56  )
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

On 9/20/2023 8:39 AM, Dmitry Antipov wrote:
> Use 'kstrtoul_from_user()', 'kstrtobool_from_user()' and
> 'kstrtoint_from_user()' where appropriate and thus avoid
> some code duplication.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

...

> +	ssize_t ret;

curious why you changed this, especially given that you were bitten by 
the format change required. I would have left this as int and just let 
it promote to size_t or ssize_t as needed.

That said:
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

P.S.:
 > Hopefully this doesn't violate "if it isn't broke, don't fix
 > it" rule (the same thing was recently accepted for ath9k).

Patches that are very self-contained are more likely to be reviewed and 
accepted. But the maintainers don't have infinite bandwidth...

/jeff

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
