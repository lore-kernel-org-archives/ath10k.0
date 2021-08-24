Return-Path: <SRS0=2rbV=NP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0316C4338F
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 16:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAF3611EF
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 16:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FAF3611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hansg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:Subject:From:Cc:To:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OddoxTI7j/NZ3uNw2VKecDnnwQGmbYO3iRly4tHyZs=; b=LTt8K35lmLKo+QxX52yAOL+rHZ
	UQpXICWvJI3PdcsaEhIA9N7t9JgzIGVJG1BLksLtY5iUjgd1bZzgiMCmA68JuNC5T2koAsshvpwBk
	330GTeI5TKBw6R7FK7q7KJ33ZIhQB1BEE1f6a7V6g39HeAXPsHZX8ytbSNi8dHgtQOBPcNV3ky0FF
	8RS39Yny6CoE4wqGuNT6jNoFvj80OEnW8q9s9hIGLbpT4f6oCsxFqpaexc9t4G2tpEqtmxukVb3cs
	WMkUPC0CGt7DtBTIkaEwDspN11c4/9ijcQSfuRvhpgKlcdPeBRjd8psBlvNDg3PO38mAU9qlR1XiE
	q1yU40Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIZfy-0041aG-Jb; Tue, 24 Aug 2021 16:53:26 +0000
Received: from mx.kolabnow.com ([95.128.36.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIZfn-0041Sn-0a
 for ath10k@lists.infradead.org; Tue, 24 Aug 2021 16:53:19 +0000
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 40ED6C5C;
 Tue, 24 Aug 2021 18:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-language:content-type:content-type:mime-version:date
 :date:message-id:subject:subject:from:from:received:received
 :received; s=dkim20160331; t=1629823450; x=1631637851; bh=9SW/2o
 oRl436ABN7kuQ2TNd6Uuzf+8JvrQld8OGTOso=; b=XxCLtz1nl2kzyrGWoz3lMO
 otbPVEhwlSyluHlqfb6AiasNHO5+XVUro3Fdp+rgU83EjI8hCgskds2ZnoSTsUN6
 Tby/RvBv+9ZpDlWqO7T4ou2hxBVXzplGJT0uoaprg8KXzR0GQ9pYOFJay4cxeXeC
 Zgpa3zx3mpOM57xpfOc9YxP0ejKxQ4zMFmv8R/BxNfdEzCqF/pYhDxeo44lO34ie
 SpUArak8USQ7SEk1rbVfhymsmjuStvAvtZ5AvlJcWIjuGZeOU7zhQRlK2T796VXn
 psn530QTucl8h63hjFIpW7QvIorBqO/8u2hy7v4I1fbkeepOCSqwAukS5lPor5JA
 QjwW9vn6oesZc3iyEbkF+1flVScbN4uJV0uZx2L/w3IFyShFfCLlLeJD5jFWT7wO
 su7omdNpvg9AwvpQgPGXwDJtst9KTsHUzcbM8/PP5+usHi8qkKH9BHhv64HOPG/i
 ooS9ocxgXUZtP6lQblLYjKCevqo44bjDEPUf9j2ZGg+Gx2PTPRYjirPzs1zCgO6v
 pA08xdexUM8H/6FYY5OMlH4iOgESh8PupcuDCcsps5e2vzD/bHatzKn6i6XIXdx9
 5Rt0OcLApuZrlJGNv1zxhGvpm/Of4aZjqCWLJ8wKISKSF77pBB+Dtuj8ei60WBbU
 +J3LgzhF92+WzcxPMGfRY=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-OD4GjqrVWz; Tue, 24 Aug 2021 18:44:10 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id A7E85279;
 Tue, 24 Aug 2021 18:44:10 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id DF11C2FCB;
 Tue, 24 Aug 2021 18:44:08 +0200 (CEST)
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
From: Hans de Goede <hans@hansg.org>
Subject: ath10k-firmware: QCA6174 hw3.2 target 0x05030000 chip_id 0x00340aff
 sub 168c:3370 board file
Message-ID: <226790d7-75d8-bac3-9991-d73fa5b7df5b@hansg.org>
Date: Tue, 24 Aug 2021 18:44:05 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9402119F2AB65D6D5456269A"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_095315_498076_14982274 
X-CRM114-Status: UNSURE (   7.20  )
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

This is a multi-part message in MIME format.
--------------9402119F2AB65D6D5456269A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Kalle,

Here is a board-file for the QCA6174 PCI 168c:003e subsys: 168c:3370 wifi
card found on Microsoft Surface Go devices.

I'm submitting this per the docs in:
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
I hope those are still up to date.

Currently the kernel gives the following message when loading on this card:
"failed to fetch board data for
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370
from ath10k/QCA6174/hw3.0/board-2.bin"

And then errors out with a bunch of -110 (-ETIMEOUT) errors.

Replacing the fallback board.bin file with the attached .bin file fixes
these errors and results in working wifi (I tested at both 2.4G and 5G).

There are various internet forum posts which point to this board file:
https://web.archive.org/web/20201111213909/http://www.killernetworking.com/support/K1535_Debian/board.bin

But the killer 1535 wifi card uses completely different subsys-ids
of 1a56:1535, so even though that happens to work I do not believe
that is the correct file.

So instead, inspired by this report:
https://bugzilla.redhat.com/show_bug.cgi?id=1651779

I started looking at the driverstore directory of the original windows
install on the device I found "netathr10x.inf" there which has this line:

eDesc.6320_3%   = ATHR_DEV_OS63_988x_TX8.ndi,        PCI\VEN_168C&DEV_003E&SUBSYS_3370168C&REV_32; WiFi Only SKU

Note the "WiFi Only SKU" remark is there to differentiate this from
the 168c:3371 subsys one which also has LTE (marked as "WiFi/LTE SKU")

This led me to the "ATHR_DEV_OS63_988x_TX8.ndi" section of the .inf file:

[ATHR_DEV_OS63_988x_TX8.ndi.NTamd64]
...
CopyFiles       = atheros.CopyFiles, atheros_FW_3X.CopyFiles, atheros_BD_TX8.CopyFiles
...

And "atheros_BD_TX8.CopyFiles" is:

[atheros_BD_TX8.CopyFiles]
eeprom_ar6320_3p0_TX8_clpc.bin,,,2

The "windows\system32\driverstore\netathr10x" dir has a ton of
eeprom files (let me know if you want a copy of the whole dir)
including the mentioned one. Where as "windows\system32\drivers"
only has the one eeprom_ar6320_3p0_TX8_clpc.bin eeprom... file,
further indicating that that is the one actually being used.

So this is the file which I've tested with and which is attached to this email as:
"bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin"

md5sum:
bc52aa5640b27fa50f9d4d144f81e169  bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin

Regards,

Hans

--------------9402119F2AB65D6D5456269A
Content-Type: application/gzip;
 name="bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsys";
 filename*1="tem-device=3370.bin.gz"

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
FP8Ah1Z2/bwfAAA=
--------------9402119F2AB65D6D5456269A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--------------9402119F2AB65D6D5456269A--

