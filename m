Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD666C44508
	for <ath10k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt+0xnZ98YxTKU0vdngqDq5moE8+1eIe8lr5296G730=; b=mevC1OlCwMbPgSJqvkLGP4pH7D
	3Rx4JuZCj1fqcmfjS3je7HXBd6mxUpoElxP9phM+NqqFDHHs48f7n6SLqd30Y8v5km7kxr/X//FvO
	mD9ueJRBWvGS2hVLCKxCvpBCWW60jE0PUvRL5PpSc4I8k6hDohcppcncW2dVW19BKpR5qA2sOEt/r
	RfRyChBQNYC9TvQyXvT4QETwGzUzygGBTPRX4rIoMpoIbxdfW4R2e0xD9C+YfRooxLIMTks4l9Plo
	2+D6cpY+ingq7isUegCTqzDjWbyTkopqSr/kl4vfoqwTBhKflQva8D8RPFnewWRH74tLv0Wp8Uw/+
	POoA5Kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYP-0000000CqU6-1ajg;
	Tue, 14 Jul 2026 18:08:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYC-0000000CqGX-1hcD
	for ath10k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG75781091346
	for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt+0xnZ98YxTKU0vdngqDq5moE8+1eIe8lr5296G730=; b=GSnbyL2bA9oXAGZb
	akzIh/LberK5CzfRFtFA5fcS/IRxWkN6VYVI+s110P1X0m45h0+R1PSpZkmkHaWs
	rI50Ne14iR94yb4u3d9aay/0a396QziKlrnxJ2FPXTDvI8hDeXOQOz8R9K4hM8nm
	Gqj3l3WwNyA4R2/EoN6biV9TRz3M+jV/wlxPjRgThOrpC7iE+ruc6gNi3Lq9BVv2
	Nmi64CaTL0rFFl8tajMkmMOItKXoPxYuVXI90SroalWdRLNzcBXzzVh5K0GqgiZ4
	hir8QqWU055pDB5+FX07m/nF9IA/tEZRK6PnaoL41z8W5wgvEkGY4LdRBy/4V1K7
	Bi8AVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjgew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92efd2ca21aso595129685a.0
        for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052491; x=1784657291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt+0xnZ98YxTKU0vdngqDq5moE8+1eIe8lr5296G730=;
        b=bkePf6iUbnj4diZ0usxfNaZGFoc5/JZVyVXqULXT9dFdR2wPGOj2pidyVt0fz0ZAlK
         J5nZWDmcpYzJjtTfsofv5GCQDFPLaq+R3+APc1OdkDLMEbbfip2gDQXFA8eG3JzmoVPX
         vYptRlPYD+eHJ7rv3bmTl+W3JJ5KgNctB4COFJSMps3Of1p5ysTCFx0aibfQcKsKBjJ3
         12kB17FWWak9E1PF2l5gGWzkw7/IlrfsRbqscL2RXjaMv7gPeZSpk1B4JwihQW84zJpr
         L2J/ls53h1jCfdT3PN35vhdJxAtPt9Q78ecD2wsN5KEIpYVfkQa2muU96LUm6ZePF3hi
         ZIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052491; x=1784657291;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jt+0xnZ98YxTKU0vdngqDq5moE8+1eIe8lr5296G730=;
        b=ZlEwHCXBNlyoRf0IGMqVvuAOYEucMPg5qOPLekEAwhnrHB4eLZo0P/adHUcOWa/4xa
         /SuYbyHqwkam+b00kvMXaHtgHdHhyE3G/Xo9pTB8FXlY6PTA2a/KTSlzvz5Jzhp8hC7x
         q863X81bMdo0/rj/WcbXWUONlEM8HpNVpUKJxg5a+OIMt2wy4KlO7lUCmTVq9XOxzjIj
         85iepOh/nUguyQF2s6GZE3U/pPhc3f6HAb8cq3cX1lh309DIi/uwybJxpFhlwo2fSxHN
         swIpwOhQncmvVt1Y0h2cPIQhAhWf2OoonLQdPVN1LwdMh5CaPeH8gROI83pr+cDt1dK3
         N7Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7RG42iBGecCZkBzenEoQwJelRRDSfIc5mbIYaYFRaNomEJKJGy7Zl3xN/zmg1GzBeb2qxKG0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxI31Ipn9ir8P407tKoGqVwMn/JOcVJhW3ZU2+2Ui6PPHZ+Umop
	OdNxtHF71pSZnhDZCtpXzJ+Hw7PcHnrGJHD9q9NVwCYjymIOhfKguAu2JCFmBdVmVV68BkBaW6t
	0wcmNmWW1Ro0UEeBVWHAJJ/MKKrjzM7dKcrVxxMvlk9yfqds05XOunGz94obbr3Xu
