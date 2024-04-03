Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A14CD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1mLLJelfE/1ZCr4RmUgYaG7UyB0RYak5vHMrZNjTRc=; b=girnpIcWBVc11Z4vVpvu7xCM1A
	qbpZsdE7YxOhvuLw8cWKRr9B4p5Jku0WWiE+GbuniLNGaC//GQuAhqciQ3FvlheZrpD0Lk7No+yMd
	Wo0kaKzo47wQPI83VGMXJJHcsR5T6Nz4K+V6cd52GhEpFCcMrXwWVgc4l74DJazHtqwjyC+TdoQEp
	yEvuQNaVKtex1qRr79Z32Dncf4SU2elIq6Yq6e2SXujabMbrZs8g81LdS7TRprg2Qxqf9aP1qBu9g
	LXkNZrmcXazw37Ko6nVk1jMRldQ9AoQVCPPkAdX9AjnWCsOiufEFqf1tQFKJJYliuR22chhzuv3mw
	vA38RhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs14l-0000000GK9a-46G6;
	Wed, 03 Apr 2024 13:54:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs14k-0000000GK7v-0DJw;
	Wed, 03 Apr 2024 13:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/1mLLJelfE/1ZCr4RmUgYaG7UyB0RYak5vHMrZNjTRc=; b=Jb4Hr4WY/OKhRLi8tftgy8WMHu
	EvVuFpcf4kjchHCw4cGZ9bTJwuZ9i7D1aAMGNYriotL+ULSapjOU3QpPFfP4nYKFzWqyRZNh7pYsC
	WPIXigfug9P3VhaC8nIbM5j95f4KCjATAmWXaMdY1VPDc0exba2g4PqygnQuD2WlJgec6/2af1ae2
	busIip0C5Shvp6tUzfxVjOIObruiRJbbnMDnrYirXvbZPrYbXjJNxhh/2cZrbagiua8KbKTXqRDar
	Ui/ogfUMGvfyQpVS0b+31nbIopCDYLjMLb3O+3ZyoDLF2VBfpTO3VHlmmMgvxVu8OMoxHPk9bGzO7
	6xiCMZvw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs14g-00000004FXb-26Vt;
	Wed, 03 Apr 2024 13:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21AB8612ED;
	Wed,  3 Apr 2024 13:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA13C433F1;
	Wed,  3 Apr 2024 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712152478;
	bh=jmLir6yT+gXZwNc/mLtJCMF1x5e9R+cRof8vBe2L93U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RoXYoA8Xu3bK3fwacMxAUk55arZBbe8CSE0xL8PSkJ3LC07/XU2PHh7+AuCstnLfx
	 famW8CIYt4jydEYRZEIDzw/p+FKjZ1OC0Yf9Ec/RARno3Hd8gtQpMg6qk6BEaqgRU5
	 JYn5naQopH64LRTGh38PCKogDX3Tlrn3mUba3VN5gumRdikAVYysrxIuoLMzw0jpUn
	 ZvfXILkBp0Gy1QUrz2abtzArDjNIj1lFdzrXMiIkDad3NjCTSavW47yLDU6I4XCytm
	 IyjaH1bqtzpgymZkv/OAfQ9G7IGV1RSifehVdAZXCgN47lyU6ER91FKgy583Mp3NDG
	 V5uyp0DpLwGmw==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,  Marcel Holtmann
 <marcel@holtmann.org>,  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Arend van Spriel <arend.vanspriel@broadcom.com>,
  Brian Norris <briannorris@chromium.org>,  =?utf-8?B?SsOpcsO0bWU=?=
 Pouiller
 <jerome.pouiller@silabs.com>,  linux-mmc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-bluetooth@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  brcm80211@lists.linux.dev,
  brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH 7/7] wifi: silabs: wfx: drop driver owner initialization
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
	<20240329-module-owner-sdio-v1-7-e4010b11ccaa@linaro.org>
Date: Wed, 03 Apr 2024 16:54:33 +0300
In-Reply-To: <20240329-module-owner-sdio-v1-7-e4010b11ccaa@linaro.org>
	(Krzysztof Kozlowski's message of "Fri, 29 Mar 2024 18:24:37 +0100")
Message-ID: <87bk6q5z6u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_145446_691609_6A19FEDB 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Core in sdio_register_driver() already sets the .owner, so driver does
> not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Also here the preferred title format is:

wifi: wfx: drop driver owner initialization

Feel free to take this via sdio tree:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

