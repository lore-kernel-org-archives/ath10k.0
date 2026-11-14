Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848E606A336
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VvGU5ENo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPw+1viQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/uosvyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=; b=VvGU5ENo0i7WAM
	EKlsR6hR8jzo3PWV3PERESjxynOnEQjGv81wzXJJdFfQT+HmJSbrupUAHOqL3VixEPDSnTOA4Lp4n
	KqRd/OND0S9SkiHun9JPjQCndJKJ0L23yzMdq6bo1RBkHKC9rAVwJi9EUYI5P8WV6ThFPqJr22Gm7
	iZwNUvC1qHODBKxe5wfT/ebc2yveNcnZ1B+LtpDGoGzlVk2Em2l5NPZgR7UvgGV30SWFtR+PwEnbV
	8l25Ppi4XpTKaY85VikKzA5DOfQK2hehbZ3x3KNEK7RVBwuyPl0yTYfCcG+S1ZKgDVygpStmiiwOn
	trZFO0sF/KpI2lSHKzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGdQ-0000000GSxp-3mrg;
	Sat, 14 Nov 2026 16:29:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGdO-0000000GSwg-1AOA
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 16:29:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkISu3844600
	for <ath10k@lists.infradead.org>; Sat, 14 Nov 2026 16:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=; b=PPw+1viQR6AQA+pi
	JW1HaAOSFgshLC2LO93ZT202AFvpFbw0+O+WOozj1IslCzC0ndhZl4DJpZiPTgcp
	pl8cyUv2E5crUfftpY3z/dVTuXXVA9sgjy53RNsxdH2Xs7V1NoZX3Io4TnOWALgF
	cn+vgHWmyXjdMzODe0zJOEVzY/K3lm/eK7N5x/acl0Qo6QfEMCBoZ3Kw+8f8Dcli
	T/0MrDo6waXv7xmrjhqquFGwQNBwSdT1+t9Z28ZXy0IL1v655wKXf2vIin9K7hGq
	iZaHUBFleYDmf9rRnzmz5BHYukyaZeleCQQlZhXLX11byoBSOPZBcbcsLHFHsrXW
	b7mP1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx18ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 14 Nov 2026 16:29:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so2632056eec.0
        for <ath10k@lists.infradead.org>; Sat, 14 Nov 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794673784; x=1795278584; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=e/uosvyPs6pJ0KtkAkmZIVgd4clxwT77qNs64jKN9PCmxRmEYLy07Y0/V3pABaaKFe
         xnvwsn5h4aDiFztISni9t+UlkLzd1SS6Pc9yAg/1dwXUenmWwAL9RsBaOFX5EnlAKL5P
         Z9j1rzQ+iUgyNlo3N1kNHw2AT7tx/Z2DhFJGsqHdyvsD9yz+17Mc/2RAvm6Vg7RxhXLg
         LVhsXnioq9m0VS8mgzLTf+VAbdPezZmBj6eHmtXZorhauHoYi2uJlvdkS5wVJPxMJnde
         BJMzQ7itLNtWT+CC8S49/SFVk5hVgwHkQNe3X3eXv3vy6CU0tDC7aXhY6CWGWgO+V5lU
         Duzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673784; x=1795278584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=EJZbZ5ogYbRpQEGmojxSGvpOFXObIkIiJOyGLpGavYvMbtjLkNP1oyzaftNQHgPkY/
         dBIYop6dORSdfNjNyBtxQsuES1Wpf7krxa3+ddAHPiHBcapu4fJqX/oOh7CRFZFeMj+J
         BFU6ONVBTty0G1CuI7uz/+EJ79Co7ZHQdK6YgFzQQsCXP5cEiZIlY4oWn6wyS7Awt5db
         j6aAh0GmPDkyC868Q4F3g4QMg3qJarnLW57oeJuns/VUoSjttNkcc10TiCjE0SMsY9nB
         lhXzp1Mbz6IkUUnKfSsCE25y5GtDNUOonP1gJ+tduLsTDwdYIjK+MIBCEae3ua760cWO
         yDJQ==
