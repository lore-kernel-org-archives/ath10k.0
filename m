Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C54606A31B
	for <ath10k@archiver.kernel.org>; Thu,  5 Nov 2026 01:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPRmBPlW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5D/lv1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G54qloTv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=xPRmBPlWKqy9N4
	Cs+EqOr5hHjK9D44BSwgK6VgzWfqASIXWdwjsXW6ugPtU8MC/kiWyhfFTNKnqL+5PFg1s5jj8nsrP
	QwLPGhENCDhZZkIRTsCL+szs421t6F5R1yY+SLgrmtVcVI9nP6688LjidkSaDgYu+yYwqGN0T9/V+
	6GZ5yWAjsYAkLYIrOJjxbvK/HpzcsVAhcaPgQsdnLwDjn5gHLgs+noH5l4IPMO8FScWVdPaUT5mxM
	aXsogYQpR4nK1llJF/KgBAByTDgXru70Z2e8CTw/5cq8ewVJzmiVPS+ShBwfHVrXMZq7MIZd/XUQC
	7/EPpgjMrN0QtzMEui3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0W-00000007R1h-11Lu;
	Thu, 05 Nov 2026 01:11:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0R-00000007R0b-3jnH
	for ath10k@lists.infradead.org;
	Thu, 05 Nov 2026 01:11:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50o8PT3084040
	for <ath10k@lists.infradead.org>; Thu, 5 Nov 2026 01:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=W5D/lv1LWTCDzOWh
	0L/f29deMLoESFQnp2yCn5ZVcV0MlX/MEg+e52Nrz4slWpWiGd0Ux7/i3TYnNoZY
	0nJf3OXTs26avJe/rLFJPzvKK1Tqanyo9J/zwafZm3lbJ6M49KgkZgw4VmPqkzgT
	roO9cLBawiAvG9i59upiEQlPCoNKeXo9oRbCopMar2QW5DS3DwK4UFKuTqI+7he5
	k46SMFt3G9EMwsy+WJn+jcSzzI7k9uhmirobk7w/4b+3orKqo/VH1mY7vWYcAJLj
	LSeTdnI3hF12qQ9iScJTuddhc3RbTsOY8tyncbRm6DeAZUZLVYskS4YNyrCYecql
	iUqvAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5thccf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 01:11:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36c9e87d262so1785919eec.0
        for <ath10k@lists.infradead.org>; Wed, 04 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793841066; x=1794445866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=G54qloTv5wmVBBqoxzHtdFa0kCXt8osdevIT6yKHSyGziIUEVl/5SYA10t9RJylKSR
         FswapodTO475TRoFfwqAHrVKjnnxdY2kcDlX65MQhBZKNj6xLGVnQnA1c4QnvXilvQOK
         Za8mKluUry5gi1NUYwZaosAPYGRLl1oWNPxRoG26dMlisneXCdUCmyJV981MiXT22/sa
         Fp2BsKNFUA/UJR7ur/aMBCLXJymrJDgNFvIHmewq2e8VnO5tK8E8xEy6+YkKMRhOSCAK
         bN5YOu7ezDDS7JuVDxNfDgpOSHxPXZQqHzEig1QLa+Sr41teL63RMQPF+P2UV1cWRsQ8
         /CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841066; x=1794445866;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=REeIDfwxHnHey598x4HQ6+LwufGRU6M3QB0zfLCwL9kIJU2+6xrPEGOly15veFTdWZ
         IFv351vLJHBcs9wyBrrvcyUxU+/6nw5FzInGJpSQIGTDNTh+rGseUjzLULpJcP4zTRES
         FJRlVGxLZ5WXKqQRNDnpTeLagefcK+HXQwfqBt2KFz114iWt7eoMhX+ksIgaw6ZHuLBp
         V0E8WQ4Q+RinQde5yyPifvn+h1UbHyFVPpLLwl9iA9gLQuqHbWIxCdL2kuHZX6SMUhgF
         31nte9/UQQxJ0lIuWWCcKs2DZIOH8DResAfBIWhAg5nZn3+DPz5WeACEQl9qnwXMMRA1
         4f1A==
X-Gm-Message-State: APuU4Z9gytfJV4HjrL+daJ5I6f7eKWNlYhj6Uv8ccYVPbvmRTDuNqje4
	eagpGKC0QQ9wIuArlrA/SLKs4eM5R2PVg63OpBIG3BNS6uws5S9VUPng8cqwOtZbpPmHvaqvapU
	soY0HKHQmPy04jdfhmnR6QgyYabYowsjBFslE70BBNnJW9oaFM7VUdwUhRcsLYgYp
