Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5930C282D0
	for <ath10k@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=; b=UGC8Q5D8NkPMqLp/dJH1jlrvt4
	lPofFD2WWwJ6+Xoc6FIGMOG0GTkdKcbchbyixpMC3eEPiqW3wr20goGH64/BlCJf9kluHnWddkcp5
	iDjM4WZ1x0oNnb/IsG5n4mQ96+QlOK8AZXdZr4PhJVYfIpN9W7zgQKcyMzGhNxMt3E6IeB/g7HbC2
	6ysH0jFPx+cEMnh69YM6l0AVPvF8751T1ryI65L4zDB2RmN6GNm60w9YjwecGre0n+AZBaiSX98n6
	OY2lgb93Dp8PEUQXlps/4xbMpB0hJdLmt/D7YyrspS8syGNSE9BUnu44dQHHUd1e56GA4eLh9LfLC
	iIC0p1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6dd-0000000CUuv-0wYj;
	Fri, 28 Feb 2025 20:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Tb-0000000CRr0-1dyL
	for ath10k@lists.infradead.org;
	Fri, 28 Feb 2025 19:56:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SBf75E022537
	for <ath10k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=; b=FvRbA7w7sNyDRhO0
	7mUYDTikpS+u+SGRNckdjLEmPGLTxCtQzAlViVCUMrSpU/VgFXyrvD/X29kL4u0I
	RjdXP9cSYsEzyazamLqG9IXfE7oRHn3L9Ejv5HhAE87lEivc5c1I+hRIYrlAxW9J
	Iubu6aEqu1LX7nSecbh/ESzV13lTfjebZEt+W0oF1TRFLGEDf2gTvXqGqVB2rjAc
	/cVIcXnZUU5dPXpkeIOuBr7pxy+VvkfMQtU4wt+P0J3GCvkJ/CbwkYnLdmflQ+Fo
	PXlo87oJ3XMSuz5iUVgMaH/dlnvZ4Zj36XQg4ZnjJqeb2NGXfmokIdXn//x+tQrv
	s/3w4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453cg3sbg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22380b74cfcso3247485ad.2
        for <ath10k@lists.infradead.org>; Fri, 28 Feb 2025 11:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740772608; x=1741377408;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=;
        b=jIh1Jyq2PL27siPS+Y+lZVZVRzEA75zBkb5p5r19lGTA/Cr05Kitf6ZmWXB37JA05T
         +iQ3QjwPMu620VdG8SmMLsDevjoqleBklIW4s0xJ/P0Zof6KZ0RAsVhp4jH5qDMGBcU1
         epv9MyfviSGEaFprsJDTzLhte+DIcivVgqHVXe4x0rgukMlHjCoheYXSEJRUqxYHHw5L
         ubfSQRn/uAyvUGGnwcJUmaXVkxVBZbA+i4zD33ImSBqPl2Pl3v9vUoaibfG+8v90m2pM
         75ptleYHtvdgFM9elh/7nR+idh8wSdcM0auJtVsLtrZzRWUzKhbxLbKiGJFRDjNtVbhO
         GG/g==
X-Forwarded-Encrypted: i=1; AJvYcCVhjBZHT4D4jDpedct29jGcrwB4A3kF2RYwhyGvLCevHjwk9IsTQDOdjKL0boiJNtf263Kr0mk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGq4vPmPxFZURoDGj7U74rKl3094AfzK+PjOlsxerZDX2AelcN
	npDQ91wqZDIDTgS7t5GmGfNHqO69qB2hl5sbr7ICUepSr1vILHYgg15951RDs5iDju8JERkMhQj
	ZCzmVZZpWVbIes0QC5CyYJIfvdn1H4iioOOKILNbh8d4PHFQ2DkAQbJcSmbtYWz8sCwVB
X-Gm-Gg: ASbGncsrELN9FD6dEpOi24Y/2wKeUV/MS3c43qJp6U1i9o+eRRNhSDsqgR8SHeG/oaM
	G0J0c0lJUAr6xYNCgIDVbF+oPVjslskSD5PwSP9Ew2EOM19RaJyTgS3DAmd43z1Bj3BjaIz3PUC
	Ou2erymNeyNCMeKk7H/qbSVH44S0G9rq1+R3sS7iX7D+pGRDtf6+5g6736lvtIvGd8QLGUqSxUc
	LVZ+X58/IsxhHQ3MizpOxL0mBdcCfiAvQAdHPA6ri8O/zLzuKjDNVXw0fa2sTo+WTWpiWLnAEB2
	BINbUDaLe/NazN9uI9YrHA03X5/mJ0n0QOluZqKtT2FUfpLgFp1P
X-Received: by 2002:a17:902:ea06:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-223690e1355mr73911145ad.23.1740772607651;
        Fri, 28 Feb 2025 11:56:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7N0OvSFFa3UWHRhgJnMWCvMyrdXk76Vy99PtpyeYMuduZgzrvVi7czXX9W/MtAa4KhsBhtg==
X-Received: by 2002:a17:902:ea06:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-223690e1355mr73910685ad.23.1740772607194;
        Fri, 28 Feb 2025 11:56:47 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336ecsm37140165ad.244.2025.02.28.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:56:46 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
Subject: Re: [PATCH 0/5] wifi: ath10k/ath11k/ath12k: Strip device prefix
 from calibration properties
Message-Id: <174077260613.4132177.11023317176929798759.b4-ty@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 11:56:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: cHtmVf9kv0oagF0whVnpXjpw5tXRPnf-
X-Proofpoint-ORIG-GUID: cHtmVf9kv0oagF0whVnpXjpw5tXRPnf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=782
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_115651_479200_556F228E 
X-CRM114-Status: GOOD (  10.17  )
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


On Tue, 25 Feb 2025 10:05:31 +0100, Krzysztof Kozlowski wrote:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath10k).
> 
> Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: wireless: ath10k: Strip ath10k prefix from calibration properties
      commit: fcd37e2a33167cf6b507256365e45a43009d74eb
[2/5] dt-bindings: wireless: ath11k: Strip ath11k prefix from calibration property
      commit: 352e8c4379fa540747cbb6c94c4b149c7487feac
[3/5] dt-bindings: wireless: ath12k: Strip ath12k prefix from calibration property
      commit: 64e37c19383f840da534449b88d7adea4c69f52d
[4/5] wifi: ath10k: Deprecate qcom,ath10k-calibration-variant properties
      commit: a97ed4ecb797a69f52f66445ebca538c93462ba4
[5/5] wifi: ath11k: Deprecate qcom,ath11k-calibration-variant properties
      commit: 1bd9ffec4cdb9a1f09bbba16bba538f6c58a397b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


