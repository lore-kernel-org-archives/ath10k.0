Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B2BC35274
	for <ath10k@archiver.kernel.org>; Mon, 18 Dec 2023 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2vzKP2T6q76NVZW+vXwKJElJYF/0lYm8wqIlWtRgs4=; b=ae1JA8wNTOLMr/6W5hnI/iyltI
	GfYqJjUKotu5mg7UKQ3eIx4/ss1NPO09OCnAj7eOwCWhJACwjYeYqkU+i2mS1VyToSNl8iL0tIhzE
	MJ3MqysGQB+OC3cNirt/eS4Z/w6bfMDRjeRmJS48N5xc5iEtMw0+4t3cssZF9+xkUOg0hggBn1v3q
	f/dAUuGijy46EThh4912+BQCFNTz9W/ycvofrRaHOaQk5gmUVP+SdIBksONCjJOUAcz+YPOqGrOm8
	wkRirQpimkTcm6LNOO36vLDMWgftUyvkD6AxzjwwQ44g4S27N4NnE4lgyNVJXIwaSOwZnXAt4vBnr
	O+k5PcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIiS-00BoKv-10;
	Mon, 18 Dec 2023 18:51:48 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIiP-00BoJ6-1b
	for ath10k@lists.infradead.org;
	Mon, 18 Dec 2023 18:51:46 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id FCI0rVc5egpyEFIiArGX6c; Mon, 18 Dec 2023 18:51:31 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id FIi9rUydbM0U2FIi9rwhrX; Mon, 18 Dec 2023 18:51:29 +0000
X-Authority-Analysis: v=2.4 cv=BuKOfKb5 c=1 sm=1 tr=0 ts=658094b1
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10
 a=jTd5SW5Gb-qoyGWwiloA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I2vzKP2T6q76NVZW+vXwKJElJYF/0lYm8wqIlWtRgs4=; b=RyMWkbHvwwOCs8KxhNvgSj/8Wk
	PJGMXyBhPAhc05rCn1yjh5R2GPCyAbk0vzHjB2Bc8xoJvslkZpizv0l/DrP1fS+AHuJD2BTrglSId
	L3g/oL0YNxv+IlPEmlDpRkbHB6/nS7SI9Syev/e4kc2JgHS7ySs04lJs1syFTD9WETRcjXpmb9VYa
	vhf4Kaq3yhKSVlHLCAP41Kq4tg9Odl3VqO8uUg9tgOX4lXrTTuJIbrUtHEsbvCkdcqcB1lVsCpmP9
	SwX92bVmKt5yx9lp1c8obgm5oST9XR2w2UbfXlZ9HyIWlCt740Y0Q3KLnMfovscGiLMHQHBIRp4lt
	7AmFv9DQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:54118 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rFIi8-003cb1-2v;
	Mon, 18 Dec 2023 12:51:28 -0600
Message-ID: <025cebbe-58e5-48c5-9917-04038ef134fc@embeddedor.com>
Date: Mon, 18 Dec 2023 12:51:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath10k: use flexible array in struct
 wmi_host_mem_chunks
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
 <170292524618.424292.1640750049894446616.kvalo@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <170292524618.424292.1640750049894446616.kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rFIi8-003cb1-2v
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:54118
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDQkxH57egpNQtsVIpd4jJgtcB5K7nTgN4ZS0M3wGMfdN+zxS8EEx/PLA3JTmHOwbd8mmPx6Dj78oE1+s/ZfpDEshxzimZNJm1sI9QjojtXrLNy/Wp/R
 Fgag2wbsR9+aKjLHgYRw7st7EwX6NRUv4YHWQdFj56xhD85F+iYGXhe/GaS7XcfaTsQrz8mmYin2UW+/iJOs0bIZOaIMhDIBaSyTZyoh8UB10E5dVK7J4FDn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_105145_645856_FE8FF4FE 
X-CRM114-Status: UNSURE (   0.27  )
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


> 6 patches applied to ath-next branch of ath.git, thanks.

Awesome! :)

Thanks
--
Gustavo

