Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE1C3DA4A
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o+9k/xRqTdcMWC2cvbgsZGUGHEZkEwsZmy23wb1EDA=; b=Ufm4Sc2Q3WRw1witI8wZpQyFWg
	tJoffFCQIsVbK0QaLFPakec6/CebO53JxJo2TCCPE1kK1DiV+mD8UFl+f+0/aW49fcTatoSDRGwWU
	8/qkYB2mb6Pzs4qabcHmApzPZ55H3i4x0QEad/PvN41A53Z6WnsiTdzdWonmgql5OP73EiHrgwy7W
	MOavskDB1FBuhDw4GNTqAM5rhaBUXiMe+Lw1o7i8ZUwuaqJG7DxsCdai4WjAlQcLod/6hY6D9UPla
	7ad4txRGEfaSryt6018Qzaurl7NqkGa/RPQJ8O5DkHsdBA3sV9jrPBN8QNbV6HybffYmggDdq3Hyk
	BlNKVQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saut0-0000000FUT7-21Zw;
	Mon, 05 Aug 2024 10:24:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauqr-0000000FTd6-3hYq
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 10:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B590CE0AB1;
	Mon,  5 Aug 2024 10:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930E0C32782;
	Mon,  5 Aug 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853323;
	bh=6KDt+JmP1HRccqMzAJ7O3BYqToFx6PIMOFQll+8+U+A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NFf/3R7Ry7ZHoy8l0wIboTlLm1JLNUB9MqNAk+qaf9/zVFfJGBGBY35wmt3h/WyTh
	 GBZgWRemao98doyS7JdKi4rA3dSepeuxYiQKd1Sg9oFZEr6fTM9QD71xC6ewi10l0Y
	 KnzXnNETmOzih7cE55rT8iC9V+2K/xEh6zym1qi3T6Urw9N+fU8OqH68m3t9TdpL3k
	 4d9/3egkCzyfLmQv0/O7PNvFo2y98VUC5JdrokBb/+/gdHlEIGki1lG2z7F+V0GNmk
	 o7OSKV4XVHHTjOnFx1h8iiDhFudmY2LgEjqe7qMTIEgeOIs/4lC86A4x0H4sFfLZHv
	 avbdQl/84AwWA==
From: Kalle Valo <kvalo@kernel.org>
To: SALVATORE BUONO <tottobuono@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: Problem with driver ath10k_pci
References: <CAH_QiWBD3DdGL-GocHjakJvwrZNMzoiJ+RfCm5iiZf8msbbJ8g@mail.gmail.com>
Date: Mon, 05 Aug 2024 13:22:00 +0300
In-Reply-To: <CAH_QiWBD3DdGL-GocHjakJvwrZNMzoiJ+RfCm5iiZf8msbbJ8g@mail.gmail.com>
	(SALVATORE BUONO's message of "Fri, 2 Aug 2024 20:55:52 +0200")
Message-ID: <877ccvjmlz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_032206_303543_112C3D53 
X-CRM114-Status: GOOD (  12.95  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SALVATORE BUONO <tottobuono@gmail.com> writes:

> Good morning, there is a problem with this driver with new version of
> ubuntu, since before I update to 24.04 it works correctly, but now it does
> not work anymore after sleep/suspension. It disconnects and I tried a lot
> of commands to restart the wifi module but it does not work. This is the
> discussion on ubuntu forum, but no solution is found. Can you fix it?
>
>
> *Salvatore Buono*
> salvatore@salvatore-Inspiron-5515:~$ sudo dmesg | grep ath10k
> [    3.509206] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
> [    3.511043] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [    3.734071] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1028:0310
> [    3.734081] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> [    3.734432] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
> [    3.799439] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
> [    3.881223] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> [    5.804589] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
> [  394.964239] ath10k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000b address=0xfb294f50 flags=0x0070]
> [  402.843038] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [  403.045772] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1028:0310
> [  403.045788] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> [  403.046353] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
> [  403.110616] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
> [  403.197531] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> [  403.259722] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
> [  418.545075] ath10k_pci 0000:02:00.0: timed out waiting peer stats info
> [  423.537127] ath10k_pci 0000:02:00.0: wmi command 90113 timeout, restarting hardware
> [  423.537147] ath10k_pci 0000:02:00.0: could not request stats (-11)
> [  423.549132] ath10k_pci 0000:02:00.0: could not request peer stats info: -108
> [  423.559691] ath10k_pci 0000:02:00.0: failed to read hi_board_data address: -16
> [  426.587606] ath10k_pci 0000:02:00.0: failed to receive initialized event from target: 00000000
> [  429.603807] ath10k_pci 0000:02:00.0: failed to receive initialized event from target: 00000000
> [  429.603824] ath10k_pci 0000:02:00.0: failed to wait for target init: -110
> [  429.606647] ath10k_pci 0000:02:00.0: failed to delete WMI vdev 1: -108
> [  429.606657] ath10k_pci 0000:02:00.0: failed to set 2g txpower 46: -108
> [  429.606661] ath10k_pci 0000:02:00.0: failed to setup tx power 23: -108
> [  429.606664] ath10k_pci 0000:02:00.0: failed to recalc tx power: -108
> [  429.606855] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 1 ar-state 2): 5000
> [  429.606898] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 1 ar-state 2): 5000

You need to report this to Ubuntu. We don't support distro kernels, only
vanilla kernel.org releases.

Adding also ath10k list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

