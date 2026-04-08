Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2591910F9964
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=; b=ix0NjlJlqfm1D49Vwq7ohTuLR3
	Pv36ZjlOAgdsl+eKUcc6FoN/SDd9U+/3qpZ0zWAH2VDbd5vsJtOrPkR5S5xQTO/ZDSRuV5ydCE8Ob
	OHmXizNU9C+80s7D6OCJbC/spT7QRnTtwmWoOuwp4XbhN1Ju+DLAr1SHH+7NbQWwzO5dFQsqXxUSX
	9cS+DM1YXnhUN3CUkP5YlvBZMouSgzGpTj5B8ofHo+rtuQQ1G/+D5fEh5iZFRWjZADTMRiW5AHk7v
	mlNP71hdCZ5NU9RTv1l/YF5cSs72BBuUHQmc+ovpcL5RyS+1Qx5m5yhRyP4QfJVgL1n8ruCH0eWda
	N7tuizzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWgL-00000009BWs-2oxI;
	Wed, 08 Apr 2026 17:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWgI-00000009BWP-3TnE
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 17:27:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638FrA2K1922404
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 17:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=; b=J50gLstgP0fA/ciJ
	ewIGPNAE8wZOH1nGkgIZ4B9IGehpZoH4YqJO5/U/XeiPzqcWbER29r+PdzpciDLR
	S9ucj11HgcuRduSbzAvDP6MZQHFsu1LARrkcH2hG1CFqeF69SVYAuBdiGRrH66w7
	ogpojaBeYo8B9QLnjV5hva9EfpHNoCmrQVUyp2OUPsfy3jAuUIZWKqCGHPiCaoWb
	NX4CLvlvxY49StRSydOeZp7ANA6dlnrCJu6xp52Y/ki6BlZEf6YtxhuMzH9cYkXW
	KdpgFEIS8NcgAVGtOPR/WqGW5lo6fwpiBfW8gufQWemyZfmyXRgxpCOOAkk4hwi4
	Cb/2IA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28rbgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 17:27:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso241144a12.1
        for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775669230; x=1776274030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=V+pDzAIzfyebOHdpk47A7aIU3zAuo9Gs+HXfz/3y9h0nbqSoNARYgl5ildYrI5MlP/
         tXOVwm4p3HUbh0/iNrmgQ1SHwQVp1tvLs0pKElr4Iwys9RI5gFQhO1X22czA+GNvV/Mm
         icX0WnCXXSLta4tdlEeAWlaobbTBw4NnVVOnPpnABI1a/VaUfvm6UImbLD7yFAj+eZTd
         nsXmSqs8tYwy7cj2U8nM4PMixTLypSHzeGElBKRipiwfoErQE2wZBrBN0KBp/WJx7gKm
         5gtBQZV/Ttnk/+R1kHK7h4PInPgiE4G3vr/r4GzTYKYowYikmTafxFyGRiYSqhOGE2a4
         bKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669230; x=1776274030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=BsBy8g/JosLWEGv6roD+ivFWRPDxk5s2c4u3FIIaRF1AshSDJat+Q7r/9Or53fwF3p
         7TIeQI9AqXoJt7HQ8OYrsvKsUT9rL4ueoYrudIaTF3PoHcXGAZpdlMquY7BV+nTS9LNH
         SGwUeGFAJd+m+1Ac7kUbbOh6GuBfa4O6AVkd8Bie1Ny5SAbXvsuc7WiyKOXXnuA45M0Q
         p7P7x1kOr9y74ql6LIk16fMK/eIgMa0HdwQNBVmLTt2LtoM+dDnhTStvdthlgzVx9mKd
         Fiycb06oHu5HXpCIaWV9cdPqYJE8XoTqBZcjz5ba40tAg2Illf950ZL4BI4mTuzX9/Rc
         wM2g==
