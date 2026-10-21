Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849AE606A331
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOWMTPR5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHV23s4v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjqDtuDe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=; b=yOWMTPR5xZuC4qNHQ1JLDJ1Wr2
	phxs3UK6/OqX85+7Tr2U8O9cIK8qWocW+jAIgqlNCkx5vPAZBnriSB4MZpA+0jl42g2wR9hGhB5SE
	dV0igJzfV32ojCYJwuXNj356k37kxwrY+Mu6oFnWMcYsy6ExLUGHkEOkLIhXfgrZ+0dIEVj7eGq4f
	hbcr7657azkmFI6c4H8mUIqVyu1q+dT4EqbxjVc3jbdJJKlm7UxfQPW1vz6PDW/C2cF3rNACAB8Ex
	B+8g+LleJBc0oGvG5XDSzDTj7hiYnX85LAPtRHc+1uCI7ekNPXNzWNdiqdXGw27VUaItcwIT7zPJq
	saxWIBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWm9-0000000C1CC-0AnU;
	Wed, 21 Oct 2026 13:54:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWm7-0000000C1BQ-1HI3
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 13:54:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgCVT325212
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=; b=CHV23s4vIghmqWbv
	3OTLp80UMjT0y9JoE3lNnRy7kqp7gqFxzRI1UwO5nNP14DtZiRzQoqWQsH663p7x
	DaJoYsdKakE2Vwgo0KLALU28mpFqAEQihoHyRFLhEc9kerwPSsZg1bdn2mLrvdxT
	mnyNsZKYNAvFECMV/cu4CA+EvKC4SJHC/w1xAiZqRQRzIGthFEdnhdGtuurIDRKq
	hFT5yxuAgxspQylAOe6y3C/A/iXxFjTQCfQn5maeNNX4ya4js+zsfmpYl7wLrX3O
	9hvEnMQLbY2Elb/eiphFd16IBofjwBOlLUD+tOJZNUSe5/T/hHODWNR6gJwf9pVR
	WiAZNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v48tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:54:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so165130785a.2
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 06:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792590872; cv=none;
        d=google.com; s=arc-20260327;
        b=SqP80+W0ywWaIJTx8ueyK1Siwb+wxHqgkTgF1dNWT24lX/WoL+Tw2IWrfcFX5EknjN
         o+yzYj3ru8V03/gi3upoe5bZ6Uirg9qPqv6uWzILrm/EaLlN1LlA8CTaZMJ7pwXJP5A4
         ZI8NbH4GDuS6BZGiwUIsnhatUeaiZoX3JJV5y4ZcetlipzB97EpnJ5sOZoxdFGdl4OKc
         i+U/hMnXqjbAkXqd0bwM6cWOs2FiKG1pZw7D5MvKqOTk5MKdn/qxpdd41wa8NynS9f0V
         6W2Gydh1K3rUWjtcOfTkfthW7RMDWN1n67NMX7//B4n63UFTRmmOC3vmMrn5O9f34RK8
         mSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        fh=o3CaLP7yGhh5VFXpcXPkCU6WpgEAqhMuRU10UUiuzxU=;
        b=s40qUolNQypxgt4sAaWUtfwoapl0+JmnTxG5bgeBGNVf/Jj0MM2VPxa7z7jl4jvuvF
         JqE5C1lwh38VWmgttRNMO+ZKA+HaICy7/owzJuZXeREh0epIVcTK55/cIbLV7axKq4cY
         vaNmNgSSXkE2MqDU+xPwI/r5ycndsDaL9iHY/jMNNfplsEVZCFsrGUZkoWlqL+EcCX4Y
         xENeqkOVto6ylSmRjnqG2XogacdbYox0+pHk1vXAVxLJU4sr4NhFG40ml8WE0M0Zwpek
         eXdrrKZCe0a9L0zwriwMLr6fonD+eCnLNdyjrwFtalvswuH/Qf5e9WMQi6jzWgbpwuZj
         2Deg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590872; x=1793195672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        b=HjqDtuDe5pqFKqCir4vvmDiSzRug9ZkKAJccKA5mcbgpGvds++jApqFke2jYiq2xIa
         Z2y0hmo7y+FE/ygEehpO1d9wXq/wDQc5SgUzghYlzrMoN72KcVgSATv1q9Rf0yYCfRBt
         h6n4VLS2FDcCyEzkG6FGYvugR9BaHx5RuqGRG7STw+5neadw6NIaU36HM5WynUFhqmde
         DHJfx8ezqGbmsreKqvMsOHo6nIhfFsMKK/kLhzat6ZCVFsxfLKRGW8SBgqYLTm0T5w8R
         YWIkkK0ASXI8TXy5Cr16RYOvOO8/suKWYqynGvw3rK4wux4hTh5SaCRoHCxTB49PkJHx
         3Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590872; x=1793195672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        b=sCR7n3tsvV4LIo9gNZaK03cuwToS2wRsy/lPQPpfXsOewHWHWR5hglUsR9l1jub1Mo
         VvrbNJjEpgNjz/vyAtxM/N43xYlV67pfuVNUV/JZDiYBKQaMrJmU44eldyzz/jRcLLPK
         byjXA+VfA9NmXopOeIeZEEHrC+WF9979HkTG2/1xojVF8Fuw+VPP54oW3IFvkCOxaNzk
         qz43o45UbyVs3bD1ERsU8bj8JxGRZmLTIMsCOIjn+tLhXI5Cg/1jrA4aJwaoPI+tlwwb
         FnuTqFI6ABRr4yQxphzbMGboBGT0eLoPL+59V5vou9ul96o4qIhWz91ugwQGBK3ZX74+
         8bnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmldRLbn91DH2c9Yws5F1Q1FR9zzVxWkde2en0M+CA1OcgEHKUJUeIPtLXaeqKcqwYjLgA/n8=@lists.infradead.org
