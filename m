Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7246C433EF
	for <ath10k@archiver.kernel.org>; Sat, 26 Feb 2022 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd4s5dwdOh5e6I1U7LrFGe+EPUrnNH+9DXTZOBatK+w=; b=Dhg8SvzXwHsiNv
	eklFHW28aY5jMcbQPALEixAmsliXcXGUqbo+zIuQxtNiYbp5QozQ5sjfCXmb+WMoNz+ky0zfDjdXz
	IZuB/ObYNV8Recgdt6f3/eS/nLJJ2hbwC9A4i9qhrjNUBB87DToIRsXDxOWO8mpomihSQiUoZfZ3d
	SBJaf/a9b4NhXg2vCgefSCLWnDVNrKBJ/mXd/g6MxmqCYu3Itvv1WMnv4AnsDX7zsb3ifKvU9gJ8V
	JY9HRy7nIYsTff84l9q17qx5QQjUaIzOujwmC6Wm1xnVeABwurdnrdCmNvSmIH9dNRiiceViU2bdf
	NeBd+Ju5c1zmsfN9kLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNx46-0085YZ-QB; Sat, 26 Feb 2022 13:24:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNx43-0085Xy-Tw
 for ath10k@lists.infradead.org; Sat, 26 Feb 2022 13:24:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C7D74CE07EB;
 Sat, 26 Feb 2022 13:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A1AC340E8;
 Sat, 26 Feb 2022 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645881878;
 bh=LIntISZamojImf53LJD9ga/6GogbygdDEqoIEymnheI=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=nHIK2/ztJuLgPFh6lH/qJUpv2H5yar91gNWQ/n+GTNFBjRl/79rH2uSaM46r7CedZ
 pTclzN+mJdgwAPxWbI1nb+Ykl/0ZnF5Gwt7MKjMbZnA0PYMuprJ4XO3mSRj4nJWdMm
 GFTRZ46jGXHb6CIfi+Q2bCKs1jpdQZIoImgwksS8H148GEsjO+1PgJHWZclC+Dp5vl
 E7iw8JsJMRVLTq/zk9xtLk9E1kYnVoQLg3yffHMs4MMAB6FBEFKuWJ22i+EgRxA+j1
 O+IkxoF3pC+vpLQfAb1Y66Eqk6mK+z+j+3YnFFC3ldcU+SYl756ji2B7PeiUhBQXUM
 +cHOWMtYp1/3g==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
Cc: Christian Lamparter <chunkeey@gmail.com>,
 Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
 <CA+5PVA5hPn9QDkmwJE3E7NU3hv08t416DfLvxeJFJCxWSzSCDg@mail.gmail.com>
Date: Sat, 26 Feb 2022 15:24:33 +0200
In-Reply-To: <CA+5PVA5hPn9QDkmwJE3E7NU3hv08t416DfLvxeJFJCxWSzSCDg@mail.gmail.com>
 (Josh Boyer's message of "Thu, 24 Feb 2022 15:24:25 -0500")
Message-ID: <87sfs5squm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_052448_390721_EFA10866 
X-CRM114-Status: GOOD (  12.77  )
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

Josh Boyer <jwboyer@kernel.org> writes:

> On Wed, Feb 23, 2022 at 2:53 PM Christian Lamparter <chunkeey@gmail.com> wrote:
>>
>> syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
>> <https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0>
>>
>> Includes the following changes:
>> 93591ce ath10k-firmware: QCA4019 hw1.0: Add ZTE MF286D specific BDFs
>> 29b419c ath10k-firmware: QCA4019 hw1.0: Add ASUS RT-AC42U specific BDFs
>> fb4e69f ath10k-firmware: QCA4019 hw1.0: Add Linksys WHW01 v1 specific  BDFs
>> ff8c56b ath10k-firmware: QCA4019 hw1.0: Add Plasma Cloud PA1200 specific BDFs
>> 89492ce ath10k-firmware: QCA4019 hw1.0: Add Plasma Cloud PA2200 specific BDFs
>> faf338c [v2] ath10k-firmware: QCA4019 hw1.0: Add Linksys MR8300 V1.0  specific BDFs
>> 725d7f6 ath10k-firmware: QCA4019 hw1.0: Add Luma WRTQ-329ACN BDFs
>> a92ca29 ath10k-firmware: QCA4019 hw1.0: Add Buffalo WTR-M2133HP specific BDFs
>> 9f771d2 ath10k-firmware: QCA4019 hw1.0: Update AVM FritzBox 4040 specific BDFs
>> a633c15 [v2] ath10k-firmware: QCA4019 hw1.0: Add Cell C RTL30VW specific BDF
>> 46a4f4a ath10k-firmware: QCA4019 hw1.0: Add Aruba AP-303 specific BDFs
>> 0e51dac ath10k-firmware: QCA4019 hw1.0: Add MobiPromo CM520-79F
>> 15f1bdd ath10k-firmware: QCA4019 hw1.0: Add Cell C RTL30VW specific BDF
>> c07b12a ath10k-firmware: QCA4019 hw1.0: Add EZVIZ CS-W3-WD1200G EUP specific  BDFs
>> f688435 ath10k-firmware: QCA4018: Add D-Link DAP-2610 specific BDFs
>> b529a8b ath10k-firmware: QCA4019 hw1.0: Add AVM FRITZ!Repeater 1200 specific  BDFs
>> 8f150f4 ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMR5000 specific BDFs
>> 1fad4d7 ath10k-firmware: QCA4019 hw1.0: Update 8devices Habanero specific BDFs
>> 08fccb1 ath10k-firmware: QCA4019 hw1.0: Add EnGenius ENH1350EXT specific BDFs
>> 0d2493a ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMD1 specific BDFs
>> 4f719af ath10k-firmware: QCA4019 hw1.0: Add EnGenius EMR3500 specific BDFs
>> e2fe755 ath10k-firmware: QCA4019 hw1.0: Add 8devices Habanero specific BDFs
>> 38ebb2d ath10k-firmware: QCA4019 hw1.0: Add EnGenius EAP2200 specific BDFs
>> bc42587 ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A42 specific BDFs
>> f305604 ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A62 specific BDFs
>>
>> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>
> Forgive me, but I have to ask.  Kalle, is there a reason you aren't
> sending these or including a Signed-off-by?

I have not sent any new pull requests to linux-firmware while we are
trying to sort out the notice.txt problem discussed in the other thread:

https://lore.kernel.org/all/CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com/

My plan was to send ath10k and ath11k updates once we find a solution
for the notice files. I'm guessing Christian wanted to get these board
files to linux-firmware quickly and decided to submit them directly, I
was not involved with that at all.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
