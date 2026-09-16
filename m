Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCBAC982C4
	for <ath10k@archiver.kernel.org>; Wed, 16 Sep 2026 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=; b=Wx0IwynfjoPI5t/dBrkSdhxiQb
	wPzbOhD7DlZ/qrlnxdJD3QF8d+4ZNl53Z+Gnbt6vUYu2OViCiHvFQpyKs4EntLmtGysHi3AEHQtVo
	NtlJVse4szngZ5qHl5X0hm0wxJzfQsqx0nTuz5DRdAiE1lXfJJw4iU1BuqGqeLO1CZuXEk6INBxoE
	2QWSlYH4QOoCPy26jXuPXRed5pBESAP5YPcF4YUQInoKe3gfeuHmXaBbyjC2zXP6OeoRN5gdySaiK
	ERigLdROsdj4/f328bT7uH1lzTeRFntVlRE8SScORLsjtraDJtYNJQWRDO3KB2uLVgd6p46HaRWbI
	hFAAxE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rCJ-00000009UxZ-0Tev;
	Wed, 16 Sep 2026 15:05:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rCE-00000009Uwc-3KdN
	for ath10k@lists.infradead.org;
	Wed, 16 Sep 2026 15:05:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYviQ3390972
	for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 15:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=; b=V5S9uLPBg09h3bTM
	XtAh5/C+atDPq7dYnJgm4MvHjon4GE3DZLkwoJCiupIwGFMRy2ZeyrNY1Vk9wYvY
	PRkfVNdjcnkpZSEv9k520lzbf+J2dQQe7qh4R47rqLlhQ+Ey82uSHYE0IlPBPI4J
	98UgpYOV4xaVAJZkCl65ZMnCwq0kFqK8DUHEEsCnBzgLREUmQrpbCSPpaEmyqY3P
	8IvzK+pAdsNAJz6onJkkjYFnXosaeC9cLoVwKA34dF2DHSIKNl6z9fKaJfhgvMDn
	LZQxeDaFL46X6vKwA7WLDlKWmfeTF9AEo1d+5scH9RkPGsQfGxFpnmE3RNMiSiej
	Yuct5A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftukf4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 15:05:13 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b3962f71e7so8532030b6e.3
        for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571113; x=1790175913; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=;
        b=TMxJjf1nQ6Nk5wTCekXRfsIO6X3zb5OIvCLYaxBfLfYYE/UcLin6dPlzhMx4j5Se8z
         tcsnoX85mzk4G2Y96FhFUxw53QQVrrbiyIuG5jVPzepXmUNXy85jD0xRU7hUpYHHScFb
         Iyz/OcEkO4CCY5m2YQHsjBHj/dAEXkkdm/uY8rBBoebSDCMT7APJ+KlTrYKDBTHRhHqD
         N2/+HOurYu3QuYBNYMfDSquuk2NtsVJ7uan6XiIQq9UGCiBLpJzJC6S4UzMhukn7xa8J
         Qlm/JwQEA6lazwnhfozX0bp+IuUfaT1njbaQx453PSikLXHFsTB5PqC3CysznyEJQFbT
         YzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571113; x=1790175913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=;
        b=KHYCbB/Q7FzxUPuLCi03k15cobpvis8hsBijDiBwObAmUldl2jNB8Zfj1VSeVaYlw0
         xUj1Nx23pB+pmIJmhVOhFgAqyt2h3sDtdrbdzqZT4I/i5j7kYjzb6SvCjmoH87ZNb0cn
         391VwPykUUi0XoDiYy9sya1L3MnYS3/U2MVUE6ELo3V/Ey1G89UFWxOllIUrYX2JUA9e
         9l3RwJluSOOAlVKx2YVdiaYNShid0p1xOf3UgvaGIevfS3W4hMSoPkKGt6duUV7qGYFf
         Lpd4qZOjH8QePOcGrZw280sHfAmD4+OD+sah/dG1XYgMQuPIyV7IS7mps24/DydihpZ8
         A5zA==
X-Forwarded-Encrypted: i=1; AKwUvByanErgEM0hXITzKH5zQXO8HB5psEfNlXPC76Ghgi1DYp4urgWn79yzY2HEaYMELMP2DSdfaxc=@lists.infradead.org
X-Gm-Message-State: AFuF++lbyQxn/A8VYObuh1PiZBvmY0yYINIz+F2W+rJTp976d1bW19Ze
	hVgamsvAgB1b0gdEVPjLm3CkBqEQaXpThSjEMnHPFPCbxFet5n58kRPDzfEH159sNi3n4OXHc9L
	XtV89+OmzWK0LC2fsAcFohyQj3Z8zdNmwG77Yug+hepUtjO4Wxl2CMG76+L0w11jx