X-Gm-Message-State: AFq9FYIh7LZuGelQTBw6VfURBtKGkvbrJgUU5toGp3eo7Rrou60qU63P
	LYw2S1t2NCiGK4A0OA2UrryeDNm2uFcPz8AR5PkBCcwfBQNTWR7/IjaFdyQWj31DbKywcq9u3pT
	cwmwDnpVw0KcFGdq/6sM1nZsxmqBVdEYEap5Tdp6XuCQHiBwTtHL1+a8LnvvU8iR91RPEwIJZeq
	xMy8tb5vNvNtA30wbfZhRm3OXep2LYBeMP0KrfR7J9M+sDLZhlha6F
X-Gm-Gg: AYBFou2mhv2O+Zyf8OAKDUNk4KrhATFz+Dmn4vKQ2XNhuvCf8FWkd1P62aRmM5tJk19
	3MhW8UKYvpcoo//YB/w63oDtCfPhgm4WsZHxRNr7IWpbHsBBaaZH6j8hDavKKA4bokP2qEtSt5R
	oZ8N0KDxqRTdlKkA3/tYsHq5xYYrfy3Q9qtz1PAq6kDl3uDq4j3m2fpz1xe/YOSwNPIffc7g3Qy
	lPevBZAyrbqc3X2QQ5DwEGAD3zdLpYDWRTmDv8ok8Guh6DVFig14R8eKf7JRNgX7IozfW0KrlU=
X-Received: by 2002:a05:620a:4398:b0:93e:c12c:f137 with SMTP id af79cd13be357-93f5803fd22mr421245885a.82.1792590872448;
        Wed, 21 Oct 2026 06:54:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:93e:c12c:f137 with SMTP id
 af79cd13be357-93f5803fd22mr421240085a.82.1792590871734; Wed, 21 Oct 2026
 06:54:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:54:20 +0200
X-Gm-Features: AclHuK9frjvxrPgqG79PX0brsm6qD44pye3rZNMkfk_0YWYp84LDbfiNcLFomHE
Message-ID: <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX4TYoUSsIAfn/
 gAWHt+b4/kGA3NJTT2wQfCZ2UKbwgQNGz37h5qO2FOH+hgftl2vhcvLZciYgJ9VcJk1jyWa8aeO
 +EajEFs43NKA527j343nq9Bjr24p8vw=
X-Proofpoint-ORIG-GUID: Rp27mUV0Jrn-wayAwzYfDUEuzBCUifv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX45yg07W4vr8r
 UZVmKtPbVDK4O+3Vn/jVjG30+NkhDev14PvAahF2V1nt0us90DWaG2k8stASa4GHhQrCKbfUrJe
 CRxRy0Kac2P8117G14nIaa5VnHiRIJRdciRKLebtJbOxdK2amzhS+09UwTyFVizto2os7NKFRgH
 jew6w0WaBvkNECSDr9kxL5Wy7gQT0SJyI3Qh0uOkfBb82rySxS0BOzFkaFe4/ils8Ljy2zTh+ew
 HHA3wstqQ3bgUyt7wfrhBOoExu39esRsTc/Y2fZ7CAT2LrZKY75jQzwtJqAqowmkUZDv92bX3Ba
 ELtHQQ6ByHNj+fzc4SYnwtTcVTK6tGWM2pCTpi/APBaNeuVOHKdLCEFRjtjkGVel278JNqCDRsv
 AKDE1bQvxGEvsN0K+tnKcNy59aOBUbA64ZbsNCIxxlUznO/MwRSnvxaiCE1mER0BLN4/EVEim+I
 9G8tkEBnxuEwWfKobcg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8c41e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=d_Mx3J29_csdZ0INFZkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Rp27mUV0Jrn-wayAwzYfDUEuzBCUifv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_065439_657360_C69EA650 
X-CRM114-Status: GOOD (  20.96  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 11:10=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
> longer recover and remains unusable until the driver is
> reloaded.
>
> Userspace daemons may continue issuing scan and connect
> requests, which the driver can only reject individually.
>
> Mark the radio as hardware-blocked through rfkill when
> entering the WEDGED state so userspace stops retrying
> operations against a device that can no longer operate.
>
> Both WEDGED transitions already route through
> ath10k_core_enter_wedged(), so adding the call there is
> enough to cover them consistently.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 6b6b80242cd1..66585cfa6d96 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k=
 *ar)
>
>         ieee80211_stop_queues(ar->hw);
>         ath10k_core_wake_all_waiters(ar);
> +
> +       /*
> +        * Signal the radio as hard-blocked so userspace (e.g.
> +        * wpa_supplicant, NetworkManager) stops looping scan and connect
> +        * requests at a device the driver has already given up on. The
> +        * state is cleared only when the driver is reloaded.
> +        */
> +       wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);

Using rfkill to signal the wedged state feels like an abuse of the
interface. Have you seen similar handling in other wireless drivers?
Wouldn't wiphy_unregister() be more appropriate here?

>  }
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>
> --
> 2.34.1
>

