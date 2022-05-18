Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30186C433EF
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkzYmHc+NKzqip8y4AEXT/j4My8quuRH+Ba4W78FIa0=; b=lhQDFqIWg3274Y
	G1w1f+grEOyEQHSic4197MW9381VO0/DzVDFA4R+bZSWw0GNYgQl20M700fWhWAovUXMerXbqYzPp
	ND9xP87QesRY4s4IMsCb86L/x3Ya2AFjkHAdima5onnxGw4JV7lV5d6mfSDp9bXBLBKG1PYlAr0/9
	FROTnEF6e4TrkqPJvnJZVkBXFLt0OTxC2o265Mce5N4Cd7uZU4pSq7uKoPb+gaCiEeNTaLg6/ln6e
	TXTn0ouXtTF6S+SHAGQaVLnj4yYUmmCoopvrzqxMDzEAqUk+PWCfmDuqFt6Y5tcCxafqXL7hkYuBo
	HdpSKyi5X+P+gQXlw59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrICR-001gom-MJ; Wed, 18 May 2022 11:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrICD-001ggt-Gc
 for ath10k@lists.infradead.org; Wed, 18 May 2022 11:50:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D969060F9A;
 Wed, 18 May 2022 11:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80441C34115;
 Wed, 18 May 2022 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652874627;
 bh=gLTtM2qkWxy1MRbGGeNh6F0a0AZ6UDbVy+idtsenHY0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=LOSjvHw6XqiuD5IntM++DAAixm+D/iYW2grKzU+yn1J52Snmq/PYhTj79nswNUSBg
 sX8WMeAiMxKxdA6czBXo4YS/r/G+sX4yZnIvX+3QDUEXSy/sdfmLzpFo32MKP+iM42
 DD07nWanNhwK6gFedczXtXMt1P/WElohEf5zdXgNSoonikCBB7MoEzgm9vPiCT1Axu
 N5tjXlQ6gLHdgP7YyBKv8M9y/oXiKhBqVUuqaNyT/OA3D1Qv9y7hVOpJdk1Yf1yvrd
 yhIKxLE4hGGRb/38MetrhZycW/p2jCstKM6XslWY1fzHpoGK9RghJ++Xdw23JOwBdJ
 vJsXH2xTH4sNw==
From: Kalle Valo <kvalo@kernel.org>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ath10k@lists.infradead.org,  Christian Lamparter <chunkeey@gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: add GL.iNet GL-B2200 specific
 board files
References: <c9eed22e-4d00-0129-0f12-26459ab4ed04@gmail.com>
Date: Wed, 18 May 2022 14:50:21 +0300
In-Reply-To: <c9eed22e-4d00-0129-0f12-26459ab4ed04@gmail.com> (Enrico Mioso's
 message of "Mon, 2 May 2022 12:15:34 +0200 (CEST)")
Message-ID: <87pmkb2h6q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_045029_636218_69E4C982 
X-CRM114-Status: GOOD (  19.06  )
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

Enrico Mioso <mrkiko.rs@gmail.com> writes:

> I would like to add some board files for a device that was added a
> while ago to OpenWRt - the GL.iNet GL-B2200 mesh router. The device
> sports 3 Wi-Fi interfacesand currently uses the three board files I am
> submitting.
> To facilitate integration, this message contains only the IPQ4019
> related files. the QCA9888v2 will be sent in a separate message.
>
> * Hardware description:
>
> This device seems based on IPQ4019 / AP-DK04.1-C3.
> The board files in this message cover the follwoing radio interfaces on the device:
> - one QCA4019 radio is used for 2.4 GHZ operation
> - one QCA4019 radio is used for 5 GHZ for operating on lower part of 5 GHZ spectrum
>
> * origin of the board files:
>
> These board files where provided by the manifacturer, who provided the
> original patch to support the device in OpenWrt.
>
> * ids to be used with the board files
>
> + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-B2200
> SHA256: bffec2b99a98ff1d2f842217ef0478c1714f9ea7f42791c2b2f47d9ed1342db6
> + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-B2200
> SHA256: 952e47bae3c8b949926b75c8471fb60dffcceefec5914c0d646a8b361df79d05
>
> * attached files:
>
> The names of the files are equal to the ID strings in the board-2.bin
> files, minus the .bin extension of course.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-B2200
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-B2200

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 95 in total

https://github.com/kvalo/ath10k-firmware/commit/bf58f64205ddd247dcaf5278f73c41babf98124d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
