Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A66606A32D
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eoosi0hZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drMVhEpn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYbJ19rn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=; b=Eoosi0hZqAu8Se
	cOpU8PYcDIxHCaj4Yb/LNDPMc4g4S+/xCTU1dAVUMTVKPkbLUZysDELQb1mqd3eHfvLzDdxVMMNWb
	N+viQ4LTYlDKSj5SxrbE3oASo740+8rT205kb4JwDh1hFWgvKXj4D7BSg+rRAAix32IfkaOg/9J4C
	8l8FI2GwqVMittOHxzKRQvJB9/7a2DLeKFwiws/byeCtGRkFqRTM3nBVKwN4t6pZKH1GUdJLMYV6v
	iKL5QqUsHrHMmL1IMmb3VCiNomzQiIpp0Ydf+edVbt3egpDI1JJZjQGE7YG6iMOFT2Q/p5XqQT111
	bgwDAUOSY+JnPDvFk7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4g-0000000AbpF-2o95;
	Wed, 25 Nov 2026 16:42:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4d-0000000AbmY-3rGQ
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 16:42:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQEKP3007852
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 16:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=; b=drMVhEpnFwL8Gqkt
	7RKt53KLEyUkxcy60KNEQMpNgg9PXPsPJmE+lCJOHR9pHU05qKyqn1BijgW9VeAe
	DEiNi0noA6y75xlwZTowj6AvFG1z9s9ikgpz0hxeGKCbMmNq1yUQk6goDRqgNA+1
	J7S/jq5n/g6+FsHKSjpumJ6F5Zdz3yicYlT/52g9fXagqW/HgVbTxKREJLRx9Oe7
	mnAx4egl/1KuLs72YqoaVts0ImHwr7IZSexY77XGi3vuUpU6JJjhtZiODlai9t2q
	XkmP0SnUO57L36mNnEPN5jAI/vIxCpG2f5v4vvlI8TgHDQIMAbE0jKV5sFLFEtdC
	tzzlyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksum0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 16:42:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so915141385a.0
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 08:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624942; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3i+/4YLNIUR4Ei4zqJZXTRn45gv6IHGUGXSEw9fZL+Ze2P+PuTNjnNtVoLYnFzINn
         xKNDDx7zIUnw3+3wkfy7Z77rN0r57DnJCMRG7zIujMmWL+O10YktfURVS5PckBs9E7lu
         ZKLABr1iUrA1DP9xnXY9agVV8o03HKqXTITrPp8mbJDUOm3JZ/WiAPEIOM0DlU4t0CYj
         F3LVIBhBhgcqQKN/wlJJeHHH9O6+7kWqq+dFLyxVyX6h4IDpHbOPQuxjO8ss3cesK7YR
         FGLqJfTiyF1OQbQOyN54r8ZKOD/R+1mC+Tb2qfpbM0hmmY6WiJXuKPDxwdYxC3uwSe9o
         UN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        fh=D2pemvf6Dw9ootARDlfvvnqKPtZb58LBWoVqUB5+vs0=;
        b=GVoXPTS9qFk+Yu7WZFqFHqBKl5Af0Q/jTZW5QWcMawa7C3VzIDyJUnhC5xZJjeArBr
         7tJqdTGYtLAkrLSRT2g2gkXPKb/YYhnQh0xfXMYzPJlpYKPwaWzJrlrpNAK02kqfOkPL
         8VpiGzaTZ87UfvsvaDn2QG/ZzBBmq13U/+iGG5O9l3GHVgaUnaJ7rsCz6eHR6o6N84RJ
         NwLHNr5SlA6/5mSQauYN/cam5dvzH95xlzGGvzgHfrtLUrl9dTVAqdsylCyz9lanlIHC
         QmDf24W97CBiTJzcgahoELM7zBAepwMYYIBoa6y0xtMUPZO6rp7PT1HXFnIQsegWlfow
         s0pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795624942; x=1796229742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=gYbJ19rnmwQAxEszvF4PwVX0Cd7PGQ5d6GTwB5XUkQE8/87YEHnhJiGMK62U83sAex
         12EndP/8vHzr0tfYNWaUEjqg9gfTYraADyCp28wR3NtDi2+g/rnfDcuxC2LeX1RYLKG3
         w4vQcByszyGxr0zDtz5BIznz6/h2RyJLYpfX0zl87fn5cN3TkN//MAQu7RZ/LggYNBmD
         NQ9Msw0uAF1tpA6F1W/pcKNOgjZG+ShajPzWKyaqqVIOQGk+ePccvRFhl7xgcYrPNuDd
         CUEBADNlIapTDl9JPb6l5QqqYT2O3jQK/u7NNJOPSjT4Y+OsLdJ6Wsi68BAWk4uIcwid
         pv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624942; x=1796229742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=vjiU+vC1ArSyn6VZqUNeHdZMxqqXqOIwTgZyjkrxbEtBndxFTdKFK2NOO30ynh/L+5
         BI498rD4dg6EQ2sa+l8pz5rD9VkD+kCShmzxWlJitvB0xuPKhyoyQ4a/GuHh4DFTeaZQ
         l8SKqAogEjoMfajUWs6nbhGbxVyOyrctvfR2FrYL4YQHfvtUPT6Bz4gTguHR8+x3Aa5O
         lP8oYzI15rbL2yMBsw6mZvRE8N//+GTPPsg3fnATAvpv344CxC+vYWaHiZJg7oQJffaI
         QLvryXILHpgOexYRU/mEKK+tYU8Ei93Y75s6WiNrDkKbsk3TwaZeHOHwoMMinVTWZulJ
         iH6w==
