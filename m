Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0420C369C9
	for <ath10k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=L2x95YA8aWoBuP2Qt81AavRWT8
	JYYPTi2lDErOFtGQR++8TyqwG2uYuQ/dGnkUoXjpNePgTYFtuHzAddf8SQb9CKMFE8dfix/mu6Blh
	663OSYLXIBYYUmwVF3mleXkeX590PgoZJP9ykkhDp/cL0dyJFTBCOipeMojSaDzrJ8/47FMDA5lbk
	Ukmas92t/LSaQ6LEKvDUwGDJWn077tqtBNQv7R3Tm9mHQPDy9cM7ag7dN5HMAlaKA7kjopfgF0WLA
	HhaHcXTgMTDZzRqquBMUXpaXMclp37wJARy4NDGm9jW2zEqLlLJivDldtQVfaJ7cxM/ZrQi/VH3DV
	dAhqU0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB2-0000000EVYG-2Eub;
	Thu, 17 Apr 2025 22:57:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAy-0000000EVSW-0Cz0
	for ath10k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClIhh013255
	for <ath10k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=fpad8Zkxw42D9J01
	Lp5PLjxxqf5lULuggiPbI0MfNVrmp0jEGN+0uxTh+/NkWruxd7+jHFzLnskQMcn7
	m+sQbV+yPVT8XkmYYQlHWjMnm4RUShnOqeJIPxOKNgHMDl5TuvSnMk+VJ4QZCNZT
	YGAtWhexjyt7PxjtxduWikStvu1jZzeDvhOXCtSDI+i8EMd+Pn9BJkY1bFzvtQ8S
	6kKfkF1OKr6Ziegne6qJP0dc/9MI+sNIngUyZXn7b4I2uEixBwBHONWmJ6ZhAP6i
	tPxrLsTnoSwzOUFHTZREzCRarse8F5mco/dQEW3kZgsCPQ8JrEB8vP+D6K4vP2lZ
	fypbzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvdqr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736d30d2570so1080219b3a.1
        for <ath10k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930663; x=1745535463;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=;
        b=UZcyXTa3canv6rjsBIJ4kOIfQoUW3KckBfUBXVLO0gZQt3SOKVdZqX0BB31dijVW11
         IoU/D5jrLUt66imoaRv/PpjmctB0y9RH/H1llg0d6v4ea+u5HeExVty4w2u/EYWj+Xds
         rWQfCnMs/GRGVoF/N1DvHAyAPURvhPGBelPMSDCq5qvDiNp+xrqQQL+5T+Ls5PRprB4P
         r5Ahh45QQed9s/tluBoYAuCgVY4JWRUFee/haFuhbpx4ruuDDYpAS8uYPzyc90+qzRsQ
         6D4crlC/MIXqLmCxvC9DPSQM449E9bRffUuoKI9KUhv7KaxYQwahzyTIxh0PhxoufPe2
         +nJw==
X-Forwarded-Encrypted: i=1; AJvYcCUF0+i/zI3uzlN6ICViMjHJ1CpnsBQiAEivu9Oyg0YWQNh+kkKaQ4WVMMAD1UciJbQxbOzZW24=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9c5WmulP9i/sb8zE1PGpnKK36up8neKImclNSRjmtCrxfU/UT
	3CzqsYF1IWR2ri9gSZyUp8DhWbKCRCwwnftDfSFEK7NK4Y5+2DdDcLB/MGWI6fvSuaYjC8iOH90
	8zg0mQib3wsgdRkCLbK0vlC4r2H4CuTTNVqfpMAq4s87afXVlAm8ErKZQc4ce
X-Gm-Gg: ASbGncsTkmjcE4C/2SIF5BjSOM5Y5RPC3LzLnkqhW15omrrMWD1B9EGRJf7XwEZoPcb
	I1zuYJ6bwbfv2j3+XqVpf8Xd5NvKH8T/nyw6wu7v+fqCbLerl4c7PEd1ay0HsKGrATFklJWiD9j
	AMime5GQByviKxd4PWxuZmsxgjiAClMFnzxaRB8l+uJjFuq/OJOA6OMwHk0ApXgkkmLqUPhkfKt
	WIl3xHR47BjFFy/9frsdhoRKkk3avSww4E4QzpS1mzzJUK+dcoKv9N1HlXLgES8KVeRhBFzv/FN
	qMATJYsWowdWdMBJiXWFMpXcfoUrgaHyCNmIpfty2YRqiFeI
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806989b3a.20.1744930662681;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBlUcOaye28+dYXVT5e8hcezLBg2+PLcejjCu36v0S/nGdgKehCY5UEe/2PNm1Uh5qKd8eA==
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806963b3a.20.1744930662149;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, wcn36xx@lists.infradead.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
Subject: Re: [PATCH ath-next 0/4] wifi: ath: Don't use %pK through printk
Message-Id: <174493066126.1347382.345644321134226340.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: UmNProHV4ZnSdIsTi-WHqQ306V_RBvBj
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68018767 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0rtzQTkjgJck7GMvs3kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: UmNProHV4ZnSdIsTi-WHqQ306V_RBvBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=656
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155744_120939_6D9D1F5B 
X-CRM114-Status: GOOD (  10.26  )
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


On Thu, 17 Apr 2025 15:19:06 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath10k: Don't use %pK through printk
      commit: 8add2b8d72722b60c749b559db2a2aef6c9def68
[2/4] wifi: ath11k: Don't use %pK through printk
      commit: 27c57c84922ef1dc72a2ea3a5427cdbaadc9be44
[3/4] wifi: ath12k: Don't use %pK through printk
      commit: 7e7f948c7d14ab5a6cfb26146a0d4734781903e3
[4/4] wifi: wcn36xx: Don't use %pK through printk
      commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


