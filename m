Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F00606A32A
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUQ7hkHW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPS8S8Ii;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdoJZTqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=; b=DUQ7hkHWhBlEsm
	EllEEOKYvEX6TQYLp1CUOScA4y3qrcbauITuwyuQlW3Gkc2CS/XzXkvHERby5o0uh8nFYaiXgVQwM
	Qx6g47IruHsAW84TG6p0r0shC8fPe3/f+JCPUfiR0jixuAlp7DqemgXwoAs5flRwyZ+2Wa8oICqyR
	82mrb0N77rRp3CC/8HU7R5fll8XCHy8fXqcTqeNLM+QRoGPTOY9vXt7+e+jKjMTrihWy+HkRuyW2g
	t4viwfBwVOD6o/TrkOfdVlI6GX6aj5IFeYGsuuKsxnUehN1fN1QuXFCG0jKEHfvwHpvLmd8Xy9rb5
	jqVpK9aN/uHL4At4ZaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAM0-00000009TWv-3DfF;
	Wed, 25 Nov 2026 10:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWALa-00000009TJi-34Mo
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 10:35:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mh0D3642160
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=; b=kPS8S8IigwGwHRGX
	S3Zsyb2MOD8LzaMZmtRaGhenxVSZg3ws2mnfSLq6/b7sCEhuK56sZRtoMbhTHWxV
	VSY01FTKZ3U+1F9uj73+Kyc9WLR3iHq0x9dl4w54ZGuZedR6eD4gG1fYGcckN5uI
	XhEuH+cinRpmOnzAaz04ZBYbrgsKur9f78LY5sfWld9wQWRjMZaaUIWIkFPCK4LU
	/eaU4AS9QThcWtz0HjQm3WidZRCXqEcVVegn/R9gKFYGcR7hS+eeJhmwhGwx5qRA
	+q7vgEDGPNGVaXzy+OC1lHabZ0bM6FbzfpcpacqI/ha0fj46EOOGkO9J3+lzyzii
	aZG0LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ad46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:35:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949dc497896so406703385a.0
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 02:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602928; cv=none;
        d=google.com; s=arc-20260327;
        b=iF+5KIVjwIBbA3Lr72pUpu/ptrw2sdfuU3eO8b16OxByhSGhlIMS3jvfECAtKdQmbx
         6Z1N0CT5gxDqWhShfwfatve5fzLQ/55JkHGLuqZ1ZNcq1QE57lphFK41m64b8Ybm8jlo
         UzEXr5V41hcroZQfVDrOTX2JisA8Gk1Q311QC7JLVjDXE7AmJAaLJ5zPk+/9y9Mpzur+
         qWVSqtOr3PPqhJvxfoXJOOlj01Ks0yQGRQw6AW7KLerkKBIDn0U8KRzufnQcZ7KW2f3W
         rvokLPQGy5E2Daggw3KN5SOnJ5oVT96s9kso+cC55YHdqDwqhMy8qLZMlJ09wJTvBT+F
         RQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        fh=Xb1tXJ37oge0SQMo1H7NI14C9l4lLnXC/UXjG4q0g5U=;
        b=de6sdB5ttI3BW28D7WDsWjfPiRQMUbTB/73dnRSp+q6ENLtiIqSvsYvLh7EBlSyjmg
         +gStbsHhdnLi4A4O1RhmMfwMJZPDfcKHKRpk6JDXirCuqgybHPwYSqogFVd0hhH+gttI
         J8kINh2aVwcVgksTcrifwX6oOr6EsMY6+Tn95jJV7EuGgm5tWtPDrxBECmInLcul9u2n
         5ogl3M53Wl0w6uHsZEUg3siU4fb4ceYF6UtexvaJFccbH8RLvg4muij2EOH2/DGtb5fy
         dTFEkrL4wWKXdJ1JwpisUsmneU6qOB4eicezwsLCiaBu8f6iQdW9R/FtvrDvSAR+cf4s
         hrEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602928; x=1796207728; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=gdoJZTqwT6+UXqrlx+/8FbQSlg6AeRsUGw2Lj44BPLl6Fc1NCXFxcx6DyxYSzuAUXK
         H8zVT9Gryst5X+k5xidYNlegseqPBK7MWjdf54nCvape2onK6Ie3ueB+7+ffijDpcd0b
         leTdHiFhqxGBKPgY22Nx8D8bDdJal+H4pGnK4MAcpjV4DgvzsSNYOKhaSqEtjMnTZSJm
         ZYTp5aZelusFrsiL1sv9XyVgdCpb8ElS98Q9XqAR5Ufuy5/wdOdCou6Z50UXWvcerTd3
         kvnFfegygbBjIHxjzqOPz2XIw8WhxPViptBWzQs0hsOifORX0hshJq+zqmATJ/JnKs1S
         81wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602928; x=1796207728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=CAqM8097tvKXu4KN3YLcLAe49RYVOXwEi42n8K4/U/ac7vKkQdJC1sYEpz8MB1G1i3
         AsXdKabm+DlvGfoCdkGyar7EL6PioVutezKWFUZIuDNTNBqgEvvwWGsmzW/sIsHRwCkK
         FmZyS8Yopj6Ze5Ge2RG1uRG4uYITx5t6nATnxwshGV3B5m8iNScNUf8J8xZil4LgaojF
         cVG5XKztCoLoTmovQTGmZtB0TVEzom77xJ0hJK+dcNzlN6VJXeU+2KwrK/ydybs0XBpP
         Of4a+Jokn0k7plVXaD74z/m6HnH7qj6IFX/TuAqf//qC2d7zyaKlFAdFsyanPoLNErl8
         g4CQ==
