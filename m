Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA28C5AD7B
	for <ath10k@archiver.kernel.org>; Sun,  9 Aug 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=; b=0l52y+1miAi8KWPAbUufZFBNpu
	QzLSu+GNJ+G7jCIew662OgCfp1HRScM0b+rNbZDwD8QAE6UkZWAC+hsa9ZigjvHLqFsTUbI1tCpdr
	zaDVyudrzBRP/Ck5q7V44oKHyvkwmkbl7OCaDIWDwOUEbCxLXcjAOsFqC4fEm+3ZHue8vSusK4Kpe
	9MgJabqEHDgPSKFG9XNg3fs/7PmvyzXOUPaZ27ILR5m2ZOlj/KjOp5BnsD7Qc4i5QHHmkG8dUQa9I
	Q0ET7/zG6MRURN8iXGbSAGUcv2SEfH49sJhnYv9cpiKcb2XAwL4YwLy47gf9iSeYv19Kcqv+4/wav
	SWOW+fDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pH-0000000AVv8-0PUU;
	Sun, 09 Aug 2026 16:56:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pD-0000000AVtg-0Vxx
	for ath10k@lists.infradead.org;
	Sun, 09 Aug 2026 16:56:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679FMmue2777257
	for <ath10k@lists.infradead.org>; Sun, 9 Aug 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FRMtojNYebz5pnxWFacqhh
	jzm6+711Mk/YGMwYi3xFA=; b=Ias4j0lIMSFUAPycl6i+j0wnbv91lYzuClBcvu
	/LmWCPr61vcusvhpi7Hu3FotmTb2GvTwmxkxxyp5+Bd+aaLF4higEAz4TVT8PxTE
	CUlEp4AQH0g4TiTZ51GtlLD7G9Vwzu9PeTW4s062cZ8sWjVrDwQpWpceb+HL5d45
	quEDJztb5nJgShcZ+JHCeBc0JMBIO1BZKy4mZT2F/pheGpgLhawL/zh9JCmdiKW9
	meBmlsAYlXo7IraptnFrmjwOOAJM3dxbi3zhtNWtuwcZxRa/Izya65riLc6FDQ5R
	fr2KtTy/koRFlERN7nVIvtLvx5yR33KzJjAONqtowAHzSoPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cu54d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 09 Aug 2026 16:56:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so16234195ad.2
        for <ath10k@lists.infradead.org>; Sun, 09 Aug 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786294597; x=1786899397; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=ZI3a6SFtAewNMmsKR9R9+6OBhWdA4Rnw0dO2T0WWnkUttpNNRhWi6fzQwuNKtBqu38
         QOh39jJRQ8qcgQ3kfgJ4KOjIxLrQkpaVJq2esYmxcP7kejRgry9qx2Azam/ux7Ud5JBz
         WRokQqX6xtYpb9SXd6yf8saQGBbaEudgO1z82WV13thfN3Jk8hOILPNViN9z/tnC3D9R
         v2QR+XBdiCTYcczGUOtLTTAX9yz1d9ynsXlPr+iC2kMZzXL6u8lIpWGYUQBU0Hd6cWI+
         1WbvyW8wFEvAbxJsc9Vc253duBVe0sX7u/6EAk4QiiJKwLlinR/xvw2jrCVWxQicLgPo
         /f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786294597; x=1786899397;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=m6rxGgg1c6af/K10OanFMuvdjQ9/a1jIqOLvF8QLE0dINTotI2MxW5HBAI/6Ty3OVo
         dmUJvz0Zpwy79l1co3wjT2LkJWqBsq3pp71OzvWMZH8Xql596jogRkY+OVzpPsIIAjos
         KquKeeL+ylkNELWbdQHf6AJMo4w6NJBv3p4SZHSksFKC7qJ15dPLTxktaUGIXW1tKnCK
         sswq+165DHZwQaFAaKXu+18dLCkipDnxOJdjBnccPbrYThNLimfqbHqKxni+IYEqZez+
         O+kiKmP4UyN9ji8GLUJsycpfYNz4USeFBGqD3uMqgTq4pZE7lCwgpCqcJWPpLZY4lkjd
         ylXA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxbfx1qzh/kIfWEw6OhgOMETs8CNn+nRY/xrLQ99vBBo5dv52sPAbXwwS4CqiRfu1iYwES6fY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4mVk3ou0Ogh7ZzAeTXdJsGjS+x/h66OJHsPTxDF+uaiAkq/bR
	Mh3Eru8NrqOF4og243kolKKdEWnJ5etmv4ztA/XnA1wIcV39WVh9AVtIEVaGDCh0URRbfQfucoF
	G4qbMFkN+V3aowBMyOKm3x8hEW2QU+V0tX90eHCpDBWOfIcwH9N4BrvcK18XvCfujWuQ/Lazo
