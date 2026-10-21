Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A7606A31B
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mox3aT+D;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7pVGVLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=; b=Mox3aT+Dm0AM7YJ590PWk9xxy2
	iSzqA7g6ujOrtKJFKvxibXxePdx/9tyEkQvQ0/RD1dmXpVujldAMN8tXlFAIhYeyvzZXbtflIZLMb
	c5SVUtVfbTRfBUyRyHXEaIBmAS0cGFYo2WvKSj1cIu1jGBmL76jQb4/qWJSa0m6qMKvM+JfZ4DX0x
	ywSpR9E2bwnqY9jigziPBVXBBNRGLnfZsM8wRf04Q7uizHJcBYUpFUlb3lD4JpCY9BQWAPoWjDzZe
	Pf1tUwnR1APoNjekwJBSeRste5UkAhFPWbnYdBmR6A2xFKnFCnG6gcsmz4tTAncQ82wWzz0R0EtoD
	PZ+9Sa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVK-0000000CSpv-2B3V;
	Wed, 21 Oct 2026 16:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVH-0000000CSoU-1qPx
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 16:49:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LGN3Y61677562
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aScArLj/kav6iD0/o6beXEYz
	xhtPHu8K7/dEbQLRbs8=; b=goC+a4OQMFZvZcJVwwGnrmMdn+Hw/jb8LweDtqux
	Ymthk89zZy8ibRIh2OsnxcuKrtrteBnDQahcx5CYa18x3UcZr7yyPQCWwzPt492p
	T4YwA/ZJowbdD+/HjUTLfXtZbZqN6oMY5kLnanhl9nydCQ8gFT6QbLEOUrTdKdKZ
	IXbxj4mkUZfhTNSqFtMfIKpO+SVuD49VXv76OCFtZ5BbtaJc9PbHBSdTiKYMNUwZ
	OoHe7unYesBmOts0ZNBgz8Aw9214R37v2egEXSs/jwlopYBHSmEKXRaXxOxOQiYy
	cpWgSr7P6W2FfurS3kYLgKvk+TgBQCB+fw16CdWXqluFhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0v8840p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so157601385a.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601366; x=1793206166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=J7pVGVLwnB8z1l1uOOG8s91fM/pmaO0IzPOHh+k997BmufBkf15tFRWHf7P9aucHws
         8FOQZP8HzqMRof2v9ahKsrct3lvYCkKS5YZxOwSFBqN1mLcbmBioPqbzmzvnS9QLq6An
         cIJ6t9SAqSNGlM//dcDZ4KHGW8HOXeqvjoKz7XV0xAOwPTvRvCxnFAAgp/TwwiP2vYJF
         /AV577tnfib/ao8fN/6PDq9zt9fcJffYhHSTM/z1gISOcjAlXW3f0XpuhRl8ByQY74dZ
         YD5Ps9loklALTxbXz/fkHatIu9vmTHx/pCR6ocCeLeUieSkQbnSBMJTrB6wG6vuUI5WX
         2/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601366; x=1793206166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=sGiOVfdQw62om/2LJq3Wbmn4L25kntDCJ+1vFlR1HTON119tn5zZpV8zdJTi5AJZAM
         CCFRCKzbd48pFVGJiVp+fWCknnshVZWcIZd3aBprPyiMXoBqg/4cl6+STNMjHGtvO/Y4
         tf3K2wy0Qh66dwLgEzuRqXHrT14n5i2efhOryH58SVqwiDI68gs8VZoCzayTBb8Af2kG
         8ItRK1KXehazNg60IMPKq1X5osO1IRyoLSWYA8TuzK+w3zvVqE7ap+hR5xmfodfakd9x
         JtpTJXLwIdRWzyoxeTmoNr0JuTtA3fmQASQdQMYPEJiGe5Y5AoksTlsMHWwpLXSAIgdj
         bBHA==
