Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2126CA1013
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znVREtlVg2TbngpLdOZn/WWH07iDbQ9DOMHKMLM8FN4=; b=RtlmCG8fgEebIK5U6NXG9UaITL
	/+nE3eZC7D/36UKsDO+kU/bGLRaOWDyTiQwza0UwBX+0sGoxYayekIRLZOnbJ82c8rYhdBaWfD+sO
	Z4rO4if2Qjgs8ant8PJuUy+FmzcpzJ+8PTHvv61f6Z+Pdb4tsI5drBg3HGitTcovh2ASKmRl8drZQ
	jDqOG4TWGR++VmQlDBkm8CsE1cN6F3YsLg3GRyYZKMk+WaVf+MLucRGfZ6QlLUTJywMWAYGLgsE1b
	SeJsx7w1N0iNmQdQ0GU1btAF90z9y4A7zG1QgSxysJfXDEcscRlmiyiSrOXBwz3g+VsZFTTpR76SV
	0XePGCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLd-00000001RtH-3d0R;
	Thu, 18 Sep 2025 23:47:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLa-00000001Ros-4AF7
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58II56SK032456
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znVREtlVg2TbngpLdOZn/WWH07iDbQ9DOMHKMLM8FN4=; b=SqeSWjpkMm3Gy5sW
	na6Q8e99ogR7PHx9shr3VMU4aXdJZHZQEWxc8nhY4myOHh0BLC4SV4sbQWtoipUC
	q7SRer7yY4cZy6JcpFbfkFc7jLfTlJ+JKCHBRVN2/g94hqDRHXc1Hxw8ya578vGG
	K5h4uVCFG8HDwC3ps5c/0qT8MreqykYOGsZZ9aXoft99kJDWqwogZFQwA3XsOwn0
	wUakVxGSuJx3qomhM04vyVttkgVMbewHH70s5fchTj5M3796PBtQEqmoH083TXEe
	ZQ7Yx14m2h6O/rDvYyuZylnSpQZyMCygmAhTKxb2x/wycotNCZnaGN6UzcMvxxPB
	BtMlIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyrd3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582bc5e4so16450745ad.2
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239250; x=1758844050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znVREtlVg2TbngpLdOZn/WWH07iDbQ9DOMHKMLM8FN4=;
        b=SlYAyLdySeZm1stwEZBJwVMjqNj2ylY/HrYm7RFysQm9TBpv0YHC0QXOZFO+qSE1E9
         FNctGczCNYBO5sXB7NmXwBrqbvGng8YPpxNCgRAmGBqLieN1iK+4AGtwVE8gw9PAoGgj
         xhJGx40mV9UFad39uXGquGcV7zbOC50Y8U2qoadGoVEqLLFwIKkkuzy2cl64QUeDS0qt
         G78bttLzhlNge25kH1Iv7GOID1j3vyYfaB2uoY0CQvTMeoQMZ3VwIeZxKJTMNMsBNzpD
         TRXYxVIYTBW96gdPHTFoY1BXv3xlVsed4aQgovvkEhrigRMkCoeY4S4gdE10pc/hBknx
         6S/g==
X-Forwarded-Encrypted: i=1; AJvYcCU75rs3TtbXKdTCiXgC2I9ad87FGU1e9hhWu5j/yybVfe8YGF+XVLSN0xRfL327skIBUWGo99o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrPtVLJeZXMu/7y2j/+ziPb/ThI/PVkd/Ww43/4XV9XftjJ5JV
	qa+cCY9O4FveomBPA67A+PYZV8N0efA1n/10zc0x+yDQ5jexekqYmSIH8u2cI14RIkLa6MjBhg/
	YdWjXLrASkgDc73uP9eUz8HdYERyUTuauzdecDaAkmHRVc/uiU+IFyJ3jqiGTM5hd
X-Gm-Gg: ASbGncucOF1cNt1Rn1t1NSQew7xFytxN+gE4642As3zpQbrYd1toanO9eIiq1BVk7ze
	KlUBPz1IicV4WdI74KYjEXVhr2IuHwyuc8g1dHVuhGeCoSiNQ0Q1CsOst4F434hw2Ui/aMQa1nj
	Bh+6Afs2d5CCbWwQpoCF/oBkDzkzf6m9DdPDQZ8qT8vk5r1Kdmo5fVUAQYjChICjwe/fyP0Tf3Q
	e10/KgYUJJUITlIT+OdbHQ7I4PyABuAQKTdYc/c8x+ypa7BcymQr8+2PkZABGbE6oBS6LBg/91U
	9/8bekJjH8O9/JlW1qUcRoRCBsHCDfdpS6UpxyrUvueDAyqiSPtqcNFFU19n4MkNzVHZoVM9KWg
	R
X-Received: by 2002:a17:903:1108:b0:267:b1d6:9605 with SMTP id d9443c01a7336-269ba3f9e56mr16343025ad.10.1758239249718;
        Thu, 18 Sep 2025 16:47:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERbqV3wCkjXG3PjyKuXLu4cfZTg5E/48OfLH/KV9hBuTRpyKhpYzz7BhKJc9/AhEvCPV/Yqg==
X-Received: by 2002:a17:903:1108:b0:267:b1d6:9605 with SMTP id d9443c01a7336-269ba3f9e56mr16342815ad.10.1758239249282;
        Thu, 18 Sep 2025 16:47:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: avoid unnecessary wait for
 service ready message
Message-Id: <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc9a12 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JOwH9nCdIS4rS6tIlecA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xCfr6XeUofxMRbjGRXSRvDA8hHOoLqDm
X-Proofpoint-ORIG-GUID: xCfr6XeUofxMRbjGRXSRvDA8hHOoLqDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyrwHfLJXazbA
 hi89RERJQ3sZ/Tf+6SXGHISMSDSfn8RGoCmDOcPbKBVrqw0muDOK9btt4mvCvhRGoc112bxZGCl
 XSNnLPcZsSxMjkSuvhZBt8ij6Zwm2kuJ0/0LOTxENydocOhC6yg31ZcwMviMk0Ots5/9xkfBiIn
 c3qK9ZTk48rXDsROXHH59c4omdPN2OO8f4xjP7DiFz8okYU9gtTACPNxD1E/gUR/7+COLz8pfqX
 Hy7AuyVeevUEvvc7HueHLtc9UFxaNq6S283tYM6fBQV5GsPhA+Ejf6buVCRtSG4ndYUYIp9Odr9
 NYJPmN3eXHmiLhiFsbATJpR9+6pb89Ph5E23RwDt+9riQJTSWsh8uSFcf1i0/PCj/NUueJTIf5c
 SJ8mhKi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164731_049418_78FC3D28 
X-CRM114-Status: GOOD (  10.53  )
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


On Mon, 11 Aug 2025 17:26:45 +0800, Baochen Qiang wrote:
> Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
> failing") works around the failure in waiting for the service ready
> message by active polling. Note the polling is triggered after initial
> wait timeout, which means that the wait-till-timeout can not be avoided
> even the message is ready.
> 
> A possible fix is to do polling once before wait as well, however this
> can not handle the race that the message arrives right after polling.
> So the solution is to do periodic polling until timeout.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: avoid unnecessary wait for service ready message
      commit: 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


