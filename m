Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3458606A31B
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZhIC4Lk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehaHJTA+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VN9EEdl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=; b=AZhIC4LkC95IkQl8RWSqvO35Lx
	EuoMlfbr19H6wEn9ikmuonF3aguGDkYuPXfUeF4qu9FVajcpI05+kU+JH5UhQ2YVcnI6PD8mDwFBN
	Mf0UDWlFYIMgthhRix8CEMckCPrx4yEnlKsJEgdHrKqVQxffJ3TB8SLGDXHIaboOMayhAFQkN8Vgy
	WxHqXu17yxJOh//piLSq+vlIz7hVaBSzUvlL9ay304RTjIFB+Tv7sbk8KYvH8VrYbedVswjg0r0Cr
	1Bi1050Q8WZgfpBY3iDajvq849gNGLm7Sm9suXbCnn14inbAaMkvfxfNPFi89OUDtXGZ3pNsHMy3Q
	6pkVrJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWSN-0000000Buyj-2ZXH;
	Wed, 21 Oct 2026 13:34:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWSL-0000000BuyD-19Ce
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 13:34:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg4M7325099
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=; b=ehaHJTA+w+NuNV5s
	4mGLRcLLchz4wx3FPm4+pwJ3zKOYbbHwwy0t012GZBEP0JzJF+epATo8AKQyHGRA
	1sdwBnJeXvabaHxUQxK//WsjJYPd5yvDeODGrXDwlGYZJvkn+rm0WJCRuJKoMIvv
	Zw1LeTuPRXWymc15QIg/ApZBHfncfeiBvh/moLXnEj2WvVLamEi3D+1UGGtAwGaK
	jGF/d7KQcTYWhEiYYU13npdtgOqQ/O+WfCV/ubDduDd+AW4OdD4fbLH1F2Nf8Vdb
	b4vCk+41mmtLj9CqFbavJUhag2LkDrxo1g9IbIRuHDg9lyIZzCpq/bOmpwgU4e8/
	z/6Erg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v46fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 13:34:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so243610885a.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 06:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792589651; cv=none;
        d=google.com; s=arc-20260327;
        b=Uy2dPu8okF8D91jauTZzarcSIp5ghz2BBWTxkgGirP09X627ELo8zI5CQcrAb84934
         Bg78CgBfwD5HZqZrasSh3bp2noTUus5HkFsUtHSI0yJ0rAHnnYodBubCAvY0QNu0Cxjg
         dklpy6s6Jfl56RSN6/QJvzjx+AERkTaelCWP3LMrZPS83U79REuVV/jXiKR83OSdF2Rh
         xDk/r246TVDIJ+V1gCw8W3k4piMLbRe+4eSKDDC+G9MnKFWm7Kd8P2Fblm5JXVCr0O2h
         ofcVFnG19fvGqoyYjtKBXmuyz7QG/oPLN8uaSmvAoaJ4LT7ktRPNgcnFWcxk1cG1QIul
         NGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        fh=a0PoMT6tcStQNdR76tiRDfR15IWDgZSrmQ3Ax3aFoC8=;
        b=gRMlniytRzSOA5trq1Nbvm/SpNBB8FC0lvc2/gztedwZmmmNRIXfMM88i6aOjDhSnm
         Hf/5WQIhoSPX9nhH+qM/IAX0Digl6Q2ZTDdpglfbBCFmNxnG4PvV4FUy3Unf66U2zBnn
         Us8V3NdrTGhp4pbEr/f/1vGbZzzNFQEl3cC2LjIES8OVjTHFKAmNvLg5PGsX190ETZoK
         +xUF7tJEfkXHxbCPy/1/WnyPKzg01NuX7cEipVXxw0PpqTB1Qq9I/qUox4aFoVvkq/+G
         KbJtzp9IhytTD0y7e4WwwW0CSFJeJtEGXj/fS/saqvccR2f2A0TWqKdI7wDfv0ztBsHW
         4fOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792589651; x=1793194451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        b=VN9EEdl7pZ6MUXo5WyPVAlAUpakUl6xCOQHXU+CiOGp84Z1uUZV5fPHr/rP2EJNb8L
         e5QPw5OFNMvLA98ETu8hBttaeolYYSMBZ8RIa55lDeLSWrqcZ5/1UgFioNb8zGeSCbO/
         1+UYLZfvTqx6es0DwPetw4Bk6Wd4BSQGuIxc8Xzhu+FvrnOEbPWW8chhdkYVx2iiyfE+
         ZbPsKJmWpZGExVEyBXVmhLZxBWDJCsNN9DPSGpXXMdIbIxW/gJff/jUXOitJrMfe2H0I
         olQNyLOClJ0AKxfJJ2rvkq4prXHuIRCOB5MKx7ldXI53fTogf7gtUVwWGmTwjPm2Yfu/
         snEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589651; x=1793194451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        b=x+raEHLWV1WtW/A5CCj0IMXh++GqE4jRs25Nbhr70ynI3KiIuT26JCAYjUld54w3lU
         kH9DUVOREUEgsB/MJZUwJ+3JaEX9CCL3w4N7ElcUj5tMbboEuJibhjdhR2rX4muHdos5
         pSCUCLTdL0Z/YcmfMVwzjZTtPs2jmSmvMTjvCSqICNeTz0zTenp8jhwJgy/7R+bdTaT9
         mbUpu+0AzDH1fAPdjkLq8Pvhc37uW1lNrjhcC0jBx4kD2R4UGx2hfx62rpRE8qdK7hZc
         B7GDxloKuZ63tmGuRoUaQXBrAC6/qZPdvY9A21WtFnkR8E3rNg6QHrHmLBIVCmy/lLKM
         ivOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy97WASxVx+eeU8vc/Yiaq2envBE51E4i9t5rhzNEw0Iw3OrTFsn0mpvms3KJRVsExidRUm4R0=@lists.infradead.org
