Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA9CCF9F8
	for <ath10k@archiver.kernel.org>; Fri, 31 Oct 2025 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hdd5AdlyqhlrueEU5Lqqj8lDkZ0EpfGrWh6YhqyV3g=; b=GzUfyobY+2GN7Bi1fqXJ5ifbjQ
	4K3/v8in3sV0U79gNh/0KeqQtU/5S7aKjNzb8etSBjyVMalk8y4SVgXPZn2bvhCezznUJNbayFeQq
	6kLM9N6OCHzAUEM8YhusJw1ZeBF4COnbIUf0GDyQJ34+3x4Yk2393BJM4fG5Rq8z0GruJdr6FIy8i
	keX1a4to+TL+smG5BlaRlgREV1XJaDpycQDDjwDmC9aqtBYHGkanzb/ouVg8uycAjZnkZRn0xv/WY
	KIK6NGyHER41Kf2KUWLw9LqBTTOvDtYAw7PklLXoKlJRyKb1XCFhlUWsiqRhWTwPSr+G9GzinKo8x
	6SeiXpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqcF-00000006HqG-0R4R;
	Fri, 31 Oct 2025 15:00:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqcB-00000006Hpc-3uZz
	for ath10k@lists.infradead.org;
	Fri, 31 Oct 2025 15:00:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VClugb1827685
	for <ath10k@lists.infradead.org>; Fri, 31 Oct 2025 15:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hdd5AdlyqhlrueEU5Lqqj8lDkZ0EpfGrWh6YhqyV3g=; b=OhaZr3mjgOMhQ3KA
	i5IsPrjX+fJxfY0ns55gYzZtnI13PISV02vWSBtY2vnqE2h4FONrqMG5VJ4Iuf5Z
	Kk3ZPdwBosznitWu0NonYGLky0phEUb1C2KQgDQKv+Q7ZoCvQj/pLBALVFw9t/xV
	8vQaVvcCJSQ21ytPP8VzP3HoFnkfqUM9V0tlDBEhFRSYHdfORRUc+lQ2A0/7t4dA
	A+jO6T4NyIX3NmQDf0j36AADRO/f2McTAL9RUhmPE6VGwSYcTMvUIMRRdQkTY+Pz
	s14GLgaZKQSfr7to3kBqGnjg8EX7rVGY4pcylqLZRGDISrUtXQy/dHGfpuSr8zAT
	eJqedA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11snam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Oct 2025 15:00:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso1768340a12.2
        for <ath10k@lists.infradead.org>; Fri, 31 Oct 2025 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761922829; x=1762527629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hdd5AdlyqhlrueEU5Lqqj8lDkZ0EpfGrWh6YhqyV3g=;
        b=f/q+sDIqpOq/bUtMB4WQlym4cjlh0mCrc9+1g6zuXw4XQ7QCG2Qw4YoJ/zs269mixu
         fBpcsehvM4WdxTMSM6QOtdDvpvpzf7bdSMhztwM49tSNMXPaeF7b9NhphUcY4VXoAEvA
         5+awhAZoabhMx3vvuh8Ws47T85kYEdl1WE16+8btVHseP5ErqGeV2ZdCjv98xvT9k5QK
         0q5m5L84zhav88awvKCgPAe/IXjS8/VAmGGmbEjgNm1dK4S6AwG8kB4GjxAO0dUOLjEt
         f+AvMB6K6BuiRPjV3aR3IZ+sEoWTO9koxAElyja7w2wbNo0Wr30TBsU70nQtjHGOmOyR
         +JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761922829; x=1762527629;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hdd5AdlyqhlrueEU5Lqqj8lDkZ0EpfGrWh6YhqyV3g=;
        b=lzlF4RMcaNm2Iyqi6mPMXx3HlAU2J2YovDYFH8XssWD0tOk7AKaBdPB6Mh5gCpoM/e
         c2ydJX4MGPQXcDCjajUMk4V5kIgCXOMpJMtTWJ1+poEO7dywxIYwzvZqqqFz3c2icl6g
         NClCoxoy4K/B7gv24vfGsyFYESc/bDfF+V6NmXEX3omPvi+Z2tfKJs8KxAqd+NjFgkDC
         4UDhgwh02mZHNeLFRy6Qb7NzFyXeLe+fua9RFANdk9Y3Q9QIcZlZi8dNNEQQXt2jKNfE
         epWinwO2BPgwZNYcUEl+/eYMMkkdC8YfHK8mGfwEeMUDTVQRaV515sOzwigHQ3e1pWbv
         4eew==
