Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC28CD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgTAVdXGUOfciSm2zIUaKstr+vMxZpqwtSXXqpCQ/cI=; b=H71vVFOjAOQdlxlu/xtxlgulTj
	4aNTeu37WifhJQW1+UnYm1aUKVWFA98OqSLa/HA+d8tVP/S5hfuZM3md0qsmaygLUUzxCcopydtRL
	zu8YOX+w8cJszWqMGFY25Ri2K61i9O0rvgGf260OHUdX2CC7nfVXmiPMZ8WuHv853/lRts3Zsdd+C
	GaetEg/gBH1VAV55QumubFD+FRlSETdMdeKCaP5cDKThpBL9+MH74gmYHnzt0XDgbyfX9DJkLgczj
	O8d2Z69Cje/FLnIDL1e2cn90Uw0PjIIf2Bkb5TwsRgd+/Ysji67I8Lomo+Hc81liHrlOtbpjzTuAe
	LUiJzTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs13o-0000000GJoG-0rgK;
	Wed, 03 Apr 2024 13:53:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs13l-0000000GJnl-1ti0;
	Wed, 03 Apr 2024 13:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA04DCE2A9A;
	Wed,  3 Apr 2024 13:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C15C433F1;
	Wed,  3 Apr 2024 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712152425;
	bh=m0lorB2MbPpc2sRbPkYyOS6AnvFCBRgPrepaAMOzzv0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YOic17JM08kzLf6HccVjw0tiON+A4lbyi59R2hAAwcWksGE4hL4QskZ99Ec4ieQLy
	 mQ+6OAGCtxnVIXaOBXRMjXkrFLFoJoy0BrmmDWc41/Z2tLnKK0nUKvRqUvLacufSmW
	 vXgnmo1FsVfofAq7Zfl5lRm0yxpoPs2kb/WGpMI8VUTznZsVpIX48OOtr3aWlW1t9j
	 3qIQUzwDyJUFRzhLJuBniJFjnSxtMGNxasSB5803FWt+k1J/4tGFtaXTdNpHZl9dKB
	 wjN2QHlTeDnJVocdcLi2LXzgfrx2ePZRajTehI4211rdxcvbC3pfc6FraLlELkOA3g
	 11XkAwGd8DwYg==
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
Subject: Re: [PATCH 6/7] wifi: marvell: mwifiex: drop driver owner
 initialization
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
	<20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
Date: Wed, 03 Apr 2024 16:53:39 +0300
In-Reply-To: <20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
	(Krzysztof Kozlowski's message of "Fri, 29 Mar 2024 18:24:36 +0100")
Message-ID: <87frw25z8c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_065349_770162_C542B44E 
X-CRM114-Status: UNSURE (   7.76  )
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

The preferred title format is:

wifi: mwifiex: drop driver owner initialization

But that's just cosmetics. Feel free to take this via sdio tree:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

