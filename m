Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EA0CAC597
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isQJO2tp1yW9LHpXNsBMnq2xvDiCZjaipuE5JuNCerM=; b=Dx9jz6fIHT88TuG0klz55BaGty
	ujlyltbSEu2aYbr4maaUziQUCnonDZic8Q5q8F4q64OuOxCqnO1MhF/Ixs+2miXBUzu5f3HKST5qR
	yA0ZoqwlRkvsO0iI3GQMiOj8yozptRtenNMuRGKuks8MLcnHOOszxOfhAr8AOMLo1CssCYOk8YXM2
	5RHZUmvGWuWZnVe/qyMw+zakRYbB2jkRR4PNHOW/KD3ju/4ylqrgVGDuwEnB85Sps40Rv+ATO7LaE
	6ogesvrtzwB9nApD+04fmheTq34z1/+2ZlFVgxm0G7l57yDnxQ/uuSH2ntAheuR6LwuCO30kxJcpT
	Lql6tJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8rk-0000000GWGu-3GKx;
	Thu, 18 Sep 2025 07:15:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8ri-0000000GWGX-09JG
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 07:15:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HMaTWo011208
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isQJO2tp1yW9LHpXNsBMnq2xvDiCZjaipuE5JuNCerM=; b=Et82SnX5I+YGHrPM
	oLFGZTaMcau4VqLzTs9m/WadRoWBtNFNhC/ASFu25S8MTVAVhHASU2V0CmJSJBze
	7O0zgoolXAE6cp53SpPMIArSg9MHYJz0pMeBCuLRRuGLrkH2H2hu7+SlB+HF38xq
	KCH5Bd4E/jpqolvYhfiRzT3iTIyVPMfuN50cJsw1SQMbSfx3ptDpN+z5Xl/Q5m6b
	81MmoX0UHXc0dWL4OBxx9QcRjo4gfuXilbWv6uoKkB77ppMaS50KDYiRtfcrkAiu
	pmGzDQe141NtKIdsjJJrlM3t8VWnDf1w5Wl4CIZgs/o8w2qtLHaYsMQoIh2rT0Uf
	VATVYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx1958-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:15:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-267fa90a2fbso19826825ad.1
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 00:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758179735; x=1758784535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isQJO2tp1yW9LHpXNsBMnq2xvDiCZjaipuE5JuNCerM=;
        b=HDPsEVxWy1PI+phgEBRPhUb7wUBBCoIQWY12MiWwqpQkfgflKH+lcTuS1jbcB7v182
         6g6bcAVWqTV5VvqknU0ybz4cZZChCiZwSFCuo7C4oLnLA1mOvFBmbcNOPVSxSj76Pghz
         R8bcoRzV4vGl901LwahEH4+D05gPY1MwdQ7LTKd4rXqvz+MES/ddDexqxcJS7Yegia7f
         JaUUAO+T6LlNiRk4DVGQDjhI2zTS7Jwv0zwp5qKbQG6CA4G58+Rseb8TpZ6Ol7b81vmG
         qzxxEt8LZMZU9R56peVuZ1oihnE/lqqXNV0zhi4x0x8jGa1sCBUSy69EMip7Wx8L4zyn
         aO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDVbnpNIdW556/FI680phctJ9y60p4lJAuJqI1yK00gZU4jFBQTP1/ujURqjO1ojK5/m90w70=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNpS+MTzxwEaR3L9DDmjae0vfxJs3rw2XW0CimM72A0o8utIHY
	NDVLguupYPdCFSoHY02HOEmK2mSLgFz3NjXX28q4i5zx7y9AyCG/qmWx/E1UxFaTBrCioUHCjpS
	gVozW+Kyqw3v9fliLsqUfti6Pr0K6cdel+qgRLBrM9fj9Fqwcl2N48U9CX0ShmiDH
