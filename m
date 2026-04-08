Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B700510F9964
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=; b=I4OWQKuxCTpwPo2YmvSMgaHUn0
	SBid/02cBkjY9aXbexoubQpO6b6g0ItPc4x0q5E18UC+KR2aTv2hdj+5i7vL7SrwTrmQB5vNRq5Jn
	K7+uUgGu3l56+mZiqj2UXv8Gf5RWr4KU84pT3U+fDjfxp+Sl9bZUe1gerkHlJTK9xwghqj4uL1sG/
	Z5CqeQFhv2s/wGqoFiBsb+PVomfpg+FfhFAVfAQ3v2qTDnp4Q48/BEv0npwaPczcy4Qcp2rZWNDIY
	dVmBqCP4z3q1xCbElbqJdLtSimHlCQJUSbHft0qh5Xlmd/phYzQNxvkx5j7U+MF6T69LJcIgrzsnz
	dXGz2DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWUn-00000009AHM-1ISr;
	Wed, 08 Apr 2026 17:15:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWUk-00000009AGT-1DSj
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 17:15:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638DLETV1259505
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=; b=ZHURPQupUvXIcRP8
	pICTvVdooRN8cXy32/VDBb8wPKJ9N2p2SxSy0kxPDXWrulWeEuEn6ho3piHldMSG
	LaUQUc34ZPsOr0Lx8HxpAaPYT7SCG71jgs116W0fUg2JCoemZipzbWXUYRwb9rBq
	IAUo+RVALSX4M8AiXoixfkI75CyxySydSJAFSpe1ZyTVNjitRsUeywLDF6ottSdT
	LTMc2PuyqMciusC5x8lZrOYjJxUwnmIN58PSTfNeZL0vriiGY9Q8vMSwxli4FXts
	9Qlmy0oR0ErjheQZfh6mvtXzUkOAUJuQKU9J5mniouumL61UV79jtSiqHYlAswD/
	bUR79w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttum6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 17:15:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so2827815ad.0
        for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668512; x=1776273312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=avIokWTAp3SkfWPPV80EW1mCoUts4svyeOffFOteloe+IfoLDi5XvxSlb2jnHaRFnn
         QA8CxJolIrz1TNNpEDMriKm9DsnA2WytAbkQtSjgh7Gp4fm28w97LNY6RgebYH47t2jO
         Roz+vBxzRgaSOuxFvFP/+UEvEtZ8K7YQy/PWMEWNz1HNj4EPJ0XZnFmZc9bPs7m+IrhA
         RipZpANtDCZ2+7JCGjusHDK/BNNbpGm64yJgkj5o4ZKsJPs/znh41f8c1lgPmN4WwVjn
         SrgilG9H6NDKYYNeejkLDZ/0Aq0JPoj81IraTCx6/BpNPQWRHLgPUZAfHk9EW2SzUpff
         anCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668512; x=1776273312;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irJPjQOx57gitkVQBKC9OTFjeqNhaQWRfIuH/klmg8I=;
        b=NDKGH67wWOJjEgEhRsGumRZvQRm1fQyNaEuPhkvWHvK/pRr749ptdIi5KGDx7N4YfY
         Mwlx+vvcOki9MFoi4TY8rQuU9bC8QnGwk9MdiLg5La0zTt5D5iHY2LWetWh65a/mY2Vl
         VrxMveoYeD7N/Nj2GYpoM9O3S8GHI5PHR5GzyUF7lpRvMw4L74dNyyS+ccY9JBsMyZcX
         m4PZ7wpAISs2gEbIcmCmsrA9PdB7vklO48MWXJrFOfUnnBH+sf94v4kpy3r34LRE9pzY
         n93DZLc09sOdqwTA1ptfgsSTrwFx2rejA0gbYX1jDkwBG4kgXZZub3aMJrPHXXoYy5Wh
         ghww==
X-Forwarded-Encrypted: i=1; AJvYcCVT87Rk4TUJDMNRjjJYMrlrWy0zuQ2NSBVK6uGMbkaI0I85i4YbGjfqxQbdHMS8VeScYUbur08=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOmBGGAKlvmmnVb97+DMN/D79bJdfhfKswCmx70zLxtHzFTqmD
	fas/QDULMY42o1W9+My+Yjc20ywUOTv8I3Rh+CZvPaG9u8TfYnIz1LksB1+fJBDKtGBL0AQphqY
	9Y93DyAXuEj/o86zHYfo86tO81uOVxGnE857dkdIngq6hK4xn0G+2zLw23dIAtA4T
X-Gm-Gg: AeBDietXkIX/7Z3UvI5gDJcbIjn4jJw6EF69bEBm+FKrKphvBsyTf4Nhj/tmoYBxHG2
	ttLOEz+9HhnneE7la2qyDgRRnYe6xIh5aLKBhsh97sOiBAbaWjgv5DXuWnw+zunPHYVcLsWRwWf
	M3wij5R1Xrr4klQIQ+Q2EHPqujUbsa/KtboNIloPmYbmLE+01OzYlNI0LwMY5htGGPMSkZed74Z
	Sk+wI2HjaiQ05PM+W3zVoPRd2jgXoF2M0c+gshzmt5FnHmLtfzjgJSwxisd2Pk0BZKDK5hqnhjR
	+BD6aPJo7vLS04GLs5DEZULrlvfDa7yl6J38189yL7IJzV4eMiUSxJUyh7KE9MfA3fTk+IH3Bv6
	WLibUfQMB6HcSU4sc+bgWkpad2tuTkIqqlVXE40yzYWmVBDlLF7sGwpylWM3Su3swqgxcty9Cjb
	1/
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809563c88.21.1775668512008;
        Wed, 08 Apr 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:12a:b39a:339f with SMTP id a92af1059eb24-12bfb7451abmr10809540c88.21.1775668511298;
        Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/3] ath10k: Introduce a devicetree quirk
 to skip host cap QMI requests
Message-Id: <177566851037.1322920.3559253544691274000.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7NGsSsr53nlHrqgih5zchuvoNmo6w5r6
X-Proofpoint-GUID: 7NGsSsr53nlHrqgih5zchuvoNmo6w5r6
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d68d21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfX/Rv1UehYau1A
 cyL8KI2TX3iFBcq3jDQsQT41/mSfACtOLne+8Mtk9TKLypFMfqahpNWdAWj67n+1YNZUidQg318
 3XnTLpBAK9D9VEzPKqEaFylmEaFMqfisghWWOjL07cq2zScadobijaDvhI/hp1nYPEw96gj0KVF
 WYiNmU2UfMJc3ED0+U19ImQKnUGXUzT2oeH0Cf4wnGi6g+cYzCvrF6w5lN7DfWuoYuJRKP6VWyU
 tYojlLBmcgFAztq0H79nPMogs0vFbBWBUgUKwbD/GWj1siGi2ullvInuRyoAUEyGdNR7xG8zG2d
 Y/G+2GcLFagWV7vOhxT75zndkObCvtfmHmfNu/M1CI0ihY83F9OmBukSQG5XbzKSDn10h1YdXoe
 iA1XKX3kfBOo/o2IMAleTHvYMLte0UHpHoOwNA9XMgzfNfIXFH9RIm9nfii8+lysjk/ocVh/05z
 EMil59My699vGsiXIvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_101514_473730_F4DF0EF1 
X-CRM114-Status: GOOD (  10.71  )
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


On Tue, 07 Apr 2026 08:43:53 +0200, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      commit: 6a7693873b20680a3c33bae0c9f9cb3185f64ade

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


