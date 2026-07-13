Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6239C43458
	for <ath10k@archiver.kernel.org>; Mon, 13 Jul 2026 01:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgGp3BHgcEYylI7heUriqKMavChYYdvTveiO/QZuDII=; b=PyuZNFK19tCeSONIyAaiUFK0a0
	NOCQKWz+emUIhv+sb4ZBgXCfHGQdRbMKjLI3qiOk7vyN0CctW3FSkXw6VHev1XaKCf1dEgUSMjk/3
	vA94xUewwi6FzebgzeyjZr1c8zSNsliCe6H1/xU9LP3sVXxNsQJd2XjDdg2ARWdLfibppYfebgpEB
	npD1Dc8WU5fjJo2hIxoTYljK/EF29zXGtcWk5+zSC/V+WX5nEn80YDDwe00LMNszh2l6aDaC5cF+8
	Bc8h1JVCLAqqvcmEUUJiZ9Nhg8tZHM0ajcT6wQtxMbz32TK82811txg9A2HtQ9Rm6klaFfBiloWZO
	e5D5wx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5rE-00000007wP7-1ABr;
	Mon, 13 Jul 2026 01:53:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5rC-00000007wOj-2DNT
	for ath10k@lists.infradead.org;
	Mon, 13 Jul 2026 01:53:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D0juBO4178785
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 01:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgGp3BHgcEYylI7heUriqKMavChYYdvTveiO/QZuDII=; b=dopDccdrGv5THr1n
	XC2I8LPcaBuvA7X4bRd8/47QgjlS0pFVXHwSobmzc2ZSmDjCcdMqzHq45SpNBq9x
	uaYDqJlabS0AzJdPsCGY2F0O4WgG0bzkVgqRE/W1KZ1yEEoyUZncxRuNXAKapqEu
	I95Spbno89FGN5bR0kJW9GWLJVWCa1Ajr3/fL/M3jlen0bikbhMUNaxFwyimyP7g
	lEcMPSYBfDp3fsRwIsV8hA/MT8St01/LNNEfKfqIAVQ1aUDPmLgBiHuh2reFn/ab
	CpaQYZqgeLjiPMxWZnBxsDAd1oO3PUw4hUSI5CZcMuPO2sYmLL/AG2hHMBcvN9bx
	ETbi6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn38cav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 01:53:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8488ac68185so3538913b3a.2
        for <ath10k@lists.infradead.org>; Sun, 12 Jul 2026 18:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783907597; x=1784512397; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OgGp3BHgcEYylI7heUriqKMavChYYdvTveiO/QZuDII=;
        b=IxWbBOGs22Pxkgww52FGEQtB/Z/drqBZaWFKzMRiJQqdFqQB7f7CCK2zKJGpG0C6ZR
         ckI4AC8cMGxcp6t5sTEVvvX0dV1Q0VScf3MdkxrKpU/8px+ajn9A+CkeOefBnP4Cr1e2
         0i32RQcVB7NG6D9YUKz6v/dDMv3RquBrHt0a6dJZ8NCqUryBkw7bBtTE5PCaGLnGQjyf
         gV57PrOrN6s3F7gE3SSHxqocxCngZuet3hgYwohwzlzON/3PiQxHf2CKbOu26e7ME4Gs
         bNc9Q0+9s7MDfpMMMFZOqo9lh4NelqxJJHjjtj8MniKoh1OrCU70M7ComkZTILfczzmo
         Vjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783907597; x=1784512397;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OgGp3BHgcEYylI7heUriqKMavChYYdvTveiO/QZuDII=;
        b=MCuQMbuucX2YVHaHCNH8mjR5m542gRjMYZhkv2VleTIe7hbTDFOVXFUaBpsiuTPLHp
         kiGqbrCMQ1xmu3Mr1ytcVWSkbSS8f+vJ7r0EqmoMsWNkT4tFhPl2kXA1sbk67v+HaQ1f
         sdPb2AcSCmPGwEMszNMwWsi8PduWok+BMpDbbeR1SFbF5G9a+B4WBVsXR0m9GH6sHCRD
         Q8qf+o4keXI7wZ/9UNyB+A5Eacsiu1u5gOBszLeINxUrpaCZLMfJ82J12HMcWPvgnCIC
         fVuru/qfzZN64fJ4zZDfL2mAxkwJX32eTN04cnNvJw5ibkZmcLCzIINHpi1MDFkoQDlr
         13Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0utHrsgxMMyPsDomeQZQSHEamOv5qD2QXpxPmNAMrBdkBjTH09pBjywFooUShiSgywTOBoQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXgWmlDursYdbIvEXKXORRy4Ljwst8M/PHPSQbLAhF+U97XK35
	Djc4+4CY91TNWnszaW42VwsWvcoYNjHPD7xeBv3fG23uu3vtucBxGyCVphUrHiyaBYaAXBsOcE7
	0L5dwJNqvqSSHOFAeHO0v3lDU0tXKC8lXwRIjTCBHe69Ud0uVVVrwKFkMkeAzdCvP