X-Gm-Gg: ASbGncsdAw04+IJgJo2COzBQg+EL+juLhwCY7j/scBgxsN4A5Q0IT0AFQMeSdIrttk1
	cor5H4mnPLprReer5MaanRB71m4Mf7Cdv4g7hSNsNqqvZS0VQ/EDJ+ogilSxSr3CErazb/R/PlJ
	KdWClKaxXmfQcYKAS49FpiT9z+FMyk/1nP4759X2y5X3/DXbVrMW9QX1a9FD1TUUSzwHj54A5Le
	hNrbDRrLaqL0/OqMct332XH5Y62uZKIAVBlxZok9rPJPEmiiGFMXgaFun1SAWJQzYLa+XTB297s
	tV8mmSuBwBxGBxORJ2xPp4OQHCfh6IhrMhzKFPPWnv4vHWGDo76Su+9coYv2K1+uGrex+lm3hLl
	0jRlBkY9IZvkS+G0HgcgVoi9UqhWorhlDRvSX
X-Received: by 2002:a17:902:aa42:b0:267:912b:2b36 with SMTP id d9443c01a7336-2697cc743d4mr22020315ad.23.1758179735420;
        Thu, 18 Sep 2025 00:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIX3vycMF8GWM3haJsU06M45B6aT+PikV6fmM8SwFtI8cQ871GAtMURLGeZVBllnZe/eVXxQ==
X-Received: by 2002:a17:902:aa42:b0:267:912b:2b36 with SMTP id d9443c01a7336-2697cc743d4mr22020095ad.23.1758179734897;
        Thu, 18 Sep 2025 00:15:34 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dff50sm16164135ad.85.2025.09.18.00.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:15:34 -0700 (PDT)
Message-ID: <5dd38154-ed56-47af-b509-87caecfa7890@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 15:15:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix connection after GTK
 rekeying
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        alexey.klimov@linaro.org, johannes@sipsolutions.net
References: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pvz5_fsjuJo7IdSXg6z01Gtbh--NT0aX
X-Proofpoint-GUID: pvz5_fsjuJo7IdSXg6z01Gtbh--NT0aX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX90RWeSTaKlxt
 4Xrs638Mg44wKZF6DJTt9JfCwfZzDKwwm9Vl8NPLPK2hmyqKUtdhv+2QXfUStvs2Wa3VHZDId1X
 HNUHAFmRXgyqe9fDuLvY9c8XjUzCoH6Rx4qXhHKJcENXwz9TLQyAe8C/+yrp5Sl33GAEPvWJpsU
 zpYCn1eP0ziniHKsa4V4GsASoAfM+G4wEdz/3JeU2hOVnNzcCMiqKjpJyiYGj+kxdb40gviqf89
 RQEXYswhFSeL5h82nwTqb5f67M1saJKVMSzYXtV9c1+odjmT+f8I1XQi2TeypANOwGYOWM6TmLC
 L7EwBUXLWYthNYEH4s00LtjkK7CKrRoC0IUA7s95MV48cpZglx2IUn5a7gFPDTBMK1g+Wy/sLwk
 axXg0GvP
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cbb198 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3sJy8hLxCyfA9cyCuJUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_001538_215256_09E27088 
X-CRM114-Status: GOOD (  20.70  )
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



On 9/2/2025 10:32 PM, Loic Poulain wrote:
> It appears that not all hardware/firmware implementations support
> group key deletion correctly, which can lead to connection hangs
> and deauthentication following GTK rekeying (delete and install).
> 
> To avoid this issue, instead of attempting to delete the key using
> the special WMI_CIPHER_NONE value, we now replace the key with an
> invalid (random) value.
> 
> This behavior has been observed with WCN39xx chipsets.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> Reported-by: "Alexey Klimov" <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v2: use random value instead of predictable zero value for key
>      Add Tested-on tag
> 
>  drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 24dd794e31ea..154ac7a70982 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -16,6 +16,7 @@
>  #include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/bitfield.h>
> +#include <linux/random.h>
>  
>  #include "hif.h"
>  #include "core.h"
> @@ -290,8 +291,15 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
>  		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
>  
>  	if (cmd == DISABLE_KEY) {
> -		arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
> -		arg.key_data = NULL;
> +		if (flags & WMI_KEY_GROUP) {
> +			/* Not all hardware handles group-key deletion operation
> +			 * correctly. Replace the key with a junk value to invalidate it.
> +			 */
> +			get_random_bytes(key->key, key->keylen);
> +		} else {
> +			arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
> +			arg.key_data = NULL;
> +		}
>  	}
>  
>  	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


