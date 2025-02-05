Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA8EC02198
	for <ath10k@archiver.kernel.org>; Wed,  5 Feb 2025 19:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U89NaUs2hFzdVum9QFeTZvvj2h4vjXk6YXjDwpodyZg=; b=4h3jKKWiB9PtGWlz5fgig4ebxk
	YFaAxTqT4eoxXyK/xcrvheI7Ri6bjiq6XBBAB7WHp0mV7pyJtHK6zYd4e8PUD4w6d9E6w/YpUHVDJ
	qpwyPHTydojxhOJf/zYDErUBVxQwEIovU/jRJ/l9H4pVYqAjIgTKtHCHxNwcMPTwQ4ueTScVF4GC8
	6awlBlWbr6ki1GZfGvLFWXr/wHfdAb41K5QS/1UMQqCuPq0RZHNKwA3m7EbzhRwJG+O1o6UFBpabq
	e46EDwjEP9sSQyle1vE3Xlma/LqALWEZoLBd5spGf1/MuRdZ5tkPuTv0RE/FUrc5j7Azvm7eM7/Qa
	kxZyWp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflIG-00000004RVx-3C8Y;
	Wed, 05 Feb 2025 19:42:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflID-00000004RUp-2G4i
	for ath10k@lists.infradead.org;
	Wed, 05 Feb 2025 19:42:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Gr9F3030476
	for <ath10k@lists.infradead.org>; Wed, 5 Feb 2025 19:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U89NaUs2hFzdVum9QFeTZv
	vj2h4vjXk6YXjDwpodyZg=; b=gOBngM1UmtXsNXEgRTgC+F06435D+fmXvuvhZK
	6msXg54TYygMRm75x1lriXI+4G/0VcAgmoDI0BeqoBMBEkAn4j1hpfZkKeDsjyIW
	Ed0ry1jEi3QHzL2Tk0Z4ALS699NpnJD9QyTVx5EtjtAi/7A/Dgs0lVuhULe4ajaB
	k1y45DqI1cgWdfhtcpAs/aohoWnxYRFR5KpnPrZBuaZ1HVvYH1LD+2he+bR5qm5Z
	wWNyQu6mxHI9Z41yGvYeT96wbO+3G1y9bLD+UugXJjdJw14LiBPg8gJ9aRDFesaf
	ULLReFsySSU1iQ9nn1QzRH5dvBIuLfJZ5oKukQKj8glv5x6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mbw48dse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 05 Feb 2025 19:42:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f9bf2d1c7eso138341a91.1
        for <ath10k@lists.infradead.org>; Wed, 05 Feb 2025 11:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738784555; x=1739389355;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U89NaUs2hFzdVum9QFeTZvvj2h4vjXk6YXjDwpodyZg=;
        b=PPS0G5sN+zLlVYA+eAgcMjmPq5FeM36yfpQlf3XLzPxXHetRDtItw51zJttbRT50lg
         65UKlZHqIo0ywHwazvIvc5OhYcoe0FeJfoGTMiZ2ZBoXyJeFOYiWNjDuSy8i4c8swu2T
         AcUiAbachY545Ta5Qb6XROJIJD+P2wvYRqsxgxEq3HJV6SdtaZ3UdR8FS5G8ghP+Ra9a
         ZitjpyMX9qUlcVWLsOiX1jt5rKLpg7vaumI704GAzCBIdsX1qDqzoI0GedMSx9KyJST2
         FLALrb0uFmSpo0veKJFG46F3CX3/SI+TQoc7cKIMAVJHvQHOS8QMzMCLA9l5KQwAGv9c
         Umzw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Fbx9zhtqTTVGzjJ97zaKCgxttDOpZKo+pItQ3uMw7FYJDlvalpSo4uoYTC0PS8fXD9ahWOg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyluRo86Vnh59yfYg5bcziUIpdLHtI+uGECPCF0lZ3+FJCRjGjm
	khhyu8JJnKiM15Nqn4kWdHxfcvrQd5dqg8mCVgFa9r98iIt+oLNR0lIbhLoVZHpHL9sGhAPQDFl
	kJCRdQWmfsS70fw2cdTzL4j7KJYOwo8/qksYroxU5k3M1SghhztT4u7U7FIZb
X-Gm-Gg: ASbGncu/mKptF0u8TFb168N0sjhAHR+um4r4Wtijrp3ZsyEjzdOidN2Hzs9rcWT9iFT
	JKeKr9TSwX1cizDdEtfOALhVbVTDTxKwQlXsHyJEtMku79Mi+pKF/e52LQCKqGrItcTP1hC3tcC
	cyEppHJRajRMms95HL7KAwhVefru0AgEko2s9ffupSZoV2JY365Aq24yCZABFnipLZ4aHWBUDVy
	d/6HUM01b1XXG24vLig+R1Jd9yqxWmz+o9suRLwqQtlp7SaKJ1fg9Trh7HHoexAvcMj3y2Pdfka
	CKMzR/9YQUvrabrF+shXXHZiqbibS+qgDNDgWF7ciUwr4sNUcikdDcnkVFZV
