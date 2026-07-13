Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F5C43458
	for <ath10k@archiver.kernel.org>; Mon, 13 Jul 2026 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/u0inyOZn7nEYb4yu8mT0JlJ/zMQrN1avKrexZU9jU=; b=YVni+SRheXMw1Vg+mj3fQXYhIa
	pVIG7o6+Yz33xcKlP4gMGVt3z8ic/n3PkPRk+NZaHOYyEF7JXCvYl4xS5jIxzlBc7U+lu1dfrlWom
	X9XkINmfKbFFs2KX2Kq2YL3sIoVbC2TDgY9+IAnwAdD/ZtTYPx5QXFm47N0Ay09abnOqpd0IVFmi6
	r0qchLfGe/KmLyH8FfsMMi+RPFCiGYMpGhV/GGyNcjS3PKKOf/I1JrTNLlPv9KdIU8mP6YldINvNZ
	r7PlkLl99QB/Z3TZm1CMyoVXINvAMXOOo+73dCS3HLaF4t1J+wOGZVepJNJjuwy4EvZuaOLR/7d11
	Dk3t1ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCwM-00000008iyU-3g3m;
	Mon, 13 Jul 2026 09:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCwK-00000008iyC-2L5L
	for ath10k@lists.infradead.org;
	Mon, 13 Jul 2026 09:27:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Yu7d794449
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 09:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/u0inyOZn7nEYb4yu8mT0JlJ/zMQrN1avKrexZU9jU=; b=HdwIrk0rzlFLq30d
	juTfJw2MaWx8PMyWrnBcV5ZIXlAAf+aAb284LOlkIcQooQO53Uj/hlR+Bwanito5
	s22EpRNpGDTct49zYPps1IhxrTQ1AC/aBPxWuZHlEWqAHe9kVvhkAP7OoylKA6+m
	ugZvZ5M3y9wRYunEdfGVo2PKpULQzrQZopkU11B/kw9cxwiV8nLBsDbEB9X3A/XJ
	1A/reqeJgl28YzPgQUw5XAEM01aWmdIOc2U2mVeXNeaU/PH3DcXv3LQRNWzpi2Ud
	i7I2e39EJVZxYY2lMhrBbTGaCkP/V+9Jezif8+4L+efJzqAaVKOP61NaPUk6oNXr
	0AgIlA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0dab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 09:27:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce406883eso28075775ad.2
        for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934822; x=1784539622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/u0inyOZn7nEYb4yu8mT0JlJ/zMQrN1avKrexZU9jU=;
        b=X9mvn1T5agbtWJJH4u7QdDUvhs9ze3k05E9+jIJDMYDhnHPqmLGrRezmPojvBHqiAa
         R2YWGyppgJaRo22e/lIAtqbZB4Oq7WU4EVS7EHyHut9TH/Sf3ySBgLRmQjac0kH9yoy1
         RGYnQytMtGslF+X8PbcmW9wAhHIfX+GNmzbIzxmyUZh2FhadhwC3oTkA6177z4L7tWUm
         BgMXpQvnupbCNSV6oDAAQUWlsfvEaxIAUUnbwbP3AF/BU2sfOqPfC3lurpVTKPDcgLCL
         ofYoMGiVwwgGhz4bo8INkfQvBz0oTvH6Rm11oagb7KS/MRrvGeZVsNrC8GVqv7b5MRIQ
         3qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934822; x=1784539622;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/u0inyOZn7nEYb4yu8mT0JlJ/zMQrN1avKrexZU9jU=;
        b=Xwjcq5YuHGDMRE8vzXjyjuIunpslcHutpF3D7XpArZWb3bfIKApTKssIw85ERSYefh
         5OCUpiCoC332+j/oFMVpin+DQofebC51lAhag0HOah39xHKtxqLYHVusTxQ8zLxiG1VV
         ZRGqtkoms7jEPV5qPi+i/HkSgGhPENVHZPCp3jKTONtku5CtJY2ecBEt0TXrqr5k9GDN
         o8VS9Fg47eHLnI3qySMC9k7jqlnpmjznqz5H2SxntohwvlY0cpxWbrF0CIQkx8yyI1D4
         ltHGsqgJe5KraFUKcZ0vQPQ9+HftFrBm+fU6ESLEvxgm+6cZ31zX8NYjkmV43LDRJnqU
         GV2g==
