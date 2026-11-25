Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B1606A31E
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TALV0OW/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMulSzXC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCOp3rfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=; b=TALV0OW/AAMc6e
	147vl1Q0/Tr4GCIKGKFXltD8O2gKLuFfswhioiCMJZAgXouiTUzL/UlNhCysr1JpvtTa3DZ7Luam8
	/ymXYoIvjcJAOlc7Oyho73OzvjVcsD9WMk6vP8L169WyVYb4/vfCw1fmsVhKMZCtV5vCTRBQ5aM80
	ca6N+9P/HnBYbEQQwnu/5P98ZQ/Zjn5Ev13AyVOu5/DgxlpLOzqn8XUinowK8z3h6nKNzyk/4v08y
	Nvch74t51cjlVmWi7IB6oysLWoMwewY8B7JJbNRRUm/hlNfXYBhQNPgzONdV6HTsPMw7GzZXa1vO1
	1Wny4daxSj0vKe+l5EoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWADI-00000009RYk-10HS;
	Wed, 25 Nov 2026 10:26:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWACz-00000009RXJ-2ing
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 10:26:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mO9r3127120
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=; b=oMulSzXCiUoJH7kF
	IIZGVo5vdon9UD11anYrJr4YAYEATeTNaNwG1cBsfB41hNrS+cdg6iQ9EB5yrrXL
	zaGIxoIxo8mq4/xbNq+Jde1AskIMPOcDGQpFK1g6r6QwsoE7g8fGDLo8aCo5kPbU
	dXE5gjvVm/38lOxAQzpwksEfWdYGEhGtE4y0l2F5pnabmI74iRaXb+fPUvYZgh88
	MjOx5ynN6TRURPdIgAb9P6Kjxk9ot+/YzSRne3jwIR1xOa4yg7wuKZw/DhOJastg
	/DXtqzpwrG4ghK1qirctUHe+pcAlbaSroMyXqT7dauLAGSOwgj0S3Cg5xKpQp+UF
	3nO9zQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbnxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:26:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so882336085a.2
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 02:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602395; cv=none;
        d=google.com; s=arc-20260327;
        b=Wel13HFW7SNZ4N8+n+E7IozBMHstdWgk0hWzzZJTFstn9pp3FTYYlW+ntEzYhelUmn
         nXZo/lQAg3O94MbfMtWYUQly0E+HirLdFAS0q7PgTK45fJss+uq5qhS6vSImr6MPzt1n
         LxQoufroso/bi6DcGd8ARCZWKjmLU8zDVNnH0fVcWaCXD/FuZW8kdpFCrk+lLLsA+F3Y
         VUZDtlQtWrW3HUOpA/u+7yYXl3f9u/7AI3zAVOjUmJY6CJIn1R4o9N1AmpiqtIGURY9m
         2pnkkhQxie5qME2x1/kxzoBKmZjXxhyKC6K17C6njVOX4yIuDkvoDR7WBMBDZkw6VS+3
         +A/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        fh=iqwSgSWdyxTSnLqle2HXD0JSFnS+DtS4h5edPAidVq8=;
        b=RQSVvddW41OocB3tth2oqGIQsgQZNlvRSfGV9oD7otIlki3szFP+kdGmdvXiROzCqQ
         hY5jbjvGkJvEzWGdHYwBHfOpp3b64vKUzaAyjkSF7uJDLqpFiRijXBnVl8REGC7Lq/C8
         33eeq1YPzo4oSAiIpSdcaoej8Wdjho0hxCguaLeA030UaJ0PdiCdarAPsqO5VpkCPgFn
         vJpwrpFcuSv0TjF5mn3+ZSUYjPr0RZwoS4EM0h7HFfvSfak1Ol/NphyHXR5VuH8uYFai
         +G8goOoUpl1EtvbV3PPGtlcFN3fGHP5yPIrnmMeYqJdJce2LWZfKcZZxlSdzh4Z62EZe
         dUdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602395; x=1796207195; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=eCOp3rfvf22hTaJoctmwRGKTUdeDYJMqC3cL8Gr44TpfCufNLJPJUqd4uYOEMw1Hs7
         BBuAQ7H03MptjU858F1/6G7TWoesiA37EkAtfuL59FzYK+cMnQcycdSQqiFTcDPR5ZkP
         VKm4BTEWkjty/E4RphYfWR/fJwv6UD95/qcfSEGEsCmsqxMIrE5c9khAwQ/146uKvxmK
         L6VcXMe7SB4vD1QgO5WMOKFX+XTqGXFOS1jReRN+12DYwrr0RI2OpJIsKHfXmQu4KakQ
         40cMUgOsVLTSTZUDdDvOkqovgqLFtIvKBkR+/PERpFVbX4yXRthaZk8m/+B/1Nn1tjP+
         vO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602395; x=1796207195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=JuWUy5yT8ES6/sIdu4xks7LcC91nN0ZF+D7cvMod78vw2UWPnUGsSGO4xzZM32GOUv
         rEOYI6U6BUmV9wnXmi883LR5TLC7OIu0P+57KXnWLsaYbiFmdJWy/ZdhHT7Ck40VXi8x
         52z65xKNa80XazeBMBip9G1+R/fExJb4mv9efuQicmoG5VMXTT2YSg+0263AcrEedXWL
         KyGsqC+QU8hWQdMi5B36baH9o+0ueJFR6UWEaM4I15J38VKZZyowgst+Hq4YMVjA1yPj
         HEfwoSadPP8BQMCIoYIx/fL/NkQQRugpmgVWPsBdgWvKtctsY+2PAfaM9kylcExjT/D2
         PHtw==
