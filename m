Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7F4CCF9E3
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=; b=3KCZPlByDCHaaGjkpryCqXugOl
	stR3R+tuRAaval3em7fWcwCXmpLz3fomaYLO64KrF3fHJunNkfbimHdENpCjyyqIlF2tLEJ9HQ+1Y
	wypMM9YcWZVVJfTrXVTK8LpwfJnXVvL6Pv1pbW7vvrqw7BcnTBc+PFXQNi6qGwOK/42WcHxtVUmGW
	p/hCCIvF9dCbzil1zFshHE3tQZieYDtVSYY+WnF8yj3ASJ6kLImTUav6BC3sTG6r/y4axvN0isR3H
	CHImsyvj7ZV74SkxpW6k4aAqsJhb5CmujrwAycp3H1gkRPD2WYXLco3dyVjkJwuX+FjzvH70jg0M7
	BzAwLHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY7x-000000063uK-3jSd;
	Mon, 10 Nov 2025 20:04:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY7v-000000063tw-1Ere
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 20:04:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYNet4070712
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=; b=iHZoEb+7rvrtIGQY
	ZdifNm7zQg6ObBnG36sLNVmkMToc6JglIPMxJy+j4phnAhWq8JdOK3rZqcOuCjsE
	DiVo5rYj7xi8eg/Un7A7vRRh3TM1+tSH2+nAdhMWS+qF28anMvbdkLpLngazP6wI
	E+diKjovVkFr9MyuLeBfj3Bei45WdSbnWWoJKu/cK0vruY7q/cX1DJpClJfaiUOh
	c95agm6xEj3zDG/f3oVL9T6UfIDhxsUFJ8oi6otHx0T0ttsMtMP4LFNPElBZx/MP
	21YUa7uKEC1qe8PF+x8gaiT8YwV8G/kYqHSFY0UlOInvwhnVsdGaVd/A0146OewZ
	NO3//g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj8md2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:04:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so7462658a12.0
        for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 12:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762805073; x=1763409873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=;
        b=EOSeXe/BqpGtOw9HwyIxeW1IcDo83PcllvFiqm5wrcpanUSoaFqFMZTDkRCFtGKGIZ
         wKXD4hDCdvXYD+LM4szzKx/am3hTyx4XA9iK+V/vWWYxx0SNkDkW+E5/pTmd9Tao6U+T
         sIKFtH0+GEZ2zXRYcNtHBCnEgBKDe+4yTxmnogx/82QdSZ90YYNMS1/Ta3ij6jNdLFOY
         zvy989Ypnaogt38gpcpg98S+4HF56VWw/B9nCIpH6dsVg2i+tZC+IOINNoDhHrNT/Xba
         n2i9B5ZFm/kAdqsSalqc6+PM9ZQxeDxyUF9u+Cl2DqHR8pL7N08gardivIwL9z1JQEyN
         kJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762805073; x=1763409873;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wywLQuZS84UaCfivN9hBRyvo1mTqLh2yeP1DKGiRq6I=;
        b=p9oqwnorVkY6MPI9W/n6sj+HfyG8DEuFZQGGE3VJwY6w2qh6l7eaiyx1sFVl2ZbEKV
         zrN9MArzFIN+KEsjv0fHnTtsxgiUhIXiTMPP2oBwYOYnawff+XSZiJXTVgKA6ebybT4F
         kQ91vNiJJM2E7PL3yvJyDhf3VEtyJB0H5w9sDw2xYIzXmzKvSi1TJlWCzlAnb9NKtSu4
         kaz9aulbb4FOfKxHQro1NjzFe2DPtABvTFwEOo1/vpV7j8x2/J4b02+/0BbcCAVfr6rA
         2zcRxbwxZWbpWeqvZM5+gTOOo6qtF1KpwUg3CTrdItDrd7m2evBFBR3oYC7vpsm9RzZP
         DWFg==
X-Forwarded-Encrypted: i=1; AJvYcCX036HZhaZLUSJBFB8A+4KefL+5Bqm7keGtR3WDz+mm9Rke+S3ae3uzkr9vAS3YnKI/dpdImjw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhkEin5t3coNoUB2LisSP4e1TPKQphdSz43AbzJKG7yWQapSH2
	dxV6VtL9ZGlobRRZ247J7C+jnOQfzrCMBklRDjQ9nTD7MsLXZC2NrtB/Me0hIl9PjNzXxhq92gc
	osfxl9hBvAjQhEIJ5slx1L1VVUIDfxCp8t+4IOy6eIPcK3GFzG7qI51tUcf5vmH9D