X-Gm-Gg: AYBFou0qkH/dPm1NtPGod32tiXgSjHkCAcbxeXJJQpze5rWLYxh3LV/kO8Lze6ZaBLf
	uY5aRGLpj6PpJMyUo2TFSAYh4zgPrKBNLqsdUr2s+45erP7uX916cPaC0qjkxS1avUnmJJ0AfB1
	IPdCTuV8tEaZrEVy2yTFjM5HjChOUqfcR2rMXxTIZJb8ok454cfuH1z1Jt2OHWKKVaVmPQRm5FA
	NVFNwfIjjIl2FuNDkbJ12FurCsuj1FXNnRymDVGtttADw7PEkLFoLq1Tw+CsfQDSWAls+Z9WA5y
	ZFOf3nZR1W3/3VhY17lrRYuugi7fEMFZZy1+JqS6fqpV66nERg1j98PmQ4wTvrZX18bjhsmNCB8
	gNjUMf6RKG6ULkqoYSSlS6oLO8qIMR31wP4XMMSOnFoNn9qxvpH0toFf77+Q8wGurUpid1vhBC/
	6nniuJ+gQjuAw7S0tP4mkajjrHEINVQg==
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817740eec.11.1793841065664;
        Wed, 04 Nov 2026 17:11:05 -0800 (PST)
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817701eec.11.1793841064981;
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm4190698eec.10.2026.11.04.17.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Message-ID: <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:02 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfX9xqgKJwbkU9y
 0Wb2wMsa4f2AN97EN8OLm60QH4s5CZKOtk9NtCXZKW4U0HOYIzam966S6hBWhNmF55JFe0/58U8
 N/qmJhXmicPzhswtJnUwhqNY4hX1oBU=
X-Proofpoint-ORIG-GUID: fGChMhQXYOSLdYau4iEGaoph2may8rbD
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aebd7aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=uPsaRaffaKHOGCdRA0sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: fGChMhQXYOSLdYau4iEGaoph2may8rbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfXxvrqJ3TSxPUW
 Mc/hifx1MPRJxa4bK6fiXkw/iYc4xEyuQFVp13I9MGlvLRUIpSUQb+0fbMnuf9UqrvlAo5l1pbk
 OJ6vhIm2HTEcxASl1nvNUPLQHC9zPyeRh6nF4cFHLhYLTjPB3w1UKyWvTX7UFiB1YbcPLPtvTPl
 PmNivV0vsLQF1Vbc0jMhDpnwfH3QHQr1x4hA5DYSTOe3dYQmVfhVHsFVvCRRFwkM9PUdtMij0wF
 ebN2RN5I1QakE7U8iAstwbJt9BzfFjwAf2cxM34sDO9dZJG6xm4bBYb8YsntgJ1K5e7bJbkMgaG
 QN9RQ/47GvJThdOiikceRoSfYDDjO1myRHm4SX3gVdGrLVYlfqeJTs+fH4yQxbnk/+kTu6EQe+a
 fxXxgGJoMvHfGXsr/BjpA4ZGzw2JtwlAEGI0th/n7O7nKBLTntfaQNf50nXOBar8sz8o/Y5goZs
 d9vB83rf2ZPj54uobGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171108_815763_D8C57C0A 
X-CRM114-Status: GOOD (  11.08  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/2026 7:37 AM, Jeff Johnson wrote:
> The following changes since commit 25e73f1d6868c759c8eb56cad4e411692c5341b4:
> 
>   wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in ieee80211_tx_prep_agg() (2026-10-26 12:20:45 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261102
> 
> for you to fetch changes up to 83d689bbe8f90ce39961bcc3a64f2ca2ec184019:
> 
>   wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it (2026-11-02 07:16:28 -0800)
> 
> ----------------------------------------------------------------
> ath.git update for v7.4-rc2
> 
> Fix a few user-visible issues in ath9k, ath10k, and ath12k.

Johannes,
I missed the window for your wireless-2026-11-02 release. Since you have now
fast-forwarded I hope you can pick this up so that I can also fast-forward. I
have a series that depends upon a revert that went straight into Linus' tree.

/jeff


