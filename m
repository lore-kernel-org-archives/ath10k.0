Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F19C79FB9
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=; b=45ZC5/yXeGKx72jAM3udVExKKH
	I3I1SF+CSTH8AK2YlbGn3ui08+YohFBjNMGTw7HlekhwOqcCteQ2+QLNCuD4MC4whLk3Uz0KoJv3w
	9tNSqGayToJZjWe9GAdQ2Ghv3aTJeffuKAc77I5wXt+c9VScns/BihXUBkioMLPnJU9L3UExl6YYL
	bmyyK0MDhdKwZPAmum2xZBC8y+6dESOCsEksGerrLJQsO2NYbMYdU4OXM8oMdOPZE7r7a5RsUd8Dk
	4WUIgl57CLmQbgHgUsetiHnmYu9E1loHU7XPuoyHviiTQhsn0QtFWbVtFYscUoAixT6Bfnt0b8daP
	j2YtqO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gDk-0000000EhZ4-3nSP;
	Thu, 10 Sep 2026 14:57:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gDh-0000000EhY9-4BDE
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 14:57:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AEW5cp2057646
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 14:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=; b=BkQr52cxFxOmIl0l
	eIXTTquh8E+z8ly/+szilfdSN2nWqs8iM3k01OKp12aRSOL1rB6V487m+wJAF0b+
	A1GYbDkW1g4Fncy0HxL6Hs4R2Ybe7mrA7PHfZP2rGcdQ2UceFQdl72+F42C9SdLk
	m7d6eb1oSFcNskTjqzRuQtyRQ7BNmuItPyWxTuCjRsYTyLD+xcVETs3e5nhHDtek
	SfpdLKxfKf6Uy7qkDMAURQs/PyQ+uVRWkjfOOd4qIljGNsBZ6uuOWktCUAPZR2Zk
	u8+pWZWvroXkDjKXWnZqI7bzerA7OYIgUmgnkErWu5pfRPrt7WkDjBXXzDPgzlyP
	emCUxA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8r5b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 14:57:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2f2b8d88fso510267b6e.2
        for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052264; x=1789657064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=LMk1YzS6aNVNBAeZiWps+Huu0tYV+6B8HPm8tNw1zFRz5WzQ55P6vLP7zDpCahvC1t
         FmZ5g1GJ8kt0ob7rtixpk+879lf7HPRc2l6BmSi3XKyTBoCiktwGDQC/vbRM0Mp5gAub
         Csnw9aERtQVgFP850BWnzVMSbVYgo123ftQtdbH5RFaRCaZJRcT3KBsZ/5aVXF7tVYQJ
         M5zLsPrXp1gNcbCRngRubnLF1y5IDShUBq8BxRuJ8A6aUF8vfuRXxQ7Ebkd4ncewSg9k
         gv4rutXgY6u65RPlOnEGeAfTHfBtXieNDaD/El6Ls6/qAaB5u1JVVBH4vCeG6E/uFFqq
         RqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052264; x=1789657064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=K/D5sN3RftxdfqcFcHkb8SI1MElGdikN0pRb92MQAseAA8JtyfRGb0cRxwHmcT31oX
         PhK0UWsRStP0klADOTa4Npiedd9V2J4lfFfo8tGSTyxyWKr9WbXKfruJpieLwVDEFhIw
         hjOW/wGeNra2m2uu25/f5uJ4qmpdeVhEQxwI2EmicXYFKeOQ/+icjNJ5ekWzrnF2UGsK
         ySKPmcB5GSECLxuqMotijZCwid2Ec5ewSoMz3mwfPI+/SkgqYgS/AglDZJHmLhNBde37
         +oK7Z0yqi6yP4eHxzcPgimTQA+T+1N0bnseL9WGEVcC4idKkfSp022NOtCvBaK1jDp+c
         TKXg==