X-Forwarded-Encrypted: i=1; AJvYcCWSbhlQJ1GNrlAvx+QUMrc2rkyIbbsxL8qtYi9EYAITHwLuB8RhPBzWiZF4XmMP4BNrkRgAMAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YznyZahFz2E7FGuDAI4FPtNsGEa0aylnr99WMAX5FwaTrSu9m4B
	MEXWz74zDBhHlrWEFCu0apxK2UjYnIQ1nELGm64w7VxH73A433VjPS/e9pQWnAMDF9mOASr2dJf
	GnP3aZWL8AwOtSPOE2sOMc08Q7aMMBkRlqHx8FtrdijQdV8sOVZhmzxrRC03v6fTD
X-Gm-Gg: AeBDietN4hBBasVwX7Ci/hnOzKZLCUuvo2Vm+sh3mhnvOCUZKPU1NPXfOBqwjS337GM
	F0qOISYz5lUEzApht+22O/0y6A22J5ka9KareT3EFwjfWFciqezqA8kVlfy0NfMuvu7Cl740K3E
	iVVy+xIy1ofA219tbs5XbbiNJ6snesL1CMnYi8eHGXXFXNVnd6K7Cy0K7yyXLe9tK/9VTIOSHxY
	HVgrUZpcUKIjH2mom5lReyJnapaC4AgV3PUeMcK6hWPRTpnwQ0adm8ap3oK7sCiIIq5Ay3N85mr
	QDNfpgAmfrfRR7Rh9k2zSm7EWVjLrni4AB0EVj6NMyC1kRkNEehVS594jpr64rYCTWqjVtWjwrI
	VVIQHQkiOo87CygaTt0HQ/A1Jro3mK2XoHWdz9AaeVhztX5JpaR7Ma3MzDbOn+b1obcCgd1/zXQ
	Jm4McNLQ==
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155902c88.24.1775669229604;
        Wed, 08 Apr 2026 10:27:09 -0700 (PDT)
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155884c88.24.1775669228903;
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d3a941b6bdsm1705140eec.24.2026.04.08.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Message-ID: <d822487c-519a-4028-bfb8-47a778d26b8a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:27:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KRaT3bWGGKGHm17C8zzmjcaUo3TEa-tz
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d68fee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=K_8wqBj_W9ihw6XZuEMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MiBTYWx0ZWRfX2YojNFzCIdLx
 9SQNZ2LLXrl7gfb1C7C2nmsIYI1FvJ+XdZ1ataWQcWmUui9NxP1a49U4R8DN8fVe2W4jltgF8WD
 XW5yeZu4GZ5dQJFYFpCKXAqTATUT24e1wBqKEa+hO3x8MvXk8GepCL9uI6OmioR0EJxtj6/fvmM
 0VLkuHZ0fjst6KBnUkPkB1jtcXRcHU393FGtJSIUIZ+QTxJDpkFTrvHYVZApMEO26uadnlqc89d
 /rx3gM7CqSGgef+WfM/SMxl/Q5JIAbM8d3ThrQZtrGByxzvNS4SwL1P/KCjGe+bVaEgqW/Q+eVs
 BbI3vFCSX4gUAteO7NERQbKXv4qKt06C7jAIiIJJDQpXfoVISw7SmcXnmfxynE4pDliyoZ6MOsA
 3IzMUf8ogmR67zMsOa2m/zbNIZ6RVQW2RgDU8DON2u2XsEW2psgNsIrL/UTMWjbv1aTM68ZHX1A
 i8bBQWo0JojioqoeU/Q==
X-Proofpoint-GUID: KRaT3bWGGKGHm17C8zzmjcaUo3TEa-tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_102711_572642_67A5AA59 
X-CRM114-Status: GOOD (  13.87  )
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

On 4/8/2026 10:15 AM, Jeff Johnson wrote:
> 
> On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
>> This quirk is used so far used on:
>>  - LG G7 ThinQ
>>  - Xiaomi Poco F1
>>
>> I'm resending it after ~ 4 years since initial send due to Snapdragon
>> 845 being one of best supported platform for mobile phones running
>> Linux, so it would be shame to not have shiny support.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
>       commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
> [2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
>       (no commit info)
> [3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
>       (no commit info)
> 
> Best regards,

Sigh, I did NOT take v4 of this series.
I did take the 1-2/3 subset of v5.

Note the self: actually look at the output from 'b4 ty --dry-run' before
removing the --dry-run

/jeff




