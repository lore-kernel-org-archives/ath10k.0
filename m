Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F6606A326
	for <ath10k@archiver.kernel.org>; Tue, 27 Oct 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fw37/EFk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyfYhr3s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hgGcIUVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=; b=Fw37/EFk2MuLJV
	vkwfl3TjdGNRo4x4k2IhwFWpmskcGU4YfYQ5VMMUvIFkTa+8NSkM3HsEby2ffo4h6VIz0dYL0fTSc
	2KEpffBeJqAJottIvqzvmzcRLZ+AJT2cVnKVtSBOCyJXwOV3O2PHLX2jVwOUpzXwqoNus+nJpi/+I
	LIC9HHctao2ON365Hk0eIhtnY0No2czrbKcCvaRzOuLiKs1hBoPS41A3nkeDtjUp6RvxOhFgVnI68
	QoOKGB8UPQwvM1VZXk6oJmPQHqRvImo5qmtpgPhS8wAIhzPztaFR9HtbqEOcYaoNFDF/lV87aAiDZ
	bB7S+JZgZGq6vdSGerZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm6-000000044CC-2t3b;
	Tue, 27 Oct 2026 08:43:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm3-000000044BO-3MGK
	for ath10k@lists.infradead.org;
	Tue, 27 Oct 2026 08:43:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8foFu2258988
	for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 08:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=; b=hyfYhr3sB5rRyhN+
	23nEsrpt8HS0WRGRdV7i0iqxj0rBxhoY3LIJLxjzwhs5+gJUbN8YXXMLXHHYbkOo
	ouOYOL/iY8yGW9plgrCovP4NistIzyu4JJj91NxJ1W/EjLmnjAGtpA5pHYZr8+91
	W2mW0wj+DMTgPcM0go70BtRp5v4vR1J81RWtwaHADYRSfeXLjwJ91FZRGKZuhJCZ
	uffr8h5MpH9E6mCjTu/OUjd0DDKDQWradsRhEHy63q3LGMhrSHVxZa/f3dhcdLP5
	ps3RCMQJtzwX5rZNbrGBqaMAkviEzO0RVFoJH7LbKmFh1NvkOdT0vNqk2l0oBbyE
	nZ0CDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw206sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 08:43:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so765431285a.1
        for <ath10k@lists.infradead.org>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793090594; cv=none;
        d=google.com; s=arc-20260327;
        b=d67P+EiRhaB/++q19gXWLfnmx6VU/cqGYalfdsjakWDH6vKV18tgaOtbfIJNYtZELf
         DSHSNmVxLnmdNK+R4C05SiO94GcVnQ3vkXbjxZF2IfPz/g3nXBK47DeVOmmFknljtlMb
         BScMHeH7cp4D7ZSXKL8z+78HLXw6yx+K1yOIcmLB9YbM2GofPTZtkMW24iQkzX3X8qbG
         oihC+n4BY6mfcIHzv4C/NUfkhmFseR2HYj90OHbMPICShDgkLIxvmYOwbJ6rG+uELa+e
         4PzMDyEH0c7WkEx0KpIqp38nkOqMoLdk4P//ALaItM5S7iGZI/MXHgg9JiI69rdv31pN
         KFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        fh=8zgKahrIQ7mTLdh8g/97NtndlLxGkMN5jlo/AoI8H30=;
        b=lNFvGl+yW4dZU3Pgk8YQXrvk3vJul8Us+jHSxNPKqwxfGWsMDngiICJSUOeoM4A8Gm
         iID0RPn3iJDaNisoGook5cjce0xOoPqyV+xG3SRWBUgHXVNyC6cC00GD2IjfCvpjiggq
         TKAds4/rEzvk3rF0IwtlOGYn8UDnj+ovgAK80e/O7ruxPruqJmdVdU39hxkAJhqmfMGS
         VSd8pyRHq3tde6l6qT3wTbPfKG6FSTHxkb9Frmd2yqRi+9pn6cAdwe/Sms/aVow+u1nq
         ZFeDuQA5aoZa1/FYpzsx3IBdCrErWWqpRL+t+ZifKUd30gBtj0Ja1dqPdLoViSM4PzXP
         EUtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090594; x=1793695394; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        b=hgGcIUVw9VBaprTfhg8OZXRMc74H6dpgJ3OuV0z6XQU4NWo4v47KDHv9qTMQIoGipG
         XqHQZ92UfoGf7Vksa2q44Nh5WdHsbZ8nYYZ4ZH+EeOC9tLSto443ZRhBqJxq+oXInlSv
         YV5Ug2LYQ20lVc6+CyqkKDA+YXXHR+N9H96WZ7zFy4gK7ISMKDHdoAj7WcMVGNXJ5hd5
         cdvS9V7SjLII5QPDdKY+kvqHQLOw4ovcJ/y8PO3RcuXzzZEDxzDzdRqIFAGIyMxKxAuG
         7xu7TOambB7AfBO1r3iXc+oA6BFbPQ8oEGQxsMYsG7PYLUyJ/lssCVonTtpp7pM1OeX9
         3jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        b=DnvvAg4JwMXR/WrvurXbuq9oLOZBdbHKwxc8j2fa01XIsnuqGm1egHEi+LISDk6qEc
         SCH2R1BKl+LEEleuOuGr9C78y1CJ6LtXMsRCrIA8eWWS3kqCdl9c6YCTvOw0OqCY5jbI
         41Y/Jw14ayGQE64rZdMcQvNKFjrAsToxZDFZNHYbu+0OPL3Yu7dEP61PqGYQtVNQXNA1
         CM1wNOYhisnxmmxe8q39oFgTrwfuhX/JCU4z8eOJC/u+qsrqR4T9lH+xAbxgqwrwlZjC
         HuztrFtIXhc5fP5jW5li10JhHju/LKCOxjqwjq/G1wWcIJlRWqEb83uQhJMg72ptbRya
         rFcg==