X-Gm-Gg: ASbGncvGpjreJ3xtfnDrDcUvbfXCGHPYhTya1Il4M01JEmziGWdFvi6+sfJbjZgjqOT
	1x6nQ7+slblAQKxXRibdB9/pZSNEDVVUQD+iL42OhfkRgwbDO5KAHHIDjQN+5/hdCS6CEd1VjRn
	c6isjoBtMhxGOf+0j0qEwrDglTU9Ppo4bc/f+fZfIcQjPQi8CIhRN8FSCi8LU6NE0yZ9+KNI65+
	imsu04Jie9pOqPFRkT8LOdRqL7EAEc4urZbePZDq8g5qkS9zxS4jxZccsO68QuCdXfdDbHYx5Be
	dUC1AxTwBGOjcBZKIJZWWECz8Um4MJU2Gy8hVqb7WyLEL0D5SAjhN//mNHw4VmTycW5DSCLbcrR
	/kRG0UzIJu8iRK3OzaIAyLwX5H9WV6+DofhLORN5vgoORtkRsfsvwYl2vuZKTV2ZdXA==
X-Received: by 2002:a17:902:c94b:b0:294:9813:4512 with SMTP id d9443c01a7336-297e540dd6fmr127849595ad.3.1762805073093;
        Mon, 10 Nov 2025 12:04:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgRlu+QHDT2qRkN8FN4ZfcELPFfekO3p0qsOXqvaypumnws68i1D7DWIV/z8geDOvCYuPmxQ==
X-Received: by 2002:a17:902:c94b:b0:294:9813:4512 with SMTP id d9443c01a7336-297e540dd6fmr127849065ad.3.1762805072440;
        Mon, 10 Nov 2025 12:04:32 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297ed6808ddsm81285505ad.17.2025.11.10.12.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 12:04:32 -0800 (PST)
Message-ID: <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:04:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kl_mggjoHSugx_2Tr9_sDHtHSfL5iXV7
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=69124552 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8
 a=V89vUnNgf5GAzAs4dTEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: Kl_mggjoHSugx_2Tr9_sDHtHSfL5iXV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3MCBTYWx0ZWRfXwNzE8UXhBb5h
 MDBy88e7wIgXy9xfcJQpfrCs94mXjiS5bLsOvv5xhFomVlcJcKGlu4jslLWZd39M2SmOquYqnoa
 0FBi8OxE5qYBRGkrvVTwdoAwK+wz/aS/evX1UKV+hnZvGoDlQIwh6pk+a8cOhPI97CmvUl7sT0a
 cNR3HQCGPSgl3ASEEIFBkQAQ/lgYhJcqr/SUtYJTFtpLhn0flNdBj12IWnU3SPD7HxxBeYs3AAf
 LYnZiXpuPhXtKuJY5c7hPgoXf8B75ZQxsr5RnW/azTQx1Yfl/NDb0pagxrZVYXSCsAjYsCiJPjR
 SRXL8KlrFsKyYlA5WJSI/ZgrTMkb+iBFOmBrqomPMrkEG5YZS13Z/h8nNb5Eucsx1GfN2oKFNCA
 9IrcyRRBURI5eNfL6mex5hW6xgdVWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_120435_483620_92990FF1 
X-CRM114-Status: GOOD (  21.36  )
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

On 11/10/2025 6:26 AM, David Heidelberg via B4 Relay wrote:
> This quirk is used so far for Xiaomi Poco F1.
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> I'm very much open to suggestions how to solve this in a different way,
> as the original discussion thread got quiet, see
>   https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/
> 
> There could be other devices in need of this quirk, but if they're not,
> we could make it compatible specific quirk.
> 
> Until merged, available also at:
>   https://gitlab.com/dhxx/linux/-/commits/b4/skip-host-cam-qmi-req
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Amit Pundir (3):
>       dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
>       ath10k: Introduce a devicetree quirk to skip host cap QMI requests
>       arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
> 
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
>  drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
>  5 files changed, 22 insertions(+), 3 deletions(-)
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39
> 
> Best regards,

The original thread predates me becoming an ath.git maintainer.
Just for my information, is the firmware and board files for this platform
available in linux-firmware? Or does it leverage the files already present
from the original (Android?) installation?

I ask because the alternative solution suggested by Kalle would require
modification of the board file on the device, and that seems more of a hassle
than just modifying the DT.

So I'm personally OK with this suggested approach.

/jeff

