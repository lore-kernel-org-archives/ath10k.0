Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C496FD15D88
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWERpC43xO7LdOOoV4IVoJ105U0V9xkWoHxV/x5ffCc=; b=zk0C940BWgFjYdWtLAqokOGU+5
	w5iGrjCDzGfO+xF/zoN1DSpkSa6ZdhWKVt0jkE0nXOv8XFwGGXjEhSBLUSUuFW5j1WyXif0sAlnb0
	xbXHtcm9E7gfEn0fD5S/YzAEwbOeG2iZP7iQbie5A0jmfyA5qHefE37V3/155fL/LA+yEcUgl7oqT
	iSag5IA1qwNYXeULi1vpW94tyXch8U2szs4eqXlQBA/AQDywN4uAsZGNb0K2AnfY2UCtFlHl1sKL1
	Yltk1/dW5+Af3ZPbcLv3z+zNnjRDSFq3n2U5WB8wTlL5MY5vQTdvfM9xOkqTf5ZjV4IDq4OCakzEb
	+TzWPg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp9v-00000006itq-1dKt;
	Wed, 03 Dec 2025 15:52:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp9s-00000006itA-1ylR
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 15:52:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3bmk1536211
	for <ath10k@lists.infradead.org>; Wed, 3 Dec 2025 15:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWERpC43xO7LdOOoV4IVoJ105U0V9xkWoHxV/x5ffCc=; b=jrzezYBdFCJjRftV
	KX9nkeoMRvv3hFxtBtHetwxBRrQ1BJRrzqerTvjgdRKbobieMDRRP4LC2GzfHMic
	o9kQftOnWTJKWXo6w1/IJSHxBon9taTnG69JH51Y4bax8gSoZPj4oLUWuxQ+7fbc
	Cw4wGp7g1Bzchtj+57aY6pOL5/YWiUVBwwUP3ffQAEUozBbgtVmUrpM1FCKxUPur
	DfvH/WZIhrXuTDlYXN4fS9hcNDzobOAWBwxI/jNkS5ZVSZmuoZsBOzO5x+A0R3pX
	HmXyBkgBMhOsahng/K/+lDFmuhBDJqCM01LvmiDmri1uovDUtuTuMJB2+ILHSgJ7
	cdfQ4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hrt79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 15:52:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295915934bfso84947715ad.0
        for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 07:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764777167; x=1765381967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWERpC43xO7LdOOoV4IVoJ105U0V9xkWoHxV/x5ffCc=;
        b=ZYEmkTRSeFMOOqaQyxwys9dvtC2Zq9tavRiVDuFD9USl3QprkOA7hTtY/rEcVO1GPT
         ekw/dprRAtBkUlj8/EevIaWy9evrJRn+p6g7HEGpTP0sMI04kXbTGQMFRXcmvi5pJwDr
         Wa8b9QANp/yxCu+YVw1l8/kh24hZN2lIqW8WipUaaiRx/5tDFFdan5AdoN1alyeGuZFP
         9reG2Y2rX2uNbVfptddg1GG31wMFW38lHz85pTLCRKpKg6FdvghiskYEXcqsLyDaVbuL
         F/wsLaQDlZ6K9MkvGxrbCvYIG9KL6VwKobyugCajC2kxqEomeKsn1vhKB2lRfdtHU9am
         PCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764777167; x=1765381967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWERpC43xO7LdOOoV4IVoJ105U0V9xkWoHxV/x5ffCc=;
        b=QAcnIZeJQHkH61RMFvnYnAEjJhwAFWl9YLeCdGh776lQpXI3VklNzTNYg3u3FJSEzt
         EHL8AtF5oVvOoV03gr+/9y3xAVBY1IXNg352MZB4rstbwCjdM3PPrgYxQnLgQzAO5WMl
         MpE/InaC/EIvCGLCW8iKTWQuamK8LoUR8dPY1Umfq0I48fFqqOxAzq8NPUeLjbmi9LPU
         DFE8a6l9fS346M2feCGjUIno/toNIxXJID0RwxVcOwAWDOoip38idvXIXw9L2lNtUJIu
         6T2N3D+5H890RtYXFUeNeSG0tiM7yly/WT5eGH1oeDKxtCmcIAdyHeN60x1jWhCDS+bX
         UfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLnRZxzO/4OOUx+KQbln+zhDZ0D80klVK9LS1vZ7NYH3r3LoWbxOV71L0eRY1RjBzbwr5KTKU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwjlL3Izlty/UjdiGjXrrXUB8dS0oCnv8EYeHpOjNl3guiAx1S
	lWy6VEFn3EYz3BNCx0kYM9k0qAtVJfnV/aBgZbzvHoS7dM7eLARdiMTG/TYX5MUBi69hRuHuXxm
	bMTFGxiIEdgmZUwsdNALjCXwqZRXvLDywAtdsLLraGZld1J/qPI5MPrSFRjIzqqXyC7RBnOkF
