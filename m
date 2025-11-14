Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB4ECE7AAA
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIlFMtE7+uqEi2dqO5eRBaDzL075sUhviJNTRcYSEtg=; b=Vn3ZLcf2298Ue2
	KYt9lTBBKs+to+EL6pG9eUrUnpX4OVzoDWeXXRRy6yJVF8d4QA0knDUWLiMaDrdrUEqrP6kSKD8Ms
	k21KNe+lRpdHBfApL3F4zbb7V6PVn8rczV10bOpYqmizNRh+4Cwzv8a3jGZBxAnY0LI959x/XbHnK
	E6m2WOe34n5DtfRQIbm+1Atb034Zd2yDNBfs/7VK8HdZpCntmbFXe2x+ZBsG4QXGkyt6bI6fldmNW
	x1SUsJpHvRmf7TnRtFhS7QaE+MthTVySlxU/k8twQXC41S4Z92Ud9oR6T4pbbQq3JCEuUW0HIDkej
	smQHqxTVHDOTL7Li9heA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqwv-0000000BzxV-1Gsw;
	Fri, 14 Nov 2025 10:22:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqws-0000000BzwC-1sw3
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 10:22:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8I6wT1629375
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 10:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uIlFMtE7+uqEi2dqO5eRBa
	DzL075sUhviJNTRcYSEtg=; b=pGxL+MnQF/1UYj0MQNAUqKavZKYwCdgzgnnD5L
	JrYWe7kd9HWeGc7wufPRrNx3RWZSrj+wRFf8ya4vHHI8O74jquUixEC9xRVi9zbz
	wAh3VnXZHW4CxIqrAZPQ1T9XaPxBZq/lWBMfF1ZS2mPOkb+6eiMbU3gAZw6u3Tfk
	NBXUgEM8Hh69vl+CXI1x1ogFwbbxLrYkpV/9NErbAzU/ANNo9xP6VUwkflUViRpK
	ZkG3JdaEavXimsaB8xoqWuEL69FZd1wlDuI5nKDEJydmWeuxnLT5qZInF7GhlXKz
	1Sp0BvvryDCZd2YDXUjI8eZ1idpghST4ZRbTpvE37jB8glkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d9t07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 10:22:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso1694314a12.0
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763115752; x=1763720552; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIlFMtE7+uqEi2dqO5eRBaDzL075sUhviJNTRcYSEtg=;
        b=LUvYsWSbVZGA61v6hIr5nR+UJjyifY4H3TTWxy5NweXnxtKMqYZ3syGVhDLAmE3CRb
         bgKZR7bzLOzfN97dUVZJh2NV+IhT6Azp8N9wy+mmpYvIB4TEQAeHz8uYghdppzvaYe75
         L6PwKxcfucJ6Mogu4F7My3/k+BkS8tWkUHh7xEF5u23aU9SWJmA8POoayqpiYmnpS6xJ
         SbQGO2CZRkzVXVguY0gv6vdzDb2W+9xlsuVDwNSziHqo+eagA1BDI1BbtF61/+KI5cow
         H2tz6Q/p9VaGxXorX1r5M+dmXnIS9l+6+MGOqZHpEbJW6hCN3FhsTdxGwdJ0gPmUFnZv
         BUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115752; x=1763720552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIlFMtE7+uqEi2dqO5eRBaDzL075sUhviJNTRcYSEtg=;
        b=NrF2dDFSU/Uvv+m/Hce308c1TRvpDbAC4HyQ4uifwmz53exL5xdwc/W+lNDDf9KLqW
         pSaPdAUl/jJWFw7wLcMuwveL/TZMohYfQNSKkx0jAdSiw9ygmLgipmri6QTD3/rgv6yo
         t7zhzrqhpxDWFNCu+e26yjZ3CX3Q/VplSdtx8oyuzYNVDSTq396F6wieT5B8VOvkl2JF
         PjDy7+H0AzdMCUl+zrCYQkIDiOw9qkGRxBwl5iCCaxQPNiPrzj/k93Pc23YcJvs3hnIG
         AobBOlhh/+TfHgzpFB/2HfJTInuRwCeOBSxHXal08rwGM0IgmF2S+TE5yuu2bDL/foR1
         AOOw==
X-Forwarded-Encrypted: i=1; AJvYcCWutRlrMDPWl/ZgqbxGmY49j0BKMoXclSyhyVyrCd0KDeJAw30SFC3LQARegTxySYkjZ6coHq8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFgqQDKKFdJOxHs+Mb7H8VoYVcxqLGK9WLvyYZAaf94v6wNDXq
	tYWR2kTZLJ3WI5h4ewdIn0AsrCrCBTTYeXdjHdvQcyI5DMif700oV5y9NDI8oPqS9RBBRC4y4vp
	jcLo0BfGLURhBYVrPoM1ff/XCmpbYnxQ2ocPkFDrzpaX737Hi8rmmZAYA/op7MF02
X-Gm-Gg: ASbGncue4XnlzbeM70HLaEidMJ2sAf2MA/z3glv9O3yahqMDijy4BMt/dZx+AVLWgQZ
	jgj3c1W/UW84dZtFAxmTqplv1rYIkk7qH6MtWwhALhXxzqj71Zp0u3IkX6QHJI5r6H5Fc2/OkQQ
	c/GNzK5/s3dBcsgqDM8ROXO5L4hqSUtmGJ9YHbViDnOIf1d/ROtPhB1lrR+3qPwb5wz2z7sE0fq
	UMGL17eT3ayfhzn+BQND3ImbcnpdKgjDZVKDrrS5IFSv1lcswXcLWA4zsKjPD0MXF5FJKkDW+Dc
	2jY4ks9HOTHXCFrUGpRgDRa2+fcJ+tn9ZKgO8mc5PzNeJN6INqhYDiVM5SaGDMFVvGIjHIQemP5
	+A6QBNqG7+ND2o07zp9v885QruDgH