X-Received: by 2002:a17:90b:52c7:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2f9e07846b9mr6703873a91.15.1738784555054;
        Wed, 05 Feb 2025 11:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF940SS5ltAjpQDKtK9E1zhSwIPpVcHL52+Reu9zJb0T1PN07OyPNgW0Um7KDFL1mJymnS5dQ==
X-Received: by 2002:a17:90b:52c7:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2f9e07846b9mr6703834a91.15.1738784554649;
        Wed, 05 Feb 2025 11:42:34 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d89b9csm1978812a91.27.2025.02.05.11.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 11:42:34 -0800 (PST)
Message-ID: <9be8cab2-02d0-40d2-b69f-7cb3095249a9@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 11:42:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PULL linux-firmware] ath11k and ath12k firmware 20250205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: foG3r0otpoHuxLjoqlo4JrJa9cnj-hFi
X-Proofpoint-ORIG-GUID: foG3r0otpoHuxLjoqlo4JrJa9cnj-hFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=945 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_114237_732056_6FB9544D 
X-CRM114-Status: GOOD (  13.02  )
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
Here's a new pull request for ath11k and ath12k.
This includes new ath11k support for QCA6698AQ, updated ath11k board support
for the Qualcomm Robotics RB3 gen2 platform [1], and some board and firmware
upgrades for other ath11k and ath12k hardware.

Please let me know if there are any problems.

/jeff

[1] https://msgid.link/CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com

The following changes since commit 7ac1fc5f254d8d97a1aa96360c23f0659addb047:

  Merge branch 'make-deb-fix-no-such-file-error' into 'main' (2025-02-04 12:31:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250205

for you to fetch changes up to 99720d02248f775f952a97455ea3b3a687196a50:

  ath12k: WCN7850 hw2.0: update board-2.bin (2025-02-05 11:26:43 -0800)

----------------------------------------------------------------
Jeff Johnson (12):
      ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-02409-QCAHKSWPL_SILICONZ-1
      ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
      ath11k: QCA6390 hw2.0: update board-2.bin
      ath11k: QCA6698AQ hw2.1: add board-2.bin
      ath11k: QCA6698AQ hw2.1: add to WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6750 hw1.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |   15 +-
 ath11k/IPQ6018/hw1.0/Notice.txt     |  419 ++--
 ath11k/IPQ6018/hw1.0/m3_fw.b01      |  Bin 6712 -> 6712 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.mdt      |  Bin 6860 -> 6860 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b00      |  Bin 340 -> 340 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b01      |  Bin 7000 -> 7000 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b03      |  Bin 2602320 -> 2606416 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b04      |  Bin 386016 -> 386528 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b05      |  Bin 202532 -> 202532 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b07      |  Bin 9912 -> 9912 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b08      |  Bin 464564 -> 467388 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.mdt      |  Bin 7340 -> 7340 bytes
 ath11k/IPQ8074/hw2.0/Notice.txt     |  419 ++--
 ath11k/IPQ8074/hw2.0/m3_fw.b01      |  Bin 136 -> 136 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.b02      |  Bin 327680 -> 327680 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.mdt      |  Bin 284 -> 284 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b00      |  Bin 340 -> 340 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b01      |  Bin 328 -> 328 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b03      |  Bin 2978704 -> 3215248 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b04      |  Bin 982944 -> 1000480 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b05      |  Bin 248260 -> 254596 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b07      |  Bin 10112 -> 9960 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b08      |  Bin 504104 -> 596768 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.mdt      |  Bin 668 -> 668 bytes
 ath11k/QCA2066/hw2.1/amss.bin       |  Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    |  Bin 685144 -> 685144 bytes
 ath11k/QCA6390/hw2.0/board-2.bin    |  Bin 115984 -> 173980 bytes
 ath11k/QCA6698AQ/hw2.1/Notice.txt   | 3658 +++++++++++++++++++++++++++++++++++
 ath11k/QCA6698AQ/hw2.1/amss.bin     |  Bin 0 -> 5132288 bytes
 ath11k/QCA6698AQ/hw2.1/board-2.bin  |  Bin 0 -> 866120 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin       |  Bin 0 -> 266684 bytes
 ath11k/QCN9074/hw1.0/Notice.txt     |  419 ++--
 ath11k/QCN9074/hw1.0/amss.bin       |  Bin 3963336 -> 4227408 bytes
 ath11k/QCN9074/hw1.0/m3.bin         |  Bin 340108 -> 340108 bytes
 ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 843548 -> 927980 bytes
 ath12k/QCN9274/hw2.0/board-2.bin    |  Bin 292160 -> 1308544 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin |  Bin 15224888 -> 15392824 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 1897968 -> 1986952 bytes
 40 files changed, 4136 insertions(+), 794 deletions(-)
 create mode 100644 ath11k/QCA6698AQ/hw2.1/Notice.txt
 create mode 100644 ath11k/QCA6698AQ/hw2.1/amss.bin
 create mode 100644 ath11k/QCA6698AQ/hw2.1/board-2.bin
 create mode 100644 ath11k/QCA6698AQ/hw2.1/m3.bin

