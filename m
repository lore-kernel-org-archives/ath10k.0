Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E924CCD1AB
	for <ath10k@archiver.kernel.org>; Wed, 22 Oct 2025 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVTDxUa5MCBjwGzNjh1dYppHFtbwKyHbDkblvk32S5U=; b=3twvoDCRckjmRfbgM/ci51i0vM
	gw4xy58yS6C/BAWDnW95yVZAm/jGoHxK1vDZu5IGzPyry5ymJ7Frm3ZD4kti29SO56T1RshSLmcNK
	y2YDidvfThM2owjrk1U70IKStWnQNZ/s8GwdPfHR90tt6TVAuYh7rcYnLo/LXG0YQZ78KivRPSayB
	+RjLjOEiee6bjZ5m2ddkoi3FWSLKcvoajhjFxJA2H9ffgZvFozEELs45M82PMsAk5NWNGHw5mv8in
	633u20bDDoRSRWJl8rGEByvysFUIe4JE43j6cMgykQMZT1U9BSYlP4WPrxX7iUJCKvmcEaAdV7VBd
	+ld4U00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd7J-00000003v6G-1qBA;
	Wed, 22 Oct 2025 17:59:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd7G-00000003v5o-3UJZ
	for ath10k@lists.infradead.org;
	Wed, 22 Oct 2025 17:59:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA5R3i020184
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 17:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YVTDxUa5MCBjwGzNjh1dYppHFtbwKyHbDkblvk32S5U=; b=nobq8lgHykBF7Ui0
	92NzON6L1iETVxwcgtgXraWJbEsEE5sP/u2wOpHRSstUolkxBNli6Jc/cs5nwJzn
	GTwXyoWVaDp3q6BbUTJJGcWlhq8vER92w9+mZIsYkFzNhZYMGBZZjFgPAdkb6fs+
	rB1ypcz/j6VLBy9j+1Nwds54Maosf0nAyw9813lzdJVknBmjubMdP8TVDwa9AHSb
	1WaBFruQcdMuwmU9mwHdtt5pA4+x+pUh4k4IZZi7oGKTmOVF/UxYmdqSgOHj3pQP
	cBWMDs0oelx3qCnK2Co1uJs/MQvPS3K3zeu4D0QgNKHnbhcoRf6TxQ2UXp2vKSU8
	eR8geQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3445ncw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 17:59:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-798920399a6so1186336b3a.0
        for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 10:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761155957; x=1761760757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVTDxUa5MCBjwGzNjh1dYppHFtbwKyHbDkblvk32S5U=;
        b=nMddXb5Da+Gb2xezr2dTScUACgGQEd/X/r0cIgu5ttot7Jle5oW2GF0NdB9yJKJs4/
         dF96k1l1eLeC5MdgQSs5Okyajn5hHZ97gKN/vZSsw6FJL2hHo8g05aEGUKfIR2D1DwfI
         RoJa0mlPTAkh2IBD0AX2wV7DErdFkMb5lvkNr/H3BTAKHUKwL8iEVuxRvu8rdd8PGBKx
         1hqJ57DB2C0VOoajlonwRVl5yw+a3zzjRM7Fw1iyyqw5jgokQjtweQUmIcY/jdpivxqo
         EeP9IDBAfKUBWuwjmWwyfWV0koKx/vIeCAt1C2b9RzcFDOY1H9jZ8nRerkRmg0vko/bi
         Vz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKgpeJF8B2dKkfKNYrvd9HZy6ntK1u/CgBfFklgGvUtob4x5ADn/ZjhNRJiVWp1JLaKh/pLLY=@lists.infradead.org
X-Gm-Message-State: AOJu0YywV5fNIE5p+6bWoXMBcn7pDykNLQJ58Ud3EC50iadkqM6MNxRW
	cFHgdgB1KYqZCnuBEYtB3K6HsRzi9AZD230i5n5gnp9R00Tpd8Mt9TzBYmipnD1ETThaLlk2Psr
	FjxO70v7Q8lfCxoTghywiDullFU18tFmaBXGavHpOkRH3ufz8bAHpkJioNQ86OEGK