X-Gm-Message-State: AOJu0YyWv35mUSRIa1SNYrehZpEIpqIgUWFaKOyMG1bOJNIEIuRvQqxK
	6H/zX16lvLwogfoFz8Ot+bRyecG2bRYpCvLtMHqs5AM6Bu/N4zdcSSsu/KK1tu6HS8x6fRtz5lN
	yytosu8YqhRtn6RJUs2BZgp4qRfRtZXahxKg4QMphTcxOt69z7JqN5ZA/RgIidK3c
X-Gm-Gg: ASbGncs1Wm7x6X24NNCw+btl/u3ebKqlz/zgbWJ2Z3Ohy5kGy3jmdOGmnEbJZToOlzf
	m+s6f0Y4Aa3xIGXX2PbuR46MWdQZuJIvPF1GXbma26fnUucrLI2C67kqDPxAclepwTjaUQXx+yW
	XiHD99ZwcY3A0pHvX+EG8rjKQwsg66CgZ/m1nxf/5Kgfy/kfn5FJamw+VfrUezimHPU24I267EE
	Pn0P7UbsbnA34kyi0xPXHnVcSddLs7SjG+CjTldnpIR7OZ+KAAAsQHvRmX01l0J+fqUSPyhjPW+
	SUDeI/vDUiD/VaG15Ji5q+sCE5tTV6CcMpxP7Nvt0YNgCNK59n/Ux55JkA2DmBt3sB+TyUAGja+
	g2OakQbF0LHbI7odbpx85W8Ktyqk/sfp3OP3ROe5A2xH1gmgXLhPqp6gLf+o=
X-Received: by 2002:a05:6a21:328b:b0:334:a784:304a with SMTP id adf61e73a8af0-348cbda98damr4637296637.33.1761922827100;
        Fri, 31 Oct 2025 08:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJpt0ufWO9x3SKiQY56jt/fiq8lIxVlKFj/qtUdM1lTLD8M7JszPy/2s5xZsXeb4DmTiz34w==
X-Received: by 2002:a05:6a21:328b:b0:334:a784:304a with SMTP id adf61e73a8af0-348cbda98damr4637032637.33.1761922824816;
        Fri, 31 Oct 2025 08:00:24 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be5ed9e6sm2385181a12.27.2025.10.31.08.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:00:24 -0700 (PDT)
Message-ID: <6de0a467-14f3-43e1-952c-b8cc7eb4801c@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 08:00:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: simplify
 ath10k_htt_tx_mgmt_inc_pending
To: Zhi-Jun You <hujy652@gmail.com>, jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20251031111639.406873-1-hujy652@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251031111639.406873-1-hujy652@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pIEVLhzjt0lG_u1GZJhY0XQBdBM8YPg_
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904cf0e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=2MrtifnGaRrmffXHbPQA:9
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: pIEVLhzjt0lG_u1GZJhY0XQBdBM8YPg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzNSBTYWx0ZWRfX7eMgdwltxTgY
 fM/KCf8svVRu7wXtsRiYV1myGTW+ubRJh7VyPNrBRgOuE8iucmNC8FhPzM5DmukZiSJ+MLcwbrm
 ws7Z7KIrCdXx9T5p7N/d0qW8Oic2NGaFc0hCPqU90btignUmEY0eDCjz/ycxQxZ0FNmcSnOD3hE
 5At0ARiz+7FvmVfNjfFvSMoB5R7bsout6xMBRAmF0+/gXAcAar2diBMpe1d4cvCfRxg7MTniEHZ
 8QiVhvZEPTX3P13Egj/9v/pE7+G5hMUttBb+V/uUVpqat9zmJyqXGDTwuSLdVfhwSHOZGum2oe8
 JEQ8OVhERMsSSjn6Vmb7oJMYZthRUf3JHSSx5xwToaU+/oguPLTIQAemn1EVBf9+SApAI+5x2Fr
 fjbKn3n3f6zZpr58sJX36/010MtJpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_080032_280775_1CAFE746 
X-CRM114-Status: UNSURE (   6.41  )
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

On 10/31/2025 4:16 AM, Zhi-Jun You wrote:
> Remove is_mgmt from ath10k_htt_tx_mgmt_inc_pending and make sure we only
> call it when it's a mgmt frame.

This fails to describe WHY the patch is needed

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

