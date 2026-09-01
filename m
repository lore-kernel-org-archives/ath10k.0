Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF7EC624D4
	for <ath10k@archiver.kernel.org>; Tue,  1 Sep 2026 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=; b=sUZQRprg/pDvGcspb2neQ1NNzc
	IY1h5UmlV9eyrXQdAcoAPAGo+awl7otScXvMKm8NZxHZOXTBXOmox/h4aYsZMFnj2ge7iSwD+iD0X
	Q5lC8zqXeXZ2bRvyLTQLlAd5Gu8YLNxlrQhGeGkpb7GH754YWQo8GqrAYenOx54Fir6Tr0J+irXbq
	YeKb/Tc9HNLnMzABXgfue66qeRr6ANhXDBO6C9hno0RJ5XwyOk3p5ExFaUPb8rD2iMSSeCEzCeW36
	hT1OELqp+ai6CUhHpGc0747PsXO9aXBYaQhS8zwK0Z5c16qNlg9XWQIuN4/JPbB4YZ3PMNDVVdYc1
	LgnMb9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgN-0000000C7IH-1tY8;
	Tue, 01 Sep 2026 12:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgK-0000000C7HA-1hjs
	for ath10k@lists.infradead.org;
	Tue, 01 Sep 2026 12:33:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJYR32323262
	for <ath10k@lists.infradead.org>; Tue, 1 Sep 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hMw1bZsyl/wsw6eXPmwKbIq6
	QdTazM6/t3F4X+WUBco=; b=eWjZsGYAZj8O5JUmFfCnYfRbww3oq3NlVlYWZXS1
	cqUsAhlg3HoZjGzoS4YlzLMgF1qH2BofiuocRfwAFFr3Y89bl5dAgkfB9TEwQAlg
	Yfykf0OjnTmoOKrma0qRTi6uKbpqgHIeeT6QcbN3bKXM/IbnA46+RaZSGloloi5s
	kwl/tWFfr3cHUXJ2CgyXJEU7fM/+8KmWY2LJrjaUvJ8fs3l+LKcjcMSVTQTJQleL
	63qY5ZqmFHMuDZFEU3nOSQvkU+whOZ0Zc9y4DoJvn8CbQj20Gs2J+0pGlPG7heoT
	cQIrBuS0MhrVaGhwS3xy+kwceHv0oAitHo8EpaPNr/9sNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cadpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 01 Sep 2026 12:33:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so56599346d6.3
        for <ath10k@lists.infradead.org>; Tue, 01 Sep 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266019; x=1788870819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=ShcPpkxOZ+tXB6doqYDMOZf0O240v4+XnQb53/KTxjLjnTEuTU+Y1L0JLuUFRns3Xb
         hzCeLkA4moW0rnYwQquzkFuHiK0Cn1Ajga8BkBbNWaPon079WXIkS5B0rVm7f+f4mNn1
         H/n5Fhd6TSxCHws5HAe8dQEgOO93whFxnuvlgIRIx6IM4iEn7qZVuuk9H7Ws3v3sFl5+
         nGUNjM2QSVT360hn7hsiyVgzb2ElqVuH+7/clPeFFk2/zuGN60KrcOwnDUoKkj9NDJca
         m8jcglB6nYC3zEBLcuQdCGbvTbHXHswBdF02CeWtJLiTIt+qrW5t4sE8KLWjmEIfPLfy
         ISkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266019; x=1788870819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=Vl+LgDylLrN48r8PfToEfOo7J3yPrHA1aTrvix/1rxx0nOhEvl59PPq4hJrHrM0Nw6
         igRhGCubXpfDoNdp3BKGm0DS0f1EdWgOKCTcqauRLY29nHFXFtL+Zz4jPC3xGHlI0jEX
         +LyU1cOaLVdMd2j1F/KzxpzFOqQvoov+udVH3zMB2t562y5rlTu9pUm9M2h9snWr115H
         0Q+d7Pvwc2mFazAOi1l1LlH8veacy6U54bdc4n6m7x0Mg5PGJh9/surcnEAbqtUVhOQE
         JMKEMrCwokCjs6hDLIfVZm60rNH5/dsemCs6/fExtQX1wZTXOtcGW90LEPeoOc0g+2Kx
         lFzw==
