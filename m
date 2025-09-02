Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80B5CA1005
	for <ath10k@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csusaucqTmzk17SeeOJaLqL2TcfNjobPHirLjmjAGww=; b=s6jff1Fe1odL5Kouo+tFmdYr8X
	2Zff2m2we8/7OLx681mEtUZwRYI4aP+EJsU0+gsRDZIto2IB860Ko0MNsEviwIBQCfC5blqqmk3/N
	G2nQjUN568gsilZP6rbXwU3gwcgDjERsHKpu+sPnPCzCCGptbeQzji3MUUMY9WOIfQsO+OMN/jG/3
	Hx/YcI0jGqU3Yl5ZjkrRmuSMm0d5y+lYcihUgVgdLraNZJa1CTN8ZxyOgfeoxhqPMC032EOtiKX7I
	dnORkZrmWY68j0100Fa7SN3HTHaDkmO5c6I7mqdX6wZ5KbRXlziA6O1re2InS+u2GpFdRlmHE4+Lg
	ETDz4ogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQJ-00000001d99-1OO0;
	Tue, 02 Sep 2025 19:12:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRYh-00000000DgM-2saV
	for ath10k@lists.infradead.org;
	Tue, 02 Sep 2025 14:00:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B04Gl013850
	for <ath10k@lists.infradead.org>; Tue, 2 Sep 2025 14:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csusaucqTmzk17SeeOJaLqL2TcfNjobPHirLjmjAGww=; b=VRxMtpHDll9fc9A3
	ta02jSVe4EMmN39ro05+m01qqFhoHEoadcUMPOIuElI9WVmdrxf/KO/31cR2DibG
	A2cA1UfpKvH8HnS0wDkjiMnonbOnrfBQpHMsGEieODCCgQJUwOf1uZ7CKw5PXTGk
	+kUPE3H8mRuLTI3/e6bhgB5Wu8RRHbN11NCteGmUUcgvNBHZz4bvhUlGHMtQ5kvr
	xRPGt/OIK74bC86UeiYIfjYjo+xFnPW0kpDrgx0FUdepgY+llQC8qDK6pAfYA5a/
	2HwRwbPuMWh5MhPGlzojyFm8pog00Ii+XT8yKCkYLVL60D1mXbozyR/ubHZHEFH9
	E9TGIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eg5tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 14:00:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-80483ad2704so314326485a.0
        for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 07:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821625; x=1757426425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csusaucqTmzk17SeeOJaLqL2TcfNjobPHirLjmjAGww=;
        b=v0O5RDSEc/IpAdhwkfSxbJuEOZvT4c5ya1wX/ME1r0SWsdaEAV00PHAVpzthqAZsq9
         aJdruujdDicMbXN7Y0z3yZhFVdaWxl5VDdLDDgM+/hib5YSL7vkgsas7xsYVcHkbSiMO
         xcn14P7aBTr1zGEKIP2xshFNMwnbVBKNrsUqSriCb36TOTqT6ufmJsFuppn9+fevy2lF
         eXEZdBOiLc027Q63/YyT0CICie+5Y83rtx649yynUsh4YwAv7NOKdQIdTVfrZuOKt0Cm
         iNlA7JHsfa4a8QjBvTv6QzQQ+YBiyPGwjBXHEy1yj8NQOuHL3DJPzRLdJUYHEEhPF1NX
         4luQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR0aPzZvWA6uj/jzeHTH3w1M89h7pqp5DIvFxdHPYDsw6WqQWEj5hlKtYIAERBsNHMpOtUPLg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJysAioQxFfhPnVkukz3lk/jEh9KI4WMhgGczfslDUinLiExDE
	eXsYaeInCLlzkhmxIChDco09vY2tFPyZUwx9BDBZrQ30/eHsLB2VCFBzRzx46aZYi3qlrmzKS9v
	IlyIbG9q0HueJx6eEs0+tMOelz0mrtbGwAtIZvxfLtsEXxmFPes/YbM40LP73476jAiQE3NdLJ+
	i7+7/FfRvKk46EyNkCkGHI/wWnSyLQoWOMUYqsdxU=
