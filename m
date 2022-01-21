Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B2EC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8+xS7U/qdPcbP1pFKsXmNOzSXQrfKfnCYIAygbtnVQ=; b=QECviw5VChHl5x
	bfREO+DsAXDipdHVCwzgiYJIWqwm8EpkMaBY6pKq10CJREuTulepl5JI8eX6vyMxavLj32332DH2a
	kedRdlAilLkG0W7Y9dGA5bK3+9z/Z/uYykIUXSHQ1W0zsoj605sA+lsSl4G3sDoqYqe7AuMFisO6N
	Ke8yQp1vHeMbCmN8UNEuJwa9S74ZMG7OltQHevMCUNWmzEU1W1rBE6ysrJICC8BhPyg0fWYHUfonI
	m+UFDwaCrCa3CyeA+04Va8dNT82CKmVjFs8MmbRmIimtyurrz19pi/+4odZ5CTGXgg9taOhmJr0Sk
	fSDySLxnwP9s/Vadjykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuMA-00FEpg-QA; Fri, 21 Jan 2022 13:53:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuM7-00FEp9-Pq
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:53:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6073561705;
 Fri, 21 Jan 2022 13:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382DFC340E1;
 Fri, 21 Jan 2022 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773210;
 bh=nGEVl+pBTguLSyQOUKJ8l16phqWeXpkpqPT8Z4WSct8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=N6JhB8R8UVq9gQNEpC02nfv5TxXnsXBfj3Rt74rsPac8xRj8zeKiMWxlpLSwkpx/K
 Hzsmsw/ugan/HWwNWjISBhD+XhAOCqMDXO2vhckcztMznFa0MtekP6IJCXadfPcUbx
 2oGORQ/VfPk5vaTtg3DuaP1uIUE0/hTp8AupatQ4G2GdAcbWfPE+ukMDntCg+fo5AT
 vvlWQ1ahE/tD/cipRfYqXOK+LZAGIKj257GQHmsSkmAjhj8b9UfGyzoZODfIwgRObK
 UUZ8Djsf2gDBAuJG+blv2n9SI1VIx+fp4TUZ4ht3oda1NON9JSniE2niPOYfz+Xlai
 bPzaxTZc4dSMw==
From: Kalle Valo <kvalo@kernel.org>
To: "Peter Adkins" <peter@sunkenlab.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Linksys WHW01 v1 specific BDFs
References: <a4e8bb5115f01cd5cc1c9cc8b584e10d@sunkenlab.com>
Date: Fri, 21 Jan 2022 15:53:27 +0200
In-Reply-To: <a4e8bb5115f01cd5cc1c9cc8b584e10d@sunkenlab.com> (Peter Adkins's
 message of "Mon, 21 Dec 2020 18:46:03 +0000")
Message-ID: <874k5xci08.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_055331_899230_92EA4B64 
X-CRM114-Status: GOOD (  15.84  )
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

"Peter Adkins" <peter@sunkenlab.com> writes:

> In order to properly add support to OpenWrt for the Linksys WHW01 v1 (FCC ID Q87-0333) [1], BDFs were required to be extracted from the vendor's firmware (version 1.1.13.202617 [2]). Without these the radios did not appear to operate correctly; the 5GHz radio was unable to scan, and when running in AP mode, clients were unable to connect.
>
> The vendor firmware appears to provide a number of board files which are installed at device power-on depending on the configured region - AU, FCC, EU, etc. Only the FCC board files have been included here, as I'm unsure whether all files should be submitted and whether there are any differences (although their md5s did not match)?
>
> Information requested, per the wiki page [3]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4018 based board
>     - one qca4019 radio is used as 2.4GHz radio
>     - one qca4019 radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you downloaded)
>
>   - Extracted from Linksys WHW01 v1 firmware (1.1.13.202617) [2]
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=linksys-whw01-v1
>     md5: 92f5a223a963211d884b6211385dfa91
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=linksys-whw01-v1
>     md5: 5bb0357df9cf3614fe4d9db696d09e43

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=linksys-whw01-v1
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=linksys-whw01-v1

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 86 in total

https://github.com/kvalo/ath10k-firmware/commit/fb4e69fcead641ed592207b133e67f0a4c6d9dab

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
