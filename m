Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B200606A324
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUkb6+cr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YURqYCE6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iu4vzhi+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=; b=qUkb6+cr3O3V5am0UUQ6GRzIpM
	eS5VeHtWKrF3lUPD3H2pCx6CwSuYdP3xbAiX7PAIdsoriL6BYULiz5J97X2sg0V2k0ED+v7sO8OyZ
	N3CpDN1Srq9V4ZiG7CHYFMWM9EYRstciWZ/b0VORJy/2aiXG6Amui6jOBVwChrj0EM/FwQqI15ES9
	+mwJV8XTz2jfg/yI39LdpKpAker3z0ytlM6MQJaUQzp0kqDTb24yjVB0PQoq3Kat4+Ksjz8SykS/x
	EDLVJgawvaVvfhux2OQvsX12yB55aJNTz5EkbaxPYoprIVw26FSb54SOShA4VSeCiXew/evKe1hwW
	FJgBVulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWbS-0000000BwAB-44Ay;
	Wed, 21 Oct 2026 13:43:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWbR-0000000Bw9Q-0OiL
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 13:43:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDN12o402419
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=; b=YURqYCE6ackpOhgt
	Q4dmC4inkPlAj6q11OZt9J9E8juowMyGfttZC6P01O+cPJaOlSxrdw90bJ/BS8do
	LsOyXt0KL1ZAIVtX9q1/58nV7b6ZblI0bm19XNoG3qEfOEDm4ktz7lSwQX4XCblI
	3yJ4ihx8+V2TfZHQq7NcmcsA4VxB+6DhRb1sVa6IcjxIR6igwKCGRySbb3tNmoNv
	sCNPNXkTBtj/hVLJgGZmYoQnsI+nvH2JXuganjckTZ5pN7parSphiSjTm4xstfOr
	z+AtuePsy0ABC8yN5HsykReJ5h5jZ91/Oo4WPnXnd1sbIjaDK2Tqbd2fWdxoDTNC
	DpHwig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr2y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:43:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so95647185a.3
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792590215; cv=none;
        d=google.com; s=arc-20260327;
        b=GPYr8j3zm/RbWaIlGf37tEtqoCdOJZq3zeGaKUm0B8idMyWKXNDB+o/FonMhr9t+kn
         C4kj/59Wrpa0aGejirnM0OgJKZ3z1LM3ugYz2hcnQd2QNjFbBAiW7p53tmDTwJu9WJ+e
         s+0j+5xalb8KmDMiEddTbuUnD9Ratsy3YIwpx4LmF8Tcvgo94a0LiXOq73UI8oo0JX27
         RPI/PlnIAwsd9/TOTOiVE5s94IjTrcTWcPWi1/3MzcfZLW2xUSvb2Z9ECvK58vbfAdv/
         fkH/SJYYcLMtOKK17AWxCUMSlEPXu7VqrVbj8+5oAm54FF4fNWbx9S4M1PFNzp/26KMP
         ++OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        fh=WPdwVTCqviib772xwrfVmgIP+NkqV1fsQmCVGBssqq4=;
        b=iJ0WdTbc7uTotvgxd9Ztm7WRv1bHRc0TMaybpV+/1U5AaBeqcaNoi9IRXAXREUUXtL
         4cvAvmnN681fIpcrcsZawCRaU6pk0/LV9JIE5IZ3433D04NGSQjfuwL1NS8SN5XLaitQ
         9meE6kWjt1H0BklluAa0PrLprSCgxcuwAkJdMaPVDrMB5Ggp6x/p2qWYS4/1rNM+6VRu
         /MNwm58/RJnZ08UTVihYEHXzH3NJ7TiM2FUtO3LK1rxdkcTsD3jxS6JR8tvToSGV8c+q
         VxUl2dC9vxNPc494YcbAKvhLGzVlqT+ihuvvls3/Pw+7kZRxPNS+75ILNYgstFbxOBff
         FJxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590215; x=1793195015; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        b=iu4vzhi+Ucx5lc70Y3Yx+anYM/ez6yPey7I+bfzUAGld9hdB++tikJsQG3BIuxmETu
         sjTNdLPy1sPHE7ZwqKGCNWMo4vJJEbcPTus2EvMZWduAUD202+TeS+5HcPyDg2bsp/Gk
         e1Z3r9li22idrmLF/hAJMBJTtj1ImsLdG34/abrfjrgBvRqay3j8pDPhfK/v6Kx7x/qd
         l4lRBZbHQfRrQWnlBrpdRaAkwqKEXPby35LnQMgcCDeKv/mXUzYZ+Ih/5tS+axhC7hxn
         RLJAUYP8hsKp2vP2Oi0AfE7dXkR9MU/A1/Ov6tIGBQGZKiAoapeA0Ka6FJGndPjusHv6
         ooFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590215; x=1793195015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        b=Vbqo8h5HkGDfeytn3J1zGcnJXtXE35Yn9sUgRoIjT3aFT9OXXFhj2EcyXkNDBsRedS
         NhJ1aqwK7Ncf+rdTMGq2mAapCfG8CqVmeiO31LYD+OxnUByrjS+GWiSo8gyAyiS89DEO
         rDeacRnIzuEiPgNdmlZ1d3Hjb0GHeEYd7bYJkxiLTvmAhPMKvoV0nc73Kdg/kUmk1pS9
         DEUzQgX4h2ysMQw/c4lOY/TBMKsxhur6ELfqgkCy9riJdgx1HnpXW1hbdN07uyYSuD/u
         OWfFYJoRdVAOMvbmkJO49U1CVPevrwQ/3/965BgKIn4Dz+phr0Z74eS3imE1+uIPPhHv
         PNWA==
