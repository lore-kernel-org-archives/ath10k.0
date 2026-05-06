Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DCBCD342C
	for <ath10k@archiver.kernel.org>; Wed,  6 May 2026 05:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7Xtwxu527ONdwqq1IS7pFyONCSzk0/BWatqg2qG/+o=; b=j765+RpkN9wWUEsq+F86+4wkaO
	Oii/3AyckhDCq9tydFbKtHnwIH6wILAFTWufFq9K6FM/zBEQ7031yZ98YsaEz86R+iugzIPeoQwTU
	65/m81fG1pVq47oOKMt25Vu6D8F6E4PaWgZM+LA2dLb8mTHNZYSqcxiKBFRjb02WEciQXmMGXD5RN
	1Uw3nMdXVxYfG6Md6wud2BnnYoEZgUM69oqi1D/wm1Hkrt89Z7uosILskPeLsLuVxGzKNDo4HXAcl
	sj0qkVgreWgIfOi/i1s6qSk+sQSL0W0+yQN8bccsihS38EKLwe1LAgzy0Aw0TajYOcWGdIzZdacSd
	bR61JiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUWg-00000000l0w-0Yta;
	Wed, 06 May 2026 05:10:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUWc-00000000l0O-3B1w
	for ath10k@lists.infradead.org;
	Wed, 06 May 2026 05:10:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Lw0Pj912232
	for <ath10k@lists.infradead.org>; Wed, 6 May 2026 05:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u7Xtwxu527ONdwqq1IS7pFyONCSzk0/BWatqg2qG/+o=; b=hgM3wVseM00DhilL
	1jQXAN6r6e4MoIMoAagWXMk3bOy+pHKdMg6ALvEMM+CB0Px2GdEoEHo1r1Bvj6Ie
	eL7Vb08krrRE51Ui8AhrizZU0x/ysk58Ncdqdc5A/JRTErW/Y627OU7CSnr0Jm6N
	iaAFc6itzyck3p1NogjqLW2n+v7y0BYfL1o8UjBpM4DreNfSVHC0MlW4nLjtpfNK
	h0SDzqfTeior/ASzpXQ7sBrWoW+NB12Eq/6T1GnwzsRSk1aVWTgT94QK2jfBkzOj
	JcGMVgCk6yaJg01SQghBCFb3KtIi3sn0KmnmZPk8Y5g3PrVGouRZ8eKkC5CmbHtj
	pQTpzw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jjyf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 06 May 2026 05:10:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so112009965ad.3
        for <ath10k@lists.infradead.org>; Tue, 05 May 2026 22:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778044220; x=1778649020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u7Xtwxu527ONdwqq1IS7pFyONCSzk0/BWatqg2qG/+o=;
        b=OL9WDfvfZKc+c5Tjv1Bsogcjrol8CuSDYywjDU/o03+tp9/YXiLP90FngodRIelGFw
         T/UJA7VUOfW+AEfzrFq5yIXKWAOMG1km2PFJgldYHD1HFSBRAa8+fuzzetV1mWmJQp4C
         sVKZfKVHa5UoE9qHOp3FyIV24tCo4INP39gcokpMsecpzUsC03LhlTADVf+SG/SeQScf
         hB7tKqKO3vhUaED7fVIQ889pEeB6YUvHcS486MKvtojo9+SqIcBrT2vnp/cP2tVq4JcN
         8qUD9GJnVKJ4sDH3DHbH7Cu6ZA6xg9kLmUzWHsu1vEuNHw6Uec8RvOc7AuSjfuPREklI
         0nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778044220; x=1778649020;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7Xtwxu527ONdwqq1IS7pFyONCSzk0/BWatqg2qG/+o=;
        b=Xlpn66MJYk9u/yENomlFqxfM1+KhNnV+/8zTlpGC4okVR2u4eIzLiCbJlEfIl2hQ1i
         F3nyRQ80Sg2QAhM7gbMq7Xq/fuZP71psf3xdja5N552cEdy6C8ghTVe0t0FZwSp1eJ6x
         +PycVGhnGw0VA/U19LuNZMXUbEpNBhLBPB/8GXo4shLa1rzivQiBEehYWHLdDC8jJ8/D
         gHz72lDGWX4TtF91Ap6ikluT7VwThcmKFSLMGTEK0E0Sn2oqho/CT7L1EtQuuL/FZMae
         /dnH2tuvt+e2kVHInJeqS9kTv2pthOWdScDrRTN3BoneVyjHLgdvgeIqiPRVFzUSQsVB
         I1Uw==
