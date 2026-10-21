Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18502606A31A
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AOUD91x3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOWqC6+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=; b=AOUD91x3AxXY6Is7L8OqJ4L7Z8
	dU+kuYBRgucv1HrrTN2ktHqk3rs2wKF9mV+xhGT54hxp1gEwc29wjTegAgr6topig2VzstdEKaopy
	jfsPbjvCP7OJ9lcQhRBm0YO0/Fq2ZqZf8UYv4FJNqzGrRqK45Xbk9cF+SwN7xaoKx2XKZ2WXrX76m
	dLuYnGY641MqTewXxWvxb3z7NxtM+pM/OhEbELAbLdmmbTtx0J1hLLIy4+0rgUE2xT3DR5VciGus7
	NodohvyC16ZQfd5Jwn1bFf9sQzE0CcC3A7kjjhv0rb+Yzwwom5pC6cV+Z8M0rNMxsg7BeJqhhzFk0
	EMWpCQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCq-0000000CQ1U-3Aw7;
	Wed, 21 Oct 2026 16:30:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCo-0000000CQ0S-2CtZ
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 16:30:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUAr34158961
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tlGZKGlDFlSxsOTfMCF1bM
	EShPw4Brtj/kvvPvd5sbU=; b=k9kKQk30PUdLl8ArJ8roU9rVGZsUL1RO7QsJ6g
	ibh9aMHMuoBPsgbxArYJ27WZ9Lqa7wCmj5wPMERpZGXfdC6IUW/NWKFO17jieEz5
	sI0n6UQfSz9gN0jsOwLkNk8za2ylYUkFD3CCu8grAojXmaAmK3TgUZ1/QUZNLoOL
	vP6euYLIeP+f3mNiN4oDMxJiEvkOgq49Uz1jQ86ScJLBXifSDnpJZXJ7ZvlpXLFD
	3KDt6Hw8Ckg+rOpOn6KqBV8+Rnbr7K2rws0Ga73hVFuRiboaMVf0UNgySz/LUf0h
	YFb4WvFf6KFfLhEOnKTbiKb9+Pi/O2aiJEa9Tp2Vc6KJVnkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8v3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso27906a91.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600219; x=1793205019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=kOWqC6+BowmalGvuIFtGeJbI2BOP2kYqPHGZrHM/5eP+j8j76k2VmPqhodYsuXDCR6
         CxKN1YA0VuEFIvFHkXkabzlhCvw2xh8+OMwRL2AxDEjHFYUkip+xnBQWwy/lnQUagWX8
         9RfXiluDMKniar1Wp0zZQHbK4Qx9xDWPfOkUdQpVzACd/EXtCnYapQuzEXG5HfYXJayC
         lOf39DM4q9bNmhcCf7v6xuNBikEsmD6SVQj7UxJ1dgvRCp9R2CqdpoJjHJKEafIATOjt
         WsFdHjhnsoMGtD2dvi460tseefmDvGNPdOwteArtFLvaLFX4paC096i7Y7prfQqoOUyo
         xecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600219; x=1793205019;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=YP2kreXMjMr6QFWqqa1JAdy/ZajZPysAZYxqmmFrkvn5tP4SgZx67YwuFNU37CKW5H
         WXxTuqmPS3MsVNj8qmEAK6opvVGGBkLu/M14S/5SRrwB+eTFoLrxPkuAwBGnYVqygbS4
         2P1AdrHhcIfsjjZXrcmC3DHqRelmbdqMgCiWNcZGc0Z07ubhVetWE1RXNNmqY+nHCARQ
         X5sKbwBzDgyh1Tmfgp6J7ld7fRI9Zf65wZ0DZRD9DALSjTZUMZZcb8n81Zqjb6zGA/cp
         o78z9SWpd7fM00+vQJChz1F3M1mWXKXwWzabFGe5MBl1gMznt3QezVwkpLHT1mKgWKjx
         FEuw==