X-Gm-Gg: ASbGncuScWgtOi7gxI6hvVti9HV/CvtBOHLOjx3hwyvIQ77we0MhdKg6YlWq5/6xDrT
	LVmzQwe9UF3KjER8XRlxBCPgHaPLuGaCs+wDJW05+R+Tfq/ShHE2l4GYDpIYwrd7E/erxbHiNAF
	GDEWnIMh6RksHWSeG3QIkQ3g==
X-Received: by 2002:a05:620a:bca:b0:7f6:e8c9:2ab9 with SMTP id af79cd13be357-7ff2b4b0029mr1278702685a.39.1756821623582;
        Tue, 02 Sep 2025 07:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdWWZMQ6aOZzdLiT+Un0WMDnOkgUs5Qx1fi85wGxKKPJPLxThT/sZyXwCh2//MRN4U8HhD58o5y53D7lFknCk=
X-Received: by 2002:a05:620a:bca:b0:7f6:e8c9:2ab9 with SMTP id
 af79cd13be357-7ff2b4b0029mr1278671285a.39.1756821620917; Tue, 02 Sep 2025
 07:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250902080400.635818-1-loic.poulain@oss.qualcomm.com> <87b92cbeb6c672600ab3530513d8aba5f4b0eb63.camel@sipsolutions.net>
In-Reply-To: <87b92cbeb6c672600ab3530513d8aba5f4b0eb63.camel@sipsolutions.net>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 16:00:09 +0200
X-Gm-Features: Ac12FXwzJQUvQoUWUqvMRrIXFykv3yJhrIuOXl3mgQl_CpVei1qt-s1e8nKX650
Message-ID: <CAFEp6-3vgYLFrkmiO2U2HKRFwYY+_UKt0pkLB9i558E5SNNeig@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath10k: Fix connection after GTK rekeying
To: Johannes Berg <johannes@sipsolutions.net>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: IOgsj_FTcu-Izkav2X8jHSbIiki4hn26
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXzbdImvyew8Ji
 kOWk4JFupphSzWwBpAscz162k846il91jf4uBEwTzEgIdBJE6kVE/revA9ByPv99QxtaXv6v/2S
 d3RHOLzAY+d/Bg1yuluq/nJed1+Ym440n/2NLHYI06e+rLh7M8hi5xjr53o0E63R8+Zrw9ww9JC
 jPvb/xYFDGABfD4sdravuIvwQNtUymm+N0Tf2d1vNGEbNUPqh4Ryw6REujkddP2EEeg+iwKMZgd
 LoTOGXH/CcOFYmGvdHjXVqCgZYFeCMaaWeSK6/p2yDZrxDo9OC7OUE34099DMaxK9PmCZVZP5fB
 u20UQZWbz9MFPGrtrLojmuJFXz5MA/ZTw6SHhA3vuxDeP/vGZuEnmxNH69fxC9/HaqQ0nUK+C5J
 ccuXDx94
X-Proofpoint-ORIG-GUID: IOgsj_FTcu-Izkav2X8jHSbIiki4hn26
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6f87a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=stkexhm8AAAA:8 a=rTrHpxIYefey2SYKP94A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_070027_758872_8008CA32 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, Sep 2, 2025 at 10:09=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Tue, 2025-09-02 at 10:04 +0200, Loic Poulain wrote:
> > It appears that not all hardware/firmware implementations support
> > group key deletion correctly, which can lead to connection hangs
> > and deauthentication following GTK rekeying (delete and install).
> >
> > To avoid this issue, instead of attempting to delete the key using
> > the special WMI_CIPHER_NONE value, we now replace the key with an
> > invalid (zeroed) value.
>
> Maybe better use a random value,

Good point!

> and even try to delete it anyway afterwards?

It would still trigger the initial issue this patch addresses.

> If it's all zeroes then an attacker can predict it and might
> be able to inject frames into the system that way?

Indeed, will fix that in v2.

Thanks,
Loic

