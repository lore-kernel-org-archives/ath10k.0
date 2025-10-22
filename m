Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D5CCD1BB
	for <ath10k@archiver.kernel.org>; Wed, 22 Oct 2025 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=; b=CjePVD/BL/TKPOfAVfDIVNAJw7
	7VX5H0UwLJWWX4CdWw93PEsVdNLLYjCZi5exdiE/yigpAs0WRcd5T+nPvikMgGUOXqKUmoqNHNI3h
	4TcGHbq2jNr4nYv1tmfUshqIc7exMVFESAJcjzSIJ7+lXJKUfHxE+9OyzIfQ4pivIsI7IX3ZIQrkF
	5EagYEOW90gSYBLeG9cy5El6eBimtgOz7kBjjOuVyZYUUhFloi4wvOwIkKJZQ9cR5cOuxYLelWPFL
	vdQWRkasLKnjRt49AA7qoKOBurUxTxtXUH2Q7WPcUhuqj/Fok/OFNVtHeax7/7HQ2HS1uzQMMJGMg
	IaOU8GHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaqF-00000003PtL-1vBW;
	Wed, 22 Oct 2025 15:33:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaqC-00000003PsV-2b4R
	for ath10k@lists.infradead.org;
	Wed, 22 Oct 2025 15:33:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MF479u011570
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 15:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=; b=lrf6gYQHCQAi2BID
	JmDEh0qwu1jcWu3t3pikSpPehuxsF+0lUsqCzhmtWHzr/KPQJhBcKzGzQeBGHO6f
	J1fOLGrVk9kwhZ0unCUK8NfBmj27mRcbUOjH4dzfFzL5Nff9L2ziFL6bFDBV1AXV
	CYHzbMoJyEEsV+apH/LZSe1ZZsfauZqg07afAxsKlJIRKMnZhElHmmAGqUKUppCS
	T2JaIXcCyJt2L0wmA3u1oF1DTy2AC3p9PwyAwhYNURc08InaDOkMikq5ysHDKz7t
	ZEPZyhlAnEOei5PNa7CHiiCRj8osASL/Ump8w/VaqiOysI1loOJGNKgRnxRqghXU
	4WJnTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k1ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 15:33:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78108268ea3so980170b3a.1
        for <ath10k@lists.infradead.org>; Wed, 22 Oct 2025 08:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147210; x=1761752010;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPO+5ZAHamuKpqqW2/tdbIcyYFMs/w8rT5Hidhv6oKM=;
        b=B/41IombVQnno/igstlNMsl/akWMVwgpenxlrpM+zj7QPvdZvD34Xny24LkgXt7mTn
         8zD0gMFzwmuMp29MJw0I1/McRQEXJPct8HKV+dlsC9r1aOyQ5RJRSodJdHkDjsx7CvZ4
         rRndawlUbAhAyVjsX4LzdEjQozbImouKGuwCVPX9UzenLAhGfcadwM1Kxkytgyrdybqu
         1vwPr8nj9QCq43SBrhEt9rxG+fz2Pbf89G/Bq3UbvA99No7DX/rSYZ+gfKgVs58YrTdw
         XBfYa45gFhQ3xfY3xRTqHb7N69SjI7YkK01seEf61NeOsjVDE/HpzjYq4JR2uMF646b5
         OZeQ==
X-Gm-Message-State: AOJu0YwjloZIAi44P3TDrMIVcFe6SdhD1SW9RxDCW+OCsyq355jj++Gl
	exJmJUvnLk9uI4bykHfG0kQJWE1HclO4IKXIyj0ZvnygdX9bXs9aIHos2C9REgUZ9rnMOpGz+WU
	MQIeWWuLDXaRSc1gd3Fq2SGOvwgqwfLPSlMwBOM/3PuGxwBlhkjAPxtKo4BqqgXPk
X-Gm-Gg: ASbGncvm3lVlPQjUNofBUVjmrZi+L8EpExSCK+qe7slPDF4ApXCuZ6VPxtARt+4OGH9
	qARmZKJAFaurQGTIRv3IvZ/jOkPHLp1ttYU5pac8o8osWU2ABU+utIs6yw0EneNMzFccCom6tMr
	NSFlSdMTpFOwgy1mIKYGHc1bWf2hC8vjFD6SbFHG+8DfWEiW2bJ+fLr/nuIgw17LyPy9kQClrtK
	x1MMEDoMlBZbMFWHNJv1yeW+xjAb85ByJT5Fj/8eB5+KTgcL+PAPLctrVUiT+GkmsLDq11by0tS
	oHxdXixIIS2K0+EySLYUxoZF3Btufe7FcH0wiJfdmH5cs0DBS5TPdCYKv92l3wduWU7YKFNiqcx
	AkSt1mSaxP2FaD++sPr1Ei/Gpmyd2CYryISw=
X-Received: by 2002:a05:6a20:918c:b0:334:8dd2:8372 with SMTP id adf61e73a8af0-33b684d0d35mr2913258637.3.1761147210321;
        Wed, 22 Oct 2025 08:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhnUYXmpiGBzo98XdERRsQOMLcEtfJFyd6TXCoDRow6qZGinPXLkS3DXGRJAh4zEywkF2EGA==
X-Received: by 2002:a05:6a20:918c:b0:334:8dd2:8372 with SMTP id adf61e73a8af0-33b684d0d35mr2913203637.3.1761147209734;
        Wed, 22 Oct 2025 08:33:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf0443b2fsm571552a12.30.2025.10.22.08.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:33:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
References: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v2] wifi: ath10k: Support for FTM TLV test commands
Message-Id: <176114720901.606027.2235262810066845660.b4-ty@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:33:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX1iXLxmh1Qrjo
 2hGM6FI6o9ORU2dli1snW1YSeIOd4meD68PDPPY2hhqqWG8RoSvZSOot0tD94mzOgHTZSn8Fsz8
 QzzpWhewpFhafJMlYBpOJRw25Z0FEHr4kZqqyeaNXxkg5iVVgir9/gBa8Bx56i48UcoemhzOSqu
 2R88ivbpKKumLap0K36326lP4f8gezxZg2FfdHybz/C2tGkfK8EQV8UOEgATgvADXvaGAQ2JO1b
 X03LcSvBuxPJ66K5on3YzG74QHliIRaxow7iX9aAgTDImnnKQuI1c5mqAJ8WLl2KTjjqb7Ke9mC
 89Il0H9SFD2OLOVjlPFKC50qfF87oaxVqbw2mt/h8fxSfTOTgwQEX5ffLT1gMUoAWjdeLMQToWI
 11KrS2T11hvo1TzKM2yQicxwFJv0PA==
X-Proofpoint-ORIG-GUID: OZRF542yQzY7NBVEFymdmwdR6I5-VAby
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f94b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CvSNZa8qkPPy6F7HHe4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: OZRF542yQzY7NBVEFymdmwdR6I5-VAby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_083332_801729_A88531A3 
X-CRM114-Status: UNSURE (   9.73  )
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


On Mon, 20 Oct 2025 17:37:59 +0200, Loic Poulain wrote:
> Existing tools like myftm use 'legacy' test command API. Similarly
> to ath11k and ath12k, we want to support raw TLV payload submitted
> from the test tool. This requires segmenting the TLV payload and
> encapsulating it within a WMI command. The opposite operation needs
> to be done upon corresponding event receiving.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Support for FTM TLV test commands
      commit: 54be197109762d2a3c2b23d44e960ce7a43a3798

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


