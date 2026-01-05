Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BCDC2A062
	for <ath10k@archiver.kernel.org>; Mon,  5 Jan 2026 05:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=; b=yPZYEUYbUgD2cVP6RRb/9B1mIp
	Ge1Wr9TxdN2mPo2z/tIZY6CUxbFrDl+1fKyGRUgvid7UKzsUyTTVgrPOxUAgDHxvUNAr+lD4qlwV6
	6sJrukPUjaPpnLk3HULKKdn7jZECwdM1uDXUGxHTBXPrgh949AM1lyw9y/Hy0c1X5mfrhlUfPBTCU
	HKVaReqScAHX1qhCn+p9/SiedTE6bXuqSHnhNx2cbwBfVBZW44DCZYMrRopQTIwQo1/rRRR1UYU2w
	fBpo2Hx5R4K96B6qcBXs/SCz6Vua3YRWrMYGsZpd1Cch7uQ6l1LE4TUzQR1+01l93w2p+jbEsCQpU
	jWRZHKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcd8R-0000000Apa8-44hg;
	Mon, 05 Jan 2026 05:28:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcd8P-0000000ApZP-1l4g
	for ath10k@lists.infradead.org;
	Mon, 05 Jan 2026 05:28:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604M4UAp3421235
	for <ath10k@lists.infradead.org>; Mon, 5 Jan 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=; b=p8STReybYQhbwnGy
	wNzUg7lL1ZW7z7QJkpPCMnINvfYraIv4VUFZ9waG50rdOmfCzCQCJ+zs1VRUlPko
	3M4a+g9RL79J86Sbze2/LnZBzs3eYkSmjI8qQMi5l+yQQHyV6emzO9im+aYdVADc
	yT1vHkIbNUv+IelL8Od/X2hIhomFJWSzBsuCo5Kzk/W6bcqn9eKiBKGH0NBPVi+a
	lJ4q9XmqlpiZicfHI2FoyBB/8vReH+e1TuQOTFV3h7ypvR5YxH/RiSC6AK2i+x1l
	4qqX+JAd6HJus+0O4rxmSFs5FeTwkmURvp0PGYL8KHTEudBIwznlSLy1u2lwyYtf
	wXrVKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertckhk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f4822f77so372404135ad.2
        for <ath10k@lists.infradead.org>; Sun, 04 Jan 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767590884; x=1768195684; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=;
        b=YafFk4xLe/9Q4fuVzXPWL+sAlMbKL6FFgQIEB+gTiuM/wJLlvLykJ+9p5LePTxdEBO
         bpRCU5FdPgLyd+9vpEArNeE6ZVIK6HGi+sj2DEWwqEf83PMnWV4vMfKbNZdKsZxceJfB
         p6ibm075HWU57Qfr/epKqTV+snSWh64Qg4U4jci09qHhHRJtcgbQZsuI87wA1EN+MAtX
         VFLyGo+fccZD7QgobfANvSPs7hQMxMTwaRV1iu/GOGo1vYkmtkFgyYOUrO1giUznFB3t
         1UNIMZXHA2FC8BANtKEKDihIaXA7XJQERo0k5nSl+k0nBUVhxlxhB931n+NRc+DBoYeE
         JFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767590884; x=1768195684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=;
        b=eCe/1aagzNRfyokx3pXn6o0o/Ms8sSzYLG1MebVB/98XZ9QOiazo5QsvZ/HHNSGzrC
         DMh/oPqdeDZ48du3YoQMlotO4k1jIPJuC5x9Ztauoe6O4O98tPEwiB87eBKZT6p/v0QB
         UlcdXHAKVYqhhH1PwjPN5s35qvTN5xAEzEIXMtAx6JzOxyjIxIrGuYwij7t1206Df1Pr
         NsRotqOfhCVWHvCV+p72tE1a6xbgtMbtnOpIFPSnHgUx0oTcg+W33mQ6Wt7Ic7uciuv2
         N8gpVfJuutAIk5T/ME4ZLVtD6xBTXzDtefzLnfSPtQplzqDVwiAOUzyWBAJKOon9faEI
         PR6w==
X-Forwarded-Encrypted: i=1; AJvYcCWj5UbPuX8gQXyJp3dQrlVVVppPb+Ya8kPJmFLKUghGFUcRtrJEVbM4SlTlFkfSBcmqbWvlllc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3jzfxCGj5H0G2R5q3w02bbcKNzb8rAsap1x+lUdyDk9BlEuh/
	UEKZZq2XlxAVMbpWq0lEkpbEeoqqnhyllGpJCb9/hvIALtfqbYKKMAIhnXboCkiBPHEJbf4885M
	I7yJcFnDGZOYzHJWN66p2bltBFBWxrq2jZ+1VsXiwq9l0XWthe2V1/eQpQnbC8ZJx
