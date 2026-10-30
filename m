Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC4A606A31C
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbZAEcUO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMTeE8OH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hwe0ltI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=; b=AbZAEcUOwSzYiC
	lVpsSBsZOAYrG3m5oyVAJuFZjRm3Byl3WwnoZIPQ+qCSdDDi/O+wJT/4tklAj+qU7VDpIvgKNuIJi
	aVYchdVj5bG5NCKXMuaLUjoHn+rE91/or1/jy83sKZUrDY3AEcI9TjtdGwNG32Tx+B2poP+4PWG90
	6veM9uFtLQ/15gLBem/oDaGctP/mUPBKcziFSSGIb6qYgnbKEP6rJPqk9WeaOPLAK3YJ1t7vEO1pq
	M6N9MQPLz3W8NfCNPnTrz87f0RARB2jvuLSCmSN+vMQU6wkugxyKGD5owypiFBMSjt0c1oRm4gpRz
	Uz7XBmwqcYrvJNzruO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh8a-0000000B02z-16CY;
	Fri, 30 Oct 2026 07:34:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh8W-0000000B000-3nhT
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 07:34:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F01g1266511
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 07:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=; b=IMTeE8OHKfv3216t
	6fKdjiaBuH885AeBMd1k244iLgxqtwc9gN7GWtOAx2Fl5Gj1YZvJ30x8lSJkFFRj
	DbhCqvljbCaZ8J0eVvnIMOhpNTYijxigHRsfAndbHd20Tdi6/WorqdfopHH7k4ps
	22Wd353VXT3f0366wkhpUJg4hK2BWsxc4/56cfmMYb3drrNOc/Rr5grU3V9lM52M
	5dUtcah4ag/7uWcfRYWtwyOs3rSxXQzmW/yRIPhQfEhvFly/vYbQK+chS/s5eY7z
	5Xk6HLOj9bJP30+h9vBzbIDf2h6jqKB3MZ+rk/Ny6Jqskrh0bEsnR350bNDavmje
	DvEqag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1ujk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 07:34:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso46263185a.2
        for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793345690; x=1793950490; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=;
        b=Hwe0ltI+HrJDiL2ilxVVuUyLba4jMsj5thGa4rqKiJynceocP16ZRcCm1umYmNS6Qj
         iA0SCuLCuHT5mLTAtortrVycBgM/7QWYcmfM2HS7obZKG83Tjg11ZNb+hdOfcyRvHO87
         3HXWppvdXv/ZKIGCAk16UEdIOiJswxZ1wNQngdZ1RzVuIsXcHyV8KDFT2fjpkJTYSZ7b
         Pohdx3fP87EaAMtD1bifpZe6j2NVKuC43q3dQgCglujNZjm7d9v9CPlt8+euQ1PQcDAd
         NTpGrW9yPqlK70+g+7DgcRCxcOsjZ/C3lRuNh4O9wKCbDE8R6LXrq1ZIZDKotFD0Obr7
         y7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345690; x=1793950490;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=;
        b=Q0Vw7Z4snUB+vn8Cohkhk2sEyb8Mqo72zRObw4+oEfo7ZKynTU7/S4QDwApH94DcyB
         4kWEz8LQnM0cYyTenmhR57RMH7Vx3SltVjVYRQK3Pi6BYH/XEkSIN5GusprTyfsWz91C
         QpmbtGYKs3rWWSTDnhIR1prAs/8uyaG7bZC6SW48X+1T5P8RhJPz3pgf9a7dbeNrUwL3
         LKzovqUL/0wjn9WGQaR+78CxGwhh289iRx39hJq9A6PLcGCF7TTBQVV/f561NwGGy9/8
         bsRjC1YAXtrDf56SON2Bja1iPOO10JhvS7IWEAlDitK7rv7VF3fk2fIEL3av17nnhddV
         +IMA==
X-Forwarded-Encrypted: i=1; AKwUvBw2A/ded3ocQTN7uKWZbNKJc//gZ6z+Xa9zUHtxgPaGyS1RoRrnaafBF/BFZiSyZqHtv9LDZnk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJX1RUGZfZH7+u7SVEzc+K0ras/G4yxRWABna3urrtOOZkFPmtA
	U7UHyCnEp729P4xZqICTpygnuIhbLPc6X35lCG/9am2d2c0m7Xmb0JOd4T/0pk6sIqVEO0Ugfc5
	6hDN4FFoEyO2dEExJRjxzWXccob49gyJzv+kByCzS9ATcX6EYKq8+yuo8OSGMqG7M
