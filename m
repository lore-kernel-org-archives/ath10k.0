Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB97C3ABC9
	for <ath10k@archiver.kernel.org>; Fri, 16 May 2025 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=; b=0ErD51fq9Hg7fkj4x/dTgN3bXm
	Drpykf5fvQAoM4lNlEci1hky/96bqZ6arodPbuGaIjiJRi1nh64mVNUkJujc8m1jQfbKi6XJWvx7A
	/dOqMPl3r5Waibyc25VtOdNVLHdiXGkGgGzRJYV3phdDxe+NNjzTcfYAma8zdVu1tddqxs3CiDTqF
	l2m6gQhYDBud3ez6yJB/HBpHkLWQG6WFopVZZMtkXpAi30ZlVhn3ZTpXhzzZbLD1qW1zFFPErOte+
	t7PuPw+8z2YeanH9Hol2drAf8yRKc3eXmTs/osGvR0hPHUW0F6sAJRGtXb1tUDQ1iNBHLkFcCaNSj
	GJGDbegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz3B-00000004Bqk-2N4U;
	Fri, 16 May 2025 17:40:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz38-00000004Bp0-3HFH
	for ath10k@lists.infradead.org;
	Fri, 16 May 2025 17:40:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGrscu030116
	for <ath10k@lists.infradead.org>; Fri, 16 May 2025 17:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=; b=Og6rGCC5PoNgGNyX
	tWn4KKbvRjmChKrDiHMely+CPmhtNIW0Fr85RQnsZECXVYdlE6JsqzjN3pALKZ5w
	jqObYK4zDatp+vrlzMqB1BZxV570ZRxK/2nAGPBHpJDRSJvejPuulJXTOfG4AgDQ
	Z/hWDERlTEG69jVbZ22epvZV1+/Q/gKGjRexfN9efzSbUcrfpAuDTN3TwICDwogF
	h3xdo38hDAjF9Us3e1TXRIjwH6WoLh320zNWPlueuCnvS2xWi026dzQK+pabMq2W
	KGBVdtbP5szSC2zRvrG6VU/z9Ue5xMKotzc0TlVXpyam/cDkI/JEJEQSLGEwqqhB
	Zi0khw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p997g31u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 May 2025 17:40:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e50d4f49bso33397505ad.1
        for <ath10k@lists.infradead.org>; Fri, 16 May 2025 10:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417245; x=1748022045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=;
        b=q5jTXgULQrp65fHWWE+PU5TA8lO0AqNkG9Rrv1nkrikIk1jJsIG+tZZ0hiZKvf9b0W
         xe2JMnxU2dnrJElOWxi3U7iGByBZSvgmB2K3NsCdeaPQhZfOrJmn+KKsd8kKtTRxxW1h
         MP17HJ/m2wAi8ea3TVUsZCMuvMJle0Tp1LFCuZhiIkvA+7Gm34hnINwBl04jjR9g/8qb
         SO5oc9PB9JePCun/GjNit1M64DCUkK7i+ge4kH7mWhclqmfXl5acIYTS25k9ONi2YFV0
         W/WxF1Aba3OBu0PnAu5hI57mpsYpmpqfFcsHV2S7AX3JpRyW8Aky315Hh1e7nHw4u6eM
         XgMw==
X-Forwarded-Encrypted: i=1; AJvYcCVx6osmVH2RQpcsjg8Wc/CyKQowgl2L6g5ylR16pLbaCbFdwsGR3HOgcNX/WLmDG7N9wE5kctw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRk7TmwwOQspWSxqz5jIo/burcZscYr8BceCX4+RyYRfFuAHHJ
	PyYuJTqXc9RlXO0QOMzJzF8rxuol5DZVPKacDUfggPAbE+iWR8d/jJI9cH4VRqcHICd49zQsd2u
	UvXLFfMG+qd1cTBsWKinowLiVSTNx+tQORZ4LoUz1VC6nqEkBtnaDgnaifbhEICL4
X-Gm-Gg: ASbGnctu1qpPszFXzuTLRyMxnduBQdZW9umJj7xmp8zqFtOHw6mFqVoTSR9EfqGY2gH
	pfkEuyZ45A6MLp+zD4efJFuItOYiFQFC5NyWtNTsA3C71CtXQdKXYZYEWju5WSjMcIrlHxvOdqb
	+n0kn/+tl11wD6d4gDLxdI29/h2CkFSKLapH5nzioUZcHaUnzVohGu0KBGNGix7Wc5FdhJT3l1n
	cTQr59WNZdL09aJygY3GyBmlWWKzydaDimB987raIUkkpkI3m2B0/SfERPtNrNEbC8o049cjfoC
	GSqgx+nf3SOy/MPzHVVRTkNjXBLwidehT+2PTk+zY9biHlxU
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457985ad.16.1747417245447;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtF4TLFrrPoEt4gmfmLFTd9XEB50AQ+2oIAkdKuvYSP0egvrOWfC3m/7jstWY5dO6hzURnA==
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457635ad.16.1747417245053;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250418115627.534833-1-colin.i.king@gmail.com>
References: <20250418115627.534833-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Fix spelling mistake "comple" ->
 "complete"
Message-Id: <174741724396.2935573.18125129643312875821.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=U7uSDfru c=1 sm=1 tr=0 ts=6827789e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uQsNN5m5feiSJzJ953YA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfXwXCAcepCRrHn
 obN0GOv81xiDtHSnRzmUYJVzwTMCiAvNYfa8rxf0RldVTTmCzcCivAlzfYz4aapcfZ/ZpDLfO8/
 jkXsuH8uGrRnFCER4YilPnWXLe6ft1rf1rivO1LlH/xX4vkLkqwGhkVXmB3ZgBlmIxTijl/jZRS
 +lioF3P10RraASU5BlLH2wm1S9Pg9y7yW9xnv+O2BMb0SpEdB+jsc6fJcjwU/XjeKZOjyyOo7UU
 Lghy+C5TRNmJ/Xc2QURz/zyMdG7EAx0Cmw1bMo4N250b4hsFLA55SyJ/k1LYEIQr+y98Ev1yZXj
 sdvhBeV+j31o4SawgYyJm7lqXOWlyADsrKmCfU3SMukJjO4pnljJjzXlGa1iI4MOd8YuRhJs6iB
 csY1i+yrGaCca5w8Apb0TM5gid7/EtDWacV9NfuSVd/SdG7HtDHWbVWQ2A9xOkh8wopgBxHq
X-Proofpoint-GUID: Dxa0DLLLhzLEAVP6PEE4BiwiHuPJN-L9
X-Proofpoint-ORIG-GUID: Dxa0DLLLhzLEAVP6PEE4BiwiHuPJN-L9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=838 clxscore=1015
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_104046_826692_263D2299 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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


On Fri, 18 Apr 2025 12:56:27 +0100, Colin Ian King wrote:
> There is a spelling mistake in a ath10k_warn message. Fix it and
> remove space before colon to tidy up message.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Fix spelling mistake "comple" -> "complete"
      commit: 2ef2d31925f0414ff0f37862b6c33f62b49089c5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


