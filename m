Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA882606A31A
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UqCNRMxT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHuuh9HF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwjYKm53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=; b=UqCNRMxTmmgmchPLzhbJSD1n9C
	jW0J1ymQd3GhnAraO9T92keQsukBDhRQP9T4XlgTA466eYCTBvewpKFzNvfyeXIOHNO5JBtuok3k8
	hajwvPtl86by6tATrgxsNu3kxSoU0H3GKXH6pt08xfdef6x2722hCUy5Umvx0yK4AhXEy6bEnVCw4
	jnlCxQl+YgXKjkxujAnbZSPB4xVD+vkehqje19Qe0WiWxlUdkVnvOUVU2e2nVwANvNI2NsYvG4e6x
	M8koEPRGtoz9mOb0aseVtD8OD4bQ44ftnHwz0Ac9qMxJwQPf0huI1SK9E8H5iuznncXJoWGkuAM10
	v+istM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQR-0000000Bzka-0n7j;
	Fri, 30 Oct 2026 15:21:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoQN-0000000Bzj4-26b6
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 15:21:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER6wu346859
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 15:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sAULQRVnF5facmSRXEx8W6
	ksib0roSTKYLXWqipFzIg=; b=nHuuh9HFhLxMhwHt4xA8chCA70DCE/32ugMEm3
	eaUWtWiNkMveqs/Cg+hbRSfni2r+o6TadpI5WM+ZhtOjq+WUaZQuOG/0milJaXmm
	saW4g+gM97op/5RjobqAHxeoFqNs6Ga6Dz+CntC98ihAVrtaIHBeXDcZxa3Pufq7
	NGd9veSKkgrRMqUCYdoUqFhNEQP6CRSofK5vdCx2Pka4NnQqwdHwcUF3rpOSa/8j
	EivXRYoKl54oViKKMVVdot9FKPRfFMmjN4PKFGnPN+BEhAdXi5jvmmEpFurCwyEn
	kB6HKF/ED6ihac+MWrUPv474hveSowFZzdUkryWuomFz6AKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rkte2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 15:21:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so9082655ad.2
        for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373706; x=1793978506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=cwjYKm53cCm/L4A0Uu/PSR0fQut3YyjYYa2lCh40742DQ7xSnpe7Ehw52RPaxstBKz
         TXJWna+S33vw23lnLRtAdrraq1sm9EDD+Wofs6APsnl+P9huH7CYW216AIN8V315/2QV
         CsaiV7KAST6U2c3+5C5MypNkmAWt6jowdua8S9ahmULk+HwNhqoC0dETSqEJWEISfUcX
         1BppxaPSg1VRpAL8/ygo39PGCwlImhOmuyqpor4Wj5Z61+Lke8GJSJl/SQn7ge0P9M5L
         Uy10K4CMv2jYCJtGVm06XqAi+sMxHURYtqQOjriApD3E2w/ffo8NqNZc3Sq0qIWCZ0xq
         4vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373706; x=1793978506;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=PKLaIeql27Xm607AFCKm8sH/pJfbI5Uh0jSnrX/pWr5oK38bfwWx5ONhgH9dK3GvG8
         xBVrmBGFeRgb0k4xzUi4zRitV2vB9MDjSeI3302zJ9bhyGlm0J+c+frQVb7UQmJrTjqL
         CU+djncusH6nzI9lJaJ/obuNz1rNlhydMBVL+hW4IzMWxKNhwI4tD7lNy6/xXJV+5IcN
         +RhE6iV0o/w9X5fMy5xV4IG5TPWorgi3NcIiGqQA02AnzCq20P3Nbq0n7GRupv+UqzZh
         T5GeUnKLS5WKrmEc3gucFWAoxX1XvzIIXr+/9xgtYpbxW7lOOyVH+S8qjrDUbelSmgCh
         /IUw==
X-Forwarded-Encrypted: i=1; AKwUvBz6VLClFqwhDnBrGQ5YCfDXfFjeZrQy+3StZ5frm9bMrJNUQIETdb/ZJ09TXqH2PZD/eAtubds=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPhJmsqbuVOa6XEVri6+aR0d6Xe9oE4ihnAJhBNxwm+3FI6x8L
	Ojt59m8RPzb2f1IFBsLSq630keuWq6hDCTeSdr541YxtT4yeJPEx3u3E1KlKuPFrLmgaNvKU+vU
	6KJtMCqClOmdtHEIaB7kODMoT/Fkwdrzt7YjWY1mGFgyBi1iG5wlNOZR5As0n1eyyuARR9Mss
