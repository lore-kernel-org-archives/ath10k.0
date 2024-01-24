Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B120AC46CD2
	for <ath10k@archiver.kernel.org>; Wed, 24 Jan 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:Date:Subject:From:To:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImgKkGf4KOTGIcxdmlBQ9MH5alEqqKV62IyLuXoL7MA=; b=e9tJd0q+JacVJl+mQBiHLn8oqz
	6/njMj53KepdDsyOj0uQIZJY9Nor2WlyBqoaBVqPbG91cI0nIVoSme3bG8/Pra1kwjAzkM3JJzpOc
	Ah3Oef3spiXxX/tJQvwAPXbKMMjeRDZg5z/H+D6KHGMSlfXbLW21BMZlVSjC09WD3KmoJQSAeUvKQ
	vPngS1vEK+HSuDa+6r+rBl4Tx6gwCe2vwibU/6FY/Vt0sarKYgAqVy8XHBWiu1uhOHd5+h+kUgAAA
	CAWAtqZOSxCHyK9FJtG9i1IKROupSec3OGdxq4uXm3pGY5bIwVJ9QurHliHXOyhbwd88H4+lKqtPa
	O+MN3agA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSddp-003WyO-2E;
	Wed, 24 Jan 2024 13:50:09 +0000
Received: from ciao.gmane.io ([116.202.254.214])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSddm-003WxE-2M
	for ath10k@lists.infradead.org;
	Wed, 24 Jan 2024 13:50:08 +0000
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gldad-ath10k@m.gmane-mx.org>)
	id 1rSddh-0003WB-Rr
	for ath10k@lists.infradead.org; Wed, 24 Jan 2024 14:50:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: ath10k@lists.infradead.org
From: Wolfram Wadepohl <wwd.smartmachine.stp@posteo.org>
Subject: MAC address problems on QCA 9377
Date: Wed, 24 Jan 2024 14:45:26 +0100
Message-ID: <uor49n$86n$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 SeaMonkey/2.53.18.1
X-Mozilla-News-Host: news://news.gmane.io:119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_055006_769400_33559563 
X-CRM114-Status: UNSURE (   4.13  )
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

We see occasionally a wrong MAC address of 00:03:7F:50:00:01 instead of 
a MAC c4:93:00... from the module manufacturer 8devices.

In the logs we see

wmi event ready sw_version 0x01000000 abi_version 331 mac_addr 
c4:93:00:1c:67:55 status 0
[   10.532051] ath10k_sdio mmc2:0001:1: boot upload otp to 0x1234 len 24037
[   10.577733] ath10k_sdio mmc2:0001:1: boot otp execute result 3
[   10.577774] ath10k_sdio mmc2:0001:1: boot using calibration mode otp

if everything is okay and

wmi event ready sw_version 0x01000000 abi_version 331 mac_addr 
00:03:7f:50:00:01 status 0
[   10.501574] ath10k_sdio mmc2:0001:1: boot upload otp to 0x1234 len 24037
[   10.548764] ath10k_sdio mmc2:0001:1: boot otp execute result 2
[   10.548808] ath10k_sdio mmc2:0001:1: boot using calibration mode otp

if failed.

Does anyone know what the result codes 2 and 3 exactly mean?
Thx


-- 
Wolfram Wadepohl
Plattform Technology
Storopack Deutschland GmbH & Co. KG


