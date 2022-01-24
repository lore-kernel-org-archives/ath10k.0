Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273CEC433F5
	for <ath10k@archiver.kernel.org>; Mon, 24 Jan 2022 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bfUrn/cSuZY9KQ16lDAKgUwE6zq7SJ96msD1smoqGM=; b=02bqKOpRWDuhqN
	gl9leRwtH6TRXOTVRfgtIK4JIZB1+pyuTvIBCbC3brbk0ARennoBnC0oYXBCVnQ2M4g+fQHe3xKlH
	S1avVLPW3spdB1qZUVCv3vGQhc6m26MOoeI1hn3cZOn65zkjVGc4DuL86Bosoj8aiEfpWXc1fBzTh
	mjr+gsbpZQwggmvVWBw4jSroB14wT7Y9d+nKYLHEkrn22Um1BPvOpvAmtp1ewgtbd9ncuMscxHRf3
	P5zn/Vl6rteEDWkHTMCb/CD98U/MVrsCl6iEqMSdycxvHK4upLksTSA1kXNiQrWWaKQL+QEVANh4e
	hDtJ2Dj1ry83XXep4Lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvIe-002jDz-RN; Mon, 24 Jan 2022 09:06:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvIY-002jDB-SK
 for ath10k@lists.infradead.org; Mon, 24 Jan 2022 09:06:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1D4FB80DEE;
 Mon, 24 Jan 2022 09:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07273C340E1;
 Mon, 24 Jan 2022 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643015159;
 bh=ykpJN+doRrZRFjegA++W+WoXuV7zmXksLn/CgF6SM1c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=vOo3uNwnq3mgQWtrhnS/P2AFnSqb0r40NzbJ514ZQLdOxGzWM8YRDRKVlwmcdgoFO
 hqpar2wPX2Ias5gwcMB7soHFeCzkeHhml7GLEvgENCzzEFznw1b4wRlFUYcJizAMfL
 gg3+JX8KFss6l284wpdthdeyVA1kFt1G6PwvZO3Gzopuhlo0XqlEFtiBEgGFf4gzsf
 4btxXIZcfxC4YvQ6UsUTiaE6qHTI6UZV6J1DMZuNilG71itYN/CPEpkEsLaEwC0ONi
 7o737bUBBpXbpsvsH5T9d6JLtDBZ8/gLKhWFWLlwXIdPXm0GA8mnp7yptY+E3g/J1R
 TqShXV+OHac0g==
From: Kalle Valo <kvalo@kernel.org>
To: Hans de Goede <hans@hansg.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174 hw3.2 target 0x05030000 chip_id
 0x00340aff sub 168c:3370 board file
In-Reply-To: <4b816e97-d072-8879-edc9-0978028197db@hansg.org> (Hans de Goede's
 message of "Fri, 21 Jan 2022 16:13:33 +0100")
References: <226790d7-75d8-bac3-9991-d73fa5b7df5b@hansg.org>
 <87ee519nsc.fsf@kernel.org>
 <4b816e97-d072-8879-edc9-0978028197db@hansg.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 24 Jan 2022 11:05:54 +0200
Message-ID: <87mtjl8pvx.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_010603_238008_2722B793 
X-CRM114-Status: GOOD (  15.12  )
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

> On 1/21/22 15:16, Kalle Valo wrote:
>> Hans de Goede <hans@hansg.org> writes:
>> 
>>> Here is a board-file for the QCA6174 PCI 168c:003e subsys: 168c:3370 wifi
>>> card found on Microsoft Surface Go devices.
>>>
>>> I'm submitting this per the docs in:
>>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
>>> I hope those are still up to date.
>>>
>>> Currently the kernel gives the following message when loading on this card:
>>> "failed to fetch board data for
>>> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370
>>> from ath10k/QCA6174/hw3.0/board-2.bin"
>>>
>>> And then errors out with a bunch of -110 (-ETIMEOUT) errors.
>>>
>>> Replacing the fallback board.bin file with the attached .bin file fixes
>>> these errors and results in working wifi (I tested at both 2.4G and 5G).
>>>
>>> There are various internet forum posts which point to this board file:
>>> https://web.archive.org/web/20201111213909/http://www.killernetworking.com/support/K1535_Debian/board.bin
>>>
>>> But the killer 1535 wifi card uses completely different subsys-ids
>>> of 1a56:1535, so even though that happens to work I do not believe
>>> that is the correct file.
>>>
>>> So instead, inspired by this report:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1651779
>>>
>>> I started looking at the driverstore directory of the original windows
>>> install on the device I found "netathr10x.inf" there which has this line:
>>>
>>> eDesc.6320_3% = ATHR_DEV_OS63_988x_TX8.ndi,
>>> PCI\VEN_168C&DEV_003E&SUBSYS_3370168C&REV_32; WiFi Only SKU
>>>
>>> Note the "WiFi Only SKU" remark is there to differentiate this from
>>> the 168c:3371 subsys one which also has LTE (marked as "WiFi/LTE SKU")
>>>
>>> This led me to the "ATHR_DEV_OS63_988x_TX8.ndi" section of the .inf file:
>>>
>>> [ATHR_DEV_OS63_988x_TX8.ndi.NTamd64]
>>> ...
>>> CopyFiles = atheros.CopyFiles, atheros_FW_3X.CopyFiles,
>>> atheros_BD_TX8.CopyFiles
>>> ...
>>>
>>> And "atheros_BD_TX8.CopyFiles" is:
>>>
>>> [atheros_BD_TX8.CopyFiles]
>>> eeprom_ar6320_3p0_TX8_clpc.bin,,,2
>>>
>>> The "windows\system32\driverstore\netathr10x" dir has a ton of
>>> eeprom files (let me know if you want a copy of the whole dir)
>>> including the mentioned one. Where as "windows\system32\drivers"
>>> only has the one eeprom_ar6320_3p0_TX8_clpc.bin eeprom... file,
>>> further indicating that that is the one actually being used.
>>>
>>> So this is the file which I've tested with and which is attached to this email as:
>>> "bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin"
>>>
>>> md5sum:
>>> bc52aa5640b27fa50f9d4d144f81e169
>>> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin
>> 
>> I assume this is the same version as you submitted directly to
>> linux-firmware[1],
>
> Correct, note that my upstream linux-firmware submission contains
> 2 new board files. I've also submitted this to the ath10k-firmware repo here:
>
> https://github.com/kvalo/ath10k-firmware/pull/11

I see that you closed it also, thanks for that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
