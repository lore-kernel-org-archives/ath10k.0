Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70473C2BD09
	for <ath10k@archiver.kernel.org>; Mon, 24 Jun 2024 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWyEAhPCIslYvyVmSXrWtzfP70CpoeWMcWeKBP3H6ko=; b=FSgMbqRwjR1xI3Kz/CqfUExdAS
	Q6ScJBUyuArVIjE5h9nylVyeI7o0LBCPmzZYCmbT7EaXIcXKe1RV32b+IiVzTt4CTuk9OrmCAdUv4
	9p5vNB1wLuwF5ippUuLHAfe4z4+he+ySv25zZRIIeOYbujhpISLcZSXIDOtbOF+4bBpRywdpJZyui
	VhsA+AQcet6REchoPu1sjToHqu9YYzgGWC5F1VWGsmtt3j7/1LJYVcxOhW/OciV7lsrJPJ0YcW8E9
	B7IrM7s/8uj1sXiMkGuw4QbAiWB72PBuQECpc2dVdq9CMAJqxzocWAN7GD9W4wKc4mZOyxjSgG2c1
	HRaTdgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmh3-0000000HXoy-2yjO;
	Mon, 24 Jun 2024 16:37:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmh0-0000000HXnX-3Oqs
	for ath10k@lists.infradead.org;
	Mon, 24 Jun 2024 16:37:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fa0f143b85so14630095ad.3
        for <ath10k@lists.infradead.org>; Mon, 24 Jun 2024 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719247041; x=1719851841; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWyEAhPCIslYvyVmSXrWtzfP70CpoeWMcWeKBP3H6ko=;
        b=E6o/pwkjoNOAiQmcvfUBksMaBk+d2qg7YincnbdoLBbbU/Vc6hQft71G5m/Kimv8q5
         1bYPomIyUQ14tkoPRp1BW1yvjLox8dBKvR0Apvs4+L0iMjMj7dFdopWNlNlUvrR5DSIA
         6m4Lq5a9E+PtHMBuswUR9IZGoQtmseXXUwsmafQIHHh3gU97prPKWplt3mhk8PC4O9S4
         RjQx2owtsPYSYDf4dcyD9CvM/lQaxaQg88aGAXSOsCL9wWsC0ed6wUBdXRDeYk1vCdvt
         E2xYQ+x3pWgOFPiXFNP9k/5DOUkx4u31o9KyQhDkKtmncZ8leDGRDzmiTshGfVrS8eIW
         ZZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247041; x=1719851841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWyEAhPCIslYvyVmSXrWtzfP70CpoeWMcWeKBP3H6ko=;
        b=K/8LBLwT+QA9BVNHINBd2MdiURnItkBPN40z5x22G1yukZE771ySeqCjs01qnbbfOW
         QQs1hn6Zl24JWiiEVQme+LXV5Cwoh2OI4A1HE8AY8oRFEJmDOzeuEvIERusOVhswygan
         QheN1iR9S0Boys/eMy6f1U31nh1XutbjtVp/IZl7RDgF/N+80twSCq05Skp0YWx+DDPy
         aWgWO2FmdiIHU9HH3/Z2Xl1HprHdWMrsPZ4Yl7+QfR8I0WEmUdlcBNxLrFq1zEGl8MuI
         pqi1UuL4k3Rj94/CIyw/fFHobA8Py79AROeOxNlEKdEev3bXVCNu5GJVZk9FcHbFxdD8
         ZXLw==
X-Gm-Message-State: AOJu0YwoZoDxOppEeUYh5wGJA3D25hgjsHB2AHkE3TaOI/UnrGtwEhYt
	wWcvCfEWgWkpAdOXYxARwMTgrwPOdJa2ZQR9WaxmJl/sl83ZCsVeeYeRBA==
X-Google-Smtp-Source: AGHT+IGQrnRJqklPSFdvGZSDXKwglCXBV15NYY4MC7gZ/a+/TIkAObKm07oTiy22SwsldjHTUuU0qg==
X-Received: by 2002:a17:903:22d1:b0:1fa:2ae7:cc79 with SMTP id d9443c01a7336-1fa2ae7d470mr53058155ad.11.1719247040847;
        Mon, 24 Jun 2024 09:37:20 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f0545sm64561045ad.27.2024.06.24.09.37.19
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 09:37:20 -0700 (PDT)
Message-ID: <6d88391b-98f1-4ee0-8a5b-867bdfdd9d5e@gmail.com>
Date: Mon, 24 Jun 2024 09:37:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci: disassociated from x:y:z:a (Reason:
 23=IEEE8021X_FAILED)
To: ath10k@lists.infradead.org
References: <23e24401-1681-4515-aa69-3c8915042781@molgen.mpg.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <23e24401-1681-4515-aa69-3c8915042781@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_093722_910085_9EAC0C32 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Paul,

On 6/24/24 8:59 AM, Paul Menzel wrote:
> Dear Linux folks,
>
>
> On the Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022 with
>
>     3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 
> 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
>
> I got a connection drop in the eduroam network at the Marburg 
> University, and Linux 6.10-rc5 logged:
>
>     [ 5436.658691] wlp58s0: Limiting TX power to 2 dBm as advertised 
> by 08:ec:f5:dc:f1:ef
>     [ 7240.208199] wlp58s0: disassociated from 08:ec:f5:dc:f1:ef 
> (Reason: 23=IEEE8021X_FAILED)
>     [ 7243.279668] ath10k_pci 0000:3a:00.0: failed to install key for 
> vdev 0 peer 08:ec:f5:dc:f1:ef: -110
>     [ 7243.279683] wlp58s0: failed to remove key (0, 
> 08:ec:f5:dc:f1:ef) from hardware (-110)
>     [ 7258.176009] wlp58s0: authenticate with 08:ec:f5:dc:f0:0f (local 
> address=9c:b6:d0:d1:6a:b1)
>     [ 7258.176024] wlp58s0: send auth to 08:ec:f5:dc:f0:0f (try 1/3)
>     [ 7258.177072] wlp58s0: authenticated
>
> Please find the output of `dmesg` attached.

FWIW I don't have a solution but we see this routinely, mainly on 
roaming when the old key is being removed for the prior BSS. I looked at 
the driver code as best I could and it appeared that the error on 
removal shouldn't cause any issues. When the new key is added it is 
successful (otherwise we'd see a separate error), and at least in my 
devices the connection to the new BSS succeeds.

Thanks,

James

>
>
> Kind regards,
>
> Paul