X-Forwarded-Encrypted: i=1; AKwUvBzNozuyDbZO4n8LtQMmvjVt9mUb2PJTJwmjhPwmacvDUAId+h9qObGuB/IDFICjGcNWu1sTDNI=@lists.infradead.org
X-Gm-Message-State: AFq9FYLuGwjg1X9GxjWqT7T+dww5pdmfbRpAVDs9OR5Lc3LtiasmTP5F
	clenvTYo/NCSZS1jAX97pY73cW/q21KUbHv/39EVLyk08rYD7lucFdH4KcnvN0wuNXKovMNKm7g
	dMkm6FOEca8ONjXXVi+pTFldBBt3iwft4Crea7ZxlxY/yq8VCjy3KBhWbeYY4L7Hw
X-Gm-Gg: AYBFou2H+cuqxijuxwN6JE+lsWBYQpT3ARMhdNuZE1yuvV5UU/n1RsanZib8jL902J9
	PWxr8Ca9UsuKmEmCGS9wd/lxo4nqw+uoTv0HvT5K/33ptv++msgOSFqTRWlkyaG92Eqf14FRftm
	FHkepUhHOMGPGrEZ6noDDZz9wLGcEBiFhzzjSn2n7WG4Xt8zwAf7A5VE1YYBN2qoW1Ni47DDyP8
	DTpepxM/x6aUT17hd1Sdbsbc3XpAn2MG7ID5M5TUZ3yQj7m6NBTLou+YEUBmHA9GE3dRgsripyz
	AQcU7e4992eFPN4EwUMsnr23UaoidL0cjYboye4J5CEVe19CKjN93s9Bl0+tOcdVlamtD7Y943U
	mDeUljETmCSYV7TKregeDH9KnskB5PCBB1pY+j4Bk4xYpylw1jufctyK5oz53g5uFBm1wgLO582
	wpLN+EazoXPxFv
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541416385a.20.1792601365660;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541412585a.20.1792601365178;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df158sm1332271fa.2.2026.10.21.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:49:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
Message-ID: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9Z8WgP+ c=1 sm=1 tr=0 ts=6ad8ed16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Cll3ooqCA_IsHNaTrZ8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX8zf5vNRlysIt
 zLIBtr7jB4g46bVFE6LIey67fWAQ+Oyw+jmaxMh6+KOlXZm5z31bicLE9R7AVl7Ss30oIAxC0Aq
 N6ReFWerkpaifYZiqIZyBwHD9AH2kVw=
X-Proofpoint-GUID: 2vGDz0zNEjNtT_49fyy27y1FOQ38E6U-
X-Proofpoint-ORIG-GUID: 2vGDz0zNEjNtT_49fyy27y1FOQ38E6U-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX6qulZY1R6IqI
 CBQmq2V6dNSmUIMCu5SFGt7mpnGI/+JQEuF8g4/l5yzGcOZLIUgnuHK0vw4WvA6GutFJ9cTOrtO
 NrgX1GdFTgMGRqQTQSeoj8PSZVQ5s/oGjSKEDzgnWqRI4Kgny84LlCfZWlS2lSs3EYwPWFDddSS
 HXDQH98OAQ/FcCEY5pAfr11XrkmJR9RU8JojMxBPaEM186x4+X5pn6S1oTXyeeZiWzElYErMoFh
 1qDSie1LBXsD2Foe4bJ8L0u5s8Xp/vwKEOvOv5E1hBy6MWoOKtZXi9T3At83G4XFpjTEr5hr2bO
 vwGyL1O6mk9voExv0qFGXIW1Fb6h2OJD+KbGZx6B16EOXZY9lKPy8sFdQa6yi97ZMAZql3mhDgj
 k3liMOTwgqBbrvqeYkezkGOJ/cfPOzJr9b3KkL/G8qqALGdqRT/7KQtk4nqLw8CT6+Y0BUbP7p6
 gAnwjkVNz0nRlKR8jgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_094927_626979_C7B74276 
X-CRM114-Status: GOOD (  12.00  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

"make check" failed:

1. Missing "Signed-off-by: author information"



-- 
With best wishes
Dmitry