X-Gm-Gg: ASbGncvCSg2891DWZXblEDnQHemNoQwU0KPM1ZuaXpUvzUkaccuRfwuyhNGuLhHWOM/
	gkzHipqTGKaDYEoVs/JtdrqtuFKJ4EtDV13wuBEWrqjA6Z0TyC9ZVEDnqzUx+w2qAH4tVKDUGRZ
	oOpU5yeT6FRB+G+DiQq/1c20SDL+xRi9XsV4lEri8G8xySHLM0SlOTj87VcUEljGLDdCwOpu0Cw
	WXYRSjapTWk5EB1Wj0A84vMDyxm6auzM9VhMxIdmHs810erBIn14E9GQ4xuXQB9Botm9toonKa2
	56qZ++xFazZ3DXNXRiWfAPG9TQzRrq9x392PQXIP7xLgnHxyducgohyryFk3eQiyXGst6K/Z/uO
	x3GjxOEfEqKlm6wyAuvbVCsFAEHJIdjumq7wCQk6H3YYUB6ai8BmW0enOY2CBFxVzxGeOUA==
X-Received: by 2002:a17:903:3504:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29d683eb3a8mr35754785ad.61.1764777167198;
        Wed, 03 Dec 2025 07:52:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESzvhI7Us3GeH2XFc6OjOB/XyyrxduJCSLZnzIbw+a1Y1n+zyaQjeLV1C4qnJZJxjWssYXkg==
X-Received: by 2002:a17:903:3504:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29d683eb3a8mr35754385ad.61.1764777166702;
        Wed, 03 Dec 2025 07:52:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb52d14sm188788595ad.82.2025.12.03.07.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 07:52:46 -0800 (PST)
Message-ID: <8f91fb5e-dc06-47ed-a49a-b729bed644e0@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 07:52:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] ath10k-firmware: WCN3990 hw1.0: Add board file for
 Huawei MateBook E 2019
To: "newwheatzjz@zohomail.com" <newwheatzjz@zohomail.com>,
        "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
References: <OS9P286MB6871D7D27E24A9B32050C888A21DA@OS9P286MB6871.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <OS9P286MB6871D7D27E24A9B32050C888A21DA@OS9P286MB6871.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8kpyu_5xXF44cHIrtkDj11zNNwCVEM_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyNiBTYWx0ZWRfX70hJWPVU69Cc
 V9bk1O/1U2SKbVHZQk5AJXZcxzVi/QjOTM6rvwREm1oAl6pfnIlMPZgN3tuJmEpuGm9b5Y+8O+2
 C1by1JaPQgHTYrsOzmOSaFDAY/ACx5FX8+3Mny+Cd/loMAVeH7h+ODEIRDCn3LFt5Ya0C7bq/qL
 /TkPpOu53us3gNwoJOowInkGbU+8JGjtX4FXiBf3LM47CndBxjXJXUTb1WZYRV9NkY8QfjtdYF3
 nuHIkK/l1vjr/KnPs89AQik0yQm5HfZdI6mAb2XRlfBEZ8BPsKwCez9i+SVUSYZRjEqvsdaLgcz
 7dVI/Lb1t473SPAqV2Ci7G59vlszWgiRZG9dgC/g+zLWQtk6ncXVQqpRYELbvqlahim7NI9Qtui
 TGLqGkMYu5Vs44/7EdGLEB0s/mUJbQ==
X-Proofpoint-GUID: 8kpyu_5xXF44cHIrtkDj11zNNwCVEM_f
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=69305cd0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=WV1l7McVAAAA:8
 a=ZJT5Bb4z-mS7AxgY1coA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22 a=ly-PvpxawfTmY1UqWLBn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_075248_514691_429BBD9C 
X-CRM114-Status: GOOD (  18.47  )
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

On 9/23/2025 1:55 AM, newwheatzjz@zohomail.com wrote:
> Hi,
> 
> Huawei MateBook E 2019 is a sdm850-based tablet using WCN3990 wifi chip.
> Using C630's calibration data causes poor 5GHz wifi signal, so add specific
> board file for it for optimal wifi performance.
> 
> I'm sorry I forgot to attach the board file last time, so I resend this email.
> 
> * description for what hardware this is:
> 
>   - it is a sdm850 based board with WCN3990 wifi chip
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - It is obtained from Windows (in the FileRepository\qcwlan folder).
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - WCN3990 hw1.0
>     + bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Huawei_Planck
>       md5sum:
>       cb84594777339fa8d1460a394f4153f6
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
> 
> Kind regards,
>         Jingzhou Zhu

Thanks, added to board-2.bin:
https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/892974e6f6ebcb5d439ddd020188e27c1a76e606

I'm processing the ath10k backlog and will issue a pull request to
linux-firmware when all the pending requests have been pushed to ath10k-firmware.

/jeff

