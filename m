Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21839FA3751
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 23:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1GYY8vrtnmd/Fz+orMbcn6ybyOpEE1SHFFFCXiCQQs=; b=LZ/JAvNsNDWGq7cUGsunOVx7pr
	6zvxO/XrOfoSiTiUoJNzMrB/5LuN5cdpoOsecnR7DIFkp/T0QJwL2MtPm8Oah50DLW6cQczJv6At2
	WhrjmiKnOFRMLEEpfcJxM5114mZUqM/bO93rmjchm9mRQEzJq3Loz6KR1ySUnL/K/8gUlCqOIh9Nt
	n3RTvrzGaS1Z8YTSsp/fVjewIUwwQBPU3jzTpDWx0XFj6fN/xTl+tHvFl5HRDPkS2eT9gOjv4YVgd
	sGdE5AFsjG0SnJNJdNdQjM8wtZdDxTM87+t4WP5BcTwC5UJA8oOVYHTLrKj4M5lrnkKRH8tBlxB8T
	7OGrwmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vboVf-00000008mXl-2Cah;
	Fri, 02 Jan 2026 23:24:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vboVQ-00000008mXN-0hGq
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 23:24:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602EN69V802619
	for <ath10k@lists.infradead.org>; Fri, 2 Jan 2026 23:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T1GYY8vrtnmd/Fz+orMbcn6ybyOpEE1SHFFFCXiCQQs=; b=pA+VyAurGpIRBT0T
	9ZvKhauE2ySokqZuRMqwYad7L7h/R0YE3D8Yd/5R2+JB4ovWl1gxeHSJiorTO3/7
	wkAMF25Tp8eyo6lCOTqs31CAJ6cwDRhiNbstVHvLNzIPv7+N4It/dVLht02cXh6d
	bIKoSMHZ2M656N03wNiawMths25ASABLwexazKVSh9h+BZ/MJiFpSaDsITDcwWiJ
	dBUIbxF8wi7rUDo1vk8SIR36lUY5qTpMZ1ybCTAoR2pnKbXbY2ADM0LWPUNzzgIn
	kQ93SuYdJlP1GxuSmcgcp3ncvWnqYqVsYkkMGgciBQct3VY5dKnEnv1Q60vwKo9e
	h3dxpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4befr08wbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 23:24:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888397482so378698356d6.1
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 15:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767396265; x=1768001065; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1GYY8vrtnmd/Fz+orMbcn6ybyOpEE1SHFFFCXiCQQs=;
        b=aLR/UkS5VvLIgkjjRc+4qO5Aq4EmdDPN7S9CypEPkViK4IqaoB9MwLMBr0NOve9SGs
         +PXguWQQlTQwWW5c80ultY5CzkycuXDYtzxFqJ2rx1VJzhnDHuZYdFmUhy59W156AqIP
         fVu35Vl5QY1cx/7W/MSgptKz75HPAE5xEppFZL2ZCwHd6rZfzFBupgzU5hytG64Mcge4
         +oWOt3iZukvTdypXAxqfXDCWZhvLAGUg2trtSxE8iPIRn+eg/ffT4R4ZPUYnztavy3O1
         wOnrv7OO9t7wicEZoFcyJO7dnxMO27RcgOMqlaZ01FhXipVgFP1mtyPTg+POBYyl6jUy
         fIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767396265; x=1768001065;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1GYY8vrtnmd/Fz+orMbcn6ybyOpEE1SHFFFCXiCQQs=;
        b=IrILxeN0D3U9V6fEIboEE6GT08t1GqNGa1TadkfSd+rezNTnYjQNudMQ753CE1pTeO
         VBLgzLrz3sIDZAfkk+FjgZ8tEymG3USIE4zQ/irEwdNtRIiw5h5BAUH7i5f47hHw5XH7
         0IknZzNsfg/oSZuoxO8ss/tv72q2U8n+hvVEaVWe6WXV+q7E3ELqvXjiWle7tNpZs8ic
         PLhY6O1IgkMS6vv1QooduJlav135WNT4cCmgNYxPOr8xdzx0lnaGpiE4XJlxZYpw99hN
         afzB2phzFhfw6P+CjZED4r1yR3wCIkX1a5p2A3itqxZ/HgiLOUHS7dYVone3rITw79xE
         Y6xA==
X-Forwarded-Encrypted: i=1; AJvYcCXxIW6Ar6ZmuijAazeU8HPo1C2FtZAQWzuZq1fkZG27xeqmdfS1fOwFc6Oz7CLuTCFOcwolVI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBvKlz6CjoYeCuOMdjbGX8C8vK/b3qmYKmvaehZM/34okDKB2D
	HXYnoqK5yk6i9AFN8a2Egv4C+/M1OX9MYbSx13xzEHtKP4IXxBiTV8RRoz6VaH2EbF9X1/8YW++
	kjkOFejgOqyQzD2EWiyOGh0x+sutqav1s17t4ZzBXEOdW5WespwCC31CslFW+vVN2
X-Gm-Gg: AY/fxX7gddUQ7FbVSPkY8q4XgXYHD+pZRO/Uqzr9N84D2NqtwMHsj4p+9glWO/89Zr7
	DD9kAU8qXDTpOX52MChcKEKtt2/E7GDoYRECfA3cgdQvKyJe0U1rntWC21m0QQVIhgHEo+kzA7q
	cFaAP8W+22Gbq0iSI1uX0ZiTkmeAcltfeowNyQBEN4A2kcnEvo3AsD0Hrsv48ccYFZuJyxgP7G+
	rbK4qhybSIeoJS8uiFKkXSjVI9L5pmz3THCD+xHa8++oiB47Q6v2Tv0bRbj9QygiiLhv1OeH8dx
	6jVIlYa4c9d0TFy7YRv6YVDbp0uOnkPaJlLVK/Tg884u8hPv4XXmtZdxUQFT52bUTbbmiCLguMs
	9doDd9vKFD830n4GSd4ygSbP7uGEU6qJqvn4srNehaXWNcTxbAESyCZOyzyRVLY2Cfef6a2Y+Wd
	cFBsVeO/WwnaPh2KccNlTGexM=
