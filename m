Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E09DC9832A
	for <ath10k@archiver.kernel.org>; Tue, 29 Sep 2026 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=uAyoez9FxvKnz6puPterlObz4i
	wd8rR5qRkW4clsIurkpbb82p1CW3AL0yU33/Ukc9SQCOVssiRGaacQ2GxqwKSshR9ni8Mk9/9Wirt
	U7Apheer/cc4dMDWCB1UrfmI7VZ4Jq/3catrZ8QNaPaDTH98qoBNvWojO93FUkwcoSKPPdP4nl+2D
	HxUpRnMYil2XfCI0SAdGoG9q1/RSdOF4iqOc2Lr+2pr7nYTwBDK4cmKrPcFvKip+ARn7+C9q4cs94
	CgmxU+WGB/UIsBqNerDFLQ39a/MPMLQt/NU+IzfVqsw/p0RoBS5jjaYu+grgJxLWGB457VU0gtqZH
	C2bSwpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZvv-00000003xJW-0lbX;
	Tue, 29 Sep 2026 15:39:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZvt-00000003xJ4-2JOr
	for ath10k@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=Spp0GO34IYsN6FK56DYnlZIOjC
	2/RFpidk0AEFWBL5pgfVvPw4IWLW9xIlZFvIjSVij1Ir4pY7pU2ctxfhCpIrudEHmQGg3ej6mAJBD
	mHIrApJi9WXGlna86bd1tCToh7udgL4Sbe1zGlAD/aZusir7LPvbRcrpkrbupl+YNxf4DHmsj0s5k
	qKsehXtH36NQfuFUnBfjRsb1YciNANcPNmKkxPcyMBo7Tmn+mQNux9AkfAP8qWVLyJ4kOQJupca6X
	shNITX0K6cDSy9CdfiL//57eAFfWKuppwlFrH9ohH5XJ2TN2I+3YyrNzpBvStZtR0E/fDdBZTj7uA
	m4YP0jlw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZvp-00000002nz6-46f8
	for ath10k@lists.infradead.org;
	Tue, 29 Sep 2026 15:39:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqifp3842809
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 15:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=oMSKxddrqHOCHTQ3
	O6/X9ZCcpt4qwGDTbrcuMfFId7FrgAhCz3G2U/MBmnB6kyyYvcPSXYE33egWygpb
	q/UAkR/onCJwuCi81275MSvHTvb3MeopPRalekgM0WRriypBFmMIGIVBenxzLPNF
	Ba8goQ+flVqu9iZtI3DuV4+NTyxfTtZj49w9riMEvskZkDYHArS6LxqF+3oBdWrb
	+Yk6FRaPq9C1UgR1AOcuBuQGY77ypF3rtxbwA0XkR5kcY/u3qcZG7XoVi1+Ax64X
	ugOmAwy/0KHNK7HmrQAYJYsNC3pgk//szoHFWkdBIC1pgNYQu1IrC//+59y/Z3CB
	0w4fvQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v9hd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 15:39:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-349ffa249bdso3412406eec.0
        for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790696387; x=1791301187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=;
        b=M+gV+2oTJqIRVx3iSuT2AE/4X3PUIpUyiEhT7Egjr0J83OLtqcyj6Mf/jMcykYz+iU
         42iO/E8OBLJrgvpPw2QQ9WqT8Ud+FZSe6NXmEgFsQWbxsTU/LAEM36kvH6ckJZG1ei5o
         Y/S4upEJfGG37Ec1Jc17EpkByZNxWoDcoM2y0zCSpXVaLSxYQV1Bg/9GowS5VnrHU6sC
         wUJZ+7YN0iuqx+FxxaYOQGsk+w29fspKfM5JXJhUXSRDrY9IzrQbAxveRP0w6RaaAyaD
         bPOwI2Ovj7X9EG2muUUSaU7J9at8/F+ZJPLsa+GBZ1HAZOQdo5DD3FYRN2SW6n5RLAc0
         HFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696387; x=1791301187;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=;
        b=gE0YpydTUq4277kLpRFIy1oN+RXy/WpxOahzwmUmSQmmYhDt0can+OQSRgahgZWu2o
         dQkOF19U3DHDMNhYB0h7ozxz5nm4/FRPmA6MnMLQj8l5XHRSmJrx8PyScvRSdyQjMoNr
         CO6MgzTgQnmcTx7CjX+zX+AJxpGfUQHYc3lEaYI/ae2qwWFh0CbuYW1zJJJcXeOWEfCJ
         xLOlWyOfP1iGtb0kD3YFBNYAmF6S5r2Of7cdcWZDpHoNCv5NP66fT43MOB7AcBJE2s92
         MH5bHAWHDxUyc3yp0AgteKgofbdhExE8k8V9grW94CLaPjZiCxEZXysRt4H1FNOqzpeU
         e2kg==