X-Gm-Gg: AR+sD12aN7c43IidTsKg01SU5cGqI+/+0XRGMpWNcYE7Pw3qD5Ccr0WDJTHILg+iAdT
	DofxKwX4kp3kfkbwUeQ+QdF/J3mWfWYC7WNdBE7rda6RS24ueVk0JwtLYmoC68FJemdcI4s7Pfj
	Rahxlnl83s1xsPzQkoxdNPBQ97NpQ2w0xYi8j+aqorkvIDBcovUf+tpT3ClKIdFr66lsZQGYbgF
	oS9+RBIBgqQuLRKy89HEGf0T8OIKZFKn9eHwrEHnt89KKGvU5Dz3frwmZeFAr2G9NtNjDdNcYc+
	IXZLADoZOWPhJn5+LqFI9ENNZ6f1eVwuYBTLaTWf3Hw8+zlqiRgqODoFGLK7A1xqXYWTTZtEPXH
	Pc1jNFa1ar6gIpPKrd+L9JQxs6iLZRp93gEkA
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822785ad.5.1786294597470;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822505ad.5.1786294597034;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm34239760eec.16.2026.08.09.09.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:56:36 -0700 (PDT)
Message-ID: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 09:56:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260809
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hs4dCPhAU3THHt08HIovVU483-e5mdBv
X-Proofpoint-ORIG-GUID: hs4dCPhAU3THHt08HIovVU483-e5mdBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX4iZftHd3i4PP
 Xh+VTniQRNZcbXvIh+ShXnK71U8E8CH6tJaqZZfKITNweuiJ9W1QScpDRc+SeRctKu23UXSXqeT
 T9aHSWwX0SlsfZB6h+q51YRobUI92ioemEYRCCcJ2ty8kalf7wh64C6W3BsAm3Gk648cZ439RA6
 vcas+YemrHi6QROEYvgjHg0H8j88v4WeXodNy/7EOY/8GRTQQ8hNWo41ePfXU6Qt1/Gh14SJM3b
 fTW1K0ZZn5dEJGKjJm122gsYpWbWa50PxngQ3NPtDnmKyDMA2GFiodX/ZVYjVnx66c4WP4me7CU
 4+7ax3RpjmRSEFKJZDUWAjTsDmaaeTb5aIDBToLRtK+RArLoHfj2yCBQimRNji/Tee3hVRl9dDM
 RG6xwzMah3fRofPFHFlvnqbpChfjCk6yWyJW4z+tNGeV1amxViv5BFP/TgL6QO+oUl0p/gwu9re
 twqJgsXKk+Bzb1ctP0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX4kWNX3UvP6tt
 7zfcWjXwYJJym/QCy9/HvUxcGf3oyEefofworwxlOHbVfSS8WCw9/FxCXM6b0toVAfTlGabMrJ/
 eaMOyBflGtYkqEzm3s+WgO/rBUjIObQ=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a78b146 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=5BXK2PN6kyUBF_VKF64A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_095639_217703_F310BE4F 
X-CRM114-Status: UNSURE (   9.35  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k, add board file for WCN3990 variant Shikra_EVK

Please let me know if there are any problems.

Thanks,
/jeff
---
The following changes since commit 16d815da3637f645bc67e4c71b757e70ae44d498:

  Merge branch 'airoha' into 'main' (2026-08-06 12:07:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260809

for you to fetch changes up to 796029ba95ac00dec03264eae3807e0ea0ae988c:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-08-09 08:00:34 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 867116 -> 893528 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

