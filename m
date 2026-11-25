Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00956606A323
	for <ath10k@archiver.kernel.org>; Wed, 25 Nov 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vsalPLzp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbzNvsM0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUlHvVAn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=; b=vsalPLzpUQps4j
	7QQmhmytAqWmrcwbKmpZ4iy0ni8EiyGyJ8yL0dJ3YihipKuJKvegb656DqZGDLCod06fO/JUoRTml
	c22adov/txq642tcP/zdXTD6II8FbvwCt90c9j7DJZr0MtWPthMbHsERJagH2xpKI2/991QKVIFme
	YbC5acZ293CNL7FdjN7XgUnv5yTXhYkeTOgxnl0iZTs7XIqYwr8t5Q3taEo6QKfayrpUfcoRBidgb
	yHrpbUQWK3TVzlkemKu10sPmFm1Q1R6IRHYerSVYzBB0lt61tXc9nh+GnPk1gQxyjdLJmWoB1lfGf
	hkSG6pexaX10/owSvOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAYG-00000009VQV-1Yf7;
	Wed, 25 Nov 2026 10:48:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAYE-00000009VPs-0NWN
	for ath10k@lists.infradead.org;
	Wed, 25 Nov 2026 10:48:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mimY3642223
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=; b=DbzNvsM0LvusNF6l
	QvFS1/spLqGnWgnLq4Ss3m2h6+l3s4S94ycHqjJQimdBHfNzvZYOx9P0j7BMuEHZ
	ejzksKnZZa8AypKqOvGHHeg8lcPe+vXZTiEsu/ZLwE1se2JMTr9HzoB6USZqykH2
	CAzWeP2PqjicEDp4J8BHyBbCiGYHdi7JtzC39SmsxaYbvbOFUN+RfV8UW3mm/XF+
	pXXHnAOTA+Y6EPAi0GjrSLf9LLmIiVag3KamNFtZIhdCbRpv3kX3xZkq1YKR3Zdk
	vCQIlG9GUyzRAiAkNiG0aWLk4ibhYz5/wZCa69x3m47k5UHg9H/D4zHIbkniOmAi
	PuKRgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aejy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 10:48:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961511b61so927733285a.3
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 02:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795603712; cv=none;
        d=google.com; s=arc-20260327;
        b=l70PF/utbdQmGXP6FNfo7fQHYmCPhyis/kYbvpuqAeIGia0q2/BqrJ2rCUc8Rq5eR1
         Z65XScuwQdSQct+LALIAJtoC+LuthX1HYI9RsfAIGXprJA3IT9ds4G/8mRhu4ZpgjRtH
         Y7cAM9ZgJQa7fuT4fZ4kC7njOpiYXPajXGofVxKmP18N9kB5GCefrjF7AdciCAb/OBev
         K6jCe5hPWLPfMlcNSpvloRaKS+Hqff/6buJ8Wi+ZET8cE1Gep7HEsOO2/igNW7nZOcd7
         b1a7j5OQXzkj45YKdFFzX9zpb1eZINpXyu3G2UWmLip/n3SP4MFNVUiLjhCVzmlZiUZ6
         uCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        fh=QFa58nR61+tOdj2PGqjZj3QxleAAv80+/ewYd5jyfnM=;
        b=d0INDLF8ucMYLodbdMie/4ZUbpanCYiKbyka8NyEoc8OCOrlQajOxGqknvLw3KqoV1
         RrJLowxyISCPWhhJLT6g8XFsBPHE83/4MJ0IyRJxrNj4nd4LsF2OyKdhwUKeWUHMEgiN
         tW/o6DRc7EfwK0ALk7cGsQNkNvhISQJDStR2Kt11LmBgrQ/AM7gEbWS7+4DeJZUShHCY
         hKdsc4s8PrYm3REQzaJsmmR2+IcrXlSLyD2QScVcbOXGfN8zPogUjbhHg0lAcEHS2K3p
         qP0eXXV81Y7S4IfDvJACWsRfYkdyb6UIq1dC/gesEv4TfPRDWieYdnt+I+SK0HXrHcev
         cQ3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603712; x=1796208512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=WUlHvVAnKyzGwnHmmN6N5oyRRj5luFV6zdj7SWKO0CvMlBbBOy+QfRkyHYzNcjtfnf
         cX3dKENizlmwJdADQs/yEFSeDSVJUMhxlHMEF/i+/Tohjbat4FsA/JHQy+8FK628Sk07
         XaIPYIa71eQ0LQW5Fuhw8MMxl3f+HksiEEXMtTfhkkSnyjgU6UHFVEL/IVYlPC4Ky2mk
         rOiaD6612vl8ATo0U2949Qr0RXRVdbLaiTvf86HN063vaOJVNuNKRPBeO9OU9YmXytne
         rlv7Ok9bZVkxdOTGrL4Ed8bPRPBazOhYQIx9icwud0Aj0ojCSoSbEdqOxAigEYQTuJl+
         uFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603712; x=1796208512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=r2P9QSijPQNf2RUOp7GwNoLMguLBcm/Qn3RawEo+yzOquwdZrvXgh1H+sfZalDmfom
         k8uB6s4kVfNyGHYePRUTb7TNPMoDqriTPbVlxsGGY//mf8kDXauyLmkOQvByFhQK90QT
         R4ZlWIvKSWuHfUbILgYGb28KoTXE9t9Kq62DUFW0fSmzO63PUugWC5/j7TMVrA5X9Tlp
         0O4L/EJuvV5TDLYeanWiGpI3YydRx4cJ3ouA/goymQlGMSqYYc8UVThBwrcVEwe4RDda
         CsgI7eJPNb04CN46fCKQMq3fA+egVSVODiHGzJEkbzb4sfM1MRGoMl1APcuHFwcx0o/e
         rJlQ==
