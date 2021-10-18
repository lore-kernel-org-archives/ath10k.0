Return-Path: <SRS0=x2CT=PG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6593BC433F5
	for <ath10k@archiver.kernel.org>; Mon, 18 Oct 2021 13:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1236C6103D
	for <ath10k@archiver.kernel.org>; Mon, 18 Oct 2021 13:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1236C6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+mK6w1Gso19s0p0eJ2MvYh0yayu2ctljr9nFuaeU8E=; b=wDdRP8rV/TNUeR
	ZGdBqPLcY93R/5PDaAMsa7AhKRTYanc02A6Fqsy+0HIsGXoRDAM8eiyKqspVxYPNeNiPEL4OpfH9s
	b69hylICT/lnSADCDJn0ZEWzypLLLYUzA3VX7zdyMcrla2rpBaIDEk55uMfw9AII7wDQ/u3b9UCnz
	WAZP0Azr9ZUFJHQ1K2CNud7MZxKmhuXIdiQue5hiwxoM6y5Q6PJmYdoCzdaYjxZIUPbFStXcd8ECz
	XqOsa/cVocxdLe3GDt8Rx5PUoZ58SheQZcuZx5Jv9pirtyLiIuVE8x4Qmi2B27nPrkN4xgv/6zYvV
	cjjjM6c/5+SySdCIInfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcSVb-00Flci-W7; Mon, 18 Oct 2021 13:16:56 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcSVS-00FlaZ-W4
 for ath10k@lists.infradead.org; Mon, 18 Oct 2021 13:16:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634563012; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=NO1sL3LhQe0Gt1J6i8DZ4oXQY6QOZlf6qP9qnMP/jmQ=;
 b=UDfB3SjLn+UxsbRv8ZOJcafoRjtCNvqSHUqYsr790hM54Zo/ZcrRGbWfkM/fevp7SUngse0r
 qzIzt94vIoxhKZvHZRn4Xb91oQYZlgJxzLzNfHrDuFG8iovHwGK3huX4Sc0H7zJNtdC4pfWD
 KWMEHB606GSgQV/21G67HqDktOE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 616d73a1ea41a97c24ca92d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 13:16:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3410DC4338F; Mon, 18 Oct 2021 13:16:17 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF540C4360C;
 Mon, 18 Oct 2021 13:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BF540C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jens Christian Hillerup <jc@veo.co>
Cc: ath10k@lists.infradead.org
Subject: Re: Network interface taking a long time to come up
References: <CADQ=1VJ4B4BB7kNZrcxByyx=--fv8xSFZ+yP9czX25qYJ3eUaQ@mail.gmail.com>
Date: Mon, 18 Oct 2021 16:16:12 +0300
In-Reply-To: <CADQ=1VJ4B4BB7kNZrcxByyx=--fv8xSFZ+yP9czX25qYJ3eUaQ@mail.gmail.com>
 (Jens Christian Hillerup's message of "Thu, 14 Oct 2021 09:56:18
 +0200")
Message-ID: <87bl3mtqw3.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_061652_955586_C26C83F2 
X-CRM114-Status: GOOD (  16.42  )
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

Jens Christian Hillerup <jc@veo.co> writes:

> Hello
>
> I'm trying to get a QCA6174-based PCIe card online on the NVIDIA Tegra
> platform. Running kernel 4.9.253-l4t-r32.6. The card is detected and
> visible in lspci (+ lsusb for the Bluetooth parts), but after loading
> the ath10k_pci driver it takes about 2 minutes for the network
> interface to actually appear.
>
> In fact, it takes so close to 120 seconds that I believe it could be
> due to some kind of timeout.
>
>     $ ls -1 /lib/firmware/ath10k/QCA6174/hw3.0/
>     board-2.bin
>     board.bin
>     firmware-4.bin
>     firmware-5.bin
>     firmware-6.bin
>     firmware-sdio-6.bin
>
>     $ dmesg
>     <snip>
>     [    9.932518] ath10k_pci 0004:01:00.0: enabling device (0000 -> 0002)
>     [    9.933364] ath10k_pci 0004:01:00.0: pci irq msi oper_irq_mode
> 2 irq_mode 0 reset_mode 0
>     [   10.211615] ath10k_pci 0004:01:00.0: Direct firmware load for
> ath10k/pre-cal-pci-0004:01:00.0.bin failed with error -2
>     [   10.211835] ath10k_pci 0004:01:00.0: Falling back to user helper
>     <snip>
>     [   71.009583] ath10k_pci 0004:01:00.0: Direct firmware load for
> ath10k/cal-pci-0004:01:00.0.bin failed with error -2
>     [   71.009612] ath10k_pci 0004:01:00.0: Falling back to user helper
>     [  132.469576] ath10k_pci 0004:01:00.0: qca6174 hw3.2 target
> 0x05030000 chip_id 0x00340aff sub 11ad:0513
>     [  132.469588] ath10k_pci 0004:01:00.0: kconfig debug 0 debugfs 1
> tracing 0 dfs 0 testmode 0
>     [  132.470831] ath10k_pci 0004:01:00.0: firmware ver
> WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 5 features wowlan,ignore-otp,mfp
> crc32 90eebefb
>     [  132.550108] ath10k_pci 0004:01:00.0: board_file api 2 bmi_id
> N/A crc32 318825bf

The 60 second timeout in firmware loading points out to the user space
firmware loader helper failing. This has come few times in the past and
is not related to ath10k, but I have forgetten the details already. Try
disabling CONFIG_FW_LOADER_USER_HELPER_FALLBACK and tinkering with other
firmware loader settings. Also google should be able to help you, this
was pretty frequent problem in the past. Ah, you are using 4.9 kernel
which is already five years old.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
