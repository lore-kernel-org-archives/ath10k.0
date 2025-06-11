Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7147C71148
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=vgRvau9ivSkbPYmR6IGVLisgUg
	XkwlqfLA4u0lj/LW181M4XpIm2XJsYAh1L3kp5R4qAC8WFXbwO00pal3nY6XhjP6wNBQW1wzg46qP
	gReuZHV9XBkW+i7rFURQXU8TyioatfbITOgzBlNDfq9PUBFMXezZ/ZNyFZwBXGqSAPwUV8J0CiXuh
	rUJe0A/SmtK0W2I+/KNh/2Yb4tjwrL3HEe05VhfzPJJo4oipPe87nVbO7PQR/3VIk2x4uwbe6OHTo
	6Ze2fTjZVE9feTs/tQwNX+DsXquzty+uhPYboJ46A2/P9JwI4Lk6adqh7CFlFfotPhBjue+j/xLqg
	sq6anjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoA-0000000BGKo-2t0R;
	Wed, 11 Jun 2025 21:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5c-0000000AZD0-0vHv
	for ath10k@bombadil.infradead.org;
	Wed, 11 Jun 2025 16:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=FSM12sR+kA7/xW0DLndUpDGe3q
	2Mv0qnBGSgVEAopwQG6UaMfP39aXSkQWvQi6bORHigpqeaY20Jqc3vEb4WrPWkjf00y97t8s2UV8f
	x5KJ3M0rjvTy/nOGvMzJ6lMk2QKWkMYM6U+b1CNm1ORD7L5Dawr0+07doS6OpV0zo2sHKm4hQ5+Xg
	quqjK3H+neKk+Dows7aokuwU8Os9Ng/j7mLcASGg8JAX8xJTH2HbyzIwFW9j1HR0yqQCcGZCIQk94
	8ou0WHyrMcZcowtgxLOTG5fcdvcMWYw0E/hEgQ9UCs3LH4es3ZOI/hPwtGjnSFTl1E35uCsxzU3f/
	gVP/zPtA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5Y-00000002R3M-3d7O
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGni029304
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=g7I16cCROfAeXNgH
	8KtUdf+KS7FzAM7sRJghl4Dm/PLyqnde6Vp9guqSFc7Iy+cK+ZwUkEF0szD0DIEa
	/aY6dTY8bn0ythUazLdawkZvL5KBgb/MLOd0IL8XgLCcGxQe/PzV1/wiiFhJKkM+
	jnsSmIlJF62FfnTtUih8lei6WWlHQlpESgpgez16GW3q+ct9efT8FH05hg7ouzJk
	u79d2+/TIUnZMlNWZE/pwK2fJEIRKy7PB/XvkG/g3XjoQYfmmfgIKrx66O+2cxkF
	3/Qu4i69vdRX4LvIgExuelKBK7bHL+WztPxoWDtCk6p5nYmhIaH3HuxX60r5VNPB
	BepFrQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6djcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74841f2aee2so26037b3a.2
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658442; x=1750263242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=;
        b=hViaavfqPiHWz2M1Yor8NbpGOYRhg5IxWbcQMVpx7l+a6NxmDKuYHaiqIObSNpAN19
         JDuu4M1/B2xZTesAzT8ul8MduKmT/wanD7ucbrF4XyE0QEHV7U+4dg6toBfNb6kgddGc
         ql40C3Zs76sPmxM0IVxb8jWwjAFCn1/ZCJpT43b+fezZVYc81i0q7h6wX3bUGiAUkz3T
         zddz1GV6z4/0c6lIfJ+WN46uKVdsY7m1NPpOB4fJWVslqyFBEcCUOUPXMyoxMnYPeurH
         RTsxZxSG3nA9OPgnE5zI4nIf9x/AAZkRRDXdGuSEvrkvxyu6VzJRm9F0jP5kXTdIkR4e
         Ne6A==