X-Forwarded-Encrypted: i=1; AL+hErGWaORanfQ/AQiVRpiAYmtFJxyZ9VvqXSmtVD2S7bAIfdQW5Vtchhqi6C3Gs+BcE3Kbae9ksCI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8E09jgDf2uiXoWuB2TJcQAg8xI7A4+9QyqsA85++FxaK3FN6Pm
	RuM0h+hhoGbsQN0wjBAR8v2v60iFtPa5Fb/poBPto73eLjDAXqx9FaB/5Uo7FShMIzjnBplqXpx
	BiuNWtARN87ohwG9CjZlJ4rbm4dCJwEXuts6PpguvpfMp6qeLVyHW34CbK7taUiotH0Bs7XiJsi
	SNGS4PRQ6uSMTbcE4pGeZukeoKTqlNaM60m3YvDTM=
X-Gm-Gg: AZFdTZetcTu7TaSDsRpQCU1/ZI9o+VvDMkz6PDdMwCPn+BpEVpwJjgO7kw8uiDwhu7N
	mCDGws+bLOe37o4Ux6EuqL7e0aCcCeOvxlh5qxoT65+wzEstrVYG4eyVrNnCpUxAojrwCeVxj6t
	RxEECh3hvxaEleeo25vVY9zb+R3v2fnuvrV6Qc8I4nWcmtUU5Yk8oCzxSdVKXetaqsohkbyiaAt
	4dZl1Cde1VUcNm62Qb0f4V7wdypUEf36pDfyQ+e2/3V+Ml19CKdY31Kma5qjE+c0R2f6X21DLc=
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id af79cd13be357-949bab14280mr3203109085a.70.1795624942121;
        Wed, 25 Nov 2026 08:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id
 af79cd13be357-949bab14280mr3203103285a.70.1795624941624; Wed, 25 Nov 2026
 08:42:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com>
In-Reply-To: <20261121194939.3647400-2-morf3089@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:42:10 +0100
X-Gm-Features: Aa3M54pON6Dg34vZZDiCdbMrAyUpRK1E1I1B8NNIa1Qr3eqV_CLiVHxkBaMNstA
Message-ID: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip
 channel stats events
