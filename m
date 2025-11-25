Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496F3CFD37F
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amvjrNRrfVqIzHSIYmyRllhFvfWonHWIq2wkK0wmVak=; b=vvVG6qSJ0eT9JGT4Bho+OnXgLC
	MIgGrUNueSJTfsIP84YptBioY4PXRYnmQbvLdjwaq06LdBtMfXMGCcboZ8XbODNxLbmHFB8V+I04X
	tZI8r3iLc7xnwyC/i0KYIO7AzXb0m4jN++ahXQG6O/Z1/4ZnO7dfet3wJxedtmeQYCfdjF2svWx7g
	G53lBuzZ+gaugHHOArf8m/Ehm2+D1EZ6HJU+IevLKaPASzjqrfBAzzhcK9ZbCWHItwdHuckUk1PbA
	OYxGxJv2zsJGb3vcpZ+7tREa2RRrIiYLw/yTtyVc34OUKIgiCCBba1I+D9pVTy6EAYzo0wfCn4pbS
	w0VDF4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqYV-0000000D9IM-3sNG;
	Tue, 25 Nov 2025 10:45:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqYT-0000000D9Ho-3sbo
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 10:45:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4wEso1672198
	for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 10:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=amvjrNRrfVqIzHSIYmyRllhF
	vfWonHWIq2wkK0wmVak=; b=S4hGKNN+rgJ9w+E1ZyX58lTr8nh1yVANR9SVTBWu
	qdcBSHUJ3c+/A3wC6kFS85lUF9891omS0tXHdHUM17y6PeZwBTY0zEqU2ARw1JIr
	exLuvQtmiRoiXc5Y+M5SXS9z6ro1PWuAl27pDM1IJlp+Pz7WhrwdvgNf7tcNwaLp
	8f1LB7LR7RYPCm+RdL8g+ddSAd/79567b4hEmDYx0Y+w5SBHzB1xQRFUuv+w/T/0
	yg8P4Hrf6tDHTXS2zNMgl4gLORcRwlSzd5hzQTlFWzYXR2hqSTpa2aTtj2kTcMeT
	pMp+uPLH6YLySVnYqTifVSAeGf3jGJmVbE7mGRaoPemslw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w811yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 10:45:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso12210615a91.1
        for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764067550; x=1764672350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amvjrNRrfVqIzHSIYmyRllhFvfWonHWIq2wkK0wmVak=;
        b=bbMG3QQK/Z35F739VsMHs73RXKtsBv0Rsfw861wRMHb7wK8O6C2rMtnIpyx/6oGhq+
         h5QxCziXDqbh4F58IYAZuvh+0asOalWRZgHsye7bImCW0fHIwcuihFoLhPOx9QUmWkYI
         Mj/qLw8zyYao5SGwAQM4LPnBENpWa6VcAtA74/uXYXFMetq3vr41KMYTHDSy6G6URIGB
         GAa/E4cAaPK8/vC8fDHY9N7yrj7z7q1uIVdtf8/Uhid5E9bDWI6HbWjRiv60BOclthWT
         TP8tveV0uMaZwRN3c3ept20ijLmt6m7gkErlJ1rxSToxCwl3Ylc1S3i5zTK4JoXzKJwE
         Fnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067550; x=1764672350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amvjrNRrfVqIzHSIYmyRllhFvfWonHWIq2wkK0wmVak=;
        b=JlFQAR7ehvQA3sw0Lk9Xt8n4E+L1lFEkkNTZ7SXJ1YpCJx1YvmEE3NOb5f83cFaNBV
         1jYaldzjFGGudSwgygoKigh+xM70N+JKpKdoA3A7wsLSfSK/quBPyakrt5G6LsTkiPjf
         dyFc1svJwYjiABKSjwgK/yuYC0FhlzohiXqsm1rd1wfN/wSCGJjutsjd5GFy1vyNdUPk
         2nSYvZ74cJqmlByjP6F8B8OH3uc6yJ4kmcobB/22nQJmbPRc+MHqzXHW4+oPlg6EodkX
         +l+lAYhr+pGBN92FmdR3mdZSRZKHJ2qwXKbIoQxNfkAifdP9ySI6DOc4WdPJ/F/2uma+
         V/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXCmEWEa/qNigfCZVNUbISxfIFPh/I1dJ9go825EyA+70k7tdjQS5OW8Lj/kHVIb3LALrMIk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYveuITs5642NzSkEBAK5JQ7GkEldVpfh9Xp6aS1clrTFchrJU
	T8xwSLmNCGfadjNoDHdyLDYtQA/rJn1OCGbsbMryc9KeQhV6q/Jh8s10fbfJYezE6hU9vVAVhmZ
	uQpLyXtEQgykNTtv11zfv3tjhreiuz6BiDMOVofXfZkZz+c+9NYzRJoUgFE/mWVhb+/aiQy9OAt
	r0MhNRVEmdcr2vi0k/nL5DIbLVebVvjamG08tzsd0=
X-Gm-Gg: ASbGncujbmuFrSZ04B45C4itbL/x+5TtTBD3OX+HoPnDkJSgJ1eIU4IeKes71p9mEeM
	FDHFQZxC7l4YvEKz/+LIYGtEiyUQTJ1j6GiTU1WHZkAaWnv9qMdN0z9CouQIO17bMiwvz/UC+E2
	Yt6rgYM2Sl60/FAPRTnRbSXgiPKxv7chSmDX2Mh38qg9SPEfP5fb+aNbO3gMm9OVtgsoFs45ZLy
	qOyKH3r
