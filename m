Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C688CC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUFmQFuq2YiSSstk6V6RK9DBk1oSJFhjwhkpBIAens4=; b=h+6Vw63IPrQTZ8
	TvqNoYM91LcNtHcJjgzXhYB/H9viW86Pp3kUFwAFWZ20b4h4ZAsoY+1Y5sdRHdj9CYbcZOL+KRPR/
	sCI4uYiRldMp3w6O7A2jsPluZeNchQjv4hbLCwLHJAMrD2qTxlVC/wh8aOR018cTkodfcn5dxSWDt
	2jAeNSQbyk7Jas0DXeblyHAeG7X3t9GyrblMRVnXbfaJjTsAypQtq0oH+/gXOLXd2WM5ZNeIN9i58
	OvSgdvyVy0UlzSSH2mWo7v8uKTuu4LfQ+3AXsLCyHBRypPQsaNiJ1Z+M9Z+rWFy5k1rO5kri8aQuV
	mKOwuADPfzR2zLR2pj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuio-00FLml-En; Fri, 21 Jan 2022 14:16:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuil-00FLld-3G
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:16:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A17966179A;
 Fri, 21 Jan 2022 14:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7899EC340E3;
 Fri, 21 Jan 2022 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642774614;
 bh=hD2hcxAmpX0THh/s8h/V//J9CPIeekiUajuEJFJaksM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PH/3AJxfZOyiPI1OOhmOEhCGFaf4P7W15KHxTVtjILmoEMtcPYVBKAZR5u6H91dLm
 zqLUaTc8W7xEomlcf8PiOI9++hzsTA/lzGlGuOert8pDO5pNJk4NVgL1np0Lwo0jFm
 gp+9/auDWp/6jT6DjoFz4iR7ZdSqbAOYrAw6jXZUQaz5ArX+ZtqJYCks/+nXKEEC52
 QYAlULMGhpzKXskao3EL2dpOYlQQ9I/0JK4juzpZzpk4AFh77rIAWl7Mf7B7RLE6Lx
 jHuV3QHvpGL1NDrSksFeI3pX5HqchY5TkjoEP3dTPRZTTXV3AM0b/lZZ5npIIGH98X
 xOqDgfK+NtYIA==
From: Kalle Valo <kvalo@kernel.org>
To: Hans de Goede <hans@hansg.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174 hw3.2 target 0x05030000 chip_id
 0x00340aff sub 168c:3370 board file
References: <226790d7-75d8-bac3-9991-d73fa5b7df5b@hansg.org>
Date: Fri, 21 Jan 2022 16:16:51 +0200
In-Reply-To: <226790d7-75d8-bac3-9991-d73fa5b7df5b@hansg.org> (Hans de Goede's
 message of "Tue, 24 Aug 2021 18:44:05 +0200")
Message-ID: <87ee519nsc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_061655_252401_BE4E652C 
X-CRM114-Status: GOOD (  23.42  )
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

Hans de Goede <hans@hansg.org> writes:

> Here is a board-file for the QCA6174 PCI 168c:003e subsys: 168c:3370 wifi
> card found on Microsoft Surface Go devices.
>
> I'm submitting this per the docs in:
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
> I hope those are still up to date.
>
> Currently the kernel gives the following message when loading on this card:
> "failed to fetch board data for
> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370
> from ath10k/QCA6174/hw3.0/board-2.bin"
>
> And then errors out with a bunch of -110 (-ETIMEOUT) errors.
>
> Replacing the fallback board.bin file with the attached .bin file fixes
> these errors and results in working wifi (I tested at both 2.4G and 5G).
>
> There are various internet forum posts which point to this board file:
> https://web.archive.org/web/20201111213909/http://www.killernetworking.com/support/K1535_Debian/board.bin
>
> But the killer 1535 wifi card uses completely different subsys-ids
> of 1a56:1535, so even though that happens to work I do not believe
> that is the correct file.
>
> So instead, inspired by this report:
> https://bugzilla.redhat.com/show_bug.cgi?id=1651779
>
> I started looking at the driverstore directory of the original windows
> install on the device I found "netathr10x.inf" there which has this line:
>
> eDesc.6320_3% = ATHR_DEV_OS63_988x_TX8.ndi,
> PCI\VEN_168C&DEV_003E&SUBSYS_3370168C&REV_32; WiFi Only SKU
>
> Note the "WiFi Only SKU" remark is there to differentiate this from
> the 168c:3371 subsys one which also has LTE (marked as "WiFi/LTE SKU")
>
> This led me to the "ATHR_DEV_OS63_988x_TX8.ndi" section of the .inf file:
>
> [ATHR_DEV_OS63_988x_TX8.ndi.NTamd64]
> ...
> CopyFiles       = atheros.CopyFiles, atheros_FW_3X.CopyFiles, atheros_BD_TX8.CopyFiles
> ...
>
> And "atheros_BD_TX8.CopyFiles" is:
>
> [atheros_BD_TX8.CopyFiles]
> eeprom_ar6320_3p0_TX8_clpc.bin,,,2
>
> The "windows\system32\driverstore\netathr10x" dir has a ton of
> eeprom files (let me know if you want a copy of the whole dir)
> including the mentioned one. Where as "windows\system32\drivers"
> only has the one eeprom_ar6320_3p0_TX8_clpc.bin eeprom... file,
> further indicating that that is the one actually being used.
>
> So this is the file which I've tested with and which is attached to this email as:
> "bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin"
>
> md5sum:
> bc52aa5640b27fa50f9d4d144f81e169
> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin

I assume this is the same version as you submitted directly to
linux-firmware[1], so I'm dropping this request.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=4d74f4dec175363fa24c95702dd86f477cef232c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
