Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B54EC54F54
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 05:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1oxIOxN0g1TGcrg/76HonK4KT8P9WIXK+xAIjQtwNk=; b=hzxeFnm+GjQ91vR2xwe0fM/3mM
	Qrdm9G+P0bsX7i+5nWebneHaTCeTOor3cqHjvJ4B4sqBZBiSR9yWgh0HM+PQY7taJRqKSknTiP8y6
	wyvfdxPXNc1kYEYtmvuvMwdQQLnwhm8XH3h3iZo5mi5bP28wOMbSz5P9oB1Bf2QFQ7PQZVkmbdnAF
	h6JQTAuEj9LjZh0RihHIbWSepHZf/Pn/b+YAj+ASx1H2rFvzPIg4N2SE3BYdqHOdJyvuepQ4eLn5M
	X1I2aZu4Xd5j8AWFQzWrxxGJl+ZWgE+e9/+gRRwauZIdgS9LWIzyVCxIk8TEpyLO4ye3A2GENy1Y3
	8Xrn1PeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgD6-0000000Br0a-11I7;
	Fri, 31 Jul 2026 05:55:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgD4-0000000Bqzw-1Ye3
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 05:55:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4uxuX3278062
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1oxIOxN0g1TGcrg/76HonK4KT8P9WIXK+xAIjQtwNk=; b=DY4r76zncXECck1y
	GdVQkcoMJhqhlrK3mNjI7EewvvlBTaODhhZlRukVSNrqO0UMLngGjlgqp7SR0kWO
	74CWpOOCjKuwtRQY++9Roe39HX5RW6DDqe/f6JEUCEz2vkLu9fYU7cSsLKZWtGnl
	adKsk2lblTMI8x+viHQBxiC+admDF7rNswzjUiL8a06mvbQZaA7OuE1AA1OwV0w+
	i/bCT4Lm0dE+63pk1o16lcDmqoAOeR5XZ/T5l7nXkXVLC0Kbs5ddc/9GG2XSqvnl
	4NOSDlKCSZ57XGCq76SCg9+tlaG9kSFiD7DUucyzLRQDPJFGEonqweIM/dcNE4cs
	GhM6dA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f86hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 05:55:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso613936a91.2
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477304; x=1786082104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1oxIOxN0g1TGcrg/76HonK4KT8P9WIXK+xAIjQtwNk=;
        b=PtktBrM/k6xFtRyAf/RPtQ3Fqi4PQ2jFJSvjUJPgAIz/vRX6Ds5UuPFk+Pq2Edv84f
         zp7iwBnAsuW2wn7JkOnv3Iifggw0pMB8+leehLwnWZknYP/KJBRp9mGJpylQ9WnKotfi
         9TFEfIfmzdTSJrYuVsll9eQVDRYil3oUeYIVAffetl4K8bACutN083nC7Rc5WstwxdlM
         4ckgbblpCPqekzmHzq6zb1c1XtOyuvELvUb4+W5GKf5TZm+Rt7K+BrrYdQXHSFqnTQK0
         H6U5+M49xA13pmbcgm+RGnqYpO+cCDWpIsx+5IrBcASsXsspK3AmzLGHGyBc2cgQXQGp
         2n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477304; x=1786082104;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1oxIOxN0g1TGcrg/76HonK4KT8P9WIXK+xAIjQtwNk=;
        b=kC366P/1d2E5Lv8CmbXI8nBRDjUNg7AOirFM0iOljqZfJiIo78LWs93wsTAQ8X15Ly
         BNQJzvraPHd2RSqrYk1MrVxkh9E885LJAXjMfvPbfKKUUovdxCkYMUma5WWMYnPZWSqN
         demURWXDxnuGoaKWewlTs9gAyYRhMooZsrOjYOsP4Rf6QG7hmmY/wUYTCnjL9nhWgfOR
         Rd74DTSXRBBhbyebUrnzph1A1y1W83xyeEjB0WgAhS/Hop0UKnnzN/mWTh8vo0LVNviD
         roccoNW56KKaDiCBouTsIVba1zgOdM+6kZ/UD8drrEpP11KcwlsZKRe+A1nVIfJPu395
         kj6A==
