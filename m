Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8281606A333
	for <ath10k@archiver.kernel.org>; Thu,  5 Nov 2026 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CvLAQm+S;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3rtgOhS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLCbN+nz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=; b=CvLAQm+SKdi2PL
	9Llvc/rC3Wd85AYyR3/4g6jRC2odcgCz2nKwhANQ+eCuJgybv0uTUAGqp61OOu0iB2/JPzltI65/1
	WCconktdMEt5+L1GjndO+PUTSmQtqWYe7Sbhu1ZaSwXPjUBZcBIVoP0v6ZLTxu7zr+Rz0u9ZATGvs
	kxHHUu9r+EaZjSFMoceL/qnZRzOtByx+d9iIJuPUv42ZIFzSmILJ657twwI84ohQoz5oLI6zjp24s
	Qo6inZJtfklZaoJoCOQFMruUnXbVNue3Z/nubI2kujCW5qmUKE/RphadkZ54M1tow/xKgVwN5t3yz
	0htvYjuC7totHUi1vkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4T2-0000000AdmV-1Qf0;
	Thu, 05 Nov 2026 20:53:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Sk-0000000Adfb-35rK
	for ath10k@lists.infradead.org;
	Thu, 05 Nov 2026 20:53:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeEuk2513475
	for <ath10k@lists.infradead.org>; Thu, 5 Nov 2026 20:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=; b=M3rtgOhSCcj95UjP
	3/j4z5tdBB2n0bGDiKdqXcsrLqnbIpEvXe7ytaOgEsqBtRaCIB5Q+9qoFlKPhxaY
	TigGajnv7BOLByYV+yFakkTo8hzBZGH3ptefucT9IVDby60awSQE2RMFPU9ti+Nc
	+CNEsOWYOQqmSfBgKDhCSRP45oet2N4myk31oBxRca8evzE0D5J6mIURKqNHNe/1
	6wY3k0rUy3jammAdM3kDUwflelcxKxdOuKcW49xP54FGl5hvA6j5SajDDaUUYUvn
	3goc1QpDL+qWi47208V1SV+N3YIUp7XcBIGgXOZZoN1ac0CbIq0OFgKHYS+uRjoG
	A59I4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatntq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 20:53:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91becce058aso49699146d6.0
        for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 12:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912012; cv=none;
        d=google.com; s=arc-20260327;
        b=sSYxYne2L4UxSqDDInwh/9otkDVz7dhCsA+/7Ck7Qv8wagj5nUBf6p8fT01GbAgz+m
         2J2v5nb3PF/+k/2uienwaKPYSj+SDGZ25IDRCPkmjRCXRVCJwpx0rqleilq3iuV6OhNu
         p7v0rRWfInQczHvhwnjAlnS/eLqiF1j+ojb6eDknaJAC7q7OFL3UkgA3OBZPFhPW581y
         rzAbKb1vNDVRqsgn6oZ3/DxG8jkMEIABqoyPwC8bJ8Vxo39vCGnxUZlhdNdoQfJ+GJ3c
         h3Xhad4NH4eIf4LrODxe97vWZ7kLz/7vJd7WDT6dg/LmJc+2txxcswouFQ8WXj47LGJ0
         951g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        fh=JfbL06954wnVLJ8afqyBuu4LgLfWrKPFk+FU7pl8OSo=;
        b=PlOlsXq+VR9Z9njBHDFJo+fHB+wEp6esGaVxjjtIYXo6kFLKZgp5oUWVJAPm6XKBUa
         HHOhFQUOq4yNkHIcqYB1RqebcmR9qnqbXUSjYCbaIdlZ5Km896hQkyBo/d8vtZY0Vq/3
         A8sDBJN7OrWUSJEJEpkB07L3qtGq7KSJG2UEbISrZx5vpv7DUwdmvPaGZ32ME1iaoYaB
         4aI4dEEhbdjvuLJ/Zq/ABmR1ylHmlzax/KxsWW4Ai2UE4vkoFmFm1QDHNxAK/kgfy0BN
         GWg/uHoRJewjQ+5gYfLj8BTbQr3AkFGYEdEHhUr6hfbGGjLZnWM7HqWmlK1mw92YKuUL
         483w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912012; x=1794516812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=TLCbN+nzUeBQ65rdGROFQZ5D0dzcivxPi8Wv5ayERiUGkzlSY4X3Fex1H2RJ2DUhCn
         9WG1FUE7rHjUHk5F3PuYMeao2gE0oyumoVE63TfDWaF0rqsIShduI1hzRHzvcQ+b/wSW
         RqJSbvx4VkTAM7h5iMa7J8W7ClwZDDqyoTHApEeVUDQfuRGcLeV059u07/kvwhidL41V
         PIHdlmxGa2pEKzFlMx5NzlEMyjdPKcF2MuXWAShoNugUTXto9GIzzwOlMVdzy+hNhCUB
         vkqfrOnPGzDRDenFgafq4FTSS3aJD9nmkThUBJr1TOLCTghU7MUQuSZiYL1CP1GlcWXo
         g4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912012; x=1794516812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=TlCcU80BVTEYUVnmHiJWEtlxz2Yhjjk/ipC7Tbg1xMpSSX2mhcSbMxu4k+PI2TEZ7n
         sz3/Bzzt6V9kPPzICfZgezbuzKhU3BDu0nm+m30HxxapJbh5dFQl2YRAHMpoScUhaFmL
         GIfVmgl5gTwHUYAZbXbh4mRxysKk2NAqxB7BiB6AmbsO7XGYjhc7lKb3FRwF1beIlI/U
         jy2tldj+n8is2MiW+Q/EjTCgSX0bdYuPdY2LQibkmA0knlufrCuiIf7UWp826VSPswSP
         pdEH7NdJpSkeD41SNwe464b1kmXWTxjUFo1t3YO9IHfHQLxFG4f/ZqDQp3sbqfAtdF6V
         4RMw==