X-Forwarded-Encrypted: i=1; AL+hErHdpUqhk1qhiaKLeZofXX3OYjAAHWhiQqbIy0D142QIhtwes7VlUGVCtlKKuSTZK4wHSw3jNik=@lists.infradead.org
X-Gm-Message-State: APuU4Z9dv5XkZP5DZvOlnGx0Ysw5oAhBkcB5xcRK9f/JXbKsIclu9U/I
	oQ6J3rAMkT8QYhIhNML0sqJU7NY3fr6+8Mgux0CHnDIxHjI3TB3IlfCt2+MCGCG3i/LuhnkEx+u
	alYget4uQS7QDi4nJq6wFSbXM1z2aVDEaK0T4zbFVbZnmr1meWk1MQQn9N2vz9pNNYhH8zITEOZ
	/OpsiVnmfpXxrUpa/9XCl6eaZvesxB2ur+deZD5CQ=
X-Gm-Gg: AZFdTZe/dw0QHg8KTQPsWFimW1dww9VdGBCbUPmlgiLtpBn5lsYOTi0Xc3WyPh1y3Uh
	P0KeN9ew5swaMIZu345emoxnWQybN7//nUyMfppq8gIiWVDGddXBPubc3ONqCjlSLOEj29oMFXz
	qQgKWP8KpeSR3GkaALvUL4SrYtaF8xqj0x+A9kVFzQ3MOoqWDLYfBdP3sPAfP7r8yCIM2+GG7uD
	HU/jU5koXrb0lGAbifSky1TItFek88q1zKzSgoIYNe4XJA4ZcHf1HN3ug4SuZUc0rR0xFOJD3U=
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-949ba9555b7mr2616940685a.18.1795603712175;
        Wed, 25 Nov 2026 02:48:32 -0800 (PST)
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id
 af79cd13be357-949ba9555b7mr2616938185a.18.1795603711712; Wed, 25 Nov 2026
 02:48:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:48:20 +0100
X-Gm-Features: Aa3M54odefbRxi0PaiCQAzNWQ-0JR92gAABK5WdL3_Jpsmn2PFUYlb6w5-3lwyY
Message-ID: <CAFEp6-0ONdrwu4ofxz40AHJ=GRhFRedT3AbZvaum2M8FUi1cPQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=8v4nwiihW6ynDyRW_tkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SYWY2GRL7llh2r6X2v5QaJFZBq6ED70E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXzXjVf1QAjuL4
 gQvvfXz/5H5fE8uX7+83XDRWZUzl/Vx2zgYPmJrz3OKJYg9nZKvxEYvbU2wU7mXznn7JVPe5tGS
 i1LGqJnLDRsRXAqPm2tseyYScbMhI0lHsSamjefnlXWEhSm1q17m/xfbHw+rQ4ETLc38eKExZlj
 1SJZBV5FwFUxEyAG6KxLiouvThg+kGhtd9ADwGeb7jfRnNIhN9F9/4QjsJtvkkrGc3yOsM8pKYj
 TCgt6LRktQf/9fGZ0Z4lrQZq7TqAQGppO0V7U2S/WfZ5tC/0ruDxJN7PWaGIGSqtUhFDSsGlK+9
 Of4IqW9ITuCbb00rp18XkI7YNP+uNZEA4GOIpCrORX0cbyKYO9Y2ZG8EqL+Z+oEh7CkSdW8hzcs
 NsHiNISMoUEfjwLlNtN9MlfYKhUOns1tbfPWmSlA7ARok1idKf7Dxthf3jUQA4doWxy2f51Ml0g
 FKwXJXKX9/NCQf4QWNw==
X-Proofpoint-ORIG-GUID: SYWY2GRL7llh2r6X2v5QaJFZBq6ED70E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX6qEfOeBBiNh8
 fCTnO0cBKwqtH8remf/VG4+0KOqwljtflCyh8ijgH+GOrjzkIEd3OgVlzpewI6fgDrEy/Auimfv
 efJWBhJEJ+R0ZvLrqFIjinb9XIhAfUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_024834_254386_12B5E8A3 
X-CRM114-Status: GOOD (  24.13  )
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

On Fri, Nov 20, 2026 at 9:43=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
>
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
>
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
>
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
>
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
>
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireles=
s/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct=
 ath10k *ar,
>         return ret;
>  }
>
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>                                          struct ath10k_sdio_rx_data *rx_p=
kts,
>                                          struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath1=
0k *ar,
>                             "HTC bundle length %u exceeds maximum %u\n",
>                             le16_to_cpu(htc_hdr->len),
>                             max_msgs);
> +               ath10k_core_start_recovery(ar);
> +               /* Recovery is a no-op if already pending, so also mask t=
he
> +                * target interrupts to stop the IRQ storm.
> +                */

Drop the generated/verbose comment above or simply say: "Prevent IRQ storm.=
"

> +               ath10k_sdio_disable_intrs(ar);
>                 return -ENOMEM;
>         }
>
>
> --
> 2.34.1
>