To: Gianluca Boiano <morf3089@gmail.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b070fee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=Wc1NDcPGuWUPlOtgj-wA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eW0A7I5g7V3aYIwriuVojNoo4vhE1xoU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfX2/Aba5xWV7b8
 HzOcZOcMtgl6v2JiyBs2HvpVvPVIUnkN05yPkW7HHobZve6u/YvrA53a85vFPvh54XRmmxnRinL
 7WOlKUhI3C0j/REHJYg3RId+d+b02jY=
X-Proofpoint-GUID: eW0A7I5g7V3aYIwriuVojNoo4vhE1xoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfX2mrbuzS1Y6TT
 8o8d79QwHccVVOgMnKzRO0DOI8np+gHvKZEuDCipVkSaskQLHMf4y9cuNYaQescBV5J7qkXyCHH
 ZpbanZTmc9qnzQXViAjCuTfvm4e4Hwwcz1t4EEKzA15FNsx+vqbYQQIxCdK9SVbAwQkeBdSITkX
 ukvv2uuOXAdLcfS9wSLqdKcHj+kinSBwucxUDbqGds4uTgvQmF+D0SyDl/Ar2nnrRlU1W13YkUH
 LgZVHy52yvv72qO4SRpBogC2HQTrCbKEzZVP6pBPlTWkq1/mTv7yO6ty46uwzStFkgHmCM3X0oz
 gsdBdPJg6EarGejxqeleTWKuzFJl96Pbl76r+fGWDm0bB4jGNT7CX6oK/w7fhrZ0hITdYCUSEN6
 S/JXzrqkemjke3L/pwuI7shS3pfAG4SzJAjXxn020L4KOAcNCanFe64LNsfAC6BEmG4aYbohUUJ
 wSPcaXGcStIUZsxkTVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_084224_081310_E6DA6D93 
X-CRM114-Status: GOOD (  24.70  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gianluca,

On Sat, Nov 21, 2026 at 8:50=E2=80=AFPM Gianluca Boiano <morf3089@gmail.com=
> wrote:
>
> SDM660 WCN3990 firmware crashes during scan when the scan command
> requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):
>
>   qcom-q6v5-mss 4080000.remoteproc: fatal error received:
>     err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=3Db00a5d88
>
> qcacld-3.0 only sets this flag when gEnableSNRMonitoring=3D1, which
> defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
> vendor driver never exercises this path.
>
> Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
> can opt out via firmware-N.bin. With the bit set the firmware no longer
> reports per-channel statistics during scan, so survey data is not
> updated on these devices.

Are we handling or using the CHAN_STAT_EVENT data in the driver? If
so, which event handler or function currently consumes it?

Regards,
Loic

>
> Tested on SDM660 (WCN3990).
>
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 1 +
>  drivers/net/wireless/ath/ath10k/core.h | 3 +++
>  drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb3..d37add4cf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[]=
 =3D {
>         [ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] =3D "single-chan=
-info-per-channel",
>         [ATH10K_FW_FEATURE_PEER_FIXED_RATE] =3D "peer-fixed-rate",
>         [ATH10K_FW_FEATURE_IRAM_RECOVERY] =3D "iram-recovery",
> +       [ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] =3D "no-chan-stat-event",
>  };
>
>  static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee43261..29a4c0d74 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -838,6 +838,9 @@ enum ath10k_fw_features {
>         /* Firmware support IRAM recovery */
>         ATH10K_FW_FEATURE_IRAM_RECOVERY =3D 22,
>
> +       /* Firmware crashes when asked for channel stats events during sc=
an. */
> +       ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT =3D 23,
> +
>         /* keep last */
>         ATH10K_FW_FEATURE_COUNT,
>  };
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..adaf3c80f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
>                 | WMI_SCAN_EVENT_DEQUEUED;
> -       arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
> +       if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
> +                     ar->running_fw->fw_file.fw_features))
> +               arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
>         arg->n_bssids =3D 1;
>         arg->bssids[0].bssid =3D "\xFF\xFF\xFF\xFF\xFF\xFF";
>  }
> --
> 2.56.1
>