X-Gm-Gg: AYBFou0HPfdzWUbl+x01nh9qyxmE3DKP8UZm22ShBYjlz3sU2tgD6R3slelbtXC2Zhj
	09reXf+rIctLbRjElfXnXWQokByvjK+zTSvykPvUZcDTYtqHcMcXupagzidyUuBHLuPOhhlMla/
	Hp91vHwO3CwYbbYH3FJfns3Tl/TRm9m/emVrVdyvp8KDxP/GE5bNBPLCWZD31RlKBl2iZ3RigCS
	O7BR01SiCHGE9ZBHTzuZIt6RSj4WvtWV12XAnpuGDzHQoiuIjtO3X/wHNRJZChbB6YvQvCxlCfA
	nJCE3wZil02egBWax9qlMBgj7k97SU/y1tqZwbGs4sNwwcv2hMb7/BJkMvNOmuhfd7R3KCeqLlj
	dcTobEBGVcAjwoGlUJ6CKM3qcrjMuuIomeLrGzuDNA8vFdzqTxcJljMMMq2jK8scol8aO+Xsdc6
	k=
X-Received: by 2002:a05:620a:1d06:b0:93c:7f48:8f46 with SMTP id af79cd13be357-944214d0ce5mr244551685a.4.1793345690344;
        Fri, 30 Oct 2026 00:34:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1d06:b0:93c:7f48:8f46 with SMTP id af79cd13be357-944214d0ce5mr244549885a.4.1793345689914;
        Fri, 30 Oct 2026 00:34:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm132997395e9.11.2026.10.30.00.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:34:48 -0700 (PDT)
Message-ID: <54eec1ce-5c47-42a7-a793-8c9f4619203f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:34:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMCBTYWx0ZWRfX/ELNRPqdUwpb
 sSl4yR4Yg27rcMpRjuI2FKSJ/OeCcRlhGClwZ6DBzkIbRFG5YYhMRIPb90/5x19HQ/JmRI10jot
 9FS5GgqRu6eKpBI6yFG+iKiJ7bm1NAW5DpCJL2wDFyJxcxZQjOrDXRicA3998pUCfWyIfHq37CP
 7vnUe6GHtERuM/SaJkNSbYWm4IEPoqBAWcwBsEuYoJBCqMKuEL3vdZRBTIfd6UJeN/roXO/bine
 idb0Y47Xc7NIyMSjWMCHYtcLrz0DU9R4xLiypXnk4gJGZWBOuPZjr3w8r2u9LCwyId6WIjyLP7q
 btIu8ZVYKUgYkqkRTCZ2pf2dPaXZE1jOGrulsKA2LNp2MrwStCr9O4Lyoar/ecdIxV7cK/I2xP2
 E5o8XphoaccSEjVSzK7qH8sC08Hqdt8qzzlb+F/aqAIXcG+pFFA3AI5V0buryM4YUjVC/duyXQZ
 ocaLkHJOi86y0NHbwSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMCBTYWx0ZWRfXx6WQAVV3BiEI
 53kRFBioXaA/klEPIrL5TPI6Y7L3X/c03pE91DuDAvXZtJOMqvbXt/pLimlV+CmM35puzSuzwxG
 dVVV7y1qWN3y+Qm1/PRyoL6b1PQ20LM=
X-Proofpoint-ORIG-GUID: 4b-6GZ_YDf7YQqjXqGCh9FGCNqeulxNf
X-Proofpoint-GUID: 4b-6GZ_YDf7YQqjXqGCh9FGCNqeulxNf
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4489a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Yg9iZ93C6t-IJzi4hqEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_003453_066529_CD4F8C47 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 08:19, Krzysztof Kozlowski wrote:
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Fix commit author.
> 2. Drop more stuff (LKP, Jeff).
> ---

-ENOCOFFEE, Subject misses v2.

Best regards,
Krzysztof