X-Received: by 2002:a17:902:d48c:b0:297:d764:9866 with SMTP id d9443c01a7336-29867f96635mr38151605ad.18.1763115751667;
        Fri, 14 Nov 2025 02:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDSKi26tdukeeIUa759YbAGm8in+yeMJs9CiwD9zYXP0yERmgL0JB9clxX4ocd5//gfGhRzQ==
X-Received: by 2002:a17:902:d48c:b0:297:d764:9866 with SMTP id d9443c01a7336-29867f96635mr38151365ad.18.1763115751169;
        Fri, 14 Nov 2025 02:22:31 -0800 (PST)
Received: from [192.168.1.102] ([120.60.77.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245edasm50883705ad.27.2025.11.14.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:22:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Date: Fri, 14 Nov 2025 15:52:18 +0530
Message-Id: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANoCF2kC/x3MMQqAMAxA0atIZgM2tCpeRRyiRg1IlbaIIN7d4
 viG/x+IElQidMUDQS6NevgMUxYwbexXQZ2zgSpyxhiLnDa8OCj7hGnckaitnXU1O2ogV2eQRe/
 /2A/v+wETW05hYQAAAA==
X-Change-ID: 20251114-ath-variant-tbl-22865456a527
To: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/PKjIKUfk95DiARFEqBQvQIr6HuYNqBqicJ5GkXt/k=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpFwLen3xdeGzsMaTDYYCd7OIuj1AlYd42t7QKk
 jD2Kk+Aqo+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaRcC3gAKCRBVnxHm/pHO
 9ewcCACmtiz0Gz3fOX7r5tZ+YWRiRMerLpeJA0jPU8AvfSaLdbbEoWDG9cAIv/KiRadqPFBf9Wp
 qjcSQYo4UVxee3OoblE295aPsQb1bKi1Sz1rqFJYQZljeAsf2w1E0WUBn1ZP+MGFAJj03yOrsTK
 xNUKsvXbOlk5iOrRyoa7rAhS2+O45RSL1zuRzBHkE2I00oBW3utGQr7hHUXtsgQP5qfSo8E0O4L
 AY4s3zF0p41qM8JzBD7nxmiacjE0+cRBpYpeoNvN3ii6LSFIifeTht2foBkbpiHbXLjZGCCu+Mw
 DzX/sLR4afzV46gQxlkwGYjZ6Do5PzAvcS39/jToYCd5Zd/U
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: 6fWq7jEVyJmnmjQLaXbrJhovZ_EbEUyU
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=691702e8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=9R49FEQIXN7mQozuOwW6cA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G88tG2J24DvW8zjn4CkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 6fWq7jEVyJmnmjQLaXbrJhovZ_EbEUyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4MiBTYWx0ZWRfX/gWeHQ+U97IN
 0ZhEx72Kx+Qtua6U4p8nRSJfYrbZG3MTrZY2JFIIo8PYlz+IYZjQmS/ZeOGXRu0FA1lIRy36Igv
 qs0fl6031GCEjZJ8pagw2Oz+i938agbB2yFBMgQrLeJxvFXZjgPnVPGFrsHJLQlsayuSYEOZfS/
 8EjV0Dhrt60USVQFUQLoSUExkLhtaA9AkgAgJxe5Rf+GCRNz7l27w9yBskR/NP6mDcHHW0LLVS/
 FbdzQHjbSI/J/CwfQDLF9wO8Z6fib7y7meDVY/DNT/lxnfQMAuJzo5z2OH7f9UwRvsO4tveMuXT
 0BdxNsNODDqQuEzcrTvS1rD/hbRt5mKj/PWFvotHmsWU06HTlQLEEp8XsYssUWSMY+0zl2vu1PW
 Z+jmSQFDnPJcWeaSACO02z2whnLSkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_022234_510083_34FA64C1 
X-CRM114-Status: GOOD (  13.71  )
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

This series aims to deprecate the usage of "qcom,*calibration-variant"
devicetree property to select the calibration variant for the WLAN devices. This
is necessary for WLAN devices connected using PCI bus, as hardcoding the device
specific information in PCI devicetree node causes the node to be updated every
time when a new device variant is attached to the PCI slot. This approach is not
scalable and causes bad user experience.

So to avoid relying on the "qcom,*calibration-variant" property, this series
introduces a new static calibration variant table based lookup. The newly
introduced helper, ath_get_calib_variant() will parse the model name from
devicetree and use it to do the variant lookup during runtime. The
ath_calib_variant_table[] will hold all the model and calibration variant
entries for the supported devices.

Going forward, new entries will be added to this table to support calibration
variants.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (2):
      wifi: ath: Use static calibration variant table for devicetree platforms
      dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property

 .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
 drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.c             |  5 ++
 drivers/net/wireless/ath/ath11k/core.c             |  7 ++
 8 files changed, 115 insertions(+), 8 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251114-ath-variant-tbl-22865456a527

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


