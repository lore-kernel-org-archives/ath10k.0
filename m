Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B48C982ED
	for <ath10k@archiver.kernel.org>; Mon, 21 Sep 2026 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=; b=iFboSx7ibrMgEnnl/rFjzDWZTd
	cde1D0oXN1pumNL85uksUvXTMTxdXA8zY2lSMYSEcGdvlEym3uzeFVnitGknM4IvrHNcueZIXgIEV
	Fv+SFzKm+ufmW9upTdBOXckPPedEno630YzIYZiiQP4dlyVpPFTuC77bGXRLK7pkEg1UMXMSa2xbz
	5b3cDe7JH9UPxVP7OOExfWNrkpwZYm6x/1ZbtHVPA0eKQy7tcKD9gPs/cmdCwvklpcgnV5M+/BA/L
	8MTtLm8pLSWIxd7xc09LITFOBxhz4pzngI/JwScbwH2L17fhAO+Ez6k7nEQPrsku+MDZVXHRTjKFc
	m4g8eqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jDd-00000003BfO-1kwZ;
	Mon, 21 Sep 2026 18:58:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jDa-00000003Be0-25Vg
	for ath10k@bombadil.infradead.org;
	Mon, 21 Sep 2026 18:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=; b=ZfumSuAUgDXlEiz3JW8vJnlyJs
	qbXDJYZSDnKDerwSs5gpM8xP2lfasLgQ52KwgILki1DbFoyMOsfiqCOzJ9QHClCWCc2C4hCEFHhEz
	vRsryDGJ9qM6ycoeJlmW/KGTNKt7QwwLwuk3VeJPW8rW+lzFiDujV3hlXLl6AP9pmf8XnP+sOUKFA
	TuwsBGed2ctMQ5wF01EpiOSyL9VpCAJA6WCQTPgLY7d5Qqxt/4nIBS+5ABiDf2pEmIZ47v02abBAC
	y7WCVUQHdGdp01yzdmWZzhqURraTipoWuc6W8Pwm+9318B2fW1NFGTcTz4eD+K06k/0uWmVLbBGgE
	DuJw7RXQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8jDX-0000000CiDn-0mpj
	for ath10k@lists.infradead.org;
	Mon, 21 Sep 2026 18:58:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNBgs1313595
	for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 18:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uUXkYzIUsHG+2keQKojwyw
	n4Tl5BjL8Kz4nL3lPB3pM=; b=cjmgIUGCxQa56erxyQBavuIbHcWHKDZ+Gy4C55
	a2f/Te4QnMEcd+E9MIEYYLfZvirzvgJFbOeJCXprsFBiVRNsF0hkilpnwuxQrGrd
	JZGk6G/3WNEn8hY2HKYYoFqKa3g0aquIKeYjcSxPhx/CBx+UnaDh2KxBorO8e0jV
	B2X9QVjF6G9w7fsjb8ybyyV8ZI7yDW8UXEEZ1O54ubymAILozlqcbx2ArKnhWqR0
	RwYCOK2pY3pUavF0HlxZaPOx2sZz16PgeX1aSs7TKIPzb/ieQEdd0YK+kfmPiHFc
	QWaFrs5pcy/kIqLGGSr5JfmEGgeSejS2wkf1Ay6ZqG4DVK/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerc7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 18:58:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4868347a12.2
        for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017094; x=1790621894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=AgMZXkeKS3nCHRDuFTBLByw0fjQh6HP4vd0LB/rl0INbfvCEe29dCI2KOgjJZiAXU3
         wIsMAMIdM0Rza1rpRtwm8AG7wuUB1VwhIAdapzE68SXfSN3mBWyM4GXa7HAPFaf12msp
         YTWww/O/A0Kygmay2WnvXCB2jh0rt14BzkqkLqNQb3sUyq7BU/hfWZtx/sZ4Mc18soV0
         nywoWtiUr9bV+cBoYQw6Qid46mEJ4bYdzU89TskCCRR/f1dDTNnumIsjc9dk/s5qge6b
         xTKgpxiszR7NnvI3pW8/z2EDDaqbYZ7Ri9eraY6injT9apXjDDkVCmvpk4wMyjXf43Oa
         dkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017094; x=1790621894;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=ht5vLd2jD5ihowXhsIme1I7HR10vOkgbxOmYhc/VdJ7JMH9XVLVmv4f8bkTyWwrUto
         W4OENZ2Fx27QP2z4eSy44j0HDAfIvQiUXH2dcMSqpbAclVTscor8va8zqoor5sxp7jUO
         AaL2vOZabBSkn6Gsf+M5J2cqsfyoGE4Tz8mrhSU0LdG1VoVkgWfNaHuFYG7+MQfK2n/8
         6jacFL/AITDx4dCwhumjOIpJaQbwa7ok1BVKHccDzCUFofpjj0gNnsmvET2pN2gehQCg
         NYsWDt6NcZkwfDW9aq9IiwYJNCuDXOD5rOfdE7zMDdavYBcvrrtesqRFm1yXM1bUdxSD
         UmWw==
