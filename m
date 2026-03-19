Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920D8107527D
	for <ath10k@archiver.kernel.org>; Thu, 19 Mar 2026 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=ywJTlgdaTyDbGWgSKF9VmZfIuV
	QCeLG/dHucJr/McllnOgpaCkJfxiQtEmMNQ/Os5FFAPK23+e4IGY5jT2ODCe1tcCPBpk363asXL31
	bEWXoqBeHrEpSTwWSSaCCCAdB1WTioMHXFGA4clZuoAWU+bdKlP5q/hNhJI9x0nAkUrS9vM45P2Hm
	lB3WVQoeXO/rtJpbx8R/x+cgo7+XHcya5TvEpNumpB5WjR6CdscvN8CyQE9ywA47K3EENhsM4eiRN
	xO93NWHc6TP1PC7fYsmxPK3tOsPoIE0apZ0sC2s73zqhmJ+znHkdPfsMBherlYJ+DxlMfYiJvWD7k
	fl5UUN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39H5-0000000AHkA-3Y9y;
	Thu, 19 Mar 2026 09:02:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39H2-0000000AHjm-1vIg
	for ath10k@bombadil.infradead.org;
	Thu, 19 Mar 2026 09:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=lRn/og25/hEkbzu+kpaV/yeua9
	egDpIepw7mufeRkhLpD9umaymB2d34RJV6mn2UIMfyrIX5CB/S+WN/X6JI7pA0i3fFhdLcEG2pLax
	G15w2/T93uo0kvozPidBwRNWiwOOwpQ8jTfoEvxgpQE7Oc01N+dqR2IQjWamCZooeQDy20VTnTUkh
	rtC2e+raNayFellbtyHcS0kl/65oglR2+5gVr22Oti9gCz5UIWtkLsue6U8z10rt6w1ncEvCejsnP
	GV1Ws7sm36x03hL6s7AiFPR6uyKE9raQ2qGWE3+jUPyebJFZbkB+VFHO5oS7gAe551On1hyKM4DX7
	MWI5HCLw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Gw-0000000D56u-1w2t
	for ath10k@lists.infradead.org;
	Thu, 19 Mar 2026 09:02:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740bt2883715
	for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=SOnVAmL3naEmqvxp
	wCam5A5ffUzxVU1QmNFR4kL3wVfl9kBJLap874hNnZL/A10nu8uG3NpMfPSZKbM2
	tOZefy7xFI7IbFBTZC3+UHFn2G+KuWnvWrGjNSSDg3WTW80omdEH/MQd8BVK1BtD
	WD3+ZiQR7pprQ8lVhbIgczFYijPq3rCfgPvdLMQXhuJwso9ZiGB5a6cgLIBossql
	PmQwNA2RP7CCoZ5Wnc2RXGqkpJHV3PRx4KY7bA2jduYZJnGtIsttRlXveyHJC1Qe
	VRqtCjpEZ1tbDfn/Q/uGHLwfF0hDJSTj25jpJpD3s8rZ4EZdpIkRa8Y9XE4RYli2
	8i55zw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuu6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94eb847f11cso7642081241.2
        for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910945; x=1774515745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=ghnFysZ6FQX3CKyPclkdXWy176+qasgndRaE+fdiX7EADnAN2cuOiyB6KSZRrVGRbw
         +wSdB/TRITAaqoGKYxjv6JMSMVq3OHDTceqlvmhRqi+QQlI31BgBTbdHwg8rFTCYkKv5
         26+ukE12RQ0h++FJhNiTquRGvbsfS6qE08VUIdta+5P2akDgz47YMij1ctkwiYfW5ExF
         4QO0N1+Zohlk2QusJ4YlyHqn8yiIaw4FktIDSzjBXAjOawA9w2/XOuSGjUlCW+1Oy0Bt
         1hvSMSH0Yd2T+XsZ45RXZvs+C2iiwnPDYPIZw0sCp9qifygpPCwYBlA2wYnPzVw2DIyf
         WDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910945; x=1774515745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=Kud+5KN/Dkzt2ziARiPGJVAw8yJ7sycCQNsGLbUkYXeW2rMBkAv8GExsaRafgwZlY7
         CfFc+vjKjJSow8gsi+R9NsaZ9kZew6l6LJxo5X1TBzTcfXvkRGrVXgURqIA62K7hiaS/
         ecOYNnmCE9OCMWA1b4y86KaTHvmbdDbqMhshgIMPtP3/IEjvMNvr73G/AKKOAQMiZ0oc
         9/hUOxlObwupy/5suFkV02PQRLA6wa43iaOQJte3qEWpOpcvhxQVzxPtBgWjfh4FpRTp
         S0PAxnxUBJkgIMH7mq27vkFGiOJdQ7dTjjatODVBshSqAD7qhpVNnATYb5Ww4jlkz1hn
         fTww==
