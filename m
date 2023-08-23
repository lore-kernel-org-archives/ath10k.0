Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F5DEE4993
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPS3ygAmBeqA8aVKd7ouMf0GyDSh5WuI/pE7O0xhgmc=; b=3/YUZWT6imHMN1
	BVfoGWj+BABHIJWMoNXoFmAVPowaAdgssrYYOj7doqgwt7uzwtXnx2is72N7RfVGOozJB99ttxiLm
	lC/8azYI+CnbllkxE1NeWIbZq5DVQltXnK2FZ7dbEXajxlDcURgPkuXEtBfZAMd6spCnlXHZ+viKo
	S74ntki0h/uDoYxSZeWVLLrgmWEev/0D2SIbDzUQrhgMN6JACJ8qkqIEnTQOXB+EL63K7pvAeqc+P
	Ph+prBueWu8CZMrFWbMhw25V+pbV2Xn7qcpAhWcp+C8Jn0TmCpqPK5l6TzXjpP90gdNh/U3eypj0e
	zyMjMvr5PzJ+p49jXYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpIk-000tdb-2Z;
	Wed, 23 Aug 2023 14:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpIh-000tcp-0y
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 14:57:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37NDAbuA028845;
	Wed, 23 Aug 2023 14:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d7UnrTOPzHM0ma6fKGQ+AAFNHq0tpNwwB1s8dJW3voY=;
 b=kgIOZhHev98p6aztb4fOzGk1XM810cO8CFLrWOadVc0o7REYpqd6XFRsjbZF3l154UQO
 s+71gVjjrBfQD8p/3QTxbd7vjYQYSLjebcFaHPTEQNO3V3P2wIlBWKuVGFmJcDfY9GUQ
 1ESG5Dw7PStQ4auToa9MSJtUS8R91c02DzR3Y4JPP+a0yBu5FZSNOJqkuIQux9nPtCHf
 k11Ixzv1bFoCG4eQA6sFn3HHRsz7T/3Cl/gjVb+WC9iRXdzv9SG6N0yF4M5Ilf0rGjPK
 jtNG6ciANodUt1lPRQ7r8oP5QlGlKBGSbCCG/RKWSYVxUloPbStGvlhfTUhUzX7YRViC aQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn25vjcv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:57:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37NEvZeU023205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:57:35 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 07:57:34 -0700
Message-ID: <e3c6581d-ba60-41c9-8551-8d2f2001743f@quicinc.com>
Date: Wed, 23 Aug 2023 07:57:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] [v2] wifi: ath10k: simplify ath10k_pci_pm_suspend()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath10k@lists.infradead.org>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
 <20230823095008.50515-3-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230823095008.50515-3-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YXzSbQr8J3sT-qHhKGJ4X_qrGIJDJxBg
X-Proofpoint-GUID: YXzSbQr8J3sT-qHhKGJ4X_qrGIJDJxBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_09,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=481
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_075739_341887_3E301B6E 
X-CRM114-Status: GOOD (  10.71  )
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

On 8/23/2023 2:50 AM, Dmitry Antipov wrote:
> Since 'ath10k_pci_suspend()' always returns 0, it may be converted to
> 'void' and 'ath10k_pci_pm_suspend()' may be simplified accordingly.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
