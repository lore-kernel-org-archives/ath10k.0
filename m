Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DC21090234
	for <ath10k@archiver.kernel.org>; Thu, 19 Mar 2026 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=ZWYuO6sOWhwRiQJwo/EMtGHrYl
	WLJizBfKX91K9dPmZ9v81K+bv6iDMIHm2FAayziVHZJIFqxaltbCaZusnjNn8+huQ/jnUxmU1qagf
	pLeb5fMo73aI7NhuGc5Iwk64DvJGcd4eYCL4hiAz7LERJ/sgwQf0z2zAYLjDdvmztb6j/oEMKaSh3
	xSHAPSsRFSQivpHQ16ZtD7eJOR1hMxzT+w3EAP7k6BdFz1Nh5NcQTU1djLWpQXmGYzoqJkBxT9Fhg
	fAvm31EJejL7mfSFVxnmlPB8ky/b7LhuSj+BmvZSXYPKtfoUsajFmHgLe5UiZeS62A+lpCmFVP6NI
	eOldqamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKt-0000000AnQH-40w2;
	Thu, 19 Mar 2026 14:26:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKr-0000000AnOP-0Ctk
	for ath10k@lists.infradead.org;
	Thu, 19 Mar 2026 14:26:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wQN3368474
	for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=QarXSthNOTFkFQkO
	al/Azz2zcOzljz5BjrIOubnbmfGGbJxmmQ6cd3iZzccgYCrqJkS037p8ei3Yw2FW
	fMzY7wYL+M5x2a7CvA7ibvc7ftLepU8jZ7dSDLW/7wr4j35FiC+FuakovAkA5bEm
	oGhBZx90FsY6NawlnD2SuBkSEDvQ96PcWAnwDx73MXSASpvIq5ZWduCJ2vU8umlO
	caIcH0KHhMuAYkUt63XzSI7fCMxfvrzce+sUtWLDPgdWVXG6MaJGGEkZZ+JBYqeT
	9j36iOmD17f1976Lp7w4hBhFRavlaBWubY2hiT8tzn47U08eYCOK0hBVP60sOrdU
	sPGUNw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9kfw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 14:26:51 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67bbb4e5f24so8343439eaf.0
        for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930411; x=1774535211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=GpMa6uxSeJhKpFBdY6qRMx8RYSGWIxSGic9Rip5ZmlHY6etorXwVxSKEuHiUErwmXh
         A8thMdQr3GKo6jbT/W5tYzZWP3bUx/gy1xpwtSFOly7pyGKl6EHMRHzZ1KY1S40X1iKU
         kSSa+h/ZKUkzvxcklum04LsZq4TaEeNiZB4s7GMcZ5Bv/JjveTHvODzuN23UVMaIlIm/
         rBBNCLfWriLrqDzWVZBjR4hp70Til3Ij6lF1gBLwsxWRjOlmzuNPh0bFkNdaq+67wFGh
         EzL/Mg23msYY6Sf/wVbEPH5yN1J/HM5Ol+rd9zMZ7AltkDxxzim5UGKECkhghTawynjY
         55OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930411; x=1774535211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=VEzDrRmgvThiyMdRcitQaIpEsyCVZXKT3gXVaaiTlN7PLP2o2ZmATYnp/+fb8Ujyvs
         k+52ITaoB++jnjyLP6xhWJRBvKWogixTur4dsvOxNMVjVFgTr3glHN0Ckg5rD0Z+lLyv
         NOfaEu9NTW5MBAYPA2aUDE7Qtotk6qggnLKX7239bwWBHxUIqB5lQuw8zzh7iyo1TZ1K
         gOeoP/Ms7DU5Im5miMymQjYwqN/jt18m2PPCTZhlPbuh6ySE/LY9yAjXxLNWESyK4g/X
         bjR9yDEJ2QwnOCKuoHRwaUEPhnwnxTraAdEqnyycas7tpWZrbXy/KZ7U8dEfqlCpF4Y0
         E86Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7N+czVWt2kPU42fm9J2f1MzPKQVEiFDOT85yKB99MweMGa/p9EGENH70bHyEBZCvEKom5Ing=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSrWoF2XrhXjrtNKjg/ouChExVpLx3puIfLB0vktJFj07fnscE
	ITi4zX/g0gMeQgGAfr2Pr4G7Nqj5zL9AkylmZ2DGpZjXkTd5F6lRKMhuOmTWc+WsATiUO7vX+bb
	7EfX1DLA610FDLLm2neIWdY3VcfqwBpBFis+S7Ve2r7fZ6QyEZXUZXF3kx+syUZwB
X-Gm-Gg: ATEYQzzBoaA18YGPGggokR040LmXeLg8QEgWbuLgBITXVQa1YBlZpKBGhbtrv3LvvNX
	nO2yo7hvKYDESTVLoPhu9NnId+F6qFUGBbvBdCGKt70773BjEuHDeffYPB1MYeYERE82sGi6upP
	3vefiByrbhPlSQAc+/i3/3UFgIwPDhtpP2DUIsba6ojc+djE5dzexemHEnKwO6BKzJj+SodLgo5
	YdqTYbmqTDBQg2ZBKTbhtT6dCmSt77IDW5gwSS/JyRqScoN0y5ddmFvf6veoEVaSBUbIPBGWhUV
	+7IcRkPiR4RNPSxpVjwqGJoG+85Vo/QnpvpX7Tnq6TFaSHsuVZvgXe8NEtTe5ZkBH5CSCyo+ZKF
	tHF/qtfmP8cGVWLJMYp+aW8LURN39hNib6AoZ2gAfQQXIqUQnUm6W1oiixQRjEegTzYQEpp27eS
	ppQt0DG4EG0Jtkng==
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746057eaf.6.1773930411230;
        Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746016eaf.6.1773930410817;
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2d14b63sm5729630fac.16.2026.03.19.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Message-ID: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfX5zERiM2Z7KEQ
 UhH26r9hBT/Sg3v/dMExgJl2k+RnDC0fm015WopazedpWKhHHS7gctyE8ij/e4Y9H4ha4Xejg2R
 iZVrYMe9LedinLCuDaqFQPz+5LwqhQDcCkWxhFPTJUmxT0ZtvGdfmJ58LqAN5a7Sya3A6HEX5vn
 BpCOYYCDZI7Ali1UW2SiySqiNitQ5swBgVvel/rZM36ThBQ04aKT0pG86abNZUmdEwB+hsXl2ZK
 ETTW4fKbEWiYr3t08j5WGkTRLOhCFBFBtpp/UDxbE23KtI1ZkQn705dnuTe3k9WneVpah0/3l30
 e21j35Tw4P19bzG1XnHNLrpAsXTs567dmzVG3A1F5Onotjbpp+GO0AmguVy7YVaGkeh5hMi9Lx3
 eN6CzmRg+xHkL68fvnbQmCuvDqMYnqyEdYV01TFdZCOJeFQOFilv1uYGvqc5urflrcZkc/EQWUG
 xWeNS/FbnQcbbbnHV5A==
X-Proofpoint-GUID: 2JcnsBRgVW8T47aROUi9kSdXgrDLdZx5
X-Proofpoint-ORIG-GUID: 2JcnsBRgVW8T47aROUi9kSdXgrDLdZx5
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bc07ab cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yAZrW0GqhKXZdV71gCQA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072653_199982_A1E5477B 
X-CRM114-Status: GOOD (  11.68  )
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

On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Bjorn,
Feel free to take this through your tree since I don't think it will conflict
with anything in mine and it will take time for the definition to propagate
back to my tree via the normal workflow (which I would prefer over merging the
immutable branch).

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