X-Gm-Gg: AYBFou1svnpo1jkoIxg2IaO38Z8UsPrELf4T0QkxR1VmK3HocM9eB711YQV1d5B4kYi
	iPbl/ZXF/yDwCGUGuMHZ9XBoB5sPn4RatJjb9GcD4nFdZ+kbpkaG0hmhnkmrSdj7lgCgp+zyL5R
	pERUJkR8T0KHOGYgZskE3s6BjPKRXn4MLRi64J+5Wujzy4J1+o/bGRTb4PeuwflfUm9Ftimjtfp
	+Zri4ynedDyV3qXctRglVhtlrHQmX0xTw6BjRt6EEvzM/VYsLqr+PSPdOtsVdh/dcbzE0sjrhVV
	VnkoYeIwzl60mecd0dp4QsL81oUTKAskDlNOtsTcFwzUspSCm1mwA1rzUl/A/PxXOw1lBXO+3Se
	GW+LG/URsRAVBvtmqn0ou3JCArhCdsP1FSF3oWisea4Eny3GlWxNqgoW3sRR3
X-Received: by 2002:a05:6820:1792:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6c7d3af57c1mr3029337eaf.40.1789571110783;
        Wed, 16 Sep 2026 08:05:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1792:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6c7d3af57c1mr3029183eaf.40.1789571109343;
        Wed, 16 Sep 2026 08:05:09 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm9336952eec.5.2026.09.16.08.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Message-ID: <fcebbc78-63a7-44ef-a822-2313ad5d7517@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 08:05:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
To: Albert Esteve <aesteve@redhat.com>,
        Brian Norris <briannorris@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
 <aql_xwEy5POcVmyU@google.com>
 <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX/Sm9NB84tWQa
 YpEJioG9aU/8l9o26HzCkmhtP/fSEos79CY+beS/d4Wm5lOEWJ/DAtEdfxoX2PNNqgSQhui7cqX
 fXxAa9JSKlxJubjWhmTFhM7+NdgMo/jdhJq706UhWgCJHESkUs/ZqaZyyUtRIFpjq+szzZspWBW
 w6kfPk9bwrpZL2Bd90fkZo02qxkxErP5IClF84eCMYYVX4w4HYBcQwTgU35DTt6M2Qmv2BRSGIm
 eRa1hq9Qc8+1mxVkw2MQzUBQjT3k876yiaWCCoi0Vz+RvnydJnNFMGoebHQTTbSTuFohbfvI8ce
 /+9GD9yfcic8cGZW9q14Ed95PoTy/T1V1qbh5r3xrURnbGGybW+hzFwLVNjgsiK9TKnVciMViSY
 Do81GMfgBnol8UI1yR0bjTS7oRJ/M+lfSoBrG74N4E52rPm+0SMpgJNvdHI5+dPpcJ03Zhqe1Bh
 K/kYCTK88zD7Z3RzySQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaab029 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cm27Pg_UAAAA:8 a=BEXexABXWyTRsNrkf64A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfXytsrvMbQxfCn
 08djb2qP9xNftvrwAeWinGi8XHk/pLDLFmFmRWJX8jR45kosAOEOQ0svq6sFmBu1w9OkiELHdsF
 0O29/iMaalqHbyHfySVDU1cjiol/DUY=
X-Proofpoint-GUID: iUSKBH0radKb_GHm7ox6XQnNXbE9-flm
X-Proofpoint-ORIG-GUID: iUSKBH0radKb_GHm7ox6XQnNXbE9-flm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_080514_978456_C5F89F58 
X-CRM114-Status: GOOD (  18.04  )
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

On 9/15/2026 11:55 PM, Albert Esteve wrote:
> On Tue, Sep 15, 2026 at 7:26 PM Brian Norris <briannorris@chromium.org> wrote:
>>
>> On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
>>> A failed ath10k_qmi_init() left a dangling
>>> pointer (ar_snoc->qmi) in the cleanup path.
>>> Clear the pointer on the way out for hygiene
>>> and consistency with deinit().
>>>
>>> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
>>
>> It's all going away (probe failure / removal) if we get here anyway, so
>> this hardly qualifies as a "fix". In fact, in a cursory check of the
>> driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
>> irrelevant to this driver -- it never is actually checked.
> 
> Yes, I agree...
> 
>>
>> I suppose you can still call it "hygiene" though, and it's probably
>> reasonable to do the same here as we do in deinit().
> 
> ... that's why I phrased the patch body that way. I hesitated about
> using the Fixes tag here. I can send a follow-up removing the tag if
> you'd prefer.
no need to repost. I'll drop the Fixes tag, update the subject to add the
missing wifi: prefix, and edit/re-flow the commit text to use the 70+ columns
that is preferred when I take it into my pending tree.

/jeff


