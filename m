Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097F606A319
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 07:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZqQtZLkN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aAEmOq4m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FEwMWP65
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMH+ndSWYxYloRSPpzwOpflCVqRuyoTp0ZLRh56w/Fo=; b=ZqQtZLkNhVVPS+2ziD6Td01K1t
	AsOQ0W4+QiwAsQS7+a5U0GXR+ENde1lNptg8liJj9Kd8DC764fwg8lCKnBuXVCMnvu2FIzNQswcs/
	JVGe5MLvoSgUhK1I79dXsgiqTMRRwnN5JEJ9F5hiIgya+r2sCKqS0mjKsKZ8MfsVH4AD05igTPC9N
	bj1XerfRaZt/9bWLqQJ9kMzLtE6r5bMCnBEhWxgY4qj7tKDcm/iwJ4xVzh7OPYceQz2aYOuGsao/E
	h+hBChOkPGx/VJgB0EcZWQDHMBtjXcHQkeY4bB6y46naRcSqp6KETpgcWSQeeqsPjEidQ+92w/MhG
	BMgIdc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4Ok-000000093lC-0BSm;
	Tue, 20 Oct 2026 07:36:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4OW-000000093jR-1RB4
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 07:36:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tFBZ186368
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMH+ndSWYxYloRSPpzwOpflCVqRuyoTp0ZLRh56w/Fo=; b=aAEmOq4mEO4rW5Bq
	jzmfpiBmMRINj7W6KferrgSDmvbZu6+O12bCcggMzp53KY5OZruintVp95jtZ9M4
	t5QKH7wfY4DNb7F4XKdD6mT58YnDO51Q3CKr8EJfTPkreMEOgxVI1C0rKtxNlEnK
	iiBIFkr1s5fU03pbAXn0iAAv1asodpoO4PZdafq3PkWs7H527QPyGKjxUq0TUbVz
	8kBccvHITyTrIbkHp1HqzmfrBiRLRGcq+zpzRdgFubWXI0erAFpFd9x+RDpLjFbf
	7eNZXwUq8X6LNVMfUjk2n7J4lTmGktboO9oJlD/QvhOT4vTF+4p4meszSJZzXIyA
	5JXtVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsdtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 07:36:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bc57d4d11so65221026d6.1
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 00:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481782; cv=none;
        d=google.com; s=arc-20260327;
        b=PeWHspgKIXyIpZz++t9wt9YduptLsz3kCiQxzQbWQhyvMij24qSutjLAPgPAKZ2VC2
         pSkuwNUpm4UH3LKenIIJIxX8I3xuf5KXlz+VEznA7Nkqvtol0mxyGnkWLD9bQwY2wnhX
         4qRPCA1edl6XmK2Jl5y/uJk608Kl+3U2aNOppmg7qIn617odV+UIPrTMuLZlaNDYU7y6
         LlywLeyje6tyYOvlvlyXYGC2Vfkb8fULdhi9uRUfkUyXLnjV80S9HeUv9h6cl32FRFkq
         zfl/jtf07akyGs4fp5jD/flU5hQc4iqDBTguxfeiUOFeKcoyHnpPsK81KJdB8t5JvB1U
         R0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yMH+ndSWYxYloRSPpzwOpflCVqRuyoTp0ZLRh56w/Fo=;
        fh=DgtZstTVI+PS//vO+3B8Qi8QlCcVVa6KAXd7qanj5B8=;
        b=WGM2CMSdcl/1S30ECrVNFR/8NaQQ21DHGo1iOcSTyN90FYAJ+VVWNt3ReNn4ki/BTk
         YLT0DJxX+tMUN/bYHNo9TosNaPn6ZfZ0IHKeAZluWS7SabRUuE4oiG4rXLCler3mKoZn
         R8elI82kkvzAIMYKmEnZVvyv2JKwUTmwzSfEUpjPBNzyEC+Uz2vAbkrU5ttj3VII7tOz
         i4+DZz/8dgw1m5/008bE6fsZ7/YlKAvk62UIoP98dz99ucl+RB15dHW2Lv65/mNo+gGb
         soT57uSUOTjUtz4u+SsL7Cw1GR/1qV6lHkDxjZ29Dy1BoB85hUhcFZksbcvznJz2vVZV
         7s6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481782; x=1793086582; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yMH+ndSWYxYloRSPpzwOpflCVqRuyoTp0ZLRh56w/Fo=;
        b=FEwMWP65qLG0hW3Zi9nn+8+BcwpRbYR9PsBigHTi4kMLjPrxy4fYpzvgbVDAxxzdBh
         Rbm5OxFpc4qSOQJufBWw0hWWalQeHda3YJHNCYDyssHEVSSs5It9twtAo34KQ370kyWS
         yqPXvcKIu2ysgrQtg5aORqjM0tTyn+MOHrnqzkIDJ4zjUFkJiEc0WYZkCjUWcGVhVJRJ
         QiDPwLvwqWzPUJlwTpVRCaVma86QsNFjy852bhfAxYLD3FoudRJd2EiKWWAICy9zhEn2
         JV0gFQTHiwM65v+qsp1vZXXUGaLY7fFCQJD/Y3j0nO0DFRE/D5tQtXgYcc8Dhl2Lt0dv
         XBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481782; x=1793086582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMH+ndSWYxYloRSPpzwOpflCVqRuyoTp0ZLRh56w/Fo=;
        b=HB6ifhVrC1ZN+e4BxM9A/QGOodvW6hg7KcAI4TltygIU11xFi3RwfvbnY1ZOqk1XPG
         bnjNeJ0eXtpnFQntAyKlAfzGOSAS3ErsDzRRtaQ1+cJafWJsKGt8AI7oH4KyxGTA1t5N
         EDJDOga/d0S2oMCzNcMUa9qxl1+HFpZ66ylsNp6WeryizJpAqGylGEN/6cO7pEGw8pNe
         nur+mAcMcJSLu6wxBXQ+Sx62qRVAkplVV3kcIGU967NfcSumDkiIDGxmGim461lOvuY1
         kAei94lVwNEEyNfOu0ITOZ1+2U5rb1ToavcqLsddNWOe5THWRlxIATR8rJzoQK3C49px
         zD9g==