X-Forwarded-Encrypted: i=1; AKwUvBwhiR9OPTTHkFTlHrtxt4/0NJVRUvOhGkfICO7W8ixnzSGqFF2AhcGXEr/Nx1bdd+oL+4MNCeQ=@lists.infradead.org
X-Gm-Message-State: AFuF++k2Ka2sZAmLFKBbGoUmFCmkCJ3Zlk1iBX51xUJEYSF9ylUIyBdK
	OKBzn+GW3c355LsH3ObeLA7pN6G2H6IXgVrZMYwG96Y0oPqGSZRp5ppDYpc+bvGphAcM/M2ECtf
	PoXnw5ip0wJlfSe8/Uf5uqL2oe7cKDxAA0MqaXukcdfzZYiBD0Q1UDLbdQTDEzpMCO4HJ4saT
X-Gm-Gg: AYBFou0rDTUiSar5J4IfJgokq/yrrp4YqYzexPCBf61z2FJqaZhnv2mV01xb89shF9i
	lADg/ywHhKoqwW0+RSI46Du4V0huEvFzFsOHCkV8i5o4/GEAyoNC3+ZqZb3gpWAYSWCQIhwycOc
	DkKcR0YZyC2eGUv7jIN++0RuH8rL6je9wihAL5saB07rjqGJCuynlcKNejfV3RfXg/CpKq6I2eA
	Svs7DgspNfZndP8zr2a+OC0X00QtW/NAcQGHyd7qLyyRY1Maq+j4AmVV+XHxOkMzgYWoi0cttsh
	pOyOBTpgADow+8MhBGtnnq/o+8PtFiVT0M/JiRZIKhYmlkyqMQx7yzcGNH01Gl2ztyRYZnbPv+j
	b4d/coYPVzMdHkKRW/D/KC/DJEISxYD5IrTQj57zXSgj7bJs2Wkm24ew=
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827315b6e.15.1789052263945;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827287b6e.15.1789052263393;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675f82sm17916653b6e.12.2026.09.10.07.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:57:42 -0700 (PDT)
Message-ID: <e2c332da-3fb8-47e2-bd59-b64a563f1236@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:57:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the ath tree
To: Mark Brown <broonie@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ath10k List <ath10k@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aqKuWv0oUjGHSMIV@sirena.org.uk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqKuWv0oUjGHSMIV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eSKE9H8epW5k1OxqQRNWahrD-lFEwTY6
X-Proofpoint-GUID: eSKE9H8epW5k1OxqQRNWahrD-lFEwTY6
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa2c568 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Bv2zyjIpLVm8bXmoBHAA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfXxIZOhFVWicBb
 X57g1nDPmWLssKnIIO/J6IBDv25W/w6LEaymabYVYmr1Mr/QhPrTBHwhineSDCReOrMa/5heT9r
 TuEdHLsadsjajwykHMdwFFwkBOJ9bVtECAvekqs0uMo9gmknVVohdy8r/SOlKrDHJt+auq/wjRJ
 soRFq9EO1LOX9D2LjAaMKi9c4ECfQURB1ucAk8en4aupJZHBd/hWyoGjsN+zElamBwWIInn8Szi
 4ikhqzpUf5Zx69bcuWiB1CazyFFO0ewZ9Bsb1iv2JapudWPUKblfPQBYJTTgksTF2VQoK4nAZJS
 n6Wo0w4tM5McRk9wvuTGCMhmra4+vXQ6GtnO0JKGgFOQ85c8VsWmBRO+gIs7G+eRt2jgzsjvz7R
 ng/GjKMUxS39Fl6KHmAK4End3p6Su2ZRE6cWvYxLH18hPQmvtUxYuf4OTPqTV31RiqeBhlRZqOp
 L7KJz1+T6ym1J1fDaZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX8y02MyddcqJY
 S4PGpNB3a4VYMH+99S8GIzaMrG3UtnsTfUY7aRmfMbpJxE5rp1hGqX+hDLvMGpVik+u72bWRjgu
 L7yU9SwVgr61K6AZplgwuS2Jakh97TE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_075746_040343_2A868187 
X-CRM114-Status: GOOD (  10.08  )
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

On 9/10/2026 6:19 AM, Mark Brown wrote:
> In commit
> 
>   bea22601ee301 ("wifi: cfg80211: don't free driver-owned scan requests")
> 
> Fixes tag
> 
>   Fixes: 4a58e7c38443 ("cfg80211: don't 'leak' uncompleted scans")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

I inherited this from the wireless tree. the wireless tree rewrote history to
fix this and I've now synced the ath tree up with that rewritten history.

/jeff

