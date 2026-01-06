Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B37CD042D
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 02:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeK2FlfxI96cOkTAnGRDcPuRUDyzWVMyyzk3ooH1how=; b=uZ68817GYjmfRn8+YUC6wgF2jS
	aHuDKaNv4+zim591pSIdZn2xCxeJWamuETzfg4m/iO6De2eW3FVhlKtqGhgD8Eb0iIoAmJbfs1ZqF
	hIBi6b+1A0Lya1F6UphjrRi/1q4OKCXDmCAvTEs97JAS9q5xltvJXenNJbnCCkvRgo2X521A3Je5R
	+PZM12vFcXaxVyET3HX/Zj5ZpntWgNdz9YLPlnO4BtF/OBXqwltDmEb3Mpmk6niJ+H1VlqUtIxNy0
	xd/5Fp+ob92XLrPHUWNOGux4oqSAstEuPBjr1UKer3R3l08laT27GZv7Z+LcHnvVVd6yrmEvNeYc6
	JYU/e/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxEJ-0000000CMJP-2NUo;
	Tue, 06 Jan 2026 02:55:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxEH-0000000CMJ3-0auR
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 02:55:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nY6t2291776
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 02:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeK2FlfxI96cOkTAnGRDcPuRUDyzWVMyyzk3ooH1how=; b=KEUOHeOW7w22wUh6
	/835hD5eNA5LZRwFgs0e5XSrclQoade/N+Om6uliJAR6A4Zd9BiGWZBomu3Si3w6
	EdUrLW31fMr/3d8J8h24J1qyvre1BVMZd3u88fLZ8pyMIE6aHwKVWQhGoRL13Lzz
	gNCDlr+Z7j+xZCnGTapVL0wjKmswuJI1CqJNqdlDVg1hQXgYkz9Z0Rf2ziZk0DJx
	dwVX07lJJF7W3Ec23w5mW17QSACvLRLtYX4yq8ZuntTZ55FWj66KY2Tn8S5xkObP
	+r37+5T2eWzuX/qwP39Zft5LW+trL1uehUMwXFE0CrggPp89FDpj4W+7oVoIwH5V
	ABgDnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nkaa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 02:55:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so25121235ad.0
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 18:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767668124; x=1768272924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeK2FlfxI96cOkTAnGRDcPuRUDyzWVMyyzk3ooH1how=;
        b=VApq3gvzcx09yU5ogkCZ7uivXXE06v2Kl+ONpOKL0atu448Yo600MwQ6JA+DD6NaKC
         PSOOPP85dKHqw34+TaII/mV2MaNjkBozMkWfy7Fo2HFkzpc3VyKD5/yTrBPTwc94yUrY
         NIptW8C1QHlpALe94pC/45FKW7H4HDW8JSxTEcVdO1YPzp5MWhJbjhdPgmtH+S7pT8ij
         n5oJwYToXEXvJiy1Y7AwKa1b+XT1etuQNkm2Lwcazs5rmrRTJKnPhXJgIS4JkrnRHp3M
         DOEAA2HcSTyLLIQJHvEeg301pNFGwroETa0RzNjJqmvipum7D3Y1G4uZZHsWz69parCL
         Xovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668124; x=1768272924;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeK2FlfxI96cOkTAnGRDcPuRUDyzWVMyyzk3ooH1how=;
        b=kOzrXbf0vuqy3poySNxACfD1saA9tXB5WGIMbX1yDWp8RW1AJGw6b6pRyoEbiICAkI
         sJC87mLXEPsHiCHEBC1W1f/aJNPp+N1gLvuMLNxejS3pWQK6h7YtOD5NsI0xlbG+QR40
         itwXYulCylZcB0c7fewAEeQaTHfaDbDFlkk+UmZAkuj3bu3/405f8FtJq2U7CtIgSY4W
         CNlC1bXQZtdA5QYEj6tv697IIztlfUy7ggbx+UJZIr9097OIed/kN0Nr3+Mbtg+M1ueE
         V0TUW66ETdB9uWh/jzWXuaAOaMPgJ5nVkHzTKCujKNa0rvNT3/XQWBRaWomuXB3f3+il
         mfZw==