X-Gm-Gg: AfdE7cku/s+AOsorTQ7E0CMjDk4AZq2WL+b6DBuriTwlwbYXFfMZUioJK4IRyaSn52H
	qksKSgxklRQ+jLUOIDGOzdzswUmiRmLono0KfmYIe/NqKVM/pdGzS67AsAjUJ6NiWyzAvVh/21u
	XSuecb/2R4j0wJEpd96vqXFfdffBT8qMfA1IXASPgOtX4Hcyj8r1EQW/DF4/6s8VlSqt5SdI96G
	pMiTcKnY8+c278pTbrvkArkiCO6EXYZF/LdbBKU1UCVLE5ED81szu2qE8/jHvsDqQV6rTsid9/m
	ciOf804faU1bh9pBRWzCSip6hq5NX0IU8K+9RGmjKMR5Bic3baNgCBwKjrhp9cp+g8Wc93DJBHI
	jev5VRB9577Q9kZe1z+N74yOMXYWunSKL4L950zXmPxADHyWtL3MQ575oWLOkH+8ND/g2zHaWfM
	UzBi1alLM=
X-Received: by 2002:a05:6a00:3e18:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-8488976b6b6mr6602481b3a.63.1783907597100;
        Sun, 12 Jul 2026 18:53:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e18:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-8488976b6b6mr6602467b3a.63.1783907596664;
        Sun, 12 Jul 2026 18:53:16 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a2cc397b2sm1524822b3a.0.2026.07.12.18.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 18:53:16 -0700 (PDT)
Message-ID: <36ddec64-7712-4749-b2b6-38553f6fa227@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop redundant NULL check on devm_clk_get()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAxNyBTYWx0ZWRfX8tTrOqXXudgJ
 PxhFzjLEQhV/vJ3iq1qMIKm1TDwLCIU/xTmqau2fp6aGtjK9yGeBsA7v1i0PE4CJRu+pb9uivFZ
 zajBAqbUX7+QbqGlEzG7yGFLL30lpjDw/HfGagc0Xc7EDRQL7qH4JQRQ+ano2d4ygwlhbNDRDo8
 2lR4nP3MS1q5zfk99gTjOZtYjmx+GycDGPQxTu3F/JSvxCQME7fptI9ZU8ELlRyJ+9/ZD398zz9
 5wJZuP39K++QJtjPmkkKskhZsHQDbrOdmrlfyn3sAykT65Q777Whjf2Av/seGJqaYlEhHcp5OHV
 Ijr31NxWk95AGsJljIYXNB16MK5S3k5WyUBhrbDWkQHWy0q3xxp4RiXso51C1VUTN7vnoPyRtug
 SGPsr3lend2DjNHyfoon7JkcqCSad5/MfbByySIdo3bjlYrStIzn2SP1O/S6F+cIAveN+DOlcw6
 Yrz2gEYfYLsxlKUgUPw==
X-Proofpoint-ORIG-GUID: 07RAdxNdgY85pH8g009WeMA9pY5qpQzU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAxNyBTYWx0ZWRfX4txCamlajZUD
 Q7kkeOL3v/nGCNCeAm5zq5WmnbATcrNnjgZYvnYGjxIj59oC646cLYuc+iYjcFaPETiePrRRTyW
 wqSYKoqFyNGXrIsjKby0Fftgn6lOBQs=
X-Proofpoint-GUID: 07RAdxNdgY85pH8g009WeMA9pY5qpQzU
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54450d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R6_wmNw2kjsSC7HTpZEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_185318_583961_D81C95B8 
X-CRM114-Status: UNSURE (   7.30  )
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



On 7/6/2026 1:24 AM, Krzysztof Kozlowski wrote:
> devm_clk_get() does not return NULL (only valid clock or ERR pointer),
> so simplify the code to drop redundant IS_ERR_OR_NULL().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