X-Forwarded-Encrypted: i=1; AKwUvBxe2IFZFixworj2k0mB/anv738Crb1m+aNtgjdGSm0/u8NbObiN8q4Kg01jZsBt1W/fJBbB8kg=@lists.infradead.org
X-Gm-Message-State: AFuF++l/RTbbzrEXn+C7d4wyCR+0biRVXeWkghmM1bOEuH3+USrL6jAP
	AbHEKAWy+e+EAYzFHTL2m5e4nxCVp2D1GLfxbDl0/lAbSTSi570uDs2d4Rlt/uVeO/olty39R/x
	SVL1E8BlAoNl43pElNjRyZeoFmMI2GEDsay/Haw6olLONy00LZz5brjpG1IY1P+Ki
X-Gm-Gg: AYBFou1QoqBKTOqLWvtlS0dMtQtOS79Syfu5BV/i7/KDTlg7Y61r8ohYaH+qkz2PiVt
	eSXNUdOY1sUx+roNziEljYPWlol0n17CyPspbjwIft11MSib63ogM41BZYjwIIs/IRW/uk4WaiH
	HXyQHT3gHdKhyK25yrJRzanFrvihObIWvXn6zSq6bPIHJAg8fjK2a15d0faoV8i/aV8FQaRpmcF
	Uh16pyO7gAhTXEWumAjJJ0qjh36MZqdAa4OoRG75JeVofZtl1GyPdvM3Qi2ges//JX1g5SViTJj
	2xhcWmPg4t8W8pO1u6QDGFCRyKAa13Uy0dB+aveiwoDYMJ3Ml8tBQU2r2zhW2XpptZE1ELIUqAp
	Dfav8LTjiEM+DTisAcrBHR9wL6S8Wcs+pIBRzBC3a1/5drziu4iGXdatWr7LQ5GXzDOrPuSHaQU
	y4AE5itktS1Xxt
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49205836d6.13.1788266018612;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49204746d6.13.1788266018042;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31e5fc6f7sm16578891fa.16.2026.09.01.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:33:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260831
Message-ID: <lh3sniuz6oxovkjdhdrjmjmoczjx5y5gnxfv3lteq3tpmjvwpr@x2n7qbbeqnnk>
References: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96c623 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: NLR-IyfGYFvXzfu650sDfP0FFg26SNmb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX5j3kbAvpsAz7
 d79TUaA4tJRV4kHVU3OeIInVTlh9WhEa/41EtfzeURu09vKz7tlYzpCUhWgclrPP5w2xP/i+UgG
 Cxe5lohuigF/8FwkPl5VDr+USRyW85s=
X-Proofpoint-GUID: NLR-IyfGYFvXzfu650sDfP0FFg26SNmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX3KPz4PItqBnq
 T4YoUOPxvGO4qU+95XVtIresG2NPXKs0okLTAt2jG06yPmAdjNAafu2wTW0+FJ3a3jDilrK16H7
 qJwTanDJ/9J/ZIbH+WD/YNlFBGJAWdHtfx8KG1HqDcQRxTTSLn9W2djRkqBt9LYI1LbtrcrFqzn
 lNySfTvUhoX5ojP802DhJaHLB2VN4+FiRWKG1YzC0n/5bvPp/QTdOQAfIHa+eaAHQVyjAaiop1U
 WXPZyDdHItukOPMHLXNMhRyiGdpHSiW0bvEh0ynBKxbro5Qq7kPkn8yAHSV65CngGIqfnJOO/IQ
 Xz9VfSv10B6L4s21ikb+kx1h99sE7dQa8f3o0Lhw6tUtummEgzUW3g2rPWS6GQ8o797nc6fF9JB
 hpzQjy1MXkAO7O5uuTWBnY0NwHmstnPcmCBAE+qG3GecxCNrw1bnXv2oNTmfwTZXQ0qytSUg3Xe
 Z4z1jaVrEBf+rUJjOdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_053340_456907_88725AA4 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Aug 31, 2026 at 11:49:36AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> This version enables Multi-link Operation (MLO).
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1211


-- 
With best wishes
Dmitry