X-Forwarded-Encrypted: i=1; AL+hErGOQCP5ch3vd/D4hu36yLQLcRjgVx230TBUpwDzLNQoB7Dy0oHNYzOPnUJHn1MHnSHNnItly/Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z881Iu+hTv5UG98I3dHyGTIgoONjYoWzMWcBzov9a3NC3lDxzt0
	gEVSw/7zStLzI0wYeAeAkHUChtkL8adKZTCn19X1oyI6/i0VAJBUt8PJbRQZ/zk5vRAy1sYF++D
	aV75hjtMsYXvJNTpWdI/kAERtk1LeklpiPPbk0oqshShMIwVB+mJXNbACsIJ2bcq3
X-Gm-Gg: AYBFou0cMQ1JKCDdaS1CXnJLNurz8EBV2xzrwcsg11vXEUfvnooqHwJTyuYcHpSP/8u
	XyAq9894G62Y/bWBrCaOiG/yDCyW34icTw3E6Czl3B2sbNcITGezEEwpEnBREGufxqSSBvf7j3S
	e8uFmnNLBT3a0sU3c+s3VY6LBA5eMoQT6jhE9R39Ba8odHcwZvQnf6HoF5kdu7Rtn8VGS0PaxE9
	e32UIYb2Vozo5eR4R+Vldqgp5HbbQcNT5YscfuVAiWanF2oNqnoxT5fc/ZzBbJtakHO/7F6EKA9
	J8tapgJ1c1FC9sw4PDb7XAhMw2nDWzLvlLKanSiFIyfeJfR4Z9ZYbSd3wYS2q/JB87Sfokrg9/u
	ee+Kc+e2wqOHur0NxgPFoD1foAA8PZqcYL+VDFAQJhiBdg9KpMjs7tjjnlBfkRwpHXO/9eALGuQ
	h+zAfxkUcitFaaG1K44B3fD9heL3VZ
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250754eec.22.1794673783365;
        Sat, 14 Nov 2026 08:29:43 -0800 (PST)
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250702eec.22.1794673782537;
        Sat, 14 Nov 2026 08:29:42 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm17265093eec.16.2026.11.14.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:29:41 -0800 (PST)
Message-ID: <9e14a92b-019d-4db7-862a-ce5a414d5c28@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:29:40 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX0RcgqFSIUz3M
 i410gqxLk8UQvk1FCaKLT/iiQhumVypDeceStCFI2OZQXGQY1wJBH1a8JqICEoeH18Ag3ezrnvM
 ms15db42FPOJyTeSPp8IbJ0FqtcSBnYG1h2SUAo991M7YREC4jTWW6kxHSgXr0BX6CLT5iunhDn
 7FvZ7ZjOjgvsYul6F18QKU/UntyyOfKH2i/qCOkfMokYDUawUjeWUhOGlOLJVzqs/ukcuNG2NOx
 R20SHjT+Jz5jQnV/gu739fMxGRRRFdW9x1lMjUNS2WQPUCzDC1FKfBz7kcbWrQf2IHjKvbJdKSt
 1hI7tlTl5+48hc8k3nDnj9HahZ+OJRlnjIEye5+JgaMI4DwU9TE8zsopXWmvVFuPB4cLgU426v7
 uOXONK5dLh/C1IZwEA0DgbOVnq9Rs/I9uRYx8f6e30lP5RQO66sMY2TGAy7ti1Gt+LD/HPL4Cci
 V6MY/y0n3F/Kgfjyq2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX+xdV+7XXaNgS
 q7Jn+qYaKkPyCXBveCSIFk/5pHLmFKVyfe2L7/61LjVwXTCINY/+vp71McX72LCAV+Er7gKd0++
 Ve2NR4dosTiIC17LP1CLWCM5x4Svz84=
X-Proofpoint-ORIG-GUID: 15_luGmkb129n5FWou8JhmIZpHBvqh_L
X-Proofpoint-GUID: 15_luGmkb129n5FWou8JhmIZpHBvqh_L
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af88c78 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DzVTQg4m434XtEhf8sYA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_082946_455031_EC08CE70 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 3:56 PM, Jeff Johnson wrote:
> 
> On Tue, 27 Oct 2026 01:56:20 +0000, Filippo Falezza wrote:
>> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
>> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> codename nairo (SM7250) never sends the event, so every read of
>> temp1_input stalls for 5 s, logs
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] wifi: ath10k: Stop unanswered temperature reads
>       commit: 2a87e367c62856b87a90f745c6b7d2eb91e0c51f
> 
> Best regards,

Based upon Nicolas' message I've reverted this.

