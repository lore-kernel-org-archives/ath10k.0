Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853A10F995C
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=; b=iRfOThi+Xu6TKJlVEUISiZAHv9
	MwkNYRCT5eiX6/Rs3NKOr+QMgU7tNNbjZ006bc+cvogmkJmpGfyVyzKnd0AJNRmXTuWp6bhUr6GVY
	vHVQy3HIyYppqCFOKlkVPTQnyZs5HP7u4/qF5FGlFL/jSckRD4wmX/6Kv5sMrXiQQBIACs2JQxCar
	gkYsySqA6SWspqoDyDVfEM9PvZy/tdiMoqMQDXDDutOXtG9nSeiYrUpFuJagxEt3vQia05BK/pBjR
	HFWTtmJfHk4SwpFOJMM042KBo1V0NyVJoaazVdws9u9s6gGxjLNhetC0/DodPrMBeRRX1UgqiqNSo
	ek/y3UCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWUm-00000009AH8-467O;
	Wed, 08 Apr 2026 17:15:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWUj-00000009AGS-1tJO
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 17:15:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638EpONY2412265
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 17:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=; b=VMBXpyGxVNWwe6oy
	18Ef2/MGEVePa27+QQ3YRBkIFvhUPfQpeEMHsLNwG3C3u+D5tDBibQ7LwE3QPh7S
	zrI7iOEsCKey/VhkfFnWr/VWWW0nFZ4Gae2lTwH8f4P3k5GcneQ85znvPzzBFfEa
	lPl5hg9qEc90RpASLMzjApxmTfL41IAt5PM4rW5aKL0Z7baJ0OzbXdDrILCN7P16
	sFVbNVKosp+CZnYwQqBSWG8CFeG1m4f/hAQj6BuVoHrRrbmwBkjfc28v+/s7RJvO
	Shs60masP6S+2Fhc1HPDHrf4fuLmWNQ3N2kJ8eeOwvJ845GPM/XChT+gbQbwJh6t
	j7aiug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vcttd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 17:15:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70dd30025fso218343a12.2
        for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668511; x=1776273311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=fsVhAGwZRredyk8g6Fdv+O0u9EtyZKB5OsITaoS1xotcu879iCXjJ355FURSORYhI4
         xie1FZHlf/iy6KT6cVQSUO1e1xv65dvHQuYJf8HG8yNVchk7ip9D6B+pEQx+PSKc6fex
         hP7LHYuVNp7DuzBzxuCxNlbOInjHZM4m5DXTdDfEMnakYWrJ65Wv8IBUvYJT4FIjoW9c
         Hr8sc9FMnoA6gRtfYifyBC85PiecTZ4yfo+O8KhXHMMPkUW+NSmQCmB98S1/y5q1wygA
         OMNvYdiSA3ZLDMapULDMWK1Dz9y2LUrJVDxBNZWiHXArc2b3F2uz5rZlr3sv1HyWfS5q
         2s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668511; x=1776273311;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=ck3nOe3x4fGvI/bllSAE+yA14V1tCHvssxG6whclZcDa5GR8FcAYTe6C4WK7j1dML0
         M6AWg0GLlLnQxr+LyRRM+e7KpjViscpQq/s31/Kx7ECJHUgqWVQO8kTKYmsHUhTKRX6B
         ELZ7UEZ03hvD4X+nf1cyLXUlZKJHy3DAQMOBaUV0bLHw91lt3Dzr6VjSA5lsVYIUs1up
         KjOK/6VkEjiH1TsLlBCCtfwj7y61qavXzmLCn8Rpn8cvF7IPzsR9uPJ6RbbRaKEbVZxH
         y7bDtK56isj1hinWnGep6jTZdcEOOeGv6rUpnr5C5CCw9/+vfW0kzA5tQaAWokf88FpQ
         wbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSfaefFZpCHZfx+BLOafEK/PEdaEuc832HzhgOp2gHRsWfZ5yl8GV+rvvP2sVLyeqrbI/TJvU=@lists.infradead.org
X-Gm-Message-State: AOJu0YywxliKgbnbmdrEg7WKq66SK8HJDsRT89FxiS5e2/r7mTeFRad3
	y+KFq3hvlzzJm9/JchkjExh80s8E+xVaDA/vg1o1iBWnV46tlcdXyyUDtNya85lzRnGhvPIQUvq
	nWhnPwERbDpjl2r4nUx6sY9T3oRmjt6SWik0aB9RW0AjbPMOhWiyoD2Vtybvwhvrc
X-Gm-Gg: AeBDievLk5IN3qgWibQEAjj6GEp9hau6huNvP376665iF0a4rGmcbuYXi2p1TqjWy7I
	JusDb3SjAzjPSELL+j3RfGQ1O8ELXlTTBqeFYSgMUC9kgbvyz3op93DV8xwyZFP9FQlm+PtZZFl
	J4zptn75ZzbpTt/sHDl6gdrBjMEcE5u51+3REbQb6rGzAsEDmzoqs8Gx6nre27soH0HUtP18s4v
	LcOB5F00GhWMqHsXsaaNonoQlL6dZ7GwtN8/2tlZSzr3t5pk0fHlIp+aLu2lLUIjQPn+fmsgwvP
	o7F5hJaxV0TLkxXLzttmNG3e2NxTgY6Bb4PkCeAb+XrouLRkN2t4Tm91TXO6ol6jOUJISU4rT+R
	4h5hQYNZMrHD2E9Vy9UTjVZRY9jLHv/AoFGpdacA5OiFiVniWcRMijzjiR3bzh34gMbqezMB2KL
	+F
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128637c88.32.1775668510867;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128609c88.32.1775668510171;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip
 host cap QMI requests
Message-Id: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfX6eDHbGH9GARp
 AbFixywuHepwz3b8c+EFIhz/AbUPS9iD1h8W5rlYwlCyGvHgwh1TA/95kVXtWM/10AQrSgchQet
 HdQi50/OMWHFFWNZRL4SYMOSEaNv+3Inkr2VkM1xpSPTQua/6uMEgQ9GnWbBymne5VTXatZRDnZ
 j7ZTvlBbVfudmcLODdfFwNiYauyoTrKAMk9eStL3f+oz9Sh0kShqKOOdpBx2UD0jemuMsXCdTuB
 erY6tOhxtcp7zmnWse77i/CSewTWzUoBiYdTSbVjjk98E7FJm/PzoPB5wg6KGUVlwYre3DfttJz
 F7ZZJDSa09ZhsCXO/7E9iZuS/Bpn1Ytbfgq6O6H8Z9UNmY70s0xZokCOg2DeVVNHqcl5MN7AZji
 CeijPDZd3bazrNkoqDOy2YhRlXnXAHjqkIv+k2j4iO0/75FxzbaZ4/9QHXR5v6J1DxuE5fXLyK4
 RoUJaL+k1If0Rovd8cA==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d68d20 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HIpYZqqfsNrSPju7iiih-mHbxGVAbPi8
X-Proofpoint-GUID: HIpYZqqfsNrSPju7iiih-mHbxGVAbPi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_101513_774916_A8F73215 
X-CRM114-Status: GOOD (  11.79  )
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


On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
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
      (no commit info)
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
      (no commit info)

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