X-Gm-Message-State: AFq9FYLwUcupiW7ElPBYUtLQ6UjvzNBpAh5H7xbNCZB2oTAQTDKJoq4b
	HO3gBIrH6vvfONW1d7+MislwFqymUBWrNGxL8LIz0nQZTQUg1WvY+TDJp3Y5bsxruxVS9PgsXmm
	DXgmdxdabbOZ3eapkDK9KP9iD1QFEcnSp1uT7MHLkJq12AUEbgHE9QQGYCGeonVTiSSDcwb2muY
	XUOF5UJus564XHf7/V1EjERSC+jvFstT8RW96ZFJg=
X-Gm-Gg: AYBFou1MJ86aFhAtiX/Te6sccQGu0AZupl5ay37ZBOZmSlrHDEsXxbCHy4rIS1bbBNE
	V2DIOYvT+UHzW7L+FxaoGbzFjRusB9HYaFutVGfGk4aFy7ae4ePZGpMyDrlLIUgI7QP6y9JHs+o
	sW87tozvCRH7voyEfqJSP6iJ1tNEQT1NdxzOsJqVNUJSHqJFOsZ5rKZaAkCBq35LH2ka/6lenGh
	mJ9B9qV7JjqIB645v7O/1MyxP/lqP6+gQrsouSsxM9oQPjWezxSEJ0FmSSp2Jd6ONXdLdS+gwE=
X-Received: by 2002:a05:620a:394c:b0:93e:c12c:4416 with SMTP id af79cd13be357-93f29df8910mr1636930985a.82.1792481781998;
        Tue, 20 Oct 2026 00:36:21 -0700 (PDT)
X-Received: by 2002:a05:620a:394c:b0:93e:c12c:4416 with SMTP id
 af79cd13be357-93f29df8910mr1636929085a.82.1792481781390; Tue, 20 Oct 2026
 00:36:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com> <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:36:09 +0200
X-Gm-Features: AclHuK8ruwll37nLGnEXSBOSywPZkonQuKTFoOC5C70Qf_HAlsUxmdKYvpBNrgU
Message-ID: <CAFEp6-1t7s9zX5GMyiZ_PP09Zz1qRZ_tRRTmo2m_vBqOBj-Mhw@mail.gmail.com>
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eWgJ8Xf02-YF_MiRQV7_7ZjDbiht_N5u
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad719f7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=3J7okp31mlcxl4oyp0oA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: eWgJ8Xf02-YF_MiRQV7_7ZjDbiht_N5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX5UhsxBcx+922
 5LpbSTNzJplPNoE81rou5ISHdQDBrQp+Nd1n7psAlNj5Khbxhk713i3WYd6CyurSHKCc4RouzzB
 buJVAMfTjhIosHNM0EavMUCtHn5SlKDIiCHmkfB1FgHzlGvJ4DUM6AbSI/jhrz8BqS0dEyLvUDE
 w1IYBuwHWIIAKIcjdSTKJ0hRRXADgFxaQvf1rPLAa3Tj4IiIrxwfzQQr3XfTJnTk0juml0+HXzT
 Uo+M1aZ1ty1OOuwcJ8vEpkYGcnUQr1iPuR+iJjPIXsNM6lmkkmW7YhQIb3SakrJ8X/h8+pwmvhE
 IkC2lSIiyYlWoGUNAICKlS2YIc06ru+Tem0Nz5FCtE+CwQWHXm/bpa1v+sg4y59zaOZ7R9hwKlV
 jguIZIo/by2Dxd7nQQhViQYlkjSA+I0ADeMIUvOCj9niFfC0Y3PL2zlZF6yTMyFw5jgXIHOuq/w
 IKHtW3gSPx4vsewTwNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX1HhwOe6cYLez
 gClK5oV8sG7MDh5fyhFqjluXv1pjvwecBHc4xEla6nK5UnaH2k8jiaQ7+ndSY3np7GKHnD1HUIV
 HGoDsjVwvZltYdK9PIJn3keKi5miFOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_003624_389664_F6B9AFDF 