X-Forwarded-Encrypted: i=1; AKwUvBxEMnmA0fw0busKrG0QFXFnlDfBzkf+9/4JqakYqbzI8pIe8MnEhdrmOX8OrE6DZlBIjYy8C6U=@lists.infradead.org
X-Gm-Message-State: APuU4Z9SNSxSAT7Xj6LD++0iAUDiCPzahnU2SjRx0FXGfpZtlTv6gZ1X
	ARKnTarWLZ65lje3TQMQX4yLvjFIs7s2sT2opKyvCevjOh6IoRvtX2MIYJiOAsWpRfNcQcGuPkj
	tTv96ABcWSwvIHXKTz02XDW719cXtvhN2OgXJLY7UQJBupm8+JM76iNdQKCrj/ixyyayBum00zq
	7qlMgcW7/Licez6ZGr4YWlRKgfzq8/Xs3J6AhzPuQ=
X-Gm-Gg: AYBFou1kjzpHXnt7m1Atp215i9xAZaWI1RuOnFSsJC0E/AEJj66skTzF4uuVFy+W+TK
	5f7YA1iJGeZhkDqKnV0BAbuHmJtg/kavE8p9QCpeZSTzSGJm1ib9/jh8dLcpgm/AziYGuWn+wzW
	SdobOvVq1CA+Kc63DxwsoAPWDtuAjLCwt1g/QzCUxRuCmwDoUQxq/eBUn1Q/kwhVWlCagZl8Pkc
	aP/+QcQFuIeT5aDRrLEEhzD5CxFobyGrh/FOah0hrStUkTmxDZwPJDLudUKJUOFInqLzYzUO/s=
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id af79cd13be357-945f360a793mr39837085a.83.1793912012302;
        Thu, 05 Nov 2026 12:53:32 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id
 af79cd13be357-945f360a793mr39833985a.83.1793912011754; Thu, 05 Nov 2026
 12:53:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com> <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