X-Forwarded-Encrypted: i=1; AJvYcCXj148DYJgujDcGMUqRQdrKHWJy3qtfgKTfLMIiRQBlEXdEQFy2vxt77z2rnbM4ShGUP+Zdu10=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKZ91jYJ98rst8fvEoNYTHuEbDZPxwxT1WvvMRBuJLxZcgNde5
	C/Am+iAL1AETSRJXq8ph3b5QtRJYEwmf9csoyUfMacyfgSh/s5P5nnqJFoiN+cjU5u76KJ909BF
	SjwuCq5cdz6u3QkMS9wCwUyLBTTYdb/xk3OGmQXamImO50HP0msk2zB6xtuuQpbHa
X-Gm-Gg: AY/fxX6gRmES6XPAGO4JuSAww2Y1R5lj+f/I6qk8ptafEQj4Fl5DZPlBo6Of0S81hGh
	+lOpwIpeqTLAKnP5idmzEYwD+PC4HEgZCFgBl2YzqXqvGEHmWUu7XpnWCh6JdgNx6Ewg8mITDJS
	AfHKvXx84py0n2K5WztCoZOX+X46dbEa8k/eChWIZXVIwVZqvXUCNTHzWZ5gn4eQDs5XB3LzLSY
	D+f0kduJIwSZFq38c+CAjsUMIkfy0XgPMiw2/xJ7mqqKlYfNRhGEYfzYgl3MHr/xpYIgGvacP3x
	SOlWDZycvOLQw+sqjnbQHrXUwzhuXksYNMHo7INGzWSjSy3Xhrak693QiZg0xeChDCI+Q3uDG92
	n/Jkr8ID5zb/gbAzFawnwN9QHMdHqK/JYjWYkZgmLAXJ5aFccI7hH0yz/u246BAy5T02QxfXCW5
	h8rCIClA==
X-Received: by 2002:a17:902:c40c:b0:29e:e5e6:247c with SMTP id d9443c01a7336-2a3e39d82bdmr10652375ad.14.1767668124314;
        Mon, 05 Jan 2026 18:55:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm+epUO5voVQquz6sVBvYJuUN550AnDeQ2R3i6J+Q6+wFvDH9JwAks/rShsvT3f0wEY+uGtg==
X-Received: by 2002:a17:902:c40c:b0:29e:e5e6:247c with SMTP id d9443c01a7336-2a3e39d82bdmr10652225ad.14.1767668123882;
        Mon, 05 Jan 2026 18:55:23 -0800 (PST)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4be5sm5391245ad.99.2026.01.05.18.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:55:23 -0800 (PST)
Message-ID: <ccba2a0b-3312-4a49-8de3-1601fa95d10f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:55:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath10k: fix dma_free_coherent() pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Govind Singh
 <govinds@qti.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260105210439.20131-2-fourier.thomas@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260105210439.20131-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nMdnbMBxZwLjg7CLqqSYXcnPlcLkZzbB
