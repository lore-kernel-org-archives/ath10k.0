Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68DA606A331
	for <ath10k@archiver.kernel.org>; Thu, 29 Oct 2026 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RF549W3T;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljJaEdhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZKtCXnJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=; b=RF549W3Ty4qcuc
	jkJz2DLd3qS1dwFxR5r2d1PQ4ePYiXhu0cWLrgaGawH8uUpDcYx/cIBwqE4P+jERi8HaeGqpLU5qF
	YvkZ+g3E4yNtSpC0Hb7AVMHxEC07UxfWLpz4I1aKmc97YKRUZ0K+IDJNmyfc/IRLHLRSHd+OsR+pz
	5HJZoCkgx2Q46WiNChZK2lXxzZPO3aD71Zf4bBGrl7EVhkOAPQPuK7LTis7+jynTV2fDSjK6b5bf2
	6P7E/G9P/iyPYEwkHuGfHrohh2tNEr7MguVgIG3MvLH6VDY33iLt+syqWxI77InVTbi/OUal+6AGa
	RNrALty/cquAXZiDQOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSzS-00000009nG4-08J8;
	Thu, 29 Oct 2026 16:28:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSzP-00000009nEv-2Y3J
	for ath10k@lists.infradead.org;
	Thu, 29 Oct 2026 16:28:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDFY71087086
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 16:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=; b=ljJaEdhI51Ae+dKw
	BJD0bZe2JkSc0nwrpWLUljK0wB3INpfz7VXgHHVAtqn1Xrmh8QUGuXzYrdGOPPp2
	bQvomHAMxEFcSwiAK8fIWB8irunsEo6hByYcCqV5womjEUBL85IWIMCWVwPqnLcd
	zFjEE/276e3tv+PujkrtT4ciFcLBrG3XiLVpkCivhVfZl3T3r/YvzmRty5avP/yy
	Q+J7N1FiGz+xAuG96OA90BCKZ9u0nlXoJd0RPo/500Q8/6MSci2KNfowAYuAtpSe
	4CdeP9r9S7k2O0k5a6xCmaOcyDe0GSSXBNvuUjb0552QBJbz49t6y8Wr5S5U1sOF
	eawDpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpbqdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 16:28:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so474050885a.1
        for <ath10k@lists.infradead.org>; Thu, 29 Oct 2026 09:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291309; cv=none;
        d=google.com; s=arc-20260327;
        b=i/SX2xbJSMdbjM4AkL0SKx1hMqOECPUB323AJ1Z7wuNpAeI0rIijRCYAQJQ3TLy3+/
         xG+O0zf/7SphHMIUZXjd3Pcqdo1KBjQdqaVy1puKQGtvu5xPKuWJE3x4MRd4jPXtDFRk
         aGviL+LPVyWl1cHJCror63jrsamg/PxnIHd6Qnx3yOSU4oKiWRCnrHf/LFPBb6RvFWOL
         //w3Hmw2TdDSaNubg6bHPpqgGGTGqp2tfc6ES3fGZv7es1UmIAZd8DHsvVUFDOnf7A2M
         xmhG5f3Hodn5T9Q6j6+rHnb+H/08tfPL+QcsCKoqe/JqdL8FSitpmvCVIzcBWFJQfUq3
         XWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        fh=O2vbqAchU9YCcBF/Klu4IB/VS3/rC0YMpz5ryRWydv8=;
        b=Bl1AESB9zOF6EHBzKf3Mf6JpDgJ9xqbw2MPn4Rdg277LEdQ/41uE5yIQWO+3BapCrV
         KVE/DP6LLNjV7UHCU1buQWlS7Rf3W0iI2Xf004G4sg2vE0+h/HVZpCYuxL3Apk9ZMdNU
         Ks1eEa6QeXY5tN2SaBOgATnozEfl3v9AKcIfL+Q67MXst9o/Em1CpJ5195Z9//pDRfhA
         BpTfX1mhOZzf5GR3qRSY2ZQYca3bQTwlub+ttWYCN5DO9HCHtpExnjuUL4chsFPxus/g
         q/oOCIAAVC27ZxnFXReGEJU4X03lxyzcBZKhYrDVlzsrDLpRdXAjNz8XTz6icqROhKiN
         uVBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291309; x=1793896109; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        b=QZKtCXnJ7vGnYiFcnvWurP9+Do48f0Nn/hCqYSUfIUIPWfY3Dn+V583MntezMMKM/8
         O2ZxLm0Y4jKQ7NXdBiBOsnr5VTrXFgVlbAyvTTdNiMjKGRIU/EtxamfPTED7wHC+pCpQ
         WNXiJseAjmHWCElb2OWfIsUdBfprksH9QXvrMZuPjn3da8Mh7rpZX5/y6bEa0V+ZN/dW
         f3QeZI5mvOSttAqBvV4V8iNPFX6px0r7uTygJjYoAC8L3eHpY6bgxzZiOyqwsRCKLa5J
         QC/2QMLjR0Q2URNDFFAOUkAoJZDq08w88p+Vaj6Wxewf4o1AkDSBXPWaPuaIGFkEfH2t
         9q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291309; x=1793896109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        b=sBWQnvJm1A68wiVJ5zYMqa1JTbw5ymPNYcx62BYcIkcubioaiPxJvsMMx9sscvQMzE
         TxDhc/em515j3ho54Vn3O4aGii+ZM4RhRA9Y8uvJ9VvumCFnyYmn9WbxJtu59AhIJPgL
         zMsojstPn6vwEygfS5TxX08/PjYXzsTUUu56I8j04xhtY1vpUYicix8d4HhvMbHQL6XD
         47WA5hQR3hEAqVFGYYusuFwh0utFT9jbNO70wOzZ5L7Erezc2FEjsxaVM3VugMBIgqAV
         AG8g7mBeITDwrq0dUlZH4Rjt8Neld3WhTENX4E3yAxq1ZUQ5pNE6OB5VZkdpPrhu/i+u
         epsg==