X-Gm-Message-State: AFq9FYJ4KguXDS23UJlVeyjLfV/LIQhkhJP0e0CYKQZgETgTQpOWYnyO
	l3OEJXhBtn3+qYhIwxFtsELC/vHSDzSFNTgt7zM6ol895a21xZ7er++aPWSKDVcc12mrad/00yu
	PmebOTlzS+R4Tp0ewTKAcIgYucUEKJNJUYqIoA2vrCT33XmqOIxTATQOvMD0deALH
X-Gm-Gg: AYBFou1YenZlsxnmag8rmhpHVJ12uKpskC7+zz9g6UwtRLm5R3Cr8B0c3O29b60TZGd
	GrWAQOlsWQMiNFfX2wfHBTt58qs5TU2uBXtrrukc19VEBzfOGFUL5HzKhdSdI80JXlEbf0oYQYb
	9MFliMcd3//8clHnUlhc8pwuObhhpCmTHEupnLP0nhMkr2jqWXREHVAJ5v6UBXndd7VIknjaCQj
	l45gl7R3C2ib6K0kZjEY0xUZ/02udRuJNBHq8AnMg4D0d/llwN0gKE432H4viKoGZydPMfzyUqh
	LxRsiQ6x1mCb0YyZba3QtJMpHYo137+BoZa08CGXMGsQDTO6DrwQ/n5eDPtyUX4Q60qDG7o9qGx
	Kd0VgjIAT6BPR/tyAKKYE6IKiInc+YdXndJOM7bkFosYzmNAJc2Tn9YdrJMt8
X-Received: by 2002:a05:693c:26c9:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-3426fccb337mr12767168eec.3.1790696386591;
        Tue, 29 Sep 2026 08:39:46 -0700 (PDT)
X-Received: by 2002:a05:693c:26c9:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-3426fccb337mr12767121eec.3.1790696385980;
        Tue, 29 Sep 2026 08:39:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350be57bsm449540eec.1.2026.09.29.08.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:39:45 -0700 (PDT)
Message-ID: <61215980-3b66-4e3b-8be9-f8f6de94cac5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260929
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
 <126186f5f19d13dcb9ff0618faed010adf1afee4.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <126186f5f19d13dcb9ff0618faed010adf1afee4.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T8OjzXd5_mfijbU1Y0h8oLmlCSuuPZnp
X-Proofpoint-GUID: T8OjzXd5_mfijbU1Y0h8oLmlCSuuPZnp
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbdbc3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NGaSfe1XjQSTNm8fpUcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXw17nwCcV5FlJ
 7Eb7cHt7sz3clNLnqwyw3aAOS1VkLwNBQwDXK5Mg2mZ4nMni1XHxlspoVmGeaMdcWJ6wbN02/Ac
 ijuFk6jPywSoMKayy87lRAdvbxiu7loMu5+1BnNCsAtDvvbtSGIYU1AJOzIS7LgtdnjfzlVnDfb
 6/jVvH7TxcPRiUDrHwp71vnCZeZcLAqgm5g7aKo9yLMvucrtOB8qlnoB27Ab9tP1kJbq/mJBede
 546vsJfpxoJBcHIXf8YOyrcWjcP1+zrGZnkwblRbCDqbVFmqPkXSt9aHEOfcTPHrS65cFedl7Mu
 N+6N1wBwt7Y026vsSBzJlTMKhvCLwERz0cSl8YjO7a0wFrNP5SkFHglscasq0ZzTY7MV29FdN/R
 9RTAxt7H1mDvpqjiVRxmlJrvxcU/FV/+XeZQH7t/1fse242TyuxXyLmYWPVCZWOrXyU357RSI9/
 o1qFSzfrSFjlRYl0jSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX9yePI7HkjTK/
 VPLKa9AJ+zJFFI3cSqjSoBLUq1NQd4Xh2QYKPw76KL1vgSRxMWa3V3dVN46+0/yjOkh+9l5b5YP
 HfLp1OKdPjpBhDxZ6UgDopzTeoy2Vp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_163950_704401_CAA25A11 
X-CRM114-Status: GOOD (  13.92  )
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

On 9/29/2026 8:14 AM, Johannes Berg wrote:
> On Tue, 2026-09-29 at 07:58 -0700, Jeff Johnson wrote:
>>
>> Baochen Qiang (1):
>>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
>>
> Hmm, it's complaining that the fixes doesn't exist, and that does seem
> to be in wireless-next only? The patch/PR applies anyway, but does it
> then cause a problem if the fix lands before the bug?
> 
> johannes

let me revisit this


