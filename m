Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BC4C71134
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=; b=Do7OBwQbivOugo7jLYO6wTKJQD
	MmQGO7qpDAx+U+s1yjJSJenFIsVnSLgBThEcS8vw6kvgxQYLaLiTpi+RswDqjxIIMAj8Gb/LTAlju
	pdl7jP7quKEKZbpj25u7J07aDNH5ZToEzL4tKsv5wez7caAhTYKF2O88BPdBLxrlcPPV0JbNGSGj3
	+B/uJCjHvNoxZ2xBnxUaRxfiY0KpZZbuaoKtkeUdai4WTSCyQPLf1HfnmfDR8eKzOhd7I5WvXwBE+
	ledktdDiLt99aRn9U1qg1P1Ra9q1/vANjwp2rJ7hxZot5T1kw6w2KTvhcU4szFR68/3WUVrMSTF16
	IMe37FDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYQ-0000000B4Fj-3roo;
	Wed, 11 Jun 2025 19:56:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5U-0000000AZ8l-1ASS
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGml026050
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=; b=E+UlaHD+abXN/FqV
	KGu70ycRKjIcsBjDL9u1b9B38gQfKZI23A1mdIIdm7HDI2wckVfqiXQnIR2dPtVO
	K4elVVlWcNt1Mpg0THT2y+fTQGgT1RjDqph4a/QqfjwxLDe97URcD/19lnMG8zjI
	pe1yml7lh0QT842Ubjm3JgmlbyBwTiDdTJj8kVBTdnTGR5FqUmb7CustPBjixSN7
	yeRJi/iMDQiQbD83PQEmpugOl+WA3aGnpqPvEJfyQv0aI1MNJtRrHD617lEC39a+
	0rZbTFvC8qDG4t2gaG4c2xpYjrCDIglRhw62yjhYaU5hZK64MvOj4WYjGB2BRS1c
	DELFsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y8ed8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so21983b3a.3
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658443; x=1750263243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=;
        b=JuSPb3U7ayDJ49vjrrmg8VNTXGGw7up47inraevS4GxM/cLI5MdTs9tKuA/xQDTCIC
         9OxuJLKQC17P2w8LHTXeM8CILVsukOza0+vbxkds7NiGSGsTS1/bLxt7fQUjxddLBDwL
         i1wM30nKtcBaQ+60ovQESx8Nr0y/r9DGnggBj/3LHzfT/u2Ko1YcBRr/j4R2LmIk/Dyd
         v2lMlQUpnXO/xuOmZw7thL6bTh38ixJq02e9Q+aX7HS/ShZYg7oYmYJMr3+/K0nfEaWq
         IXj8gQM/pZyZJknYnqTeL8MohvHYeaSG47Kyw7oRvf19flz7Uy6M5iHwWUhIppFcoqLg
         UTIw==
X-Forwarded-Encrypted: i=1; AJvYcCXHzdg2I+Yjw3JxL8BBNl2vaZKge3TD+CySZ4BsxS8KU29nN04SskV+9ABMlgNU/01htK9XWUs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV5/Rzxze5XJd4ErMM6B+KKgaauuuxHekjoyR7OiNGUHxuWGg8
	iYHtmQ95YtWmiXBNkfaVEBxs4WFDJAjlqzLVI4s5t7lBQBuSUg+u+yTlcQEKbzI7ac0wPSw+cXv
	8FXcfsBOlQ10qj2ujZEtUqwkraOlDPo+63RJpDjvqRs/yP7j+yXXO76uff6dvsClpJksv76bd
X-Gm-Gg: ASbGncu1b/aAmdGBjb5703eu3kDoV17U88oyBS4zwOeD3DruBHLoqFDZB/ajI39yHGo
	C9+MaDzNiLEIQKy6170uGK7z8C3ybIg20LtLN0P02iPz6NrkR/3zcJb3EzX0GSe74C+02vh273l
	3d5XLgwxXgW6vagxxYgz+H7i7w/ooDMY3AzgEa9CJh082cGRl9QA9kdzGOFzooUt8QTE0/eoQEV
	LJ0rCG3lQtj0ZkobZJu+wLqwGHb573XFBP7bby6/5qIlkyIWrV7Y0Z1h8HZ210wplMFjd8Ql9hg
	aYimRB7lfWLZoNEfiGd20VsD5UfNX2B1+JbOxaupoiHqOBdlHD+tKG7WVlg=