X-CRM114-Status: GOOD (  24.66  )
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

On Fri, Sep 25, 2026 at 2:27=E2=80=AFPM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Recovery timeout enforcement currently advances only when
> new recovery triggers arrive.
>
> In practice, the interval between triggers is not bounded.
> Additional timeout handling, workqueue congestion, or other
> recovery-related activities may delay subsequent triggers,
> causing the effective recovery timeout to extend well beyond
> the intended ATH10K_RECOVERY_DEADLINE_HZ limit.
>
> If recovery becomes stuck and no further trigger is generated,
> deadline enforcement may stop progressing entirely.
>
> Convert recovery_check_work() into self-rearming delayed_work
> so timeout monitoring follows its own timeline while recovery
> is in progress, independent of future recovery triggers.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Are you using b4 (or ./scripts/get_maintainer.pl) for this series? It
looks like a lot of relevant To: and Cc: recipients are missing, which
makes it harder to get proper review coverage.

>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 20 ++++++++++++++------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  |  5 ++++-
>  3 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 29ca34a643ed..93dc7332c759 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2522,7 +2522,8 @@ static void ath10k_core_enter_wedged(struct ath10k =
*ar)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
>         unsigned long recovery_start =3D READ_ONCE(ar->recovery_start_jif=
fies);
>         int fail_count;
>
> @@ -2536,8 +2537,11 @@ static void ath10k_core_recovery_check_work(struct=
 work_struct *work)
>         if (!atomic_read(&ar->pending_recovery))
>                 return;
>
> -       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT=
_HZ))
> +       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT=
_HZ)) {
> +               queue_delayed_work(ar->workqueue_aux, &ar->recovery_check=
_work,
> +                                  ATH10K_RECOVERY_TIMEOUT_HZ);
>                 return;
> +       }
>
>         /* Record the continuous recovery fail count when recovery is lat=
e. */
>         fail_count =3D atomic_inc_return(&ar->fail_cont_count);
> @@ -2547,7 +2551,12 @@ static void ath10k_core_recovery_check_work(struct=
 work_struct *work)
>                 ath10k_err(ar, "recovery timeout %ums, fail count %d, shu=
tting down driver!",
>                            jiffies_to_msecs(jiffies - recovery_start), fa=
il_count);
>                 ath10k_core_enter_wedged(ar);
> +               return;
>         }
> +
> +       /* Keep checking on our own even if no further trigger arrives. *=
/
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
> @@ -2574,9 +2583,8 @@ void ath10k_core_start_recovery(struct ath10k *ar)
>         atomic_set(&ar->fail_cont_count, 0);
>         WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
>         queue_work(ar->workqueue, &ar->restart_work);
> -
> -       /* Start monitoring after publishing the recovery timestamp. */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -3758,7 +3766,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
 struct device *dev,
>
>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>         INIT_WORK(&ar->restart_work, ath10k_core_restart);
> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_wo=
rk);
> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_=
check_work);
>         INIT_WORK(&ar->set_coverage_class_work,
>                   ath10k_core_set_coverage_class_work);
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index 0319da3ec022..a1ded2cba103 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1213,7 +1213,7 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..d10126351fce 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bo=
ol suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8175,6 +8175,9 @@ static void ath10k_reconfig_complete(struct ieee802=
11_hw *hw,
>                 atomic_set(&ar->fail_cont_count, 0);
>                 atomic_set(&ar->pending_recovery, 0);
>
> +               /* Stop the self-rearming monitor after recovery succeeds=
. */
> +               cancel_delayed_work(&ar->recovery_check_work);
> +
>                 if (ar->hw_params.hw_restart_disconnect) {
>                         list_for_each_entry(arvif, &ar->arvifs, list) {
>                                 if (arvif->is_up && arvif->vdev_type =3D=
=3D WMI_VDEV_TYPE_STA)
>
> --
> 2.34.1
>
>