X-Forwarded-Encrypted: i=1; AL+hErHeBH33GlKrUDBY+cb8s2U/FggI+kHLTP15xMf1Xlyobm01hCSUGezPzWAc7nShCvqNlD2Bpco=@lists.infradead.org
X-Gm-Message-State: APuU4Z/aelA1MQs1v/6PgVcM6oI8ktpHEYDfazjPeRdbeK8vdjcQZfRr
	QmRJQguhE5eCybFVF6gMyQUmwGOXVUkIMJdnz9OpSvLpBJ+RigCxmIpZq9EJPWbdjmNN0mv00fQ
	YBmwHodWy3fEWZ08Kut6KwGzT8LKhgUag/VSA+MRBiYGZgiL2ZX5YzAfGzyXfoZBgrO7LLNwY2B
	z8F+YQae/O+l5NeQgKkqSVh/1pFdFhwpcGfGNrsSM=
X-Gm-Gg: AZFdTZdDVPaZpt1dyNtgeea+jqlkvQGu8cnHAO5n03Wp3FgPPYvrOpvYzFBk0/owjuG
	jkQfV30hcuIwjeYBtjwpU5f2kTTgWMr+UeNL1kcS14YI/WQwBxRBomdFnRtwy9gEVvxF30Ud6bR
	F6J/BWixd6oQ1J3+BDMC19iCAJ1KZPYWgRwn1UK3QZUgn58SNY7/fUvUm83Tsa0SIsKSCK2Furn
	5y6xtNdWn04jSeMRYEFgurQrwCn0TsCqcOuBSgZ8IFhBAFvnJFhPdJ7X7+d/ec+zJrpBjys5vk=
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id af79cd13be357-949ba95560bmr2997969485a.19.1795602394973;
        Wed, 25 Nov 2026 02:26:34 -0800 (PST)
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id
 af79cd13be357-949ba95560bmr2997966985a.19.1795602394422; Wed, 25 Nov 2026
 02:26:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:26:22 +0100
X-Gm-Features: Aa3M54pDilQgmdQ_iplbP4xTthogyJeysaRUo2ZcdIbsLLaIHGQCESKKQsu7iDE
Message-ID: <CAFEp6-1UR8eSK+nPeQ+wAHsb50VD8iyrHs2DoyNqtPpKV9mJUQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXzdldazCF/jgf
 /ELkmBSCyZMiMWiXPSBa9cFutzgKs1h6N5wQeIIY387Nb3iA63XexLdMewRO7iSucVsbYVwscsx
 74JHpriifKb4D7VNWP5bAm0k0mHotw8=
X-Proofpoint-ORIG-GUID: pDjA9YaEkVv6HQhNiOkGdlW6Snyqc2Ie
X-Proofpoint-GUID: pDjA9YaEkVv6HQhNiOkGdlW6Snyqc2Ie
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06b7dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=RL1vT02WTRJ250hdzHgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXyVHyDmCbkLPG
 Y6RKeuLxEQz6s6j1tKcM2UG9LFiMWSkbrB2hwfnTV30E5WozDiUPXL/vfDA6mo9jOLOYNS+LomB
 lQz0eyWZIL/JRRO1bKmD8bWHWQdWjrA99dAK5qY+kXhRNXcaGlx45f3Ru5qhapli1hzwkXybRR/
 qBjX/T2Ji1k4re1k7ni/jOYHP4axPJoLIj51wkx5Psnsec0VwF+ysGgfxw6/I03ojL/oq2ZFMyY
 mp4pqRpdfSBM0c/mXt5BxCv6By6FLH9TZOn9Oxuy31g++l/LxKgPqFhMuN8jSFs/oKsGd06JfY2
 ibLBRJSi8HyFsA11uqxs1n+WedwmXdtFZozAs8kBKmsaNvUpIDWIBEOAc5YepANdfoo09v0Uvik
 iZBl1VcH5+x2Frm+Jn5GdMRZgixTmSWJOmkk3Y5TqaEWANXJg4oIyfhy3oZ/p6kH8yaJbDsKFXY
 cKNwhKhM7NXfmGKsU9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_022638_142682_92D6915E 