X-Gm-Gg: AYBFou2qj4dFKUEs5Yenkc7qSicUZcKS6ZsWyDgCyQBP/TAjzNXYesuWsJtl43JIltN
	5QZErpViflAvUH+/k5psDg86lZKpa5n7wMrbSF76RaHHohueaJW5OAxYGJg7DC21PMECXwwXKe0
	6xB5zEUQD7Ux+bsz9eGW9/Gk5uITqG+ARnCbpX3InEkc82q+wIkkDTU9JHdlbI2KfqXExQ5wzbf
	b3ycl/sLDdFJCosHuvro5ULTe7T28xgPiHb22prKqhECDcPCW8SqsbfrgpxDfeWgUc6j3oooXVH
	CXq2DRfsuBiUkFOSDxjVB6S9zFfbHUU3CKuaYCnbMtb5srFrfxEIxnE7FfG+S20mcAYlifk9ETE
	IpUNQCqlynZ2KMi7wBX+7H4RDgDHcZdRURONTFKwKXLIfddPKG1Tvl8KBsbcH7lgUQuFnAjmTZc
	Oi6M23Amh8
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900255ad.6.1793373706207;
        Fri, 30 Oct 2026 08:21:46 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900015ad.6.1793373705552;
        Fri, 30 Oct 2026 08:21:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm8905895ad.62.2026.10.30.08.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:21:44 -0700 (PDT)
Message-ID: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:21:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261029
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8vhDWvBtj3c9F6gPXmSBbV1rxROcHc02
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX7XDT8qmskx+z
 ORlRbysJCSfS1zOFVbCUNvwaMifedORVtaE0lq2/BJkY1GOMaWU7tI7JtFBn1ad8oLpM1bPlEiK
 vS3iGHS3lueEL7B1e4nqyiL37lD/Rk8=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4b60a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=qW8f3ulzRhYlp-s60KwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXydbc0fyBBr63
 jmehwYFmAmRkCTwvqIHvb+yuoFbZbSnKw/4ddJS4DKFAdaEyGO9Ir1o5jKHc5CNRdtvnxPTw367
 tPbpGtUbf8CPr47GAARNnIDgYi2RvLdafNA2rWLncs0yhqprHXEw59CFYDGo6hxpbUTQi8IJ5D9
 UWFnpmhjF1CuXboc56clCXyYlb/T9RJGz49pKPhFhZYkola2CyzQVQFQbp+p8a/ykw5C6nL4Fxp
 HqCyTSskvxYcAsQTr1mPM+BmBd7kxYwaKKPzmFb4Jp7mNpoPTcYrA2yvWP2KkEIEQ3K/5RBdbKb
 7mvZCv8zctAv11zmOkGpVOSiZCCccf/4c17ziZtiGJ/Ji1scgppSr/DEdQ5esE2U4hBI1Zk/HeR
 rZ2AkNQTq7mbr26vKaVlgduNSMIBB93JNlE+VFNd/HcM/Ba9YkjWSYivsQAPeuh0fIkrfSMvPgW
 mWmmb71xhoounnGTnKg==
X-Proofpoint-GUID: 8vhDWvBtj3c9F6gPXmSBbV1rxROcHc02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082147_550791_B73C675A 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k and ath12k.

For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit bcf20866cf559c19e6f33b10266fde45013e60b6:

  Merge branch 'rubikpi3-adsp-00256.2' into 'main' (2026-10-29 13:06:16 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261029

for you to fetch changes up to 173aced9dec7af5541d50ad771b5578927426776:

  ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 (2026-10-30 08:08:40 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

 WHENCE                                 |    4 +
 ath11k/QCA2066/hw2.1/board-2.bin       |  Bin 745440 -> 865704 bytes
 ath11k/QCA2066/hw2.1/nfa725/Notice.txt | 3658 ++++++++++++++++++++++++++++++++
 ath11k/QCA2066/hw2.1/nfa725/amss.bin   |  Bin 0 -> 5140480 bytes
 ath11k/QCA2066/hw2.1/nfa725/m3.bin     |  Bin 0 -> 266684 bytes
 5 files changed, 3662 insertions(+)
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/Notice.txt
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/amss.bin
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/m3.bin

