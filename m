Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C81C61CE7
	for <ath10k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzcxmCnV5pYzfiX15guSgFMIxLrLb3NYj+Ra6xjgQnA=; b=vXvVwK+ezmYMVQ6rKd4aV90K0Z
	1tB415G4XlszcCG/fExzyWmuyWyPfZJ512ZHf6gTB6TJR6TY3CHc9GGqJSlRD+IjNMDuJDkaHe2cc
	tyBsf/bfhoGdDSvJ4Qv8CfPndReIGQmUmFWXwIMjRnDXUBqy9P/2ZrygZg4GYzGwNl4dydytz1dho
	n4yTyBbZKQfGVJ9HqLYjsFiaNDXO8xaqXXNQ3oLGuskLUFEfc2uH1Im82iKtiygSjC9N6GG0YMtlN
	KKxqsKzDhDo6lfQBhWgVnKbDripuhMNcbQ/WWt/bgUEOy/m2eFnZTrLXxsc6Tk8UbdU+C0oq3+tKK
	rQs99VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNum9-00000001mLD-1yx8;
	Sat, 07 Jun 2025 14:44:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNum7-00000001mKZ-1kQB
	for ath10k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DJdLc011378
	for <ath10k@lists.infradead.org>; Sat, 7 Jun 2025 14:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzcxmCnV5pYzfiX15guSgFMIxLrLb3NYj+Ra6xjgQnA=; b=Z4cPxXT6LBUkradC
	N9MnJk/8zLs8BDAqAUwa15Raw53GHEYgEBxhGfnZLYZdG4hrpKPO0bMALOQU9teC
	pfB221wfUtBfYsOHMxzF39Q2zlLaCZZkwYxBq9dfQ/qp/A8Tqk9l69Ebx8BPE/lP
	kFzHV0dLaX1gjRl3BK8/j0Cl7DelMUwiDDijvRCIL9q/YL7wMTv8sGwXw6DnOyCc
	6CpsHZ9J1mqDS/Xdt0ZBzELZBXVEvsc8nNtACH1y274ZXk6c+Yl9ZT3VigDeL5lE
	TQxWvFmQB4AcNyJB2mt8toylswPCx32x8zyIaGmBgDDVJO9LOPZocjz+FtfBlKLk
	uMUB1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9gp5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 07 Jun 2025 14:43:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235196dfc50so26434785ad.1
        for <ath10k@lists.infradead.org>; Sat, 07 Jun 2025 07:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307437; x=1749912237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzcxmCnV5pYzfiX15guSgFMIxLrLb3NYj+Ra6xjgQnA=;
        b=vD+JZARvFSuybeCWYBgRYUJrtMOcGojfqXXE9CCBys2RQtc8CWjsfcQLW8wJkXEU7W
         5edw6nVa3cGfg4c6PFjqc5Lkx66qKTdif4827sRQQWoOaN/5jFLOjx21x+S2Psr5VOvY
         iGzvbpRaz7Z5+hMXo5HDuWmDUhPF5cG5kTlg78djRDcgu1SagBnjftZQLNADd+5a1eud
         qn3Js5PYPokEqIH0bC3xwAxmlrS8nI0iuwzh/dXT7FEBVIZ0NZ3o+KDxL5lDgitqOMkc
         k20lUZCVkTT3LFJpFPe4vTeWt2RxYXsdznso5fZ9A4AvRHhjPBVvoAC7SMoNgTxZVRqh
         ZXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUps7U6fxMqPsYhKz3Xi7/baM6VtMZ4Wg75kT5/ErGXRXU9Mhm5hU90HuYbuWKAAAeQNVegKZA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5a1nXRYFMVgMOUBdnyx+RL+HsNqIoHhqgYjaMYwXpKNEHBeeb
	WXk20l9c/WHHi0VLucQAsAlbJRrccALG2rc9fSVtTUtRLHF6T8OzkBkOKJrRVfalPHK2c/GiT04
	nmd+huBrQB2OHvlVlZ70F0O3U1ZVKZNcxYXPDEByahqPZKAnPUTj5ShTrKTyJh0C/SHRUMOZP
