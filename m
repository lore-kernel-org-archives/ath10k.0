Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80794C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DCxf1isKIZQ08nLrl33nVAAMZXFuzWF9+R8fAXJe10=; b=xeZMKgXOLrD+KY
	fpeNmqJb/HrQmRgzK6xy6D6Y+BVygTPsaYlbPOBkickFskGgy1dDep/D9Zv/oDeuwtb7pSGMfzCfZ
	ZjodB5/kYkCyyjNM8/ooBcsdMe8/gWLFkK2R3PymE9BqSyugByqRj1qC54rbhcsHLEF+yy7b8/Ke1
	CZRC5BA1pGURzj2TQv7K/DPOYnODhXo/oHp355CSIkV3/HYlmgJDx7SSLtwZzU+sFwWcv0Q03KOMU
	qEsq6q8kcyDLj++oE1Sn8O+TdDnkKvmQ/Hl7qjlcXnZ5kVU74K+vpR5KkK/7z5WuxR4dC03EsZkrU
	0A0STys9q3aH2M9yRYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAvaL-00FT94-Mm; Fri, 21 Jan 2022 15:12:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAvaI-00FT8e-Lw
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 15:12:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6994BB81EDB;
 Fri, 21 Jan 2022 15:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8A4C340E1;
 Fri, 21 Jan 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642777932;
 bh=RdczTUofFwZAkdNSgiNB3XLtQykQkK1akjKyrY5+Mm0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=by6NEevEAwd/sIi77d6lEW1tIoZnPuMdHxKEI3xCORhi8l0KSwhcs6p20PFYCjIIt
 6c6JihXXzg5NF/N363xfOpY1IMPCoSQqovly95T5pg7E7XIyGsa9Y/VsvUI7hos8uV
 6TyzJRAwWexhkzKTLgQ0u7rv/ib+sv9JlUM7WBXdiD0WkzXjbYtMALfNBUrTma3xz7
 aK73tvVJoxxksnzjnis8e9rDR/BFC4q2geDcUex+2a4aM+k6UN3mbx/jZ1xHReBvu5
 7lIr9pP+ViwcFg/NMVkY2VSY8pIIGoZGKbEz3C63d8bA2zItnXzKPuB8M/3tME5H4G
 0qB4c3i4tzJ4A==
From: Kalle Valo <kvalo@kernel.org>
To: Joshua Roys <roysjosh@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add ASUS RT-AC42U specific BDFs
References: <CANoNxL_-ixM9Am2O30OUrNFux9zO_YUMPjh37e6PR9hZEyEYFQ@mail.gmail.com>
Date: Fri, 21 Jan 2022 17:12:05 +0200
In-Reply-To: <CANoNxL_-ixM9Am2O30OUrNFux9zO_YUMPjh37e6PR9hZEyEYFQ@mail.gmail.com>
 (Joshua Roys's message of "Mon, 10 Jan 2022 10:53:13 -0500")
Message-ID: <87pmol86nu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_071214_876727_561C44D5 
X-CRM114-Status: GOOD (  12.42  )
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

Joshua Roys <roysjosh@gmail.com> writes:

> This is in support of the OpenWRT bringup for the ASUS RT-ACRH17 a/k/a
> RT-AC42U (online) a/k/a RT-AC82U (GPL sources).
>
> * description of hardware
>   - QCA4019-based board, the vendor sources build off of DK04.1
>   - QCA4019 is used as 2.4 GHz radio (BDF in previous email)
>   - QCA9984 is used as 5 GHz radio
>
> * origin of the board file
>   - Pulled from the firmware image 3.0.0.4-382-52517-gb4d36a6
>   - Identical to board file in GPL sources
>
> * IDs to be used with the board file
>   - bus=pci,bmi-chip-id=0,bmi-board-id=3,variant=ASUS-RT-AC42U
>
> * md5sum/sha256sum of the board file
>   - MD5 d6add1386d2353d08f8a0d86f243a5c1
>   - SHA256 e6e076ab66b0e8eff9f78e120659258c537fd9d9b558142d5e14575cda854534
>
> Board file is attached.

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=3,variant=ASUS-RT-AC42U

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 20 in total

https://github.com/kvalo/ath10k-firmware/commit/069b752fd26245aff0a00344bf8fc469bfa65d17

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