X-Forwarded-Encrypted: i=1; AKwUvBzWmJHKbeUAt/hP9gyBfz3HYcxoo2F5nFg6J2Ro/c7nIUO6UuVCev10WBmGPvaf47k7WmvgRys=@lists.infradead.org
X-Gm-Message-State: AFq9FYKjm70ADU0nerJplyIZuHak1iZ7cOPeC5fJwLGh0kbCCKds19IY
	2cCBvkI7nCGJyQwr4R3XFZxd4fEJsMSJWAs53UQtwMjRxLUZSTSxzkViXmwQ/9Cu0dcPJXsQRF3
	MVoxTT7EBERA/ZGlouks4xWsTFN43P9e6lzeO3C3bDb0kmMIymcjYTQFKOqvRtnLyMGRaLTAZce
	dEWshVMQcLzoc+chyx5ObG6pL+oR6kJgM2Hj4eCTM=
X-Gm-Gg: AYBFou2IUwpDPkzIElOSPK/sLCZKJ7HmQrZYxSnzH0AqCE7qpNGkcY7MkkD9bBMnnFg
	xcKhPeiwLdcitUWo1weoSzuVJ1Q4XSHtxEdZa5wYoRbKydN9aWS3PIICE7Q3vRiH1uLYPMx8RvV
	SqoZDG9+pPfjXEBQOTXBuuj3+2gaYpq+PbDf3pEe0mqDE0dmX24BwvwewTQTWXEPP2EPZyMEkZq
	mYgyoExjwDcBM2dpXwcaeZ15nzQyy2RPj5Lu7lFmCOKR9TCbSeOXf6++Z17ZAabzRW5YYL97iY=
X-Received: by 2002:a05:620a:6011:b0:93f:11ee:ba1a with SMTP id af79cd13be357-93f57f91849mr395279885a.48.1792590214988;
        Wed, 21 Oct 2026 06:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:93f:11ee:ba1a with SMTP id
 af79cd13be357-93f57f91849mr395274685a.48.1792590214318; Wed, 21 Oct 2026
 06:43:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:43:22 +0200
X-Gm-Features: AclHuK9bkKR-qO0jcN1FEgG42syrJGdmYfU_hxWhaF-M615PIzoLQ_M5jA6Oi34
Message-ID: <CAFEp6-2p3vFY2ARd5bftVAQj2FxweaTFvdXyJr4nWBZSRyUD8w@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 3/8] wifi: ath10k: also wake remaining blocked waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: HBcPrcTKl8NLEM6zpXATZIB24KjN--Jq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfXzBojKzZnvz+2
 efBXxWFii6gzfHoyvb6YTVXnSoot5eQ4A7UGScDQEwhHNnEoxWnvHe+hBi+ynMTt0YZi6Fx+DHz
 4Du9FEDmCwHnOznHnNDBgWbwFbASCew=