In-Reply-To: <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:53:20 +0100
X-Gm-Features: AclHuK8M2UGEAgtgAaYS4CJiDcLNJz8p_a_dG3tur9BUocLC8UmA9Ko567IQDlQ
Message-ID: <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: christophergriffin05@gmail.com
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Hari Chandrakanthan <quic_haric@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        John Crispin <john@phrozen.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        ath10k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXyapirYSX+jZB
 JvXz+DtA6m+2Aa7h0muYJTMYsXA5fKlbo5AeMmmZx4t1ieKYSEJx4E4oD4kBGttuszp35VB6I48
 rWbZY2vrnWnOHsCRIAmT+rRgi79EgnY=
X-Proofpoint-ORIG-GUID: 6dzfw9Jf6cUL3AYebb1tEcKVU84ejzhA
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aececcd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=CkqNy8FowFOMXlqwbJ0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXxbW78QsDHEni
 aWYsRnzksMAUB4vEi0LgjE/LXeqYgLZ2wDVDJZ/qxjiUGIoeO5jg8jy2gcmYFvy/asc9Wq9gAN3
 dtYFOzbxAIUN3XhMJokMXWdc7J4qzzqsPGjIXdBp09ykjAdiQdjcQD1X/0BWXYdY1xR+LQoGPlc
 J/QtxJj480NG6Ksp2QfuHNPBIWWcvEuWHY7NN1M2JUsvYUX+vBXjT/1EXFKsN6z0VYp6Kmhcv7t
 v7tKE13E2M1lf7e2pQVvB/NNqaEl36UB2dSnE9HDsoNZiqPIUxkb27AnTWoKEZDN97+76m3hA2t
 C/Kdc0NgZ4bqGOhmP47eELawJJ4AHG6PLxjD7AzDU5wtEVs4GBP/2aiFOMjCQ8P8JWPugvOiQ/F
 zLWuoa9GqEcc57op/4+G9ojBKgCcS/YiZx73ChOaqnhmcFvJbb5o4IHomZcdtk+qhIssPb8t3hl
 DnwiHErjwS4GevNR75w==
X-Proofpoint-GUID: 6dzfw9Jf6cUL3AYebb1tEcKVU84ejzhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125339_445698_34F53BC4 
X-CRM114-Status: GOOD (  21.06  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 7:11=E2=80=AFPM Christopher Griffin via B4 Relay
<devnull+christophergriffin05.gmail.com@kernel.org> wrote:
>
> From: Christopher Griffin <christophergriffin05@gmail.com>
>
> When ath10k_start_scan() fails, ath10k_hw_scan() sets the scan state
> back to idle and returns the error to mac80211, but first still queues
> ar->scan.timeout. The timeout then stays pending for the full scan time
> (20 s by default) although no scan is running. A scan started within
> that time gets no timeout of its own, as the work is already pending,
> and the stale one aborts it early.
>
> Don't queue the timeout when the scan did not start, as
> ath10k_remain_on_channel() already does. Until commit 634349bae0b2
> ("ath10k: move hw_scan worker queuing") ath10k_start_scan() queued it,
> on success only.
>
> ath11k has the same code; there, a QCN9074 firmware crash during a scan
> left such a timeout pending.
>
> Fixes: 634349bae0b2 ("ath10k: move hw_scan worker queuing")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>

It looks more like a theoretical issue than something that is likely
to occur in practice, but the fix looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c20..2fded15b61721 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6491,6 +6491,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
>                 spin_lock_bh(&ar->data_lock);
>                 ar->scan.state =3D ATH10K_SCAN_IDLE;
>                 spin_unlock_bh(&ar->data_lock);
> +               goto exit;
>         }
>
>         ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
>
> --
> 2.43.0
>
>