X-Gm-Message-State: AFq9FYIkS2tv1GCY2O02rVKmmL5yJuTUuA3Ph/PgX2H7k+WIH/RDOMYE
	7M/IvXbgWKkDoqvZzIHV9/97X9HEmQTScwEkqjX6RnCbU/VAVQqpo326dle7dQRnnSlYpcNNzeJ
	fp4SM7D5ODAqCJW4z4VzojXXKUzhb4LBM7LbTwXe+BbNHYGDhUHdBTFlPx/okCM+SQMNhTdQV0t
	sSVm6IGVAZRuHgTiHLghmU8nlLbHMFjuP5ivVudvg=
X-Gm-Gg: AYBFou2W2/8ZODCB48qDJnIUiAXEIfCe7jyytWDaoQpbvCHTq9mkJ1CmD2upCAaLD5R
	eeBHQHBDm22FWEWw4BIMCjvo4okc5tUmFgDG0fwHahtyOlV6+fHIYUQIr26cjFxF24MRwPDAvDu
	CECVKEWnqYK1Okg8UUIeD/pt00dV+q1Jh0VV3Tr2YBiYFwVlxYmfsb8TwHwyOlRC/8sB7jcEo7R
	A6RFlgc98CurwWrUMhhCQUYscg2xA8Kv8o0YzzIr5ci22ILYIVAKxT4xT/7fHRuJgG9ZJAZaGo=
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id af79cd13be357-93f57f1efc9mr420300585a.19.1792589651273;
        Wed, 21 Oct 2026 06:34:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id
 af79cd13be357-93f57f1efc9mr420291985a.19.1792589650530; Wed, 21 Oct 2026
 06:34:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:33:59 +0200
X-Gm-Features: AclHuK8a62c-CwhTvVQDCilzI1eRkbIH_HPXo0xCOe3rMO-oFX0aKFEfCQjnEyI
Message-ID: <CAFEp6-3UB=U16NkQNM_H4gUA71XWvYLcmcO_mJhFpX=9yC=HiQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX2JQR68IIt4TX
 1oOB8DyN1C0raHUs2kh+vmJoGnSqlS7HkD/HTnmzp93VeyUVS5CLknGa0a7a2SeoP5D9Hdb4BG7
 rFuMmEyOk8rzc5xRLqGYXAMnkSpxh5A=