X-Forwarded-Encrypted: i=1; AKwUvBy7j2VK6eNF+sF7V8tov1aQzpLNv/RjbfE9UvJ3wOjEilfdMYHwj0Pc5lqyFvunCXyFN7o8h74=@lists.infradead.org
X-Gm-Message-State: AFq9FYLbC5gXcfK9NF7B+A5vG8yMkdVfM4c4kS3rC9BmWhNP2bQ1GIYi
	JTYGg7H0Yd/lEhXAMBfaaO6Ckv79N7JwWxlEKEZIsaCYJiibxKramR5i9dUYM6Rf22mmeYPiWqJ
	FHjraOTT22W52YUHa9c2vGsenF4t8V7LMI3CiI/pUw5DjtOXXiKjzR2v+xzlrMRDyn/secqoJat
	RCwkbaqS/TxxmvnmLOuZveopdWNs1JKBVTf7aXyQg=
X-Gm-Gg: AYBFou3Ywklq1hypsi+tk0w/nLMKmafH3inr1+Ru469Su7MyEhog/Pq6d/hB34fxpWz
	SWYkHKdnqB8TWBmnJTxIoab7vNwTLVEOFX2qCtE3/XlmNSdckWKgzud7n+yXlpqQGfz1ycIX4jp
	YibdZBwK8I5RKNzE185eOm9L6sUHfInxdeDFLnWoysQXSqDOWyWpIsVZz0wSHo8I1i2LwrXw/T5
	cNwc1qrYIhtMfutXnfxVTK7wnsZlIyQJrnJuA32sNE8r11wyWPMKTecbFoWvt9lSZZ4PkhOYx2m
X-Received: by 2002:a05:620a:6605:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-940ef98797amr1274815985a.63.1793090593916;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6605:b0:93b:d7ed:ff3d with SMTP id
 af79cd13be357-940ef98797amr1274814285a.63.1793090593496; Tue, 27 Oct 2026
 01:43:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:43:02 +0100
X-Gm-Features: AclHuK_5pFygU_jzn-hqcPuz9wQNMws9wc2uom00ym03C3O7qRCxHLEYDup8Xvk
Message-ID: <CAFEp6-0UXd_YLG77tM9k=wtZ6Q5f0Q0wOr5jrkMM3nPe=Ky7-g@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Filippo Falezza <effeffe99@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX4/rywuyCHr9Q
 n3ikKAznwbcIhnTKAW44Oglv8FVn6N6kG41jMReoNa6VqH1ot2oxiBZW9EI5krqf5SceS9vz0yc
 9Bl4D7SJA/oWqsDUs9u7Bms422BF9iV2rT1j3NOZwvzDYQtADvrgGmuD/D8DFdOSsa3cnYxvBzU
 UdXQnOAGBWlfGU/35TDK28dX0q2BrXDAKhnLUq6XS6dlUYChPiusoq5glf9jcFmqbjOx3JSKRGz
 7v0uVEUwvrrXAp7Xg4VLMppvQohhHuvK/FGrOsJBZKQ6jnCbseB8d0JkT6shbdMcDWWvHsONKZX
 zPx0+D8USfzWxP4/fRcU2h2+rRAsuKx0HQ3uVIMJ0xrOvKV3CtUrwlCbYv8HG3dB3HbROuIHGBi
 wH6qzk1gaG7F+Vhfp8bijBEKuZjE0FS3PBO5of6pmtWYqKwzAvFhXhFR9kkCHy54BuzG7zFwu2P
 SnZq/l/eRIcGJjtw/oA==
