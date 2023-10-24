Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D5C07545
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reRXj0I/WcYPyIvtV6+CspAkFvEZcev+L80uapRYExo=; b=GP8ZXwVxxF+Mu9
	YV7uv0JRiBFIab/R23Eu7hxpNGKZK6Foe6S392mrrIlaQ7BVpzaqWQuIYbAXQ80WgoeFY6ApTCyTQ
	VnKlNLsThZzJWOWzJQwL6FkWE4e09OU91hlSBkhxoWrDyTRqnfw2T+CNEpQ/i2Znmn2B68GMIjW6L
	fL4ysLfGPy0IosSK+1r2n67UrJ5nKYXjTpQ7SXLG8QbWPcykfx4zwzrBrpmaxlDz2cCZBHOu5z5/h
	pqoXJLY8junSlWPLoLHHVW6ayjmi4NGDmhhxqgBSWgzvIQpAw+/Q0uaBbOpIFR3FHk5p4dkTOzGXR
	VMCJHuCZSxX20G5gNjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvI8s-00A6EO-1P;
	Tue, 24 Oct 2023 14:12:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvI8p-00A6BX-1b
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 14:12:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OD19s1010611;
	Tue, 24 Oct 2023 14:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=p9sOB031NYZ8rg3UqM90082ySLtrpR0E5gqeOS58yKA=;
 b=ejOv4aqW+X41opJBnFmtmFQbaQunWDmcO/lEmgpsQ42s8OQAwlekie3CRbkijCpU1IRF
 HhQmGdA22Izso1SJG2JC2XhR9H5sMg93nbr9bd86oHqIG/6EOs6nByp/b86sY8uCwDhA
 5aXJpCJkow9WQ+C8HYWlEBvfnfWsmK8R11J3XDbagiDbHWnXbyi5AEVbuL+t9nTqfChm
 K1W0IhJU/647dbhzWGqasbjRvJxcr1ZJq4oBOhhPgG3V+bS27TUD38qcfirndF70OAk/
 bLU4wlJZE/loxQA0/0WrpNf9cvBy1SxWRAv35mOw4Jm0s/AXXNOdYH9o10R2vdTQY2qv FA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tx7r80xs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 14:11:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OEBq6d018331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 14:11:52 GMT
Received: from [10.48.243.236] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 24 Oct
 2023 07:11:52 -0700
Message-ID: <90328e09-5e48-4bd0-ac67-62a104b6eb76@quicinc.com>
Date: Tue, 24 Oct 2023 07:11:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: replace deprecated strncpy with strtomem_pad
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Justin Stitt <justinstitt@google.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
References: <20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com>
 <87wmvcxjdy.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87wmvcxjdy.fsf@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JythYTgortCfUjIegZMu4FJzutgO0nLB
X-Proofpoint-GUID: JythYTgortCfUjIegZMu4FJzutgO0nLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_14,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=308 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_071219_670728_E0E269FD 
X-CRM114-Status: GOOD (  10.28  )
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

On 10/24/2023 6:03 AM, Kalle Valo wrote:
> What about using just memcpy() to make it clear it's not really a proper
> string:
> 
> arvif->u.ap.ssid_len = 4;
> memcpy(arvif->u.ap.ssid, "mesh", arvif->u.ap.ssid_len);
> 

In the "changed & BSS_CHANGED_SSID" case that comes soon after this we 
just set the length and use memcpy without clearing the rest of the 
buffer, so doing the same here, as you suggest, would be consistent.

/jeff

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
