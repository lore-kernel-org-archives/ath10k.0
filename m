Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DCAC3ABC9
	for <ath10k@archiver.kernel.org>; Fri, 16 May 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8pWKVxaMh1kzxVLK0M6ZtTeykbiXElVUESVt8rZ1zQ=; b=1lCx8qtFtB37eJAsyExVx88pDz
	tZp1qcWAT+Ypbr0CWogRq2QW+YJo1ILK7CyezK6OL8Bf1OTssLsRmr0LvyRKW2NzrEk66XcZGNp9l
	BuVP7A7W1q7cMEcvPk9ixhGRfjaQNefqt/2vXZp3vEj//L/KpMkKXUfL94JB3tU9WR9M40HTCc+Wq
	t8exb6UL2H3wF51150q8fySlJ3KGSPlaMGfAiDh0YbwP30mhg6c48FBZx6klGsoMyImp1zvcN94Pd
	loN+3SlaSORtAEYXEyhnfg7gdtWQ6iVnP/ntXbHVo9lzdqvu2ru20vu8BEiIbEgGMWfrvbdNHS2Kr
	gUZozV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz3D-00000004BrQ-0Iaz;
	Fri, 16 May 2025 17:40:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz3A-00000004Bpv-23rk
	for ath10k@lists.infradead.org;
	Fri, 16 May 2025 17:40:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBXhmc014461
	for <ath10k@lists.infradead.org>; Fri, 16 May 2025 17:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8pWKVxaMh1kzxVLK0M6ZtTeykbiXElVUESVt8rZ1zQ=; b=eQBFLzay5QsvcWew
	h+AOdyRqrCxzMUD/Lp6KFYb9lSOHN81UoQnq/AlS9uxhQrOHXA/E+DOJftKgqbcB
	fYKW59YPYu4FKopNoyAkaaZfLolAydYugSWeaZ3NYAqbhVVGZ9WIR/IyKhJED/Jw
	waoXnU4p9gfWjMHMaUBMhSPMLCFS8KQXdvDJzjCYFwpn07UbbDKkEHyjjJCkkgns
	ZoQ6EgUXR275fo8q5aHQgAEoOJIuJ4GUUgIMWHAKM7th9GOFV6TSOEKiCvT4n2c/
	YE/RMsrIq6yMCgJ0gq3Cm1NhUCEADaj6IEuCkv+dZZLo35dK0NtQVWxMxzKeW4Sx
	w8hz7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpjw70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 May 2025 17:40:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e7f041997so40307445ad.3
        for <ath10k@lists.infradead.org>; Fri, 16 May 2025 10:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417247; x=1748022047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8pWKVxaMh1kzxVLK0M6ZtTeykbiXElVUESVt8rZ1zQ=;
        b=iH8aXalMs4uk2fZqc38OuvgykBg5d8G+W45t8XaiZ9cgAJCEF1cpJKZxjOw/3ppJk+
         o0WtRuYe7RS1BwwWcqK4B6D8ow7ZNBHyD6TGvzjRBfR+TXOZc2c93EQlQGOXLcX+p6ki
         agPYYj8QWRriPCm/a3oSw03d02kpbTz9FoiKVPH3S6SHKyNYqBzASvDPa5x9yd917ApZ
         lPODX3SK2OcRCFgbXme4ozGMIeAgyfTY0Bz/HqUJC3pNbqJ8ow4ia1/Qr0MqUb5w3pxG
         GjN/ihamCrSPEPI835sFfZYHxN/Wra4hX0XHFyNu7hQ8V6g5HG9f6LblAbxb+7+kz840
         Gtjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfvsRUIFNMfe1IMp6lWW79pK5Bpe8+KH/cx2OWUUbX9S5MUh32vfSbvFIdhQGInY4xMnnWQGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHxHRsLLGQC3Y/6cXP57QqoPQMeU0xszaXjHdbo8uadvC6JbA
	fq9lp/S+OG8q3jusfW2B3IqhXu+L0ymyRcR1EIT5KyZmxljUAXhdoCPNffVzlEjWsIw3HCLHa7o
	7CRIGYRilzoCDR3B5brhf85uuLto+kDuuHi2VbXqNcp9cFMSMawec22PNxGxXQ2aP
