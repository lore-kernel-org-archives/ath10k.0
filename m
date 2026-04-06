Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC75F46C4E
	for <ath10k@archiver.kernel.org>; Mon,  6 Apr 2026 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=; b=LWioH40zknFRbvOjy0PlbMZMmE
	LWeKqak73AjjXezB90w/Hmzbd7pR6sY2g/th+HsbkdlhKTllISUbHV+FKMGcKM9nkatU+nCftYotL
	hnuslxucn2Ct1QLR9qCad2wn2etudBx8ezgjXD7+IWFCBbKpNzO3SlJTHFSTi3B3Gb7Se+f8bywqd
	Vdqalfo6n2ab/ICcWtx4vB1Zde/+onx4/Mft6U942zIypdfZJU3oKVtDOBm/u2b9lbjqv/liNnF7q
	x+1uGx49x1sbN6A5F+6oQgdqTzV8yYRnQz/bEKV1i7mukzSs+I7boYvx9jRnUlhycaSOdHOnTXcvJ
	LV0peU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9mEs-00000005IEN-1oRS;
	Mon, 06 Apr 2026 15:51:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9mEp-00000005IDp-3KwC
	for ath10k@lists.infradead.org;
	Mon, 06 Apr 2026 15:51:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636F0tjx582233
	for <ath10k@lists.infradead.org>; Mon, 6 Apr 2026 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=; b=J93kyziEVXCaDbwt
	ZIT0AYP/Y0+O2Lgk/IKQ0H3W06K6bAYtGRhFzD/XVbuvpZuwpBH6MUqdtNwsDJme
	WouloICu0BfgqnKRoKxAXUdFscYsqt+EzzQAr3mUlPGKWa9Z7g5Vs2bE84XzaaCw
	SOrQzYu5omCBrrW6wKKaa972ZNQllDgt2bpVHBel4Z4m43XHQAmU1EoqibHgajAY
	Q4M2Q6kP21cghTLNdd/R8AVtvijc50TVOf5nh9YowLnhNFLjo8+T2wUK3iYDNgxX
	DGMmbGzJS2N7idyKVqmsQuuOeeXQB216jedwhbFbXct2QhlY5R1P0fM7Sh28eK91
	GYrzjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf3r05dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 06 Apr 2026 15:51:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5692851eec.0
        for <ath10k@lists.infradead.org>; Mon, 06 Apr 2026 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775490700; x=1776095500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=C0iNUjx5WIV3dODMUVVEO3M22DBAvn7k0v2Ee3gKPVxWu0sYq2kvYGvtYVmV585uzd
         /oxtzSMcWT9MEmEurXaRw/PupN3005bxnxs5VvU76ID+lCThoAOxnwW2O07lLdTWerZa
         N7q+U0m9GFq6GYW4lFQR4vyQC6Bj2BIavz+ZZkOGf06cRdXfvz+eAD0WpA4xf338z4U8
         d3zKrVQID042VNVh/aFBn4GFSp7YuSoO2rcohJp4Gct2KkMEV4Drg/oonHbRQO4OpBFd
         gHVzD2p1JOeAwBvY0xMbosfciyJbNLsCvSJ7sK4xXc2jLNoochJo59wSTnMG2kjFIOB7
         IG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490700; x=1776095500;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=Fe0x0w0hmCwTiqlpKpZ1DZzWbXAW8ngq3aVNYCtHmlT4hxD9q2uvT2ssc0DHxWY53O
         Wjol5/A17XJ9/LPOQgz9P9F67jN/iHSxbqnI8H95E7Y2PHo6LmdsbxCoIqjM8mHYn08J
         SZUNbIImLDGbgADRmyXSlxK28uOBTquMwAiwXEtFXk/j75AqRabmkfwaEf6treaKOn3y
         QJJRP6+mqpVLY0MJwGOh6W1s59K1jZSrh9LpkvyZMZHDku6Q3ORFztOBHX9jNQjAOSBa
         h/kt56ZolhkshfAaKV2SO7pnF5E+R5lwKBqi3mftUH/GI1+hCJpo/NIn743BVZgydBNW
         NMOw==