X-Forwarded-Encrypted: i=1; AKwUvBw4rG6jtXedscbtWep6flrxNKH4n/pMVA9ZbykhADfKj4I4VYP8M+1ChfZc8GSkAelJXv6rW3E=@lists.infradead.org
X-Gm-Message-State: AFq9FYL5K37EzWBur+DUPSWJ+u7GAtdhz13nh5zUkqeA2fILdirvt9M4
	1hvOW5oNzkPRL1evJfjmjkU+48fk9fz3LaS2GZ2R9OW3a3Nc68W+ZIuffzgQOxIcB2ZYsF0XftH
	H5iy0LIjvZsamIHpaphqm31yGG4WRJndzDEbToMC9ghIax3QLzUj03YaTbSBZV2gluAh+22P4gR
	LZxK9fdPdEduJlOem9j/qFQ0CeRToZkrcImONHuPE=
X-Gm-Gg: AYBFou3Naaf2NJ9s56hw2QqxZGNPh9iYhoUwlm0qTsK4sdQbeU/ansKAlhqJv/GxYzf
	NLKC+llvqkYwPWpjreuaQCQE+o07y4R9/z2Rhc9IT0hGivthVWLL2LtyK5pXpC4SvnuH2eBv5FN
	z9K/jkW3VZq5OUN4RQamqOfAICQSxXDr9u1L1lTjHshSzLlXvQ8bf+PoauHOFyvVwFUPa2ENC96
	py3ZGqHR5L+hiRfNZ0cFWB/dlltCZTqZ43JEu/KpH2TRvWrBZUdUfvRPpLU6NdJAbBQ50ccyxDS
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id af79cd13be357-94408d9cd0cmr909714185a.65.1793291308661;
        Thu, 29 Oct 2026 09:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id
 af79cd13be357-94408d9cd0cmr909709685a.65.1793291308187; Thu, 29 Oct 2026
 09:28:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028050337.127464-1-yaojiale02@163.com> <20261028050337.127464-2-yaojiale02@163.com>
In-Reply-To: <20261028050337.127464-2-yaojiale02@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:28:16 +0100
X-Gm-Features: AclHuK9jYoqEMbdFg84LDshS_f4aCDb9uqZSpjUek3Kwn5SwhZg0YWrh26svot4
Message-ID: <CAFEp6-3UCSqHqABuvBwmNf_bAvJCWg+N9rZvLMYRydWQKxMpeA@mail.gmail.com>
Subject: Re: [PATCH 1/4] wifi: ath10k: clear monitor interface after add failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Michal Kazior <michal.kazior@tieto.com>,
        Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXxLSYHYNyBkao
 JBS2yKJAW5rzItB/b4U4Yq4IybH4krBRywh6lGdiUyMpPzpPuoCN6PwWWGXNj2jvr8OJ4JL151u
 9CjPP4AqBOiHjYzpopEgN31NZJ6wfrOZFeWYTHvOPi6G95tUEjEkRnSDngOaxLMT18/0AyQP1+l
 tNvzSzNPUQgx21Ejw+vEImJWI3dU/BRJjPWkCbi6TrzahAgKNbcf13N99z9KouWSPDAyPFeHaUs
 W48FrTQyCfbLL5oLsFcwTkrAabF61MMl8CcbD8BLMP2ZAPcIv8/V8QvLtdjfkvOysqw9jpPpaQH
 Vf6Lr6VLKWevzO3u6fv0eiM1W7v9AF+8UcZx0RnHfrpBo6dp70gBKorAkms/jpLWHPOO5lUlZxJ
 TWjpPBPzYL/Yz5iF8Xye3iPkfaGvC65BQhAId7iyHbitq0m2NFH31fZHhr8u3mzI1YZOQTKqI74
 KNxfCdNZoya3lJepj1w==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae3742d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX2ANkouzVEV5b
 cH3UTIiCp1N46Fqo8ltY2GpXmLiWJT6b8dtyx52nx/Yqvjq6OaCIjLOsCm25yh37UoAdzIlq4qA
 7ueEKvGqFbdK6qbowWEnknglUVDnwCU=
X-Proofpoint-GUID: u6_mAQoGDagDwk-9mfrjL0z57IxA40Rn
X-Proofpoint-ORIG-GUID: u6_mAQoGDagDwk-9mfrjL0z57IxA40Rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_092831_768216_B6D4EEC8 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, Oct 28, 2026 at 6:04=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:
>
> ath10k_add_interface() publishes the monitor vif before recalculating the
> monitor configuration. If that operation fails, the interface addition is
> unwound but monitor_arvif still points at the vif that mac80211 will free=
.
>
> Clear the published pointer before entering the common vdev cleanup path.
>
> Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This looks like a reasonable UAF fix to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..36b694ae6de4 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5875,6 +5875,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>                 ret =3D ath10k_monitor_recalc(ar);
>                 if (ret) {
>                         ath10k_warn(ar, "failed to recalc monitor: %d\n",=
 ret);
> +                       ar->monitor_arvif =3D NULL;
>                         goto err_peer_delete;
>                 }
>         }
> --
> 2.34.1
>
>

