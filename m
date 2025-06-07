Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6AC61DB2
	for <ath10k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIznSFFa/P4iZ1LmmERUAZJS7v+GKDZ+faVfPh56hlg=; b=fRSdXvniIdWrd74PzcJDQgkihS
	rDkUHt3ES7Gp0DWTYiayHvJvZpqSp/NAwscKfpX29FtBRwKmkW594j1CTR/grxlBupHP6LKQ2Ks9L
	RqJxNCQ2b4FwIyix+mhnxSy+hE5wkwd7nOcz41SAEtqm8mnqQKW6GZKbtnoj51Y5WgkSUKWEkbyaE
	SHQLTSQuofpCetVl6Cx0NzuKmGqC+eSg2RrdG5g8ob5YCrkAdKj5M2FLINEu3xZ4tSS3BJim89Ivp
	1x1PGt6pQjON+15uI4biogE+xfr6yshnSCn3NlS+7zJ8I0h6sSYEP4DKwTTmfnsA0EhBO+bfLEXX7
	wQ5qwzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumA-00000001mLa-3xlU;
	Sat, 07 Jun 2025 14:44:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNum7-00000001mKa-2lCu
	for ath10k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5579QkDu030708
	for <ath10k@lists.infradead.org>; Sat, 7 Jun 2025 14:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIznSFFa/P4iZ1LmmERUAZJS7v+GKDZ+faVfPh56hlg=; b=VJrUmaieKFYW6vGr
	6p0oRKIkQpEkZTRL5e8VMMYuVh/pTQypCsaC9fIB8Dr4wV8jn4O9jEyYxwKRbgiI
	nOZVoCI6iN/WBc8TkdwHzu2uAhIpwSgpJtxgnpntlD+IES9f4trtxRdLqvIdxYjW
	CObBe9yXFaoP2EIuKXLtKBd7jpjfpYFi4mkKAPXLkGgJ/cIGso7upsmNyh08U4dw
	KwgM337cchFn5irtMK1A1WaVZH5k7YB95WcAXrXnW+wx8XVLkHdTm4kk8lf7pW+j
	N3PxbDA3Hx7JEtVz/2z/4Byo/lR+245vT2+gJzlGaPejPsWaHSKVDzxx3Uy68Kip
	xrUnbQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrrs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 07 Jun 2025 14:43:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23592f5fcb0so47629995ad.3
        for <ath10k@lists.infradead.org>; Sat, 07 Jun 2025 07:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307437; x=1749912237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIznSFFa/P4iZ1LmmERUAZJS7v+GKDZ+faVfPh56hlg=;
        b=p/XBKjZTHtkEfnGBpM0fBja+/8/QSHITJoraJ42LDgDU/jvvtH8AlxhH8gG/oI7wln
         Em9buYkKrvyrgSROYxqirzVwUE6gaToosSizzs0JWvTw3NTdf4Xypj9Vge+2zJ0ps2cc
         CxzvxFOouUB4VCPVR39TEasRyRNCPMqmMzf7TiBR+NtNq8tiRUesWooMmDGj9/STHuGb
         b758GDJMYzzopJDFoZu0/XgXptUKVTk4Xwk0eb/VOxnmzovqCrimCg7qY10dznng1kzx
         GNW5BoYR80mNNdpZx0ALO2CrjQ+DNSV0v0vqoDjpq+2mHsw5eaWWGkPYeoWmTRuNVtwe
         MXLA==
X-Forwarded-Encrypted: i=1; AJvYcCXRs8Pv4r4+COG6XxLjuQ8ZSgfqmc+oDVLy5yNs/6Q/FM3f8RI/HMxnQPZ+ySwK3Ie/uMxB7zc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXmLuDdGbWFq67kl2+DXsO0n/lXrF/pWzqtko30+irrSlbMpl
	4yS6Wn0vimpklvyFVC7QkKohosw858UHLNEGfj+b2rWVFsdoWKsM3VZjLZwfGDw7I/No0rrT8MV
	wRAbF97U4Cwj+sQYrw8Al40iU5gBNFB3B6gps0s/84g7Z8YnP76o4ZrjsjxZUy+tu