X-Forwarded-Encrypted: i=1; AKwUvBwzwfuTEYqSrj6gsUYn+rKJ2C4ULjMMLM/5wPWrFqdauq8Cgr7TCYZqRQ7jze1uz6GfxLDvXq8=@lists.infradead.org
X-Gm-Message-State: AFq9FYI4w7W1Fjs50+T6m7rpWXG2hUMlKHlndu0h4UAOgrVoSegaOmUs
	fSxg2nNcK+tPJL6M+NOCpikKHQaoh1aQY4kb72iuIZtOSCwUpGSLtdiwt0m/e3Dhh2RxxkXDo0g
	/1k5hlgJhW72nZcjtejVHUMhL6vjG5x6FJ9ze5oR6GaF/1EiwpG0Y7B5ffhnqO4rS
X-Gm-Gg: AYBFou13dPOuZm2jy3FlsrH4oL+gzjhf4gK00Qi0LAClBHgcz55n6R6UfVbrGn/H0Ls
	HNOUk8FiP0jr/sV8MN5xmbIKR8L5lvrdMVXVX9P86vQQCyZTuFFBusuve4ZAqStdUY6JBdDH4ug
	F+mygn6gx5T4E7rvBaPA/0wHPtQ6p463rlH3WC9Y3THoRi3I5GJCB9VVvHFW4gZ4NhYiCSp0fDx
	Mb7XK33n6oIoKM5Zgs0e/dCfWMJk4vCkTFtzoLuNfDH2dB3dfFU5zUvmU8ZUR6Sl+l4zZrJRxjJ
	YbWAd+/o3zSrrMKzrIeHssM0akFppZznC8C4UxDOfwJ7PdzNNThvX88EBTGocvfwL7SrB+wuSzL
	cQjRpAWbfRLzvHlbFf6c+4pA7fldMwv3T3gel
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499982a91.3.1792600219339;
        Wed, 21 Oct 2026 09:30:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499969a91.3.1792600218678;
        Wed, 21 Oct 2026 09:30:18 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm157338a91.17.2026.10.21.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:30:17 -0700 (PDT)
Message-ID: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:30:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261021
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX7zDHVC6OrEIu
 kXd55c7iM3DR+ilK1CPIkZxAcVT1U9Udz0AkEzGCj2g5M4Zoj53GpICmQ74qrmJ38Z1zeIAAlF4
 CgQj9dJn6T5f+rMea6h0iGj81akE18c=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8e89c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: buI9ijVDHANLGCwF9U4h1vJP2oOkTs8L
X-Proofpoint-ORIG-GUID: buI9ijVDHANLGCwF9U4h1vJP2oOkTs8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX2HbDvfftG63W
 nooebqqpAzPo7p1/oyO7l4jllyNw2ogxPbHF4yWqWVMSJfsyCmci/CS8IxdllrVd05RQPC6bHKB
 +YvjKl6Sl1fKRSiGMDGSQcbmYZ8U7vWOw6qp3BPF6kbdBSypABK0eZHha1+nxZebyFCGgCnPif1
 YrAeqOfud/dAz2lobzZ4UETsraXsBC8uMzwqLhdpFWBDLwAPJkwrd4eXQiNTwD98PlaJYdwrudN
 Z6eCq59aB75p4jBuVSI6tjAL0SdYDaiKT3AI4f76CMzjiNnZyAVEds3R3kphTHphWm9Yi9k7cLj
 IgNVZ30Hj71LH1Us7nLgjoahE+QyVIQkF0uE9ljHFTfkCZbsENDRWypuILkrWZgMLWkeBswPWpf
 /oYITxw2nRBzvnvrq/2zqemVeLj9sJJ/Kc+lLcyqQYVHQlpDRhdL2WCMeVMbFNpAElEWwVXzYaJ
 2Aje5bL2ObhZirj379Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093022_679849_ABA74E55 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 59f9fc2ef8d1e312d2a613d4e1ffad2ff31a0a01:

  Merge branch 'qcom-fw-version-qca-path' into 'main' (2026-10-21 14:46:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261021

for you to fetch changes up to 0c5fbfd280e21e243f5956a0823cdf958839ebe3:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-21 09:16:32 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