X-Proofpoint-GUID: xzDKc1M3pPkcO6ZOgJX3mttF1FPQfYg-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX295wAXisbtDP
 1Toe0K3C37dZWuDN7cBZSekWf4BE79AvwOrakr0huuJcrQyKt0igoeJ2rW3AOFr2zP55f/qYnsD
 JvUC+ZJ1IIkvYdHowAIQLhMyLrT4j2g=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae06422 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=pn2aKBgt1YT2jw1FRdIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: xzDKc1M3pPkcO6ZOgJX3mttF1FPQfYg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014315_957782_61DD6425 
X-CRM114-Status: GOOD (  39.74  )
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

On Tue, Oct 27, 2026 at 2:56=E2=80=AFAM Filippo Falezza <effeffe99@gmail.co=
m> wrote:
>
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
>
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
>
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
>
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
>
> This change was written with the help of an AI coding assistant; see
> the notes below.
>
> Fixes: e98199a8c27f ("ath10k: enable QCA6174/QCA9377 to read the chip tem=
perature")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Hello there,
>
> this is v2 of the fix for ath10k temperature reads that stall for 5 s
> on firmware that never answers the request, as on the WCN3990 firmware
> of a Motorola Moto G 5G Plus (SM7250).
>
> The only change from v1 is the name of the flag: it is now
> ath10k_thermal.broken, as Loic suggested, instead of
> temperature_unanswered. The behaviour is the same, so the testing from
> v1 still applies: on the phone, the first read after the firmware
> starts times out once after 5 s, every later read returns -EOPNOTSUPP
> within milliseconds, and a full `sensors` run takes 25 ms instead of
> 5 s or more. Restarting Wi-Fi makes the driver ask the firmware again.
> I have not tested firmware that answers the request.
>
> v2 builds with W=3D1 for arm64 and is checkpatch --strict clean, on top
> of ath-next (cd026e68fdbf).
>
> As with v1, I wrote this with the help of an AI coding assistant
> (Claude Code); the testing is on the phone.
>
> Thanks,
> Filippo
> ---
> Changes in v2:
> - Rename temperature_unanswered to broken, as suggested by Loic Poulain.
> - Link to v1: https://patch.msgid.link/20261026-ath10k-temperature-v1-1-e=
5cd6fde7f1e@gmail.com
> ---
>  drivers/net/wireless/ath/ath10k/core.c    | 1 +
>  drivers/net/wireless/ath/ath10k/thermal.c | 9 ++++++++-
>  drivers/net/wireless/ath/ath10k/thermal.h | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..a749ae582b0a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2985,6 +2985,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10=
k_firmware_mode mode,
>         clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
>         ar->running_fw =3D fw;
> +       ar->thermal.broken =3D false;
>
>         if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
>                       ar->running_fw->fw_file.fw_features)) {
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wire=
less/ath/ath10k/thermal.c
> index 9bb486f8e920..9ff7de0abd12 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.c
> +++ b/drivers/net/wireless/ath/ath10k/thermal.c
> @@ -75,6 +75,12 @@ static ssize_t ath10k_thermal_show_temp(struct device =
*dev,
>                 goto out;
>         }
>
> +       /* Don't stall every read on firmware that never answers */
> +       if (ar->thermal.broken) {
> +               ret =3D -EOPNOTSUPP;
> +               goto out;
> +       }
> +
>         reinit_completion(&ar->thermal.wmi_sync);
>         ret =3D ath10k_wmi_pdev_get_temperature(ar);
>         if (ret) {
> @@ -90,7 +96,8 @@ static ssize_t ath10k_thermal_show_temp(struct device *=
dev,
>         time_left =3D wait_for_completion_timeout(&ar->thermal.wmi_sync,
>                                                 ATH10K_THERMAL_SYNC_TIMEO=
UT_HZ);
>         if (!time_left) {
> -               ath10k_warn(ar, "failed to synchronize thermal read\n");
> +               ath10k_warn(ar, "failed to synchronize thermal read, not =
asking again until the firmware restarts\n");
> +               ar->thermal.broken =3D true;
>                 ret =3D -ETIMEDOUT;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wire=
less/ath/ath10k/thermal.h
> index 1f4de9fbf2b3..d1fb5b958c37 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.h
> +++ b/drivers/net/wireless/ath/ath10k/thermal.h
> @@ -19,6 +19,8 @@ struct ath10k_thermal {
>         /* protected by conf_mutex */
>         u32 throttle_state;
>         u32 quiet_period;
> +       /* the running firmware did not answer a temperature request */
> +       bool broken;
>         /* temperature value in Celsius degree
>          * protected by data_lock
>          */
>
> ---
> base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> change-id: 20261022-ath10k-temperature-22b119fd615c
>
> Best regards,
> --
> Filippo Falezza <effeffe99@gmail.com>
>

