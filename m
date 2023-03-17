Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F78C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5iACDoaqKnaa3DkbWttxR8641wJSI3gUL4mjIKkjfE=; b=wqJyakFW/VoWZw
	JYNt/pP3vLvXtKz9nanprGGSRg2KXjOWxm23uZZU7mE5aUFx9V6mvW4NdPAHtXHrsb4EIEoeMkyUc
	Pk1MEg3NI51QbFmNDLPvyFp1RSwlol62PUsFKQihNOBY/hah8TuEsK1RsyvkpxMCMZC/W9PdoLnDE
	ni42E/TG0pTqGkmUPY17vkouv4yUnt5VBgerm4w8jWNHnQrUqjvzbgAl471hyQkbqBSRDv+echC9Z
	6TaT7qcASXT1vcMsWX/apnFyBW/PZvViOqNWqcFUIghQkBP5iOb9CcuFRu5VpO4255XF9MlvzzU7Y
	CjDuftCKwutMf4szv2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8bv-0027yb-0Z;
	Fri, 17 Mar 2023 11:51:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8bs-0027xv-1d
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:51:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1778060EA0;
	Fri, 17 Mar 2023 11:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B771AC433D2;
	Fri, 17 Mar 2023 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053859;
	bh=sC7r4HVHlmlaWboC01OmGxjuxyr7jc2FfEr3pSQcoUg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HHfYeh6GodmlMsI9+xwt4W0YzgYZEwAhB03YdXBbzWesF6moZprpsBmpVzo8Mh1rn
	 7tssSI6XRGaNprbr9sJeW7kv0xR8TH0Wl9AiWKpZOkxVsB+DoBHu5q6Gtrg8vP3sxQ
	 4/eAMj0eIvMRrJTb45758ERHI0z7gZLtD3ADWmW+y7zguJHfLJ5J4Aiy7lTVoZ4bFI
	 mbQBViRATzgzaIQO0JkY4XjpJeP6wJX4bbq/r3LwenGltEt3vAeW7/FF0wEegEGXhJ
	 he6z1Q52ZVMp8xfmw3gBRqh8xQ1yp6Pql01T7llcZ9N7IMqomzRuDKJIAxbl0J2Pje
	 6XV43pKdw2k9A==
From: Kalle Valo <kvalo@kernel.org>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: wifi: ath10k-firmware: QCA9888 hw2.0: Add Linksys WHW03V2 specific BDFs
References: <CA+RD57NTNJcxz0-nJFwKsm5HjChTXG-9seE6kGzwMpzqpYO_4A@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:50:54 +0200
In-Reply-To: <CA+RD57NTNJcxz0-nJFwKsm5HjChTXG-9seE6kGzwMpzqpYO_4A@mail.gmail.com>
	(Vincent Tremblay's message of "Sun, 12 Mar 2023 15:57:50 -0400")
Message-ID: <87wn3fiokh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_045100_586018_97A93737 
X-CRM114-Status: GOOD (  16.48  )
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

Vincent Tremblay <vincent@vtremblay.dev> writes:

> This is a set of files for the Linksys WHW03V2 that are currently
> missing from the repository.
>
> *  description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - QCA9888 V2 interface connected over PCI-E to operate on higher
> part of the 5 GHZ spectrum
>
> * origin of the board file (did you create it yourself or where you
>   downloaded):
>
>   They were extracted from the vendor firmware (version 2.1.19.209783).
>   The files can be found in the folder "/lib/firmware/QCA9888/v2/FCC".
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-whw03v2.bin
> md5sum: fde89e0dace1652566d96fb9c83b1c61
>
> * attach the actual board file (board.bin):
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-whw03v2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 17 in total

https://github.com/kvalo/ath10k-firmware/commit/07101af80a3c94a395add066613af5ede68c0727

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
