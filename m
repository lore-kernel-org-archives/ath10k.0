Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EACC433FE
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XjX2i7541dPqACCxOK/kB6rADDKo/t8NOIZWjEqkAw=; b=h6VVJtYzylekRk
	fKDDnW/5lfM8cdv9IgxB4X6gm+4s+DlgyVW3fiHKb86q52gqSrzPWfqU8A+VYNDd8f36wQ6SjEX5a
	1tZrXelQG4bo/stk8fCaPcCjbYJGl2WqrrR1cZzxL60++d+9b515jJ9uUwgRxPoEVUpXVrSNGrQXN
	MhlhlSg308Wk9qXk/eFhseRPJiiNl+z3bWyzN+4QF0mvnmR83eFY20GL3bytb8g2R9nVAtGkLalvN
	tSO8RsT8Wtb0//WcMfggftYuukGtEEWxdVZZcE0cCY/S7UX6ggCTU27f0TTtYbrunG8s1g7f4NfcH
	xi1tmf2n6AO6TSdM1LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAy7G-00Fn8K-56; Fri, 21 Jan 2022 17:54:26 +0000
Received: from mx.kolabnow.com ([212.103.80.154])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAy5l-00Fmek-EW
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 17:52:56 +0000
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 1EB9E420CB;
 Fri, 21 Jan 2022 18:42:37 +0100 (CET)
Authentication-Results: ext-mx-out003.mykolab.com (amavisd-new);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:references:content-language:subject:subject
 :mime-version:date:date:message-id:received:received:received;
 s=dkim20160331; t=1642786956; x=1644601357; bh=MWl/EJSIzEp61Cgc
 KqbwYhpMeh0nGtLm3ox5BjC1n8U=; b=kXdZm0NUl9sYOFZlhSnPJzzJmAZvU30b
 wlnm0nLEXRyn/yMH4JW3aP+DNwSkuAxB2cuSDDv2CJxiFzY8Bt8ZTM6UAErreoJy
 UbTv2ZP0tVm+ns4Z2scd8z/gFXlbj25GCbjM79YwqFl4EKbknInhrTlW4jWCCoFM
 +yxv6oQIegIysDW7SvoRh0oq7PsCbNjy+9B2N8/6xv8GFrkYa7wuzGv0fG/0ky9B
 JLwX/EFs33e/TlAT6UqbFuKFvPjzGMnzbnqsl5LWXoNCUFC7/1RF9ZE2kTAX/3j/
 aUFt6tTpGwtUwWmw+nfxrWjiDWAdrrCwzlnYsUbQ03muhCN8D8UDXVpnWMuuIrL2
 yRquEyTbJaSeUWtxQNR4/WIE/9gAkwBEIMBDGFp7lMoSJzhR3jkk1+faALJsmIzs
 IFZlpJeRe5g1CQVdyeHaIXQ7bBY5yXbh+nNgUeqkjOMmz6VeI8Ub69l2lB2GgB6Z
 XdHdvD9Yk6sRraIYYkvsYLsOuD+YJNp3XhQMYfDdoMrV9os4EFwcH6IhXq2fni/8
 kWO2XMqkEZpQBnUVFjiZfCplzQIu8xs2hFJk6PvJ4dML2j5CZfOM7tAQanhp+t93
 xFACXYJajKkaBIYWb1KBXN7e+SgckvGa2IHzETrImZA5z7ChbbDxKDCFFHsTtCkZ
 bPaL87zKMls=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCWp9lCK9S71; Fri, 21 Jan 2022 18:42:36 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id 9BB54420CA;
 Fri, 21 Jan 2022 18:42:35 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 1254F7A6;
 Fri, 21 Jan 2022 16:13:35 +0100 (CET)
Message-ID: <4b816e97-d072-8879-edc9-0978028197db@hansg.org>
Date: Fri, 21 Jan 2022 16:13:33 +0100
MIME-Version: 1.0
Subject: Re: ath10k-firmware: QCA6174 hw3.2 target 0x05030000 chip_id
 0x00340aff sub 168c:3370 board file
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <226790d7-75d8-bac3-9991-d73fa5b7df5b@hansg.org>
 <87ee519nsc.fsf@kernel.org>
From: Hans de Goede <hans@hansg.org>
In-Reply-To: <87ee519nsc.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_095253_893557_BD36DC8F 
X-CRM114-Status: GOOD (  19.59  )
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

Hi,

On 1/21/22 15:16, Kalle Valo wrote:
> Hans de Goede <hans@hansg.org> writes:
> 
>> Here is a board-file for the QCA6174 PCI 168c:003e subsys: 168c:3370 wifi
>> card found on Microsoft Surface Go devices.
>>
>> I'm submitting this per the docs in:
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
>> I hope those are still up to date.
>>
>> Currently the kernel gives the following message when loading on this card:
>> "failed to fetch board data for
>> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370
>> from ath10k/QCA6174/hw3.0/board-2.bin"
>>
>> And then errors out with a bunch of -110 (-ETIMEOUT) errors.
>>
>> Replacing the fallback board.bin file with the attached .bin file fixes
>> these errors and results in working wifi (I tested at both 2.4G and 5G).
>>
>> There are various internet forum posts which point to this board file:
>> https://web.archive.org/web/20201111213909/http://www.killernetworking.com/support/K1535_Debian/board.bin
>>
>> But the killer 1535 wifi card uses completely different subsys-ids
>> of 1a56:1535, so even though that happens to work I do not believe
>> that is the correct file.
>>
>> So instead, inspired by this report:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1651779
>>
>> I started looking at the driverstore directory of the original windows
>> install on the device I found "netathr10x.inf" there which has this line:
>>
>> eDesc.6320_3% = ATHR_DEV_OS63_988x_TX8.ndi,
>> PCI\VEN_168C&DEV_003E&SUBSYS_3370168C&REV_32; WiFi Only SKU
>>
>> Note the "WiFi Only SKU" remark is there to differentiate this from
>> the 168c:3371 subsys one which also has LTE (marked as "WiFi/LTE SKU")
>>
>> This led me to the "ATHR_DEV_OS63_988x_TX8.ndi" section of the .inf file:
>>
>> [ATHR_DEV_OS63_988x_TX8.ndi.NTamd64]
>> ...
>> CopyFiles       = atheros.CopyFiles, atheros_FW_3X.CopyFiles, atheros_BD_TX8.CopyFiles
>> ...
>>
>> And "atheros_BD_TX8.CopyFiles" is:
>>
>> [atheros_BD_TX8.CopyFiles]
>> eeprom_ar6320_3p0_TX8_clpc.bin,,,2
>>
>> The "windows\system32\driverstore\netathr10x" dir has a ton of
>> eeprom files (let me know if you want a copy of the whole dir)
>> including the mentioned one. Where as "windows\system32\drivers"
>> only has the one eeprom_ar6320_3p0_TX8_clpc.bin eeprom... file,
>> further indicating that that is the one actually being used.
>>
>> So this is the file which I've tested with and which is attached to this email as:
>> "bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin"
>>
>> md5sum:
>> bc52aa5640b27fa50f9d4d144f81e169
>> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370.bin
> 
> I assume this is the same version as you submitted directly to
> linux-firmware[1],

Correct, note that my upstream linux-firmware submission contains
2 new board files. I've also submitted this to the ath10k-firmware repo here:

https://github.com/kvalo/ath10k-firmware/pull/11

Regards,

Hans


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