X-Forwarded-Encrypted: i=1; AHgh+RrB3mKkXn5U1TXTbNzyV0xvzpSjWuWrrojA1tgqqV97E/17jCklJifchTRqrXb7T3u4N53eXUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxB3uZJA3JYo/Z+ENdqJ1MlcOD+YQUIRs1u9fEiGP/0vGLslOD
	TcJxTfwhRc8BwZbIy2fPz+RwVq830KvriXSGBosUtbb16UP8JxEDCCvpmp9apQRgWrweVt9893Q
	4yNl1XW0LVaqn7TII1A82Il/z3TVvh0U0wMQpF6F2Gj+Dz9HhzFM6ji/j2NukLYC6dJbyvbkY
X-Gm-Gg: AR+sD133wUWhsq+Q+2hNwzW6b8faH6adIxRCz98XKGUBnCHxqInMUskVyYtjpwb3E+2
	MReJV2KJ+1I8V6t9A7PQv0grTfMOSokdw6YoT9q5c21oR3/udX9ox8lPkDydZ//IH4pSHQUXZmm
	nyA/v3/7VIcHTlVpLgoPK7H6WVMbfVmXXu+Pm5FvSF5KkGgmR+hgtPegRnzBHKXMSQqXX/pnmrP
	UZtUAJBbxYiOlHPhtgxPSqr1tOGyBhvwEFy8oafJx1MyrE5knf57mT4XyUCl4oFOudXKbcDcWY4
	8YxL1u6z2lkOEMAoG1E17+cwCz6/fr1H28sCR0ul/X/RkbCcems0jf/IK8tLjsxF8uyL3HFCOQz
	o3SWLhq/Nl3xC2NlxFViWth0vKqYRkbx6BzolkO9/
X-Received: by 2002:a17:90b:4d8e:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38fb14a9599mr756842a91.35.1785477304019;
        Thu, 30 Jul 2026 22:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8e:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-38fb14a9599mr756822a91.35.1785477303560;
        Thu, 30 Jul 2026 22:55:03 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa7470c5csm1782626c88.5.2026.07.30.22.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:55:03 -0700 (PDT)
Message-ID: <bd49ebde-c5a6-4640-8308-e7b4c3702470@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:24:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: filter non-UTF testmode events
To: Linghui Wu <linghui.wu@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX1V4kHoXhnz+0
 O09Htkg0yWBdYJFSDCVlMQLOCwfmmkjI0pKdtBdjmLtb96HqOBfXLX66ZGC+kjDDmCJnzZCz31C
 u3Mp1lxNheDsFRNPktfxNn4REvYM8c8=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c38b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J8ee_osQro5uhysJbSQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: gZEBQVwBaB48QCJEQvGglswMDQkq7wPK
X-Proofpoint-GUID: gZEBQVwBaB48QCJEQvGglswMDQkq7wPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX1gY5BlABJSv9
 VrDfP21lgIyBNpsJ+kgXZQ6bwy3JoMRG3XnpWLshnLf+glXUYgw67iwPWxDFg3p3iJmMy9aGXw4
 myo0e2F8GGhWxUa0X7+ViYEAq+fRxJzCZjfiCQGQVvcLTFZ6Ds+Q25lWqeOhzxRnAvhcfFzlHub
 eMASA1AWWfyYGWhMgfhlgLPkFxn8hNeuWcgJxRHoYXl7NquyH6gAJaLGHPfuPS6jdIynKqwzdcm
 +MX1xJFFcqEgTwkljIy6kiNmG6rnJ5B/HFDhCUQuuQR0QBz198inFdt5fioqIqtwVx5tVoJncca
 wwpuLVGQ4pBMOYrO8KV/XsdEH8MW2mXtwtldUKJPsu7lhhvchUI6rWZDmg+8qQZLlwLp68XgKDS
 AEZxYIeFlSF4vUsF642TUyUzEC9EtQgt3ADmmYpS40zzjl0N3sOZ5lAM2V7mk7fwlHDK68A9i9P
 Ht5vi7BVmul+7HUOzsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225506_531157_05285AC7 
X-CRM114-Status: UNSURE (   9.31  )
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

On 7/30/2026 8:02 AM, Linghui Wu wrote:
> When UTF monitor is enabled, ath10k forwards WMI events to nl80211
> testmode. Non-UTF events can therefore be delivered to userspace and
> confuse FTM tools which expect only UTF responses.
> 
> Only forward known UTF event IDs from WMI event namespaces that route
> events through ath10k_tm_event_wmi(), and drop other WMI events while UTF
> monitor is active. READY events are still handled by the normal WMI
> receive path.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1
> 
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