X-Forwarded-Encrypted: i=1; AHgh+RonPQi6IQpcm88L18NRHF1G59kgXmxd/eZ8t3JNE4htXx2ZHizht9gSsSr0BkyB8P2RyUwUqOM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQFodxcMfjxYNIrLlmTcFsPdcaDJKk7mXgksXLvobLFBP2qFpF
	Dm1esG1C2cRAy9YCJ6vxdnCgfl9kslW8pCZoIMQ9twjFXpvLWP2g++NKkltYfUZxpYHC8/N5uYo
	KW6Vu2Hrv37ujo326B+jBYnjw1Q/2l6xQ1RbMmQn1jKI8aZF8SzJnw/qHg9tJcycN
X-Gm-Gg: AfdE7cmVt9bxo4aHMFjHAJMao8j9gODnwfkALr5ru75HrXgkNsV3wTtDO6xpiVAEDLM
	4DDU+zy/mLxZiv1wFvuYgzUIkSSKkGIiBLnNKjfuDj1mc8w9GbeCCPv1+bWgHWul6VmHKCHhRDC
	Awy0cSJwY9EclEp+Z+dzjU2ln0vMGvxzFDzFLAO8VOvPptiC1svF0ya32iJ2yCtpCVzqu1hBHj3
	LyM2iIAPOW8R7lC/kKFBdi4lU8QvyAQfrBjn/IMm9ObwLq1CHuk6R0oxKIemWcCN/y1Wn3RvFhG
	cOeULlHGm7cDZvny6alfMBbB69bQGif5IBZlagIXUmJ2U95d9UP6bGsRvQTHG9vumMAKWzRefTv
	7h+haQqUoFSrxfQYAR1K4cQUUbbgJKxgqzfRdSTxP068CbtFAy+8=
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr9284968637.41.1783934822541;
        Mon, 13 Jul 2026 02:27:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr9284945637.41.1783934822031;
        Mon, 13 Jul 2026 02:27:02 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm25094642eec.29.2026.07.13.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:27:01 -0700 (PDT)
Message-ID: <072a0eef-6b31-4bcd-9cbd-d1b9f9bc56d4@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:56:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath-next] wifi: ath10k: trigger hardware recovery upon rx
 failures
To: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vdb119_D8chtjFbAQVJhHrMrMm-3wuaI
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54af67 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=egApRZYCym5QJ-JG5DAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX21r8edqS32WV
 vRNsJvbmN2hqnTepLezmhLa4MpcdlBrrUe5uir2DOvmKrOXpZPKarYkbzudU+FiToWfFoSJfykI
 AF7sBbh7QyXGO24XLK5wPT78SzFoZxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX6561ewBa9plY
 aBjUk7Yr+oSxpZxOIBgMM3J/1M/jzr05PS5klQ4YmhXLemfcaCDkMv6g/oxo22+Ht8jQscCi9b1
 E/v+/LgDHWjdKb2g1vBpMHaksotwtUKA5TpVbxWz22cYYxVobUahzDST+UYaU2Dry/Ni6FHoBT8
 J4Cy+gjSMlVbZKgxRy37V7DwWAaoFdmfDvrmJF97TfiOl8GrnQ86h5trDosl9nuDvmwRWJS5L3q
 4KyqDt+nE18gtnnqV2BTXuS94X78Srg4r+yVn7WDF3vpCNvGwqE3SLE9YASKaIG2a0HNVN6aZtg
 k8MqILTfnxKgCXDrPMwgU0TDNmPz3HRGw6b7q6woXkju9OYbrNjWJGC66efCMFWF+8GDicCsSKU
 FW8r1UZJoFKYt406QC/ePbe2s01yLWBDXnCvd/Frgi163P5XiDnQn9QfG4Ew0z+TVvLy+bZ7pl2
 BTaFBQDhJQ2vGaYxtaA==
X-Proofpoint-GUID: Vdb119_D8chtjFbAQVJhHrMrMm-3wuaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022704_734772_C51E0862 
X-CRM114-Status: UNSURE (   9.85  )
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

On 7/10/2026 11:34 AM, Manikanta Pubbisetty wrote:


[PATCH ath-next] Prefix missing in subject

> When an error occurs during RX packet processing (e.g., MSDU done
> failure), the driver sets rx_confused and drops all subsequent RX
> packets until a Wi-Fi ON/OFF cycle clears the flag. This can leave
> the device in a bad state where it cannot process RX data traffic.
> 
> Instead of leaving the device in such a state, trigger hardware
> recovery so that such an error state can be reset and the device
> can function again normally.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Actual change looks fine,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