X-Received: by 2002:a05:6214:1ccf:b0:786:8f81:42f with SMTP id 6a1803df08f44-88d8369eac6mr675360166d6.39.1767396265432;
        Fri, 02 Jan 2026 15:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVK/WKrTkslH7Y0vfCHTFCAvovEzvlC0OyEeJ2yOG+2XWavrDxprlpJsUYJLZtTg1a4LzJzg==
X-Received: by 2002:a05:6214:1ccf:b0:786:8f81:42f with SMTP id 6a1803df08f44-88d8369eac6mr675359666d6.39.1767396264962;
        Fri, 02 Jan 2026 15:24:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186287e3sm12691524e87.97.2026.01.02.15.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 15:24:22 -0800 (PST)
Date: Sat, 3 Jan 2026 01:24:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
Message-ID: <trdxottcptxd5uvgn63oaphemnsk6s2ujc3533abh6pm65iqpi@5ahtn56pff67>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
 <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
 <CAO9ioeU2JjzDwkGQzxc963kakNyZCtaSRAmLu=1kOAMGQeuZRQ@mail.gmail.com>
 <CAMRc=MdCxXg6Hbn_qPVsux2aAfN8cqpG946rS2Sb9J_Cjy0ZQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdCxXg6Hbn_qPVsux2aAfN8cqpG946rS2Sb9J_Cjy0ZQg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=XsL3+FF9 c=1 sm=1 tr=0 ts=695853aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=S1boB9Fu75youA7A4nsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: I0SYA4VIDlU7Le7Fw2fhP3nWN0Z4g3Dq
X-Proofpoint-ORIG-GUID: I0SYA4VIDlU7Le7Fw2fhP3nWN0Z4g3Dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDIxMSBTYWx0ZWRfXx/U+xNvMa5GG
 ZyAJ11UrQbW9AzmJZTyMFm8AxNLb7GYzYi71Bn35qzZOI4snAZt6zx00UFFyZ0dAuLSi+QeP/aK
 5scYin9fC0HNng/bUq7tsdMsvifDbZYwA5qPMpTpxauJ2KSLbivPTZvp9PXzL3niqVjlnSCB7AB
 3QxCTM2duAFGyyasDNhBEtoPW222cyo48zMeqwBXw80XZ44glUAAavzh3xEq1MWLrf7j3RJ/9Qu
 taHMThTyohkNQd8LVcH04HG91BnEhdewtlfXShQEVy4/c2SGGn1To8T726zuFqQSAdBMa1JKmHK
 6Jf/ekmWpp8AXbfJbVmXjV8M+kHHSLozk1TD6Tq6eh6ubFFV9L9d7M6ldmbBugY3xUD0AmWsIKv
 L6pEq+dUkw4Vs/fbXjfgZ3lLQxznKUDTVpftAdVgJgcMm0D5LQ9qShust4KGsQ9wjD/IogX/SCw
 CtqY1ADam64hgIBGbBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_152428_347019_EFF92287 
X-CRM114-Status: GOOD (  39.51  )
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

On Fri, Jan 02, 2026 at 06:06:51PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 2, 2026 at 4:10 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, 2 Jan 2026 at 13:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> > >
> > > On Wed, Dec 31, 2025 at 12:36 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> > > > voltages over internal rails. Implement support for using powersequencer
> > > > for this family of ATH10k devices in addition to using regulators.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > >
> > > >  static void ath10k_snoc_wlan_disable(struct ath10k *ar)
> > > > @@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
> > > >                 goto err_release_resource;
> > > >         }
> > > >
> > > > -       ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
> > > > +       /*
> > > > +        * Backwards compatibility, ignore the defer error from pwrseq, if it
> > > > +        * should be used, we will get an error from regulator get.
> > > > +        */
> > >
> > > Can you elaborate on this? I'm not exactly following. I suppose you
> > > mean the regulator_get() will return -EPROBE_DEFER? One of the
> > > supplies exposed by the PMU?
> >
> > Yes. devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
> > - it is not supposed to be used
> > - it is supposed to be used, but the driver hasn't probed yet.
> >
> 
> Yes but normally driver core would still create a devlink between the
> device binding to the PMU node and the consumer of its regulators -

fw_devlink, which are not mandatory, time out, etc. So, no, it is not
granted that the PMU is always available during the probe.

> this device - so we can expect that it will always be the first one,
> no? Unless we need this driver to be firmware-agnostic.
> 
> > There is no simple way to distinguish between these two cases, but:
> > - if it is not supposed to be used, then regulator_bulk_get() will
> > return all regulators as expected, continuing the probe
> > - if it is supposed to be used, but wasn't probed yet, we will get
> > -EPROBE_DEFER from regulator_bulk_get() too.
> >
> > I can write that in a comment, if you think that it makes the code more obvious.
> >
> 
> Yes, please make it more descriptive. Ideally I'd like to improve the
> API to avoid such confusion in the future.

The prolem is that we can't (or I don't see a way to). Power sequencing
core has no way to distinguish these two cases.

-- 
With best wishes
Dmitry