X-Gm-Gg: ASbGnct0BDY5oA0GCJap+kWBpUPGwVXHyxXn6JI1MA2/iTcduta0Y0UkvxQI1Ob1+ZP
	2PhZ68tgBA/SJoLUL+fgbZw2w44+AtuQ9PcZ/1pQJjoWuTlTqlz3UcxUjqUIXzGjMlFR2V8OJBg
	8aYniKvh9/5Q1kH9+4VOKDeuq6BSDEb1xFzdw2a2B62Dndyh7uII47Bo38NMj1/F5yEfnoD97cA
	mCFh0Pr4YEUDUtWZu5RF4cx/r4q7M4F7c4EBGOfp6b/VpsYFmxdpMw8HxKBM42D7mMlcrtbtjB0
	Al5A3/ZhLJJF/2bSIvgTinKenCH3FeQ6DYhv9ZodvuVjc08B
X-Received: by 2002:a17:903:2f4d:b0:224:24d3:6103 with SMTP id d9443c01a7336-231d4596d40mr61192115ad.35.1747417247087;
        Fri, 16 May 2025 10:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWa8ji6HOqJCeB/StEMfWMDUBnd1taWIOBSxPGp3Cgj8KNbuY90IhBKEkiubja+uA4+WbBg==
X-Received: by 2002:a17:903:2f4d:b0:224:24d3:6103 with SMTP id d9443c01a7336-231d4596d40mr61191765ad.35.1747417246668;
        Fri, 16 May 2025 10:40:46 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
In-Reply-To: <504b4d5276d13f5f9c3bffcfdaf244006312c22b.1745051315.git.christophe.jaillet@wanadoo.fr>
References: <504b4d5276d13f5f9c3bffcfdaf244006312c22b.1745051315.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] wifi: ath10k: Constify structures in hw.c
Message-Id: <174741724522.2935573.13839146888605668919.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: buhnzHUNhgYEERsZv62DzhMnDJU2ZGaS
X-Proofpoint-ORIG-GUID: buhnzHUNhgYEERsZv62DzhMnDJU2ZGaS
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682778a0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=iT9tRhyl7QObuXKRkkAA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX1t2N8VG45MVL
 N0ju9jc4Rd/rzFiVHAgWhRPE9Ii/waPEWWRHOU4VDvWylDSVmn/hyRQWPqdYK+21oO1Qpd6QgTb
 F11633SzuRY6O08fsNwpfUJbbwUWISxqUJ1e81MYMyXzw71K1hMG9pBWLb2K3nuMX/sMHV1yQF0
 YXJvPoxfWdS/O6lH/U/jjnMJ3gOb+QR/B9NuLA68Tt3QEpgLm9bxsYZk8V9OHGHmhNYnw1//fTm
 5ocFboy6sewokND+5NDb8fHn0/ngaYOAI5rtM7p9URYqRwzTnycm/Z9Lp3EPiL2JX568i0nu5+z
 Vam4uR2hXZNPiS3EN2SPA5+zrn6I3VXXrnNiwklE5coomj/KKIrVgE2sByyGG9QmCRN2xRiQ+6z
 bpxAVK7IWHeqBn32SIJD1O7k/yAvwHcWi2E/TP0NHm/G/NEWN0L798nZXF0I9y7//Ae4RNfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=693 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_104048_538576_27C0DEDB 
X-CRM114-Status: UNSURE (   9.57  )
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


On Sat, 19 Apr 2025 10:29:17 +0200, Christophe JAILLET wrote:
> Structures defined in hw.c are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   10357	    951	      0	  11308	   2c2c	drivers/net/wireless/ath/ath10k/hw.o
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Constify structures in hw.c
      commit: bd8402eec9aa3f9d6c797bd51b3c5b4b029673af

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