X-Received: by 2002:a05:6a00:1490:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-7486cb219b7mr5179604b3a.1.1749658442750;
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExcLPif8UAuX4ZoswEaY25R/k69NLePm004lZfTnTJsqF+aqjn9Vn3sVFV0N9NDcXgNtJ3aw==
X-Received: by 2002:a05:6a00:1490:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-7486cb219b7mr5179579b3a.1.1749658442306;
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:55 -0700
Subject: [PATCH ath-next 2/5] wifi: ath9k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-2-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX5hoPqsNns2OH
 F6ULsRYddA7+t1Bd1fuGYyIVIp0CcdeUxUaLaUv+cZF8d7nlLO1z/k/st+CIvqgsGoi2DjG296b
 +ay6mWGye2gRJsnfcXjcR7QL4Muluke037ScyYbG1HEim90OqdkL34mfqNkWZW12q6L8PIBrumh
 JoK0kYwSwlu37Yq15M0MDh2IdxXtP/dME/6SMUqAYAFC0XguSlGIBRMjReDD2LC8a0I8cYGJ1EK
 4m2oZE5JaLkMlMH7mn4CwMqZnUaTxSqSEvv4sYOFVXgJSqKwCH11DI1gzXB183/1hH7iCQpwFZj
 aDXo7VDiOHJQiSdx+YfCkstnA/KuoEcRtYT8shDJMErL8lrlmqFNHUOuioCwh4qq69HP7QtiuOT
 AT2nBIpxym1b9uPIvmfAI9tgP7koe/Y+d7T8CNlFjoegnp0cCuAo8VZHDwCXRVmMXB2hSSTp
X-Proofpoint-GUID: ZxPR1YbxUraUpZBRN99FMSmh0HTEEzz5
X-Proofpoint-ORIG-GUID: ZxPR1YbxUraUpZBRN99FMSmh0HTEEzz5
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6849ab4b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wX-X5SGVYUOQdF0mMgYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091404_312162_8DA3D003 
X-CRM114-Status: GOOD (  13.46  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warnings:

drivers/net/wireless/ath/ath9k/common-beacon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-spectral.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/dynack.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 7 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/common-beacon.c b/drivers/net/wireless/ath/ath9k/common-beacon.c
index 01d6d3205a654292397557990ea485b074313341..e4df89f2fa031ad15a40bfb49ea7639b1ab72a74 100644
--- a/drivers/net/wireless/ath/ath9k/common-beacon.c
+++ b/drivers/net/wireless/ath/ath9k/common-beacon.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "common.h"
 
 #define FUDGE 2
diff --git a/drivers/net/wireless/ath/ath9k/common-debug.c b/drivers/net/wireless/ath/ath9k/common-debug.c
index 7aefb79f6bed5b765de27c1e5d46c9f7ad62647a..1ea070200e4a32be34d2af6784f9196aab4e1925 100644
--- a/drivers/net/wireless/ath/ath9k/common-debug.c
+++ b/drivers/net/wireless/ath/ath9k/common-debug.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "common.h"
 
 static ssize_t read_file_modal_eeprom(struct file *file, char __user *user_buf,
diff --git a/drivers/net/wireless/ath/ath9k/common-init.c b/drivers/net/wireless/ath/ath9k/common-init.c
index 7c13a1deb3acf1c1a1430a29a50f79bfb539e121..da102c791712e7f2eaac06d0d91b9ade08faf8f9 100644
--- a/drivers/net/wireless/ath/ath9k/common-init.c
+++ b/drivers/net/wireless/ath/ath9k/common-init.c
@@ -16,6 +16,7 @@
 
 /* We use the hw_value as an index into our private channel structure */
 
+#include <linux/export.h>
 #include "common.h"
 
 #define CHAN2G(_freq, _idx)  { \
diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.c b/drivers/net/wireless/ath/ath9k/common-spectral.c
index 300d178830adf6aeda9bda6db2ef31becce9c917..ca01a07f6630cac3ca69b3fb64c5e51e983e1d81 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.c
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/relay.h>
 #include <linux/random.h>
 #include "ath9k.h"
diff --git a/drivers/net/wireless/ath/ath9k/common.c b/drivers/net/wireless/ath/ath9k/common.c
index 099f3d45c594d7bbe7c56aad7503627bd37d20d1..ffcf2276eb92e5f6d38eff13adc56c9ccfbba56b 100644
--- a/drivers/net/wireless/ath/ath9k/common.c
+++ b/drivers/net/wireless/ath/ath9k/common.c
@@ -18,6 +18,7 @@
  * Module for common driver code between ath9k and ath9k_htc
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
diff --git a/drivers/net/wireless/ath/ath9k/dynack.c b/drivers/net/wireless/ath/ath9k/dynack.c
index 321ff54fdb4237f32ffa7c3e52f1c2adddc729fc..598b3a2ad818db88337e74a37d68704e2e4dc241 100644
--- a/drivers/net/wireless/ath/ath9k/dynack.c
+++ b/drivers/net/wireless/ath/ath9k/dynack.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "ath9k.h"
 #include "hw.h"
 #include "dynack.h"
diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index f9a774bd0e13937034989b772af2ab74e4cb3a49..14de62c1a32bd2459cc443028a4410cc2c6e4b5b 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/module.h>

-- 
2.42.0


