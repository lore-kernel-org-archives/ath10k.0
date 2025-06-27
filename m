Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ABFC77B7F
	for <ath10k@archiver.kernel.org>; Fri, 27 Jun 2025 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnEz7OZ9bC64orY85fIGEKGnIosfekYwIKnmm/3NWO0=; b=MWNcZd2fo07Phm9QGoifabwPXA
	uI3pCnKjpanCi49HbKzbNxDICJ6dTvbYLwOtTG9IjssTOfOC5A8O+l7nA2lpRKhBkqKXmTxPKIAIy
	/dgDG9YMHXRGQqfbaAh7jIw9eVDgPJw87/ojXm6xpiAfrBiq1b7GHE37o1TrvQax847bg+05OLLwA
	fX6I53xs/Aq90zDDHzDZjWKAsO9DztcfIz91tNetB27BzZD7sIuUm58CCfQSw+Oz3AsHIi/pXgOkI
	u3HY410FB1I7rCX7y9W8Ljyh7vaUf/2bNQajliQPlIp0Q8QccEMT7wtTVLCYyVjZ9TH8YWHluH1X2
	w4sZbCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAho-0000000F15d-0ATO;
	Fri, 27 Jun 2025 15:09:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAIr-0000000EwV6-33FA
	for ath10k@lists.infradead.org;
	Fri, 27 Jun 2025 14:43:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmNQI027380
	for <ath10k@lists.infradead.org>; Fri, 27 Jun 2025 14:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnEz7OZ9bC64orY85fIGEKGnIosfekYwIKnmm/3NWO0=; b=jEtnbiV5A3meDkam
	hKYJte3pUhZG4A0IfGtqwYhk39+9W8wFsYU3o4fi8/WIKQbEE+Gd6+KG64qG68Wh
	1ui17ANu0+yYqRrm0UssyjkBVdM06abMpgjwtUcNoWCnR73CVahZR1XfYNOowmEy
	EelGvNJh3KVArgI5LhkWjpfGLn0930uaJaSkG8X0VAfjLfT6ZyUjn8o48HNUSUu4
	xCeVs567p3WxlpPFVM/s4YECDTwbrKVWQGPaH/8x6bpz6hlIYIi8/f8kPYtoxt5V
	VMoaMN2Wjn/nPkYl6pbDdpY1XGLSjOpDAZuGXUwlD/8U+sd8fbu0czb5x9H9nvaq
	r/ZvhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hjug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 27 Jun 2025 14:43:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso3070433b3a.0
        for <ath10k@lists.infradead.org>; Fri, 27 Jun 2025 07:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035424; x=1751640224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnEz7OZ9bC64orY85fIGEKGnIosfekYwIKnmm/3NWO0=;
        b=ab27i6iufJodioLM+mGBG+m68fcl3u11RyWP/jvNeHfDnidLNm26FwhpnYnERGqslw
         MqPRnGBQnznQ6AXUrOf2L6eiKiLmuuGRsjSNPYZjBT2UhYs1UWTmmYLPPCXVr8JveqN6
         TyxA4nqScXyCVURNNuANTjBBkT4vjpDtciukZqgqHl8suH3qeVm+0MOXNkiPnJbSZ1eM
         66tjEWge2qrFbO/PMaW7jk90jzxFZNBY5eTp7ZtfcMjXYZ4qNL0yYBjQdfNi9ty0wXpm
         ACJyyS3IvPxVtIPMxTyCPWyPwzLyxPUmqSKr/H7kj0ab8iZaIs+fy8NHrL60dKOtY/UD
         G3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Et2sePajLB3u5yXyDovakAIE/xnYuNUeFEXjCeN9xYkkKaHyFxDVF6EznvW4Ek8atr7kg3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMk5rFFZ5r6C3t4qBM8dwO0W1LL62X695vVTlqXdsafvAn2ouW
	5uHBrktiDi6xE8JpAkSKBF9r/pkZdhP5vf9extcelg+U2wwmozdzT5wfHQGw8LzkHfuFS9UMlvA
	1ZGWrQtNN/g2enp8oRPr4HtDW63c+5IBwe0FgcEWhItenNy4YwbQie89AKswu0xlf