X-Forwarded-Encrypted: i=1; AFNElJ91uZTSePl7x66vP6Iuob6NsRaviT/laZ6fV9oWgdLbmUa9/4B+XY8ZKFFeLv9QoM+bXnqJUdU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5FUAZYe7ogre2NprPrk4r79qO+V+AM2nsx/kZu1YsqCanTyif
	AvZ5DPex901dEOCYV7kVVDDywGS+b+YFnugzqx86c6lqPFTy4pnYomb2j2+nn/SIAJSxnKWgr3g
	aHwG0HRsZtOewOCIAuZTjg6fLAVhMMg15/1HMm49KlfGliiIku7fv6BRVM1jSJaWyFkhOOo0z
X-Gm-Gg: AeBDiev0d7TTwy1M6sAbb0Eh6eURWK/AKQIjbzNBtXZY3vMGSTLqtPpiN0N8vHHT+iP
	iLAopc6uiLwhFHPixXo84KgMPagq4oByVGf2UU+BCKHRl8v0IqDsL+iYLnvYbMo1FKnW952XV5x
	bapS3Z3QYiRUuLCz67AIMNr9Nqdkr8lShlicoDp0A052ijlftiqljT+5cJWQpqpvgyJnzUt8rE7
	Kk0uMPkUhfgq1nXVn0UTI10jTVrB5ypu9H24ceKBYtybrUxLZEc/KSxz5v5p9lkXubCH6WyKhPQ
	ulZ6xWQYTBMuGkCjqbsjWj5yafJgVy+vqvzQMVmfNYqduYq4VbNkOvysQJPsqZjTVbfQOJd0O9Y
	bB4ZgxSToGKs3qOvCgl6gp3oPWqBGKU0sYWKBI82vuzDw+AVGVAIxs27Q5OyuJv47g9Kgqbs9
X-Received: by 2002:a05:6a20:3d0b:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-3aa5a9b7371mr2199507637.24.1778044219767;
        Tue, 05 May 2026 22:10:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0b:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-3aa5a9b7371mr2199475637.24.1778044219304;
        Tue, 05 May 2026 22:10:19 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839681a9e33sm4773198b3a.50.2026.05.05.22.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 22:10:18 -0700 (PDT)
Message-ID: <bd36f7a3-ec5a-4018-8e53-a5f5cedc3909@oss.qualcomm.com>
Date: Wed, 6 May 2026 10:40:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath10k: skip WMI and beacon
 transmission when device is wedged
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NyBTYWx0ZWRfX4fQd05mGtoki
 o3lsyCrfmQqmLTyihTaC+lMd4Ot1adhLK20KVRkSJ+vTYHd2GH57/oOhNPVrHVi89iUPbzuV1ds
 lh5ofj1ac/jSCmNuJbidFsjylQ6OI+loqwln+FaOvGzkM8eWXw85UdXP8FyoxDo/3PS8B8K8kWS
 4LMkfjy36LtN9zyzf4uYT9EKBcj6r4jVsfkRHiRiHlOQX3fuMmUOZrZ3uRGb4/LcKjD1bbdwSwm
 9FjP6V2Z4ltRitqEkNNyI9O9IndEvTyBLF+Ka1xPSf/EBs9FZqsMEwi5+FwfjXJQo1dnMVLUUqe
 wGqBw2OtCKX0mH2EUPJnuuB2GUclMw7J6dbsH2QTt/2RX1RWnoJ1ecYQX0fm1rNk+S8jwiDm7xq
 dS6BI9r0VAmpz4sl350EbXJilGPhVe1tcL0idwXKjZiCmlOXUEz0r23e6t6lcBW/KExSd0D7gDp
 Xzuee0em6eXkVCJaIdg==
X-Proofpoint-GUID: l3dyzgHmxztxOyvrj5p91mr2YHJbja_0
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69facd3c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EIYY-h-vi8t0s74smRsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: l3dyzgHmxztxOyvrj5p91mr2YHJbja_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_221022_820989_DF0C664E 
X-CRM114-Status: GOOD (  12.95  )
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

On 4/28/2026 11:47 AM, Kang Yang wrote:
> In ath10k_wmi_cmd_send(), the current code detects ATH10K_STATE_WEDGED
> and sets ret to -ESHUTDOWN, but still proceeds to transmit pending
> beacons and calls ath10k_wmi_cmd_send_nowait().
> 
> This can lead to incorrect behavior, as WMI commands and beacons are
> still sent after the device has been marked as wedged, and the original
> -ESHUTDOWN return value may be overwritten by the result of the send
> path.
> 
> The wedged state indicates the hardware is already unreliable, and no
> further interaction with firmware is expected or meaningful in this
> state.
> 
> Fix this by skipping beacon transmission and the WMI send path entirely
> once ATH10K_STATE_WEDGED is detected, ensuring consistent return values
> and avoiding unnecessary firmware interaction.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