X-Forwarded-Encrypted: i=1; AJvYcCXQRel6xJ4GrsmhQU+DWfoMglnuaJWVX7IA4axC2yXWNgBXzfaHNq/JrSU9rLvaNosnjUA5Ypc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrn2sDxca16pgJwMuG4JE4uPnNWTrp5/BRBRksmUOiHy0uVQJN
	apw/uiBxg7BlN3qK4MzOc9dtlkOvJhLjDs6tyu3rwBhSk2CAZNZ4nCHRdNks8VaDAL2F4PbADIi
	TJ2Q1JY3q9X9fqzYvu6A1oGUmbdIX7ihgVaH8iOgHIETwMt/iwv3X4iAqoVNBGQ3B
X-Gm-Gg: ATEYQzw4gz5p8mfp9dO4ynN7olxXyMm0mD1S7lLS7OQ53WmYtbvS9HgYTGEfVkkdL13
	2h1+/BmycALRTFdxTAmQFRbaaUa9F9AoDWyLaIYwaMGbqP8lULNCK+9jNnM75ZazQSycIUGSX1p
	uAEc+jl7AHxs8o0IzpcNJm+yCQqUlEMuvOag76D9ryalk5x+Ye7ytJ6AgzXGLAhSJ0731KOxUWt
	C3A2FGTumyEujPfGZeMR3RyqOaYqitzz7QDk/mPQ7QA1lkjfZfHAME+Ny4RW2zv1BvIkFmI0BsT
	SStyN33dE3sav/XScE+icPQ2arxcbY2ibB3N0mGD3lxY0FlnPiceRDQ09yGUy/PDiZ6sqtJdRgv
	q1ayLPLb+AsZVbPE5ujp41cV++hVc1a1zNVcgvA8UXcTShVgUVb32H98Q1/OppB6Kh/VNjbo8Yy
	BzcbaNDCZo
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1267010137.24.1773910945452;
        Thu, 19 Mar 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266966137.24.1773910944965;
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm48733435e9.8.2026.03.19.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Message-ID: <c26aad81-ac48-4ba1-987b-ab6c271fc095@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI
 service ID instead of defining it locally
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
 <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tk65jdwVdxFluctTahItCc4fER7SvhJo
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbbba2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=BdGfMZ6iCwODMfnLSHAA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX3n1wEM4XyuRG
 PRKuEV9W+s1NqP2Tpqf8XZx0Jcp+XpRwVlzlbIHYYuOeJEC0LsFS5acurvmQl9IHepwHxBsP0sZ
 pzfDqkP+vJK2jfrUOhpQGNUaX5FY4qnBy6gYROq6tCXXMPLepe9tb6PC9RygDUpD2stsSUhKgU0
 13Wq+CIJX9qWnms8RUsq9+C9EI/ya9dmtfSxQcZFGwtR4hLpP2r5WOJEXWPje2HRCmr/HzPgSrd
 Pctop03LVjsd+t90f7bFYxnLPbiWrhB90SkIoJQ0iACI6HDMxWAvcnm5EKpyeTneviBYHO49oz8
 sX2GVRXuqus+q1PHpEtkLk4ti5pWLdBTLwppQVb+HZi2m64FUjAWQDbQ7hytKMi7i4Luo9DUXqz
 rODnYnqwvJLofGChDem+JRfTNxn1afwYqhsdx+5mBUy9gmJiazVmrsHCA4s4d/nmmSoJgCvubC7
 xEY39cZj3Wfqp7kBdnQ==
X-Proofpoint-ORIG-GUID: tk65jdwVdxFluctTahItCc4fER7SvhJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_090230_934160_2EE2ACE2 
X-CRM114-Status: GOOD (  12.20  )
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


Hi,

On 3/16/26 03:09, Bjorn Andersson wrote:
> 
> On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>>
> 
> Applied, thanks!
> 
> [4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
>        commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Just a head up I'm not seeing it in qcom/for-next