X-Proofpoint-ORIG-GUID: nMdnbMBxZwLjg7CLqqSYXcnPlcLkZzbB
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c799d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=sJ90gTr51a4L_-UUfAIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfXxK/AGUI1bmgq
 75k2m9mzRift7HrXc+spslgY4RAJb27i4bma+X22M/vldV6+h+E/ykdnkzh08kVG1evfIvmTe1T
 obKvAWT6bOwEGOEUs/2bjm/eHeSwe0bAiUObZkZkdoLU2dB6lIutc0QV/et7csiEBkN+Zb5xf1E
 JHHxwYo3OB7QxX6C/1fyu/ZMMRK6lULEPf2HfHrJPxqk0dzXJH494Vi1IaoW0soPlnmYK4d0Y2r
 Z2ywJDv+jb0VMOh07XHcWWHg/g2tJli7I3653ZaUeuhdRGF9Th6z5XF8J1ioiD3py27UuMz/bDh
 DgDAtHFeJsv4B0A4stWE7E0tqIM6ObjcMQNKPObAsxkWyiVy15cK5K5/ThupP31MPtitLeOcWK9
 m8gbjYGQ9hprQ7MJ1BnJ7qEolnVamKIee1L57mRpHbWqPaRV7Cjjo7bPULW31fXkjRgiDsDLMBF
 6BKBg/ZajfyBmIAotYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_185529_306405_2075045F 
X-CRM114-Status: GOOD (  16.92  )
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



On 1/6/2026 5:04 AM, Thomas Fourier wrote:
> dma_alloc_coherent() allocates a DMA mapped buffer and stores the
> addresses in XXX_unaligned fields.  Those should be reused when freeing
> the buffer rather than the aligned addresses.
> 
> Fixes: 2a1e1ad3fd37 ("ath10k: Add support for 64 bit ce descriptor")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/ce.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
> index 7bbda46cfd93..82f120ee1c66 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1727,8 +1727,8 @@ static void _ath10k_ce_free_pipe(struct ath10k *ar, int ce_id)
>  				  (ce_state->src_ring->nentries *
>  				   sizeof(struct ce_desc) +
>  				   CE_DESC_RING_ALIGN),
> -				  ce_state->src_ring->base_addr_owner_space,
> -				  ce_state->src_ring->base_addr_ce_space);
> +				  ce_state->src_ring->base_addr_owner_space_unaligned,
> +				  ce_state->src_ring->base_addr_ce_space_unaligned);
>  		kfree(ce_state->src_ring);
>  	}
>  
> @@ -1737,8 +1737,8 @@ static void _ath10k_ce_free_pipe(struct ath10k *ar, int ce_id)
>  				  (ce_state->dest_ring->nentries *
>  				   sizeof(struct ce_desc) +
>  				   CE_DESC_RING_ALIGN),
> -				  ce_state->dest_ring->base_addr_owner_space,
> -				  ce_state->dest_ring->base_addr_ce_space);
> +				  ce_state->dest_ring->base_addr_owner_space_unaligned,
> +				  ce_state->dest_ring->base_addr_ce_space_unaligned);
>  		kfree(ce_state->dest_ring);
>  	}
>  
> @@ -1758,8 +1758,8 @@ static void _ath10k_ce_free_pipe_64(struct ath10k *ar, int ce_id)
>  				  (ce_state->src_ring->nentries *
>  				   sizeof(struct ce_desc_64) +
>  				   CE_DESC_RING_ALIGN),
> -				  ce_state->src_ring->base_addr_owner_space,
> -				  ce_state->src_ring->base_addr_ce_space);
> +				  ce_state->src_ring->base_addr_owner_space_unaligned,
> +				  ce_state->src_ring->base_addr_ce_space_unaligned);
>  		kfree(ce_state->src_ring);
>  	}
>  
> @@ -1768,8 +1768,8 @@ static void _ath10k_ce_free_pipe_64(struct ath10k *ar, int ce_id)
>  				  (ce_state->dest_ring->nentries *
>  				   sizeof(struct ce_desc_64) +
>  				   CE_DESC_RING_ALIGN),
> -				  ce_state->dest_ring->base_addr_owner_space,
> -				  ce_state->dest_ring->base_addr_ce_space);
> +				  ce_state->dest_ring->base_addr_owner_space_unaligned,
> +				  ce_state->dest_ring->base_addr_ce_space_unaligned);
>  		kfree(ce_state->dest_ring);
>  	}
>  

seems ath12k has the same issue, would you like to fix it as well?