X-CRM114-Status: GOOD (  36.06  )
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
> Each recovery trigger queues recovery_check_work on workqueue_aux. If
> a recovery is already pending, the work blocks for up to 5 seconds
> waiting for it to finish, and marks the device WEDGED after four
> failed waits.
>
> On SDIO, one firmware crash can raise several triggers. workqueue_aux
> also runs SDIO RX and WMI SERVICE_READY handling, so the blocked
> check stalls the traffic the recovery itself is waiting for. Recovery
> then fails with "ctl_resp never came in (-110)", and a recoverable
> crash ends up WEDGED.
>
> Stop waiting on workqueue_aux. Let only the first trigger start a
> recovery, using atomic_cmpxchg() on pending_recovery, and ignore the
> rest. Replace the wait-and-count logic with a single 20 second
> delayed work, the same bound as four 5-second waits. If recovery has
> not completed when it fires, mark the device WEDGED. Since the
> deadline already covers elapsed time, fail_cont_count is no longer
> needed and is removed.
>
> Because pending_recovery is now set only once per recovery, any path
> that abandons a recovery must clear it. Otherwise the next crash is
> ignored: the device is neither restarted nor marked WEDGED. Clear it
> in ath10k_stop(), and in ath10k_core_restart() when the device is OFF
> and there is nothing to restart. The OFF case was found by code
> inspection and has not been reproduced.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 75 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  7 +---
>  drivers/net/wireless/ath/ath10k/mac.c  | 15 ++++++-
>  3 files changed, 56 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb31cc..b536c21630b1 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2535,48 +2535,45 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
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
> -
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
> -
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
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> -
> -               /* Avoid having multiple recoveries at the same time. */
> +       /*
> +        * Pure deadline monitor: it is armed by
> +        * ath10k_core_start_recovery() and cancelled once recovery
> +        * completes. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
>                 return;
> -       }
>
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);
> +       ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
> +                  jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> +       ar->state =3D ATH10K_STATE_WEDGED;
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle. Losers do nothing
> +        * while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Arm the monitor before queueing restart_work so that restart_w=
ork
> +        * can cancel it if there turns out to be nothing to restart.
> +        */
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
> +       queue_work(ar->workqueue, &ar->restart_work);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -2655,6 +2652,13 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>                  * or if the crash happens during FW probing
>                  */
>                 ath10k_warn(ar, "cannot restart a device that hasn't been=
 started\n");
> +               /* Nothing will be restarted, so no recovery is pending a=
ny
> +                * more. Leaving pending_recovery set would block the nex=
t real
> +                * recovery and let the monitor wedge a device that is st=
arted
> +                * later.
> +                */
> +               cancel_delayed_work(&ar->recovery_check_work);
> +               atomic_set(&ar->pending_recovery, 0);
>                 break;
>         case ATH10K_STATE_RESTARTING:
>                 /* hw restart might be requested from multiple places */
> @@ -3769,7 +3773,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
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
> @@ -3806,6 +3810,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>  void ath10k_core_destroy(struct ath10k *ar)
>  {
> +       cancel_work_sync(&ar->restart_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>         destroy_workqueue(ar->workqueue);
>
>         destroy_workqueue(ar->workqueue_aux);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..2e100dd246e2 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -87,8 +87,7 @@
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
>  #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
> -#define ATH10K_RECOVERY_TIMEOUT_HZ                     (5 * HZ)
> -#define ATH10K_RECOVERY_MAX_FAIL_COUNT                 4
> +#define ATH10K_RECOVERY_TIMEOUT_HZ                     (20 * HZ)
>
>  struct ath10k;
>
> @@ -1207,14 +1206,12 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
>         atomic_t pending_recovery;
>         unsigned int recovery_count;
> -       /* continuous recovery fail count */
> -       atomic_t fail_cont_count;
>
>         /* cycle count is reported twice for each visited channel during =
scan.
>          * access protected by data_lock
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..74aca0af11c8 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,14 @@ static void ath10k_stop(struct ieee80211_hw *hw, b=
ool suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
> +        * recovery state after the works are cancelled so a later
> +        * ath10k_start() can start a fresh cycle instead of being blocke=
d
> +        * by a stale pending_recovery that nothing will clear.
> +        */
> +       atomic_set(&ar->pending_recovery, 0);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80=
211_hw *hw,
>                 ar->state =3D ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
>
> +               /* Cancel the deadline monitor first so it cannot declare=
 the
> +                * device wedged after recovery has completed.
> +                */
> +               cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>                 /* Clear recovery state. */
>                 complete(&ar->driver_recovery);
> -               atomic_set(&ar->fail_cont_count, 0);
>                 atomic_set(&ar->pending_recovery, 0);
>
>                 if (ar->hw_params.hw_restart_disconnect) {
>
> --
> 2.34.1
>