X-Gm-Gg: ASbGncs95LB39TAUThe/amAf6/IuhnsxmiW1hwpx8VKMIPtZbXndDpIuus5a1KeIYur
	mop90FssOhMvgRbNW+/b3HxviBAsRqvrF7BbjOQklVAuqb8ssn7pDnZktUUwiNyAoXFBPi6+ObT
	RDLykrNnLSyUbN/teKX4aV734gmITjRqcTrzixzQrvInXt9LK2QvN8gYEjHSDazSHFAhAoiZYZk
	Sff0o7a0i0CGwSd69TEXx29/Is3Wbs0t15Pa3iTmm6pUFu8RJFGbd3lPFI2HBkjYzmiCvgvtRpp
	qzXQlyL5MB4KB75x2A0JHkgt45TLUcjf+G/fruwR42gpjnP1y6kFHe2BkPFsCw33PQmlUREc8mE
	0McnkNpPYhzcll68FpW1XVZBb9P02vfdnxyk=
X-Received: by 2002:a05:6a21:6d9c:b0:339:bdbe:df98 with SMTP id adf61e73a8af0-33aa81c4325mr5628878637.28.1761155957190;
        Wed, 22 Oct 2025 10:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5y3u0xzYCHWDSlNnoOWL1sz7J3kf4Fz0/YdQwwpxY8t+Cj2GW2WwYobgvQLg6BVs7jiFv3w==
X-Received: by 2002:a05:6a21:6d9c:b0:339:bdbe:df98 with SMTP id adf61e73a8af0-33aa81c4325mr5628842637.28.1761155956737;
        Wed, 22 Oct 2025 10:59:16 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2301230bdsm15132413b3a.75.2025.10.22.10.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:59:16 -0700 (PDT)
Message-ID: <28db1c63-c87d-41fb-aeb7-9cce0f083f2d@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:59:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath10k: Removed atomic iteration in bitrate
 mask clear.
To: Rory Little <rory@candelatech.com>, johannes@sipsolutions.net,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20240806004024.2014080-1-rory@candelatech.com>
 <20240806004024.2014080-3-rory@candelatech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240806004024.2014080-3-rory@candelatech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EWeEuXn2RJ2R14I0gig9Rze350deesv4
X-Proofpoint-ORIG-GUID: EWeEuXn2RJ2R14I0gig9Rze350deesv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX74eWiNcjem9B
 tb5sJRAzPn+vr64xjzwzp6eCWiP+F0rOfNlIDxq9sFkGtTm2rhYDkBNecqhuIECMQ9wX4/AvSbK
 ugVsamMfoKSnftubd+aUCjWSoyVh5bTccDN6l/uhvoOFr/876FSLY5WyvPJYjGkherNj29OMzLt
 sEIjj7JmS2hemIWWvR0bQZBPS1CzYneZ023O3Gt53RFw3D/oSTbk+dsbgnjFHZdrW9fX7chQ3s9
 KOIwnyH52W/Wi5yj6lSRDWiV5P/0UTPoejLS63Dj3KUF5pBOxRMHmz0sYRhhAk9OMzpwhYJhDPU
 PssOGSLKFI+kC1Lb4ef6IRJ5qJWfB0GVF1TbGPjTUyke26IWX2eSurw/pRDjQSnhtjzXeTGjsjs
 /eKgYYdJEFfb7cfjQns5Nqrc9g7SNg==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f91b76 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=uYVGJH5IAAAA:8 a=I2mjh__s8OsZQkTd-rwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZkEWZNUrOYKkpCLSUeX7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_105918_876781_DE8ED642 
X-CRM114-Status: GOOD (  16.80  )
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

On 8/5/24 17:40, Rory Little wrote:
> This operation requires some blocking calls, which causes issues when
> attempting to guard this iteration's critical section with an RCU lock.
> Instead, we will take advantage of the held wiphy mutex to protect this
> operation.
> 
> Signed-off-by: Rory Little <rory@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7579a1cd7d15..a1a13b9ad465 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -9502,9 +9502,9 @@ static int ath10k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
>  			     ar->normal_mode_fw.fw_file.fw_features);
>  	if (allow_pfr) {
>  		mutex_lock(&ar->conf_mutex);
> -		ieee80211_iterate_stations_atomic(ar->hw,
> -						  ath10k_mac_clr_bitrate_mask_iter,
> -						  arvif);
> +		ieee80211_iterate_stations_mtx(ar->hw,
> +					       ath10k_mac_clr_bitrate_mask_iter,
> +					       arvif);
>  		mutex_unlock(&ar->conf_mutex);
>  	}
>  

+ ath10k list

This was deferred back when Kalle was maintainer, and I'm now revisiting the backlog.
Is this still needed? And if so, is there a reason why the other instance of
ieee80211_iterate_stations_atomic() (which sets the mask) does not need to be
modified?

/jeff