X-Forwarded-Encrypted: i=1; AJvYcCXsPqG5sAzSyLXVWaWfgGF39GlLO7xp0iqTUHZM8Lf+FTDxFljL0Mi5CSW0ekkVeFTmOF03K3I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdQ+fbNw5mTHoIB9lHSYqgVnZ0wS7R5O7uHtZpP+5ODjIQ2OJo
	KoXnDpvTEwu7hUEsoTpTrijl4bsFWa4Y7ddsrfpbd/5NhfkpY9pWvdgeXDekpUhBTylPanoB2Rp
	HKKAS36GhnOgbl7cPWKW7J0TIBTE/LByVqEzOCv+8Mfr9C47xj8z8oR8oB/kuCsNu
X-Gm-Gg: ASbGncs1AgSYUnUX0SOFVi/qqHmj7OSJCk/uM9AiTfaI3JzzOGhwP3WmKbz3+NUw3uE
	hUON5ODWOaeM7mUVBiU8zpbyJnl8suKRDEvRXu0p3z/m8zDGYpx4+6G0wvxDNj5+oL9k5q3FBIw
	zjPe1/f1+74FAoj0h3DEFjqsh+oHp0dF1LgDmLHGTMOrKTzl7iXTaWtAFswQnyLsEdPIGPBzpi9
	YKLA+cYbWyKRMMMTy+ZwEXgSpSv3SYLIVHhAfTKixzJ/mqc8jfr2I6z7QfzX5TZ+FNNI7MrLL/z
	7D09Jhe+es7sv3HfpOT2bnIBCo2OneqyGkjaE50tFOsJo251UarQwURDdL8=
X-Received: by 2002:a05:6a00:124e:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-7486cbd8633mr4706291b3a.15.1749658441828;
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO0qGQZKOb/hJZ+5EWYGdrvpghWgbeGHWYq9TkhEW2zl0TjeFA4FC23wTXpeMr4FHA8EIFAQ==
X-Received: by 2002:a05:6a00:124e:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-7486cbd8633mr4706260b3a.15.1749658441432;
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:54 -0700
Subject: [PATCH ath-next 1/5] wifi: ath: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-1-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX1FnxK3RsL24L
 E5n0YbfAxJZ2K7x8Uo+uaK4jRY9HnLmEx+j3ldCBBScuB/GLr0PBSDkfEBvf00j8YNKeM82PiIS
 g9OcX9cbgwUJcwJcrdKa9AAksllS6cX5qYBqPzW1IEiquB/5EnrzrDzJUhtfddIKILcDi6BXeNQ
 smhRX5jiKV1PkAGQ+yS8ewFthW2kKumE8eGvsR63ppWpvlrelPlKQf+mum4nkHA1t2IBZcHKM/W
 tzd/okr87I9G7tIuSybNFUIxOaw3/yYVOTdIpIX5q07zX4KIBA+Hu+A8ZN9rniS6VshgW4Z4sfM
 VMRmcpHC2EzEM6nclFfKGd+SrWwGd6C6xliX9pjEigTx7SlXetbb4IwALfs98U6cRilkQabDhSj
 FC3/MMX4hEtyQadcVFMahEj7ZYfQqNOhsiHF2TW66fNUvYRiwZiII++xnQ3QgRh/noS9i+H8
X-Proofpoint-GUID: CUBgVI_L04uI6APKV2YYMBptUexAUhWj
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6849ab4a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rLkratNtAnnL-XKjWSkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CUBgVI_L04uI6APKV2YYMBptUexAUhWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_171409_291170_2E2E38CE 
X-CRM114-Status: GOOD (  11.26  )
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
the following warning:

drivers/net/wireless/ath/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/main.c b/drivers/net/wireless/ath/main.c
index 89f4b0513946916230dad4529df7c2d30402f2d8..d79d73738a816479107b130c6c0849de72442887 100644
--- a/drivers/net/wireless/ath/main.c
+++ b/drivers/net/wireless/ath/main.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 

-- 
2.42.0