X-Proofpoint-GUID: HBcPrcTKl8NLEM6zpXATZIB24KjN--Jq
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8c187 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ICYLl7Pk4l7hwN0V23EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX2QV/n95ZFhSC
 dhPNokaH6GW1clxvFfQjvqiuSLkFXyuJ14dz5kXLCsOTaFeakI2qvMGkYPS7GQ41xuul1yooEYc
 nn/5t9bQvCJ5pz/bVSwGfA2v8gLDLnmEOe2Mlt/N4RD+GhnqZRqTlCzcJdewT/7xV33ZSSkT+lX
 sOFklXAXXprXESvVnqGXqNqjCaU8Yi4GPURfInz7YwG8Iw3aLlPZGT1klFmqbbul/gDXq2oCJPk
 eGkpiRioAxC2/TYfHJ6V7dUIEqKVvasXqTlFesx4Sn3B/FDI8Dpiayq2w9ez7MmwwMp/vyZQ8Qn
 Zref8z45HfSImmOsUrh3Wv2Bg98pr3/oUHe9qtwkhF7/uCVL3ZjP1Tm5HC/QUEySrNYygD5szu8
 9prsvjx4wKX1XFZjPVEDYMaf2aOMKdVEh+21zwe8P2cqBaAbZMStIUaqsaSR8UzeBz/rX8dtX+S
 6/SbXmZ+L2pOPRlTFfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_064337_249479_D606D5E0 
X-CRM114-Status: GOOD (  20.40  )
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

On Wed, Oct 21, 2026 at 11:09=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> ath10k_core_wake_all_waiters() releases callers that would
> otherwise remain blocked after the driver has given up on the
> device.
>
> However, peer_delete_done, target_suspend, wow.wakeup_completed,
> peer_stats_info_complete and wmi.radar_confirm are not included
> in that list. Callers waiting on any of them continue sleeping
> until their individual timeouts expire, even though no further
> progress can be made. The WoW and suspend waiters are on the
> suspend/resume path, where these extra timeouts consume the
> watchdog budget.
>
> Add these completions to ath10k_core_wake_all_waiters() so
> blocked callers are released immediately instead of waiting
> for unnecessary timeout delays.
>
> peer_delete_done is the only one of these that is never
> reinitialized before its waiters run. A completion left over
> from a wake during recovery would make the next peer delete
> wait return immediately, so reinit it before each peer delete
> command is sent.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 93140f1ffb7b..677e582b87e4 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct at=
h10k *ar)
>         complete(&ar->install_key_done);
>         complete(&ar->vdev_setup_done);
>         complete(&ar->vdev_delete_done);
> +       complete(&ar->peer_delete_done);
> +       complete(&ar->target_suspend);
> +       complete(&ar->wow.wakeup_completed);
> +       complete(&ar->peer_stats_info_complete);
>         complete(&ar->thermal.wmi_sync);
> +       complete(&ar->wmi.radar_confirm);
>         complete(&ar->bss_survey_done);
>         wake_up(&ar->htt.empty_tx_wq);
>         wake_up(&ar->wmi.tx_credits_wq);
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..45a3082d5a64 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 =
vdev_id, const u8 *addr)
>
>         lockdep_assert_held(&ar->conf_mutex);
>
> +       reinit_completion(&ar->peer_delete_done);
>         ret =3D ath10k_wmi_peer_delete(ar, vdev_id, addr);
>         if (ret)
>                 return ret;
> @@ -5890,6 +5891,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>  err_peer_delete:
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>                 ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>                                                  vif->addr);
> @@ -5952,6 +5954,7 @@ static void ath10k_remove_interface(struct ieee8021=
1_hw *hw,
>
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ret =3D ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>                                              vif->addr);
>                 if (ret)
>
> --
> 2.34.1
>

