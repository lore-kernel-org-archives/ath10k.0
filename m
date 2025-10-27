Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688A4CCF9E5
	for <ath10k@archiver.kernel.org>; Mon, 27 Oct 2025 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDJoOWucDsqB5K9PCwP7EzuNd8EKSXZV0OeeK1jEzkI=; b=uHe0ybo1YgL1uH8whuT8vXEL42
	lQ3Pw2FhJVomwEjKCVuw93AwhPpaFt3kw4ljizVW/UXarMRwLT1fCTR/kqPYyEc68mjTTVU7j0goC
	TLD5wrtZymlRqmAUj6PSp7t6Gl1VNGdA9FVlbe29nngmbpBOoNBjC7O26EXSVt9blwyMmkauKp0YQ
	TeADO+J4uj23mKlLgLn7rYSutKX8FJhbselYDNB3VVkBP5flImcE8DMIbZkMasRKv4yuT8WfIs5/V
	D4W3z5ktk5LoJvbzXl4K26hkd+CbksuzlyKkQ+wR8MNCIiV7icogyYonU6kNfyRCkOxG3w1FnM/RP
	MsWGYLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOLH-0000000E9GY-1Cru;
	Mon, 27 Oct 2025 14:37:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOLE-0000000E9GF-3DFq
	for ath10k@lists.infradead.org;
	Mon, 27 Oct 2025 14:37:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCfLLj2779945
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 14:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDJoOWucDsqB5K9PCwP7EzuNd8EKSXZV0OeeK1jEzkI=; b=ZoDbPgR4Lygtjnja
	hFaQ8LvZDGrGEBQiiA9r8L+jC0jovn5UXVd6wSt85MdPD6ZlKPtH7gDjYXeDQNyf
	/buQ8gZ/rdN1v2nLaxcvpmN5O3xGNjk23mAGOiFlu2NRdUr6B103S3zvC16vAo/M
	fkd9f7cT3mKdXHMUTAONMS/C9Qj//di6cwbgA3N4lQ49SM7pZ9z/lLfTydgGrDbj
	w3nf0YLaiUansDL5oOKAOVgHDGbzwPa5bWNuM2iF2uhYHFt+KN60GycfLIiQhHpZ
	VOXxnDjxFHhszSNRESz7JPLzJZofISrca5mq+BkLaWjF3uQ7JpN8wxhIHdRwk178
	cOqosw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28yarcnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 14:37:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33be4db19cfso9037319a91.0
        for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 07:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575819; x=1762180619;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDJoOWucDsqB5K9PCwP7EzuNd8EKSXZV0OeeK1jEzkI=;
        b=fbhTRiw6W3Xd8lK/SiAXjcqmJZaFNvgYUWyRfMPwp83c/iAX1qnhoFBscJ5s88pddW
         7xqRVS9aP51ZfU7FdRbOmD13i9k8rOILzZOhN2OiktEFH2hPr7Sc1RurTQXJB8jkwQcC
         PVUTtu6gewuK8eNdmW83+//AUZimNY5o2BVGqK7Sp00KQs5hzZZrL6/BigXZBEVsQEJw
         wsDGHgvENGfo3adrDN0laBNjEZWM11rlTnC6Fto/rK8Aot7oW/sf7muNkCDN9ED0pn5K
         PXcWxVASBXH5uVCuUwORH8DVnQLmt+xXiqZb9KBECDisPJ5Xh7d9i5IlRnRti3IPoL6g
         KHjA==
X-Forwarded-Encrypted: i=1; AJvYcCVUgYKJUdWMAahXUJm653h3sNiHtJRduW1XwzDToplTS7Cl7K74J9atPPF5NTfd4DVvec85pUw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz0N0otncmV6B5oNH0YOoZdUz4BrRDgpt3r4+GbEIfsnakHUoK
	NfDMHrBE1RdQXk9tf16Y9hcoZ2YtLwZKzwaXdl2Fg6A74KoEC3pPyyUGY7oDNdGXkfDCkE7ilfC
	0/zUFmT4SHySdOqwSFoKHwQq32iMWNsZHJp/Ocol58xX89KYdZGxr5p4Aa4dkN4IJ
