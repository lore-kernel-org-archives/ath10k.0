Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2BDC6FD1D
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTQEHnHI65xmLDDJPBkkrpUvcxXcXyaO0sl4X1dWLk4=; b=Shv2hrXwhSnQAx
	gyoU21TdLOqQLMM+Znq1OtP9tKufz6WJrTfTqMDNTNlbjD9qwvPs8mdqISwjd6LMRzTnEB689NwEV
	tLjjSh+OQl+KHqcJEjpmEdFazr/Iykqw9Po199eqnnqEm7shY8bPk6HteGMQyndE0eVDtnoS8lQGF
	UUn8cxDv0MLHUtVLRF87pzMyMLCnruPFJZU6gtYI39Uok28yN0eIN5bM0w0UlpXD5OCSceBxGMMBi
	skmsWsYk/Ns6lG4Y0nHNYbdJgTiXjjjQQYGwInWfgRtwCWEBirSCLH+ljDF9TGo0lGNqLhuv3Cedc
	8CX6A/6kWDuNQincd3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHlU-009dRT-16;
	Mon, 20 Mar 2023 15:49:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHlR-009dQH-1o
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 15:49:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48451B80EC2;
	Mon, 20 Mar 2023 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAC2C433D2;
	Mon, 20 Mar 2023 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679327375;
	bh=Wey60S7YosF3VUbkljCp4pLTuPZnSX00bYowZt6PxXY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NN4oDClfM/gvwyp4IimGBwcAALjO0a/E/AVKbvuN+B4BifBAGQRUEXV9Aww8e1ASm
	 gmyXkbk6homQyuc0f/T/PdawAlOeW0Tt2qVsmSFMhASgq5a+LQ2aPffVl9bS+qKYxB
	 DFjPaSXJlkI2lcRUEwv07x9vfsNHgSQEd4pnHx1VrJcFjIiUwmtuQUxjXU5bu+mysD
	 qQwPLbvyo5rG1aziuh8o+P5ruLyErCNJJrd7FoNfv6qCQCiqLHK9U8Uvpls0K8YITB
	 i4K+yB4dvZpw4BTTC1KmOG8xNbmvyL/okWqTcypUhJ8VAzeUYq5t4Sin89O/265psU
	 2kq352R5T7auQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL.iNet GL-AP1300 specific BDFs
References: <6415f6b9.050a0220.7cdcf.a5a7@mx.google.com>
Date: Mon, 20 Mar 2023 17:49:32 +0200
In-Reply-To: <6415f6b9.050a0220.7cdcf.a5a7@mx.google.com> (Christian Marangi's
	message of "Sat, 18 Mar 2023 12:38:29 +0100")
Message-ID: <875yavh183.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084937_734664_90C3C835 
X-CRM114-Status: GOOD (  16.24  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> Hi, we have many board file not pused upstream in openwrt. The intention
> is to fix this and have all of them merged.
>
> * description for what hardware this is:
>
>   - it is a QCA4019 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - extracted from the original stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GL-AP1300
>       sha256sum:
>       91b0dcc779f5eabff3da24b708474d1346b8126e8ac7300407aa6a94a94e7af7
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=GL-AP1300
>       sha256sum:
>       33765528d2c9e7ed8c78592e7f58745b16a714aabdb11cf5a9176433fd1a6a6c
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-AP1300
>       sha256sum:
>       310ad9cc661b1e1d261228b465bb951124be6205171984d717dbe37a6be99c36
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-AP1300
>       sha256sum:
>       11c3d627a2aeb3d10ec22247c34a4a36153bfcc0724de4db07c83ceaa90a11cd
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GL-AP1300
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=GL-AP1300
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=GL-AP1300
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=GL-AP1300

Changed:


Deleted:

4 board image(s) added, 0 changed, 0 deleted, 143 in total

https://github.com/kvalo/ath10k-firmware/commit/e7ea0e9b4a4ea1ab1b4e14863268021a4854bf2b

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