X-Gm-Gg: ASbGncsdqtdii1JDOqH3bG9Zsxtzul0rUGK7NyWsQv04xMF1ICeplMfREblThIOhFfk
	PUHm4dhv+4DTJPSWQwch+wDT1xnEe2rSAkRFZopVkfRCDBTmniaQbSxelRCwdCojS0TY6Iz88Ua
	+/7Z4z5zIU2wmTfwDNDvz8wYWTxbHMbOfv/FiWIB4P+891LzMtV8KyZ2gs6MVxMai1WNh1Z8JNH
	ChanENJ76E3uH7zEzspoNvF2CxUNGd5twoyeegsRqEBSe3cpbrnD6/dYsu/37fnKgS9YBjKMtEt
	PHLj/NZV/YIxAOwde2C6M9Zw1XcNiQg0iQSdM7K+YPWyvQrrFdZMRnyIcRw=
X-Received: by 2002:a17:902:f688:b0:234:325:500b with SMTP id d9443c01a7336-236020e6e0fmr94478025ad.22.1749307436831;
        Sat, 07 Jun 2025 07:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtEwX+CYFF9tWBi8OSvwsaTfDq+qAz9M4ipDToqoJL56YkpTKX6fp9SV49PLNR9nRrd/51zQ==
X-Received: by 2002:a17:902:f688:b0:234:325:500b with SMTP id d9443c01a7336-236020e6e0fmr94477825ad.22.1749307436453;
        Sat, 07 Jun 2025 07:43:56 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:43:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kalle Valo <kvalo@kernel.org>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Surabhi Vishnoi <quic_svishnoi@quicinc.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc: phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20250318205043.1043148-1-caleb.connolly@linaro.org>
References: <20250318205043.1043148-1-caleb.connolly@linaro.org>
Subject: Re: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash
 recovery
Message-Id: <174930743530.154748.10228995269580503920.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:43:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=6844502e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NluFblzGRrdN37FGmV8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CAYdIYfkjN_ilta0GnCYAmq0ap_uitUU
X-Proofpoint-ORIG-GUID: CAYdIYfkjN_ilta0GnCYAmq0ap_uitUU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNSBTYWx0ZWRfX27PGChwanHoK
 XO4OyBeXJx9mUfoC+H8x7pn9Ecq0FkrjxhmxTNXZK5/cy6eOSemSSAeqg+QzlnCPxRGvtlvSt+l
 oqCAtvlRRjHKN+03J4eJC8bHeSzrVxLZgakgKJVJxGAa9oLJVDbFFUPTuWGQ+2nd+DnYAPX4l5m
 3rpDWT4GO3yUyAvG1drlx8oTar+EuSrKv+CHy9WB6cPwABwcfbWFc4jNYAdEN4w4h408SGCxVlM
 anfXSKN5NYnlI5YYFDGvopuY1kwH1vErLt3uoSpHAR9hDyOpU8lfpciEuMrwLS8VZuf9Lis576T
 wBGq583aExUzIsiN2jBVCH/soIusGmgdgjtGlf2wbNRhNIN0lDp3UaWYlEw62pqiPJukYuiGKtg
 hinFaELcZLIkHxHwQe68BIRQuWQfm6OHJICQvAps/W8XqnAdO9B1EtsmhS75my+LW46aci45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=556 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074359_581494_168062EA 
X-CRM114-Status: GOOD (  10.57  )
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


On Tue, 18 Mar 2025 20:50:27 +0000, Caleb Connolly wrote:
> In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
> recovery flow, but we still unconditionally call enable again in
> ath10k_snoc_hif_start().
> 
> We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
> before hif_start() is called, so instead check the
> ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
> recovery.
> 
> [...]

Applied, thanks!

[1/1] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
      commit: 1650d32b92b01db03a1a95d69ee74fcbc34d4b00

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