X-Proofpoint-ORIG-GUID: Sww9Y5fCUnlxYcHj65aYdh_7j2RjOdAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX0Cn2fMJz7Wwv
 ZvDFJPDXgU7hRQxV7po0/zfuPXxB8AYa7L3TLpurdO9yCm8wozN8Hf/DhCy5P/YikuGIgk95jyl
 HnNoq+whV2vmbqGo1APaVMitYq6ZqdycHrqZj+/55nPM9nnCEJz6cCnfqx/CNv95mpIXhU2zrQR
 sFAYB6tXRIzYg6Xt9FNJCJzgiptX04rlLroYPXqfCmnxWthhwaK3yiepPSsUbDWxytts5+Twbx2
 R6dvyyN/8i3NpCHBPRlBtWhfjkow80rFcAhfNg5B3vio3XA3saEhthLL7VM71G9i65SMtCJxW0B
 g9QPcyhMZAsdOw28CPzTylMM4ftpy6frgmybT4LzScmZL33jTRdVy0P4HcQ0RAeYaVdao8mnDvt
 /UxnNouSPZ+Dovu8Qza6CTcE9XEa6g4HJkSZzUKdzYI2UHo5T6j8sU8oqH5zCECpUCOxPpUntyf
 PGaKkmsjvEtIqWbQaXQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8bf54 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=HbN7EbVxkcm7v0jztH4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Sww9Y5fCUnlxYcHj65aYdh_7j2RjOdAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_063413_458395_58BA29D0 
X-CRM114-Status: GOOD (  32.50  )
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
> Recovery monitoring runs on workqueue_aux, which is also
> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>
> A single firmware crash may generate multiple recovery
> triggers. Recovery detection currently handles each one by
> waiting for recovery completion on workqueue_aux. On SDIO,
> this blocks the same workqueue needed to deliver recovery
> traffic, preventing recovery from completing.
>
> As a result, otherwise recoverable firmware crashes fail
> with:
>   ctl_resp never came in (-110)
>
> Treat duplicate recovery triggers as part of a single
> recovery attempt by gating recovery startup in
> ath10k_core_start_recovery() with an atomic_cmpxchg() on
> pending_recovery, and by making the monitor path check the
> elapsed time since the attempt started instead of blocking
> on a completion.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 64 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  2 ++
>  2 files changed, 37 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..07beefa06c4c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2494,46 +2494,52 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
>         struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       unsigned long recovery_start =3D READ_ONCE(ar->recovery_start_jif=
fies);
> +       int fail_count;
>
> -       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> -        * so avoid infinite recovery.
> -        */
> -       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> -               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> -                          atomic_read(&ar->fail_cont_count));
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
>                 return;
> -       }
>
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
> +       /*
> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
> +        * cycle. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
> +               return;
>
> -       if (atomic_read(&ar->pending_recovery)) {
> -               /* Sometimes it happened another recovery work before the=
 previous one
> -                * completed, then the second recovery work will destroy =
the previous
> -                * one, thus below is to avoid that.
> -                */
> -               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> -                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> -               if (time_left) {
> -                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> -                       return;
> -               }
> +       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT=
_HZ))

You can use time_is_after_jiffies() for this.

> +               return;
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> +       /* Record the continuous recovery fail count when recovery is lat=
e. */
> +       fail_count =3D atomic_inc_return(&ar->fail_cont_count);
>
> -               /* Avoid having multiple recoveries at the same time. */
> -               return;
> +       if (fail_count >=3D ATH10K_RECOVERY_MAX_FAIL_COUNT) {
> +               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> +                          fail_count);
> +               ar->state =3D ATH10K_STATE_WEDGED;
>         }
> -
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);

So we are not re-arming anymore for additional tries? or I miss something.

>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle and stamps the
> +        * deadline. Losers do nothing while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Start a fresh failure budget; the last cycle may not have comp=
leted. */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
> +       queue_work(ar->workqueue, &ar->restart_work);
> +
> +       /* Start monitoring after publishing the recovery timestamp. */
>         queue_work(ar->workqueue_aux, &ar->recovery_check_work);

So now that the recovery check is no longer blocking, it seems to me
that this could be implemented as a simple timer (alternatively, a
delayed work) as it would avoid having to perform the timeout
calculation...

>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..c739fbadc8bb 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1215,6 +1215,8 @@ struct ath10k {
>         unsigned int recovery_count;
>         /* continuous recovery fail count */
>         atomic_t fail_cont_count;
> +       /* jiffies when the current recovery attempt started */
> +       unsigned long recovery_start_jiffies;
>
>         /* cycle count is reported twice for each visited channel during =
scan.
>          * access protected by data_lock
>
> --
> 2.34.1
>

