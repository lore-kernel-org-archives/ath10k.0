Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA5C636D3
	for <ath10k@archiver.kernel.org>; Sat,  4 Feb 2023 04:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6oCyhkFcFgkxJgFFb4IySMUDgyoL7+tn/Mqj3a/vA8=; b=XBaNZiMCLrO0gG
	tFL/wTDhyynU1eA6GPOa6YmRH+O9h0gDb13vgxtSd9bxNi/OhSEfsw7fxAw0ZG+GxHo794M0vgj+K
	OszElymHu9R8PkLbv/yCORC0AY7iG2I5vPSt/IYsAxkK1lU6QkxYaU8oZ3hEDAs4VNmHF1Lrt4A9i
	r++xcnTULAIteyi4PevVgCkWHnAJAIJB3/cPUyT0UjI6hFFBtBxaX1avcwZ75psfeteuwzWOhg5cc
	LmI80+CnqDA8+rh3O2qSAveDaTDtpt4JQkgGX8MRx9+eCcdL5SDAqEdUAUU2jrwGinOdhSNlSvowh
	mhC6SbFSAurIheYki3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOA84-004Qtm-MT; Sat, 04 Feb 2023 04:26:20 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOA80-004QtO-MI
	for ath10k@lists.infradead.org; Sat, 04 Feb 2023 04:26:18 +0000
Received: (qmail 12021 invoked from network); 4 Feb 2023 04:26:11 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 4 Feb 2023 04:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=message-id
	:date:mime-version:from:subject:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding; s=2018; bh=6FQ/mWs8MPD/
	ilIHOtvhkUEM9lfOwINQv/6BuHhx3QA=; b=B8XzNsbwoWQ7v6iTvZYjmGnjlFkY
	PahFJJX66+2FplakSuLo7+P3nqy736o1CjQy6xAXFCp8NUkpSjDJJ0faj6QD71zA
	qZiZYWbE22uS2VLnJfYQ3i7837/E2/HdtXofxgF3FatRO2ICDyRzdVSwl/+nlwnv
	6bwoMT9ko4g8vEw=
Received: (qmail 90372 invoked from network); 4 Feb 2023 04:26:10 -0000
Received: by simscan 1.4.0 ppid: 90330, pid: 90365, t: 0.3330s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 4 Feb 2023 04:26:10 -0000
Message-ID: <0369d0d2-cb2c-7310-4f33-dc8da52816ef@openmail.cc>
Date: Sat, 4 Feb 2023 12:26:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: equu@openmail.cc
Subject: Re: [PATCH v5 3/3] wifi: ath10k: only load compatible DT cal data
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
 <20230203104822.361415-1-equu@openmail.cc>
 <20230203104822.361415-4-equu@openmail.cc>
 <CAL_JsqKq1Yv+svKMS3R=TmDui1VJEjinoPFoDAAgr8tBbV1aSQ@mail.gmail.com>
 <aef1d48b-cfc2-1a5d-d26c-deae85875d43@openmail.cc>
 <CAL_JsqLbGBQcxDQSbsqFyE2CR3VH=61NtZvU2YqE1visdUZXCQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLbGBQcxDQSbsqFyE2CR3VH=61NtZvU2YqE1visdUZXCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_202617_102292_C046840F 
X-CRM114-Status: UNSURE (   6.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

>
>>> Upon further thought, why can't you decide all this just on PCI
>>> VID/PID? The giant switch statement in ath10k_pci_probe() could all
>>> just be struct of driver_data from the PCI match table.
>> I cannot decide all this just on PCI VID/PID because PCI VID/PID cannot tell whether calibration data are stored in the device (like most expansion cards) or not (for example, in an NVRAM cell referenced by the device tree).
>>
> For a given VID/PID, you could have calibration data in DT that you
> want to ignore sometimes and not other times (because the compatible
> is wrong)?

Some devices will change their VID/PID after applied with calibration data (e.g. AR922X will do 168c:ff1d -> 168c:0029), but most device trees only record their post-calibration VID/PID in their compatibility string.

Should we match such device against their pre-calibration VID/PID only, and break all current device trees for them?

I think we could add these pre-calibration VID/PIDs to the ID-list of the PCI driver, but had better match compatibility strings against drivers, not devices.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