X-Forwarded-Encrypted: i=1; AJvYcCWz6RIJ3O+XQy3EAS5kleOBPtqSiNslIHwJ9lODxrrqZ+Ra/mWHUFLzr4GA9XFdJlAX4LjVwHk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7YEb+Fl4tQW2sUZDDL4trI+7HYY8mf9DlLAPYD2JKEeDg9YMm
	9/vIllziRsnJ71dQRG4F1kfNy3Szsis82I4ZDwUSlaNAcFkohn7E2o7HLw8lySO/d87uIMeeo9J
	IkJOgTis2Duj+Jz2fu/S8eT7yaWLTIgHNkG8YYqNEOEQib0B5zrNR9saat6xXEktS
X-Gm-Gg: AeBDieujZPURsWUvdJ6SragsOc28wryiyjp+FOxVplzjdOUUaqxOMTTpIIL7PrUZ6Aa
	zkpnK1xng9xRTJM8c8l5uZyN9awWVa2uPocYmt9JnpyF9EMPerU92pZXGbBM9HifGPe5SQxvO/4
	eT6Xab988pKJyGxIv/J93iwhhoU+XGcoDjXc1YTEcDZx84xaeaSIjLAdNHl6jkOFTYICjddacj/
	TQMKaRxJBSUXu3WW4FnsNCJSs1lSqAEXGgK2/LTax2+JSVj/IRYt12NLgLH+LLl9ju5AxN+GgE1
	YbQflpRjsnexbJ3KpSAWgDHvaQdVUFmnqt7OBx2yvV+p8xtQxHK/97mz9e5aMw0B2qsTgxXP62r
	oUoNvl+JJslvNcAr5iIKsNRhqpT4fmFb0VXpNv+/AJZojGO9aMJiQlgc4tspymACi21YjlPgxyE
	894ogXmB4SVu/YSQ==
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780043c88.16.1775490700199;
        Mon, 06 Apr 2026 08:51:40 -0700 (PDT)
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780019c88.16.1775490699506;
        Mon, 06 Apr 2026 08:51:39 -0700 (PDT)
Received: from [192.168.1.44] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm15701803c88.10.2026.04.06.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 08:51:38 -0700 (PDT)
Message-ID: <0cf5e285-b5f0-49ef-97ae-6c04504044ac@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 08:51:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YtipP2FNceU5JFcvjl07DoQ0wxGPjC0l
X-Authority-Analysis: v=2.4 cv=Us9u9uwB c=1 sm=1 tr=0 ts=69d3d68d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=KKAkSRfTAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE1NiBTYWx0ZWRfX/v9uFlkEvlUx
 jbLYhkphkTzjsEjibP9LNbw9DebKlVwuaO2ZnzxRqMpFolo7+7i1YGQnumlM11iy2Ul7KGzE26F
 MXthTuHzOjz09quBKlekhYGB2YMWseQz8JpeuKXa67rPQ/cmocpWkYUvo8qmqRuebl41nzAUI74
 kz3COIm/dMCvYIJ8OKoIP/9X9EJkiuc+SXvoQoQkIzfn/jyXzBVzVkqpsRCjDbip3Jw12G8tDkb
 8ZANnDA8MSFTT4S7N0NLPPspD8fxiQzBf/G/jMCBYcMPP5VuK5UmuNBp6lz6kKwnPO5Jf/N6AKO
 kL6vyawY91rHJ7OhCSMhJchDXRvf/zXugnfC7Ge8PykVMJ2iWJDWG8cQmHHa+wU5a5UpgbMbOqC
 j91xgGxck00qV+L5zI7deugJODooc6kghUbv+jltRtopfozkLbtNT9/AzoUOChxc1EpGHZYUMKn
 1Gwf2KIEQU9owyegy9A==
X-Proofpoint-GUID: YtipP2FNceU5JFcvjl07DoQ0wxGPjC0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_085143_985866_8F3C44A3 
X-CRM114-Status: GOOD (  19.59  )
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

On 3/25/2026 10:57 AM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host-capability QMI request.
> Since this request occurs before firmware and board files are loaded,
> the quirk cannot be expressed in the firmware itself and must be described
> in the device tree.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index f2440d39b7ebc..5120b3589ab57 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -171,6 +171,12 @@ properties:
>        Quirk specifying that the firmware expects the 8bit version
>        of the host capability QMI request
>  
> +  qcom,snoc-host-cap-skip-quirk:
> +    type: boolean
> +    description:
> +      Quirk specifying that the firmware wants to skip the host
> +      capability QMI request
> +
>    qcom,xo-cal-data:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> 

DT folks, there is a pending DTS series [1] that would like to reference this
capability. Would like to get an ack so I can get this in the upcoming merge
window.

Thanks,
/jeff

[1] https://lore.kernel.org/all/20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org/