X-Forwarded-Encrypted: i=1; AL+hErFFbWtBhQXdXmBpV3u7DCjXukCsBmFi1o3bkTs2JNcPwBsxKAxf/CRqKXUJ/hwO4s9iu+o5cqQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8RW3wh5CijZDocttbQPlNGanWCSlmMrp09nDyWfH2/djRTy+hF
	NMNbi4zntmvot1OjUKFRQsPawk3kOTAJD2F2+o9NXqL0ppYOd2lVvb3Ztm6M/sGBTOD1Mti1ZFM
	FPA1OXB+kHeDqJeQTA2f1sJtzG3fvHpQFj6Q8nlYdForRF2VLL+KcUzrSr6qnuI6IgV187v4EuL
	a7pN7T3oILI2O62Akr1Xu4iiARf9lIT+8T5MvYY/k=
X-Gm-Gg: AZFdTZetFzcsx50HY2HDhBEdUnqzopAaLn65kE7aPKpnMAD7z9VExOmQRLXiJlwLJ1S
	Eb2uvLTxKEzkYSXi+agfGlzccmmpBP+iSR3th6s9a5vaiL3nXqyorSIrns8v5UuLi3Ye7CcLbNA
	/U/ec5Iuv0pfWUtRMMaouQRl5wFQbYfJnKUS1RMlx00xcfZyJ9y5MV7R6AkAoOPXYL7M9vwRgRs
	45nGBb3Tdxqht3NwES0uwoM6+Oew0WJ+j7rRYj7uPWuXPw3tC+7Lr50vavCdtDNxwhfvFOk78I=
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id af79cd13be357-949ba9b99a7mr3132210785a.26.1795602928359;
        Wed, 25 Nov 2026 02:35:28 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id
 af79cd13be357-949ba9b99a7mr3132207785a.26.1795602927857; Wed, 25 Nov 2026
 02:35:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:35:17 +0100
X-Gm-Features: Aa3M54re0FQ_0fXLMt1bXHOoqkxsP0SiwM0GqLy5xHbvAlYSumBJKK5qN-6KKNM
Message-ID: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b9f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pfe4PHYFt_2W75ZQFz8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kuvKrSsr7tBdCtKKR-K-UTpGrnkIdKLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX/D7HynBpTUAG
 EIB5iW1KQp0D5j0QypoqyBqjlueNbKlXB/LZSG4qEIfRTGZGavFlHqPu89X2WvU0YBhBFX1iPGv
 wC4oDpOo2RD2rVONz2SCBGRvGjskO1e9Ntz0A5bRzVqO7xf/GJbUbUnzHL7FlvgACgYe45jrnJR
 or0YKJ/yRDvTg1nF+bYDcJX0Lnr+nZObetx3I02orBK1sGQXI01vW+CPJgl7jbp/VznfAyyNy9S
 5Y8Yz+XrQV/1e14ISHcWoU+8SKg96gHuhxvGU0E0xLhn4rwdYkxqOooqJpE7Co4SdUOKbbrbWSG
 LNGJzuAlkTLGmyG5TPJlgGkPAXxnToxQttwd50gYa/RIHZSidakRiZFKUr5K1ym4z7W7ang9AiN
 TdIwixr11g8NxvWfuDvBFq92De07EUJUkHRDMBN2T2sp+iXQuD7Rg8mxwRk/ddmYvh93I8JLDq/
 wM5iPEC1j0++Jzk7YHw==
X-Proofpoint-ORIG-GUID: kuvKrSsr7tBdCtKKR-K-UTpGrnkIdKLM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXxfv6rMNVJQQr
 +tamGeGvTCoQrVlbPoSCBIRWxBSHiRNfiT9aDL3SSBrloVYPrDbNU3bXspX4x6c8N6br55yyybu
 MqjZ//uT/Bhy3TpWw+WmM7LPoQNufKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_023530_897172_501219A2 
X-CRM114-Status: GOOD (  19.34  )
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

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> ath10k_core_wake_all_waiters() still misses several completions,
> leaving their callers blocked after the driver has given up on the
> device.
>
> In particular, callers waiting on peer_delete_done, target_suspend,
> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
> continue sleeping until their individual timeouts expire even though
> no further progress is possible. The WoW and suspend waits are on the
> suspend and resume paths, where these delays consume watchdog budget.
>
> Add the missing completions to ath10k_core_wake_all_waiters() so the
> callers are released immediately.
>
> peer_delete_done is not otherwise reinitialized before every wait.
> A completion left signaled by recovery would therefore make a later
> peer-delete wait return immediately. Reinitialize it before sending
> each peer-delete command.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 3bb4d2742c30..99960f12dc66 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct at=
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
> index 74aca0af11c8..695df1821e5c 100644
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
> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>  err_peer_delete:
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>                 ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>                                                  vif->addr);
> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee8021=
1_hw *hw,
>
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ret =3D ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>                                              vif->addr);

So it would probably be cleaner to have a helper such as
__ath10k_peer_delete() that performs both the reinit_completion() and
the ath10k_wmi_peer_delete() call. Avoiding duplication.

>                 if (ret)
>
> --
> 2.34.1
>