X-Gm-Gg: ASbGncv1ikWi7ccDij26fkJCMuGiH9ulvuAwJP3yD1R4srhkoxjkmfxZTFMIhz5mQtE
	EELqfU4elDeHUK8r9/NsKkOsWU6t96f29AONoipE0dM9+DR8WjG7sV6Dwge2yczgOUMiPC3yRAg
	W0r/ujUdxwjuGY6EGcjVgpN3++bukj4GqpbhUP/eZSr8E7eFY/eqheo5DDiOTr4RUTMeXtrnUIX
	CnUxG+Jh4qu1wf2W/vcX9CC8vTNdJezeSOUuxjo742qwd9Pe2+orn3bQiaPrcvABvsngNEPRkXC
	74Ty2DccZr2aXr5cdxKm81eqFz4OQdFFEev6ijlPlIKnK7p1RhUF+KfEto03Z9FdYcImjS+9adg
	Le0ncDfe6uz+5jIzyWkPn71Lo4jqBcmhIWPU=
X-Received: by 2002:a17:90b:3806:b0:33f:ee05:56e7 with SMTP id 98e67ed59e1d1-34027a03349mr71853a91.16.1761575819454;
        Mon, 27 Oct 2025 07:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLI2Y1Zzj+255lVEV69R1zaLBMf/vkd9sTRc/FrK7Wh+yrPZjW2eHP7+rD3nyG7cJKigIxow==
X-Received: by 2002:a17:90b:3806:b0:33f:ee05:56e7 with SMTP id 98e67ed59e1d1-34027a03349mr71788a91.16.1761575818839;
        Mon, 27 Oct 2025 07:36:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712f0c13e0sm7496748a12.34.2025.10.27.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:36:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: klaus.kudielka@gmail.com, yannick.martin@okazoo.eu,
        andreas.tobler@onway.ch, mathias.kretschmer@fit.fraunhofer.de,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
In-Reply-To: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
References: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] Revert "wifi: ath10k: avoid unnecessary
 wait for service ready message"
Message-Id: <176157581767.355959.13478681330409784890.b4-ty@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 07:36:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=OPsqHCaB c=1 sm=1 tr=0 ts=68ff838c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0dCs_J3m0UDQCHnNMicA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: bO9XSqvYsZv20DrCTuEasK1IjkDE9cFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNiBTYWx0ZWRfX5WShKPOGcpTY
 mZY6zwlTk7JSkZ7BUcblflTOtgrZvwJEHBA4a06ImVP2e9PE/db84ZZ0Tl3x5KnpztqEOexxW/y
 tvpQLg6D/qEMsPWKX4cHsKEvYrXdPNCcwZn3jCXuuSCBQAt3xBfXV5mFszC1/Oh3hvBJxocwh4J
 VYjKCOtroZ84mZLEOFTR9GYB+sdJHRIZYSdtRg7PlQ9mf2B6n/yd+5VJIsASxEIq5Mgy5hkpYSQ
 ceGRKZATy2Ot0KIwhXchNhZ/V2CFDtbDody3pRGVTzOpORP2YyvMnfKkzVsiowUm0BQv0EEF5Qf
 E9F4fyvlnd8/rwahfg10Rv3aUKIS/qRaJNlH5piQ0oQH2foekviQYvL7SpqYmxKRNpdN+5HKh4P
 tJYWBjbw0l2iRQDO1XZK/ypDZobknw==
X-Proofpoint-ORIG-GUID: bO9XSqvYsZv20DrCTuEasK1IjkDE9cFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_073700_928207_437AA482 
X-CRM114-Status: UNSURE (   8.84  )
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


On Mon, 27 Oct 2025 09:49:12 +0800, Baochen Qiang wrote:
> This reverts commit 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a.
> 
> Although this commit benefits QCA6174, it breaks QCA988x and
> QCA9984 [1][2]. Since it is not likely to root cause/fix this
> issue in a short time, revert it to get those chips back.
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] Revert "wifi: ath10k: avoid unnecessary wait for service ready message"
      commit: 2469bb6a6af944755a7d7daf66be90f3b8decbf9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


