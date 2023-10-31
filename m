Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F2CC4332F
	for <ath10k@archiver.kernel.org>; Tue, 31 Oct 2023 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou6EATBNdZjc9oMcPWEAec4WfRiMm+uYuXs9T9AGJ+4=; b=2+NXBr947wUgiE
	B69xFfTTEJOprfa2Vvye9cPjhj/f8Lzx2SNL3iYu26Y2Hjg08ev+9DY3XsJxiEFxiQ6LBoniexKys
	1qCLoyVUERULQDO4KvEBEf0y0jgzd83C+0LCzujJYv7xwsAokQ1nVQkXCqHO0xVB3tuFcHRZuBh2N
	FxQnQrLfuUdyE9iPU+G4m61h7TL5Kr8gk+0gfr7bBnp5j81nmBr6pTTi9wUfficMc652YQ4bte3Ou
	theW4JgKHL2VHgUXTBaOytn3U7yV9vbeJjNoE6gtPMhZe14wzzkFG5Yw07h29/6MNwVYk6cM8ZAr0
	bHTREDy3Wzdw+LRuAR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjSO-004iR1-2R;
	Tue, 31 Oct 2023 07:46:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjSL-004iQN-1C
	for ath10k@lists.infradead.org;
	Tue, 31 Oct 2023 07:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F09A60D54;
	Tue, 31 Oct 2023 07:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F32C433C7;
	Tue, 31 Oct 2023 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698738392;
	bh=g2XziSccx+MTDgQb4k51PyXlsNg5Uj2V1xR5ZbJYWag=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WGcrOe5ObTvGcRZ6pX6hkz+aPhA7kHHm0mt4/hIdYnyiW2UVQ/9FZqh3qiSEr1J7F
	 zGxm8fgALAca4sN4K4RV3P367XQeqTSHIYgGYCwB91RArrx76cGmP5dAC1S2rCldW9
	 9OtRU/CNsRDOqPUcqb7jwOheo7yDrvhAWQ0wkbpH6l6j7pmQEB4DNaDWa4VbH9xf8w
	 OhbK4idB2x5uuiZSnjtu8b0BDBBjlHnO7B8p9isuy5AfUFmFiqmnnX6HOZg3Nc7dmK
	 AluiO7zIYnKFcBxAVYHwJk2xMDIOy9Zv1P7UvzeZzWLa76iOoeeLWt14dPsNWBiSAZ
	 WZ0IwQibD8GkA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath10k: replace deprecated strncpy with memcpy
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
References: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169873838825.2137176.1962660661621825377.kvalo@kernel.org>
Date: Tue, 31 Oct 2023 07:46:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_004633_455150_4D440B16 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Justin Stitt <justinstitt@google.com> wrote:

> strncpy() is deprecated [1] and we should prefer less ambiguous
> interfaces.
> 
> In this case, arvif->u.ap.ssid has its length maintained by
> arvif->u.ap.ssid_len which indicates it may not need to be
> NUL-terminated. Make this explicit with __nonstring and use a plain old
> memcpy.
> 
> This is also consistent with future copies into arvif->u.ap.ssid:
> 
>         if (changed & BSS_CHANGED_SSID &&
>             vif->type == NL80211_IFTYPE_AP) {
>                 arvif->u.ap.ssid_len = vif->cfg.ssid_len;
>                 if (vif->cfg.ssid_len)
>                         memcpy(arvif->u.ap.ssid, vif->cfg.ssid,
>                                vif->cfg.ssid_len);
>                 arvif->u.ap.hidden_ssid = info->hidden_ssid;
>         }
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ac2f43d3d34e wifi: ath10k: replace deprecated strncpy with memcpy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
