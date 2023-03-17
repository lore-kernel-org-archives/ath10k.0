Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5BDC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DeuL4IryezmJRS3IhpWoCYzEDhxfyuMh3sp69gHprQ=; b=2kb1czgH0wm24H
	5oxKC7E4atJet0kCZb73GH6e3L1zstwQAkHi2kpceDOA3hGD3/O3jbOCx99DPT4Wl6YsaeRFUetG9
	SzMhYYr8cghSm8ZwN5MUbY0K3ebcQWsnuk3BX8OJtJ0t4lOil4neDtW9ZDRaY5jJB4f4RT1I+Pr03
	TVmwiOKnLK0/DH6fFQoo+YsdKC7EdWlfEYrGDWtrCabxggl/OEyZSXntDYvMgSokh0qfjiJFJfO8I
	zL6or8K4wQtgja0BC7g4rVW+XuGkpE5FqIZN0cHHQcl7rQ+0OlDbRBwVPSPq4rYOedq3gR6IfZoKL
	ueN+CwhofpAD7B0Cqjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8dI-00288H-0O;
	Fri, 17 Mar 2023 11:52:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8dF-00287p-1g
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:52:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1037A60EA0;
	Fri, 17 Mar 2023 11:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE517C433D2;
	Fri, 17 Mar 2023 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053944;
	bh=xkPTiwldesianGR6Q+53BEx75oSfM/xFgKdrSj2oKx0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=E0OfOZ5eJJzOtiXBSTfh8IYtnu/I7f+oJXuy9Ruu7z61+0GMbO38iiJYbF05M2cwR
	 Wbj4TjxSRDefMj6ws1g2xacw69gzw7U6GUh57NuDsi8YyLZXe2ZQmfRPk5JCjD7Zcp
	 /9h1nfWjbPM+4SYysWwuSwHKyGp5D10X7hsl9d3N8/o2SzuY21bPWnHoA4OjB7EZ8j
	 iKtXnfgby6+LeA1M+W/I7gAD48NMJ5OIj4ZKXqkmSXrUJkp9aWyvvLUMPbato7rXgd
	 CAsmUnHWT/Tk8wO4CHUHR4rvKK0WSiYgSy9SVxgakMTiK4QuOpSqJw2YW6MD8tC/Z9
	 MRtGNmwRwU85g==
From: Kalle Valo <kvalo@kernel.org>
To: Giammarco Marzano <giammarco.marzano@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add ZTE MF289F (5G) specific BDF
References: <CAJE2SDe7A4Jtuqh5qAK1p38DB6Ehkst-ZcqnuE0XXB7htSEEBw@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:52:21 +0200
In-Reply-To: <CAJE2SDe7A4Jtuqh5qAK1p38DB6Ehkst-ZcqnuE0XXB7htSEEBw@mail.gmail.com>
	(Giammarco Marzano's message of "Wed, 3 Aug 2022 15:56:58 +0200")
Message-ID: <87sfe3ioi2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_045225_598066_D5559E37 
X-CRM114-Status: GOOD (  14.11  )
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

Giammarco Marzano <giammarco.marzano@gmail.com> writes:

> this file is for add definition for ZTE MF289F
>
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file: taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA9984 hw1.0
>
>     + bus=pci,vendor=168c,device=0046,subsystem-vendor=168c,subsystem-device=cafe,variant=zte,mf289f
>       md5sum: 424c30dc8a88405ad8545b9b89ce8453
>
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,vendor=168c,device=0046,subsystem-vendor=168c,subsystem-device=cafe,variant=zte,mf289f

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 20 in total

https://github.com/kvalo/ath10k-firmware/commit/986b305b2c2b64cf8f789ba021157f7328ad86e1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
