Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A26C54ED0
	for <ath10k@archiver.kernel.org>; Fri, 23 May 2025 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=; b=kxT5j72p7YYg7nl8DvZAeVwnYd
	f52nBMX6vW7P7mjRNumOSl2vg5iEjqn2dK/3m170HBdXBclv+NoTX5KurM9PHuvCE2kr8NbQ2TXiM
	b6aemILa7Qw+fLP8jXrFYlqjnrmp/aJ9aUFlmGQJCCU0TnP9MCao7RzahLWwQmKDew9zpeJWorSFY
	DCVtQO3kYe4bQi5QRcp2ZG9xyOC2guuHkeu8rNDLEGd0ReImOkon/j+K0iOb6blPtu8U8eGLUjaeK
	nSIOFjJaqqtERx9w4Wf+pbNAm+xI5qI5d+3USpxUTQFBcEla+Dljn7Gk8BkjgfG9NX7+zy0+nll0J
	OLnyVKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7R-00000004WoV-0BHX;
	Fri, 23 May 2025 17:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVsN-00000004UZh-2jBe
	for ath10k@lists.infradead.org;
	Fri, 23 May 2025 17:08:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBZoZW016599
	for <ath10k@lists.infradead.org>; Fri, 23 May 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZUadBFHdEtu6nVasWJSp0
	TAppzK35LzVtrVbC8Wug8=; b=VIsc9/hahModkP8X3PA1B8iC7GVr0M99R3IrGE
	aXOMtHoA+grJu4k3WXH+JuWtnc7F9fefFanwa6ufBzaL+31aP6GpUT4eTozFo5DS
	+uP/sPxDGnjFpdOhZajBfhanvUa1jy6YDpHtixdCXg0YASFpmfyLd9GhoWHqS4Ps
	9dIAJmh+pAOitJfq6Ga0yKPJHbo6QjdRxaVjLt6yKvymZXiolw382/psU+TPAEbD
	7ObJeHHx24IO0UAmz7b6jQDX+AL18ucjLChTa5ja+5XwGW+SkFCmVcaktjKh/ouo
	ggtOOWkfZxkyf2HAI2he2QxssLXXfZbxf2xizW+CGaf2hA4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa2s2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 23 May 2025 17:08:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c7227d7dso105292b3a.2
        for <ath10k@lists.infradead.org>; Fri, 23 May 2025 10:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020084; x=1748624884;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=;
        b=otogZ/UQE6tKcCu3U5Nlyr1vtJ1VQf9ID3DoYK6r74wh3Fn+MJl9lsxvNiX4q2niu7
         xD9Gb9gnNmuArP9zbhWFONacQzGg419Mfuneh0RUgr1/LuDzXffsV04dYTPauBhl+S8N
         AK8zGZMTWhfWggBa+bC7G6WiwQR20J6S0kUJ2yp1q8zoxGkCgkIzOrwLoDe3+fg/m8Gm
         YdkKu42chmydXc/wMzuAmML3mSWr7Tcju47z6xKkwsnHJ9QgB/adhR1jCjD3hWqXcjn1
         saNtWNidAb9H/cXFY3pDF6mfD3/+HsInslihjJNz6N24yL/pbuMGhfw5sFeIU29PtZok
         hhEw==
X-Forwarded-Encrypted: i=1; AJvYcCXvtIa4yd7LDnbuvkg++jjbA3GveksywPmQdKUU97qZexLVSdNd1+FtiHdlKMQ34nNKXHk9wJc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxROh3je+n7PwBw3fbyi/siPvOfw5Bj6p8olYf9lgJIIaJ0ufhL
	XnsR8EMJF4vSqtQ5G/QJnpuBeINrMTR/NjwIXvQfQc5rbK+Dw2JRYojp5DFw9aCApUCZoc3OO6u
	xackTljokJly8lwDBnIbdybj9QemHNuLCHo5MxcwTEy/htQVtWdF7d6sAeYW5yH2c
X-Gm-Gg: ASbGncuhZjXdx/9UKgtCsJM4+TtejWiZwMOTOhaIiH+a/5+ZOjwuFf7l2kbcBKQDj7/
	uILrAmWomI1Easp1Ijqv0ST2Gn+MjiSsciXyFW5t4K/vNc6lQwhfzXv7kNaPW8vd28UXSSpOo1/
	WViYal7SsE/z2b9BeTXN2g6zXhKSMRMiEx3UCTB3IjCJFsgg1wDHZrcqs8NlpCIgChwm9qDiVlC
	fErsm0IYzEJ7tG0d0cGApi2I8dFdtZa+BED7OsuIkrJe77JtFHwrOOUm/d28v18fVfSAzJImJSA
	AA7vycfNWKCp59uiyJnn0qDt+ZX91y6o66Jn7eGhbRiYZR/0
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr380008b3a.20.1748020083887;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5x+zjlejQD7iUhgZen4iAhbFV5wkG6YLj4vbg91n7MooaF52e912rywgPZgF74Hdf6hPSIA==
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr379983b3a.20.1748020083500;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c37sm13084080b3a.117.2025.05.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Message-ID: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
Date: Fri, 23 May 2025 10:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830ab75 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=w00LdxtAzVfKRbiaHPIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pWMF218WinNTB2Ojd5w8NhzBKb8RLBOf
X-Proofpoint-GUID: pWMF218WinNTB2Ojd5w8NhzBKb8RLBOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NiBTYWx0ZWRfX0PuDAN6JB2wS
 XPNUYB45SCyozfYWYUhGNKyBY5NyJTm9iGkS7KMscxIDVkdaYsDfoW3e2Miqq3dJ1QPifnQPdun
 Tfv/iLjGU8fwNI18uz4pyGdf/OrwcA7GVf1vyVbEXRd5Bdr3TTl2+9yE13uTbx2uDe/BwIZLh2X
 lK8BEYAz8gipca9lcTZnXIm4Y5Jg0Sson+bDboTlO09ikiof+IJeWAT8n7hY5UX8I7zb8mrWW1B
 T/yGVXVl4j4c9LwsouVK5r+s4U2pV90157wA8o7BbjwCKZo5fCCTksx0b8lF7ywc2st7DDMK/dt
 KlvTOZI20VNo00XwsZDZ0QKvyp/bxKRUhzikZ6uEDja7/Db+vRHIQL04MykBY6rKPnxNpzCqBSD
 M+3IK5VT5XrTjv/o5dY8CjwcDqV/pJDjQNig85JDuqGOJUljMO4xCV1zqDw3pqDWjL7lNiYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=921 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_100807_796998_81E86C41 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874fa:

  Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250523

for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)

----------------------------------------------------------------

This is an update to the WCN7850 firmware that fixes the widely reported
failures due to the prior version in ath-20250424.

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