X-Gm-Gg: ASbGncsvfxUx5vn5IqF6CiFVi/fDZ9ts8ff8g4xLlqVSdwP1j43CY4ZGt8pOI66ZapT
	yZfG0VUNTWZ54h/XNs8RVBC3due/f0/5YdOYi9zX37jL3MUXG8V7kfiV2M8Y3UWHYQkQeSxj01U
	I6iPKuPKdT21GyFlggEhDKtlWdLCLpKQihKGJefSgkOIqV6tHyouv0Wpmb8VyE9Bznc2XJ7HHS8
	fU4513H4hhltPsQrVpAEH7gAyLjTi2RVV7JarW+PmGTpRFOHJWhWTxIHgO1+kKmOhFOqCTHekza
	x1A24+5Hff5MCuu2WeclfPApicM+TcUJH4Ykj+X4UCiOg5rJ
X-Received: by 2002:a17:903:32c6:b0:234:8c3d:2912 with SMTP id d9443c01a7336-23601cf0adamr113731355ad.11.1749307437680;
        Sat, 07 Jun 2025 07:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrXtxzVdbJJ4WGnCJvbQe9rygqOb+uLB0Wg7iPjmNdoPIj8yeTrfEk17IDYHLY6gvLP4vMlA==
X-Received: by 2002:a17:903:32c6:b0:234:8c3d:2912 with SMTP id d9443c01a7336-23601cf0adamr113731135ad.11.1749307437304;
        Sat, 07 Jun 2025 07:43:57 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:43:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
In-Reply-To: <20250522131704.612206-1-loic.poulain@oss.qualcomm.com>
References: <20250522131704.612206-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: Avoid vdev delete timeout when
 firmware is already down
Message-Id: <174930743660.154748.6559672422960537797.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:43:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=6844502e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7I3S1EzipQkWTEvUIxgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JD0sYZ2T3_dDGuMS188CMq6lbNz9No-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfXzSYXpvUur9ox
 28fnyikxsRAiL0yY2DQhCPvyvwCY9MD+aTgzryoKTNJRocb1SnxRMRjOQ4OJ1PbJRgPQwyInIL3
 IrpHkCXzKdw+qabSvIPdurUlfJ0tAsTdg9OwUb2YKsn0jcXUOWsmFxQvIUrpxy+YHnLme39bDse
 XH5134qmkjud5ZySsa+rPFIkuG2U9IXtKA66ijcL6PLn4gduFrxFp4a2rE24oBy7kIjvUIjypBM
 puAMt1wR0anqAuEYJdRPFYxLOre+lKlJIorzMR3YLXDPWNa2efubx7+x+ESipD0ZBuKQ9NO0pLh
 ovnTwg2oV4HQBlFdfQQhG+WTTixnwvVq9p0AsY/fhVlfh8rYDIqw7Fc09FRfzuC6J1L5tQHUO06
 HS2Nb57TfRU76vO3/NVNIL/5WVAKtcAcgQ1MimT8aIGW4E3WRGMvIxUO7CbHMZUSIw68S2WE
X-Proofpoint-ORIG-GUID: JD0sYZ2T3_dDGuMS188CMq6lbNz9No-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=843 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074359_820423_66BC9E1A 
X-CRM114-Status: GOOD (  10.84  )
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


On Thu, 22 May 2025 15:17:04 +0200, Loic Poulain wrote:
> In some scenarios, the firmware may be stopped before the interface is
> removed, either due to a crash or because the remoteproc (e.g., MPSS)
> is shut down early during system reboot or shutdown.
> 
> This leads to a delay during interface teardown, as the driver waits for
> a vdev delete response that never arrives, eventually timing out.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Avoid vdev delete timeout when firmware is already down
      commit: dc9c4252fe0d7a7f1ee904405ea91534277305bf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