X-Forwarded-Encrypted: i=1; AKwUvByjB9/uhQB5lwiTilTi9w7+9iRV8cvI4ozLwq/FcnJYKf94kzLCswElozFrHaP7k91BDvGmes8=@lists.infradead.org
X-Gm-Message-State: AFuF++mBiAsHtWjtbxcybjf3+ItmWeO7lqlk01Gv5YXfP//dWXBPabOl
	ApHDG0CLD2+Ww9mZRj671y3V1Q6R6tXKLLyycAqEdBl147XZ/cqRT+PUa0FU6aZON2wz3mhQn8i
	Y2x8tmu3+PWxr+HrtIndvkpZ7HJpW2T2f5oOHbUHQS+Xbejr+unUUd/fTWjPL1SM2
X-Gm-Gg: AYBFou3nIBg3FBQEtN5EJxcAylqjSRdtuYwDoCAlfAkb4vyB6Eg+cH5SVU/v70cEgZH
	D1SbosSM7VlugnuN6FCpgt33JDfOF2YCnpVNiuz6oIjp0Fs5R8gHhYyWxifdbF5FB9VGA//+lxI
	0T8yGn+Uo+Nj76TcJJlHFyqY4J3RWEtoFp3eI4iZNECx6XK+p7273jwHyE3oWdULmlNaP7rY4pS
	Opb2Qplwvzob2juKcznlsZ0rtao+S+fPWuuIoQ+r6BxNnP9AL2hIhjPtQdoyHZioj7DVbkieT/F
	NMnk28y4Dz9qM3yrx6ycw+IG4w1aCxxv1XBWVFHxqL8Y4IvZAeD7b11cErBNyMHaCVsXWDX5EO1
	5RGsqFIshpoMEQcy1vdY0ikEfG3LWm22hGas=
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267310637.40.1790017093662;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267268637.40.1790017093097;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248fsm11523188c88.1.2026.09.21.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:58:12 -0700 (PDT)
Message-ID: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 59PqRT3xJWCEDViQOpMvYOn2qD4DKptg
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab17e46 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=E4bmoj0mVIXTqPrLO-AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 59PqRT3xJWCEDViQOpMvYOn2qD4DKptg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfXxX3uAOZxn++D
 2Njpu9FkTN0+x5MDDtp4Y1He/00IVx1sLTADPIMipaQqxNmIb+A0aBovdXO0yvJqRIt+7mMhvKy
 pJQ1w4T072+P5ervDcT4aGvsa2oPSz4adeiWHfkOTgYL3+9pjhUCaV4vpgpcvCEn8pMzgaZ+cdf
 sfcQ+4uejBlKdZLeV3mbxjyr2Sv/rN/7kmhHIN8oUm4Ii0HTHFiMQrhzatymkpb7tACmW4eavHQ
 +6XD1Ufxxex3K7ggznDl4x2pNjJ+/AWQisZKxpMc4q0ybzR0uiluo8xZ5v/QREvtPD8qliVMHT4
 ih7GfqxWN/sK8UhCSiWd2HLi+EDmVYKzExfvTroebwtuU7Kk8z6EITBGuv5vwWXZ+ZkTmt4iEEC
 cEI14QHR6RpUtmCrChpqECWsUSdcqwGCDprmTyRcJEyEuMP04CnxuBbwi9iSm53mYjjg59qZrZu
 oGUZfwYyRrbdYZ9hBlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX0NbWVFnOmtW3
 WzYxAon/VZ0R7MOzFXOJ6WC8uZIOYrB+XAnLeLnpCwck2SFwBhNqvATn/73BtfSLlbaMdOAXBvk
 TbmnPHzkknYQv09oZjqApIsRaKsxhSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_195819_642496_CDCDAFC3 
X-CRM114-Status: GOOD (  10.19  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there are two board updates:
QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5e0:

  Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260921

for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath12k: QCC2072 hw1.0: update board-2.bin
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