X-Gm-Gg: ASbGnctx1arfnjpK6l1mvGEPEajG8KigZLk5KwoBI0emHW/NHooAuVSS0SA2E1Xs4jO
	m2xYl+v5yNI+ltgpHHrAAv7kLilhqDBCzGAW9tkTlys3iPpiCwWxA3smjXpEx59P+Qg9Yxq6bm3
	qIdae5Bn7KSNDGj7hN2HLvI6Zb+u1yaZNALrmtG9y1ZgRV5h7k/lnDc7qzH7PsYDAMz46KjWUoz
	i8rfc/tLEsBiV8Hidn7LnZk0VweyEj4M94xzGM2qgd3BbQeKqT44IIIgpCMMslrf1jnvntD/csM
	rVsDhs/mfqQ7tkI/04rQR8a4OJrrwWAZwpD7YVWJW9tIvXpEzlhIL9nD8N4=
X-Received: by 2002:a05:6a00:4b16:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74af6e6350cmr4661279b3a.5.1751035424209;
        Fri, 27 Jun 2025 07:43:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUXASWkVGqAD6hPre0AnkWX72+JTqkej8+ilFSGk66OQwdS0ApjjhTz7IQTLD/IwpMwL9oA==
X-Received: by 2002:a05:6a00:4b16:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74af6e6350cmr4661251b3a.5.1751035423831;
        Fri, 27 Jun 2025 07:43:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4ccsm2458956b3a.156.2025.06.27.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:43:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250521055411.288724-1-sumanth.gavini@yahoo.com>
References: <20250521055411.288724-1-sumanth.gavini.ref@yahoo.com>
 <20250521055411.288724-1-sumanth.gavini@yahoo.com>
Subject: Re: [PATCH] wifi: ath10k: Fix Spelling
Message-Id: <175103542317.3295854.2266295711938072392.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 07:43:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX2wZtQ5iNiptX
 wbHoJO3UCDQzoWrJARYWUJGDM/46/nAWlJ6jbFEFK69znIePWHhPT2ayiel4KXvYyiJhat8O4VT
 Nio4RfWhhVyzaYjZH/+BBhkFRD5gMvigGZjuaqRnX2aT3/MevzTE5+t7hsp4uGIsnAHlHs6XYgR
 77l7g8zAuacKwmvBE+tK9JmegnanvwiQOi31s9OwgZoxwXPNrM1icYpEF2DvdDmgKPXvJTZVG3w
 wy26HqtR07YAB8qZ8HrOiBht8QzYQ6XEVWxElGBGgwD4CkKyZ7AkEtiVoRHqMQP/7t3i76PScHj
 0cJwQZwQf4kNmZjTa3GQa8AZniEGvLnkAJw+J9PQkrExHnf1TQr3xMlyZaqVnJcaty8D4UlqotK
 vXLKFIamiSwqNSvZNpjnOLzNQqWj+MGIeDhCYDn3uqDmukQ0lVK425ts5V/cRWka87JTd+ih
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685eae21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DrYC-KHvJF-t_aiCWxipmAfHpkJ7SHCy
X-Proofpoint-ORIG-GUID: DrYC-KHvJF-t_aiCWxipmAfHpkJ7SHCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=814 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_074345_779051_D19EF36E 
X-CRM114-Status: UNSURE (   6.88  )
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


On Tue, 20 May 2025 22:54:09 -0700, Sumanth Gavini wrote:
> Fix "trasmitting" to "transmitting"
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Fix Spelling
      commit: 20870fb0a3001fa99f2684dafb200c2ae6b8aae7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