X-Gm-Gg: AfdE7ckp6XDS+XWJlPCkVHwX8F52jV2zSeMedQyLSe06YapRax6Ew/amZJw6hid2YKr
	L4VE9Urh35ndBSJU8Np0VX/Ok6O2jF1ob2kPUIVpg+dI46HxuNEQYhbs2BMzOM6Rn29BTDPclSc
	EM1iYLmGXBpVFs8TUb/EhWJnqvLYQczfuoR1p1+hfnFlZtl5IsiU2XS1x6i8lfg2zEXlndeyDhI
	xvJx+K99GNIxPcZqYFjSYloDtYf8wVeRbQi4jGRe0olvZpXQAX5NYVVrf44rBdi40ERGAh/Ky8i
	tsmUS561R2Qd1dXW1viKdRSWZLa5hBLFYqPly3QWItN+jJ7LQJtTIVu8DETt0lOO7aDSnWhWug9
	bDRL1Yi2ttgS/UyMk8qbXEXMgll1Z6jGoRNQ5FmCwiMQOWOUkA/Os1mISxZvUW6szPQ==
X-Received: by 2002:a05:620a:2549:b0:92e:4470:f6a7 with SMTP id af79cd13be357-92ef2b96862mr1443576385a.10.1784052490884;
        Tue, 14 Jul 2026 11:08:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:92e:4470:f6a7 with SMTP id af79cd13be357-92ef2b96862mr1443572185a.10.1784052490403;
        Tue, 14 Jul 2026 11:08:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:08:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath10k: Drop redundant NULL check on
 devm_clk_get()
Message-Id: <178405248825.4102418.11672660835815026374.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:08:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: o8QKe6nVqLj66oUYZf_c8wy0WwMX9ePV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX5c6e8sAKFVb3
 Ua4uNmgqICSnUPWGretKhZVvc9GoU29r4/Yn4qoxY+OP4tW2BuhjIozs+7qnRMl1XoHrXr8RsCd
 FLPycMmtq5KPCAfjTI7UFg0HIrN4lbpOSCGukkZX7hcZE/XTgzAI8A9lGhJXLSgQIO1bQoItXfj
 vBm38c/cqRiHAbZUr9qC8JrQjIisV++2g8p+2kYPhIDA+wSfr7VexdZ9YIaikrrWDgNCEVzRFyw
 IcGeaIkzl8WL/f6ZAZB4eBk7Fcfz/TAibqGPfGLeZfpuYjgXe9FEX+XSq9KEARz4WHC3bLhBTdp
 wCC0NqOGlnkbHGS5DTfbPrJeDNIzYLo9nrAySuTBG9BZjUfm0ujFYvDERez48AtB56kSHTE1pA0
 KxO/oVVg6lpdhCICSaMV6fFkvlRAqDdFudZhewl6pvpta2GtByLwfI1lYFReZ0/cT11BKf1oi+L
 Fz1Q2eBgMUAT2GQmaSg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a567b0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX4vftPpxxoD71
 iFDWxtmatr6KPNFaV9Y53znQiFSD/LqRb3vFwP+r4y0czRVKeLZ9ja2KUwnAsX65slWQxUEpC2b
 BJwOIKJOe7UOsVVaFi+5dK7YovvS7xE=
X-Proofpoint-ORIG-GUID: o8QKe6nVqLj66oUYZf_c8wy0WwMX9ePV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110812_679686_0EFA4CD6 
X-CRM114-Status: UNSURE (   8.31  )
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


On Sun, 05 Jul 2026 19:24:06 +0200, Krzysztof Kozlowski wrote:
> devm_clk_get() does not return NULL (only valid clock or ERR pointer),
> so simplify the code to drop redundant IS_ERR_OR_NULL().
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Drop redundant NULL check on devm_clk_get()
      commit: 298b337bb1d450793ed5248cc0345694f73f057c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