X-Gm-Gg: AY/fxX5g/xu35ZGJAWXhLN/h94sjkifV/PMSA89wPA70PkQm666jifuOrsUn+XrCAUx
	b6YUpGr6tTCKWE4L5jYyVQwz6o5kUy05T3+ZxkkDjAIkqpMxszCgyuOAJhemWIqQ1Ue8aefiazV
	HAhE3KNEH2vdtx5ajZXu/8Avvr18nUrTa8XJZQyTADPuwsg//G7AKQdrhljyxWoL2uX95MHvrwe
	keMcqu7/pQfyVWtZTmbhuzC74p2dQJrIKCsFGZBkun5sn0eZ3/s6TYQMLFy2ru/Lk5/qhksO9Dv
	6oGCIGpxCm3CLuom1BeigUlKpAL5x7MQ845T+zLxgjC8ZVVKopmikGGG6oW/pIJBO7yLy7EIbt/
	ZIv6no/OkHo0awa5pd2Y/cSZe5A==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr495236535ad.19.1767590883590;
        Sun, 04 Jan 2026 21:28:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbaj1V4nEbmUqRyqdLbR30phiMUr/qZ9BnYe5LDcyPtLXwba5LyrTHI4MJa9Hfds7VAJx5vA==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr495236285ad.19.1767590883086;
        Sun, 04 Jan 2026 21:28:03 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c828e6sm433017955ad.24.2026.01.04.21.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:28:02 -0800 (PST)
Date: Mon, 5 Jan 2026 10:57:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ath10k List <ath10k@lists.infradead.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mhi tree with the ath-next tree
Message-ID: <yvsigdjgbc5wxm7bcbppavepib7qfcuc3mua66raacs2gka3l7@r2vfpa2zwxv3>
References: <20260105154243.7cd5d049@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105154243.7cd5d049@canb.auug.org.au>
X-Proofpoint-ORIG-GUID: gHnpO37LvWkbsJEqaFnNpjKrmqS6sxvf
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=695b4be4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=rOUgymgbAAAA:8 a=656955H9C4BmhTxc2UEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: gHnpO37LvWkbsJEqaFnNpjKrmqS6sxvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0NyBTYWx0ZWRfXxBpHowOCMlCt
 MNj6vaumjGIbsM9Qhxv7GhVRMDbDXrLJr9cidxkfCX+Nc7+XWqMxO0jVWuSdIpJmD03h86kb9EJ
 H8Qm/eqgv2/m653G2fUsgc2KkqrrhYXyfVnd/z+lgLPuNKDMOipord7Z5UoXsjHDm41daUk/OT9
 USTYEoNd11scfpjEYNnAusIMVFdixhMjFhYbIBwf08WUmGX97Bt1v7i8q2fMvakir4rpMCiqVZ7
 WPMZvRw/bpPjygFNYNE9nrzLawynfUP9xOG943nc0Y1iOB9bdrz/xbVyUCXzPHpbPXdyj3mh/U1
 77O8RB4cGwI87heGsTpJVRDjz+JdcmWm0rIQZ8M5E8HSk2SaZczeeRIaeGCd2msrbIEjLJ1FYPd
 9x4iN1+k7UTafa+6VLVVQ+TeTyt5l4zNwrx+ETkPtbY5MAbnz9xiIQPSyMsC3ErKXVbZWlIHihI
 uUbmwtExwrf3IFWwkJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_212805_487192_8E3703ED 
X-CRM114-Status: GOOD (  32.46  )
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

On Mon, Jan 05, 2026 at 03:42:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mhi tree got a conflict in:
> 
>   drivers/net/wireless/ath/ath12k/mhi.c
> 
> between commits:
> 
>   7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file")
>   a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components")
>   bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")
> 
> from the ath-next tree and commit:
> 
>   51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels")
> 
> from the mhi tree.
> 
> I fixed it up (I used the former version of this file and then
> applied the following merge resolution patch) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Thanks for providing the resolution. It looks good to me. I'll mention this to
Greg while sending the MHI PR and I hope Jeff also does the same in his ath PR
as well so that the conflict resolution is well noted.

- Mani

> From 667166ff448d06ed3ef9671bf6c8fe7337b71b0a Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 5 Jan 2026 15:39:19 +1100
> Subject: [PATCH] fix up for "net: qrtr: Drop the MHI auto_queue feature for
>  IPCR DL channels"
> 
> interacting with commits
> 
>   7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file"
> )
>   a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specifi
> c components")
>   bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")
> 
> from the ath-next tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> index b8d972659314..988affafcfd1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> @@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  
> @@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  
> -- 
> 2.52.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
மணிவண்ணன் சதாசிவம்

