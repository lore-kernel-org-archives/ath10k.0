Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8268ECD5BCE
	for <ath10k@archiver.kernel.org>; Tue, 19 Sep 2023 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcin9xGvCB3XFvigbQ2G72KmR0UlsxUj+Onb3GPxs1I=; b=Mr7vtsaytXBb6B
	KIKG33aoWyHow7HJZDjutu94REjbxZNDknZl0AeHexjmPmeIZQorn/sNYmAMQzUcWDtBuII6IKLUR
	Sq37MgSG8sSTlIE6w7jAa4CW33f5MqsHskxMo4B7WvUdf7iTHrAFqQGJCA+FuKL82oXi03dbF0LYf
	G7PDrntAH7dvYKokhH+aTSLzdPdWSalP0K7jorgrIMepRTG8TBWsU9apQqC+IxI/sm+/uIA9ORS2W
	CZDhgkKzl96mRiHOuZr5K219IEiiuxPHHa5H6eC9BdRbFE/mhvOSocxUYsirN+1nJhfVm1QPsqGBU
	xw0+YrE0DVvlkD/FvOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibwP-000gPa-2u;
	Tue, 19 Sep 2023 14:43:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibwM-000gO5-0y
	for ath10k@lists.infradead.org;
	Tue, 19 Sep 2023 14:43:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38JDphdP017577;
	Tue, 19 Sep 2023 14:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FB+Wv0z8e8vpyK7yXtnE9x4fXf6Rr6Oxu6k/fddRaXI=;
 b=WGruaA/zvrV5PfiPz5EfDRnXZux4bASKgTvi1ciFKiaYmH3n1DFoCdKbpdDjtf6NtToh
 cYNqOsbNtgqTlzrxYPlO97xCipX1WaS8k9VFCfnBzu+jDx/q5Lu67K4g1kxm+tFvQli3
 AL7dHWfYlQ4kwkdRndvUSJanPFZnpXu1KQ4IBpidqGxg5FZA5I8GcmuqkgKV4sWVd2FZ
 /t4tDXliOr2agP3jfcy5oFiJpQ7EHQwxMbb3pTi8Oykj+uILY6s4OSnsjxh6zJ7uu9cy
 zH3wrODYIHTyaIJakXiHh2AMSa/qi97Ba3fv7qiLkkrXd1fpLR3+tYRkImyrRFSR8G3d Dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t78upgku8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 14:42:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38JEguhB002542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 14:42:56 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 19 Sep
 2023 07:42:55 -0700
Message-ID: <812fef01-6b13-4a5f-bbf3-311991f74a71@quicinc.com>
Date: Tue, 19 Sep 2023 07:42:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: simplify SDIO async handling
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath10k@lists.infradead.org>
References: <20230918143718.78259-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230918143718.78259-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ugwIaHwBT5CbchiRQ71rrYwjT23r5T73
X-Proofpoint-ORIG-GUID: ugwIaHwBT5CbchiRQ71rrYwjT23r5T73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_074302_362225_44C66A64 
X-CRM114-Status: GOOD (  15.46  )
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

On 9/18/2023 7:37 AM, Dmitry Antipov wrote:
> This is an initial attempt to fix TODO found in SDIO bus support
> code. As original comment says, an idea is to store SDIO-specific
> 'struct ath10k_sdio_bus_request' data within skb control buffer
> instead of managing (a relatively large, 1024-items for now) free
> list of the aforementioned structures.
> 
> Compile tested only so TESTERS WANTED.

While the maintainers like code to be as clean as possible, there is 
also the "if it isn't broke, don't fix it" mantra. This is especially 
true for older drivers that are in pure maintenance mode.

So unless you can show you are fixing a problem and you can actually 
test your patches (or recruit someone to do so), any patches to ath10k, 
especially to SDIO, won't be accepted.

Your team is doing some nice work, but I suggest you focus on drivers 
that are under active development, and preferably ones where you 
actually have the hardware to test.

/jeff

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