X-Received: by 2002:a17:90b:270d:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34733e5524amr14722199a91.4.1764067549921;
        Tue, 25 Nov 2025 02:45:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI094azFzHmR9Mpqh2BRxwu+hIt81IHtiK5UwJ5+gq9ntEsPJXOl2awVYN9lA7/mn4pi8WZXMDuGhgAdl8pSM=
X-Received: by 2002:a17:90b:270d:b0:340:2a16:94be with SMTP id
 98e67ed59e1d1-34733e5524amr14722162a91.4.1764067549382; Tue, 25 Nov 2025
 02:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-1-836b9c51ad86@ixit.cz> <313b36d3-e1b4-4e80-8d5d-d65981abb34b@ixit.cz>
In-Reply-To: <313b36d3-e1b4-4e80-8d5d-d65981abb34b@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:45:38 +0200
X-Gm-Features: AWmQ_bnWmBdFq8y-6AhUdu26riDbJhJiOAevtOgo1n9d3y03_XHjZCEBqAIS92o
Message-ID: <CAO9ioeX8hCn3-SQ3etvCT5OfNLRmbqZ6DQg_smQO6PugEg_5Yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: Introduce a firmware quirk to skip host cap
 QMI requests
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OCBTYWx0ZWRfX7g7oyfjxX5ze
 Hrrw7BMBlpoUb/XT4eciC0bMTC5tx1iFXxfVC9gUMlDmGiWr1Hygznk/fSIgztyn75dghknzEsM
 GFN3UKx1sLTOxmCCwjoPu972TehiT8Ufd37BoKqxaUoZikUeXPnTrRYCRNaEVM22kUHpdn2QXmq
 MLOEUuOgmKkRbwyP1GEu91sSSMdqLqwFqaidfTiiGUyUbzCAkded1Bx/dIQYeJR6rUm1YO0QHFF
 6w9xRh9tR8udlmq88pKX2M8spw4u95Dja0HeyMD1HVEZJkbyMtrmXnxxNyWpX3oWD5Y/tI5N9Ka
 s1Jdvla3T8KqyqPSSqH9usx8tx9Q/qCEiS3REL8emACtuY4zmPBM6hrxbHtkqeJYPeQvjS2FTWA
 alIh5CdfS8LHTQcGyUBqwh5fUeFdNg==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=692588de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1U8LozzuH-I-QAyVdeQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WDMVusHktZhMic1geTI1A5_yptQs1E8S
X-Proofpoint-GUID: WDMVusHktZhMic1geTI1A5_yptQs1E8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_024554_008450_2AEA5976 
X-CRM114-Status: GOOD (  34.65  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, 25 Nov 2025 at 11:27, David Heidelberg <david@ixit.cz> wrote:
>
> Sadly, this is too early in the initialization process and we get NULL
> deref, similar to [1].
>

[dropped splat]

>
> If no objection raised, I would go back to the original device-tree
> property way then (as also another device in need of this quirk showed up).

Please fix the NULL deref instead. This is a property of the firmware
rather than a device.

>
> David
>
> [1]
> https://lore.kernel.org/ath10k/54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr/
>
> On 11/11/2025 13:34, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> >
> > There are firmware versions which do not support host capability
> > QMI request. We suspect either the host cap is not implemented or
> > there may be firmware specific issues, but apparently there seem
> > to be a generation of firmware that has this particular behavior.
> >
> > For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> > "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> >
> > If we do not skip the host cap QMI request on Xiaomi Poco F1,
> > then we get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> > ath10k_qmi_host_cap_send_sync(). But this error message is not
> > fatal to the firmware nor to the ath10k driver and we can still
> > bring up the WiFi services successfully if we just ignore it.
> >
> > Hence introducing this firmware quirk to skip host capability
> > QMI request for the firmware versions which do not support this
> > feature.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >   drivers/net/wireless/ath/ath10k/core.c |  1 +
> >   drivers/net/wireless/ath/ath10k/core.h |  3 +++
> >   drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
> >   3 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 7c2939cbde5f0..7602631696798 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -773,6 +773,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
> >       [ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
> >       [ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
> >       [ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
> > +     [ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ] = "no-host-cap-qmi-req",
> >   };
> >
> >   static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> > diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> > index 73a9db302245d..b20541e4046f8 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.h
> > +++ b/drivers/net/wireless/ath/ath10k/core.h
> > @@ -838,6 +838,9 @@ enum ath10k_fw_features {
> >       /* Firmware support IRAM recovery */
> >       ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
> >
> > +     /* Firmware does not support host capability QMI request */
> > +     ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ = 23,
> > +
> >       /* keep last */
> >       ATH10K_FW_FEATURE_COUNT,
> >   };
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > index 8275345631a0b..5dc8ea39372c1 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -819,9 +819,16 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
> >               return;
> >       }
> >
> > -     ret = ath10k_qmi_host_cap_send_sync(qmi);
> > -     if (ret)
> > -             return;
> > +     /*
> > +      * Skip the host capability request for the firmware versions which
> > +      * do not support this feature.
> > +      */
> > +     if (!test_bit(ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ,
> > +                   ar->running_fw->fw_file.fw_features)) {
> > +             ret = ath10k_qmi_host_cap_send_sync(qmi);
> > +             if (ret)
> > +                     return;
> > +     }
> >
> >       ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
> >       if (ret)
> >
>
> --
> David Heidelberg
>


-- 
With best wishes
Dmitry

