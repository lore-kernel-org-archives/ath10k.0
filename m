Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B4C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bLQ7DFBgxbMxDjvYWNP8XEjt+7+EJYhkC4hdPmoZ5I=; b=UtIhqHhPJlqWpIDWhqXDy+AqVg
	gaxo3KIDYZ2zKMTfj6luppn/n2/DLxhGPOIZBFGlGtNt3+BvPTquybQ5M7WUwA1Npvl/Uz80Ajj+n
	NuxUD8U3HXnFhPFwbbnCGcVCySar67HmdCQukHqV87V6d1AwjxYxeD2L9l4bWYKb7syeSTkp2WIVb
	HkqKLQh/Xx6T7l6GqhBNpg4UeudBwyKzukMS0DISq5e+6FHFxJ2kzfiz+xVsGM1DBW4Iom4aLiK0s
	NleCGlmhYy8SAj5UOjwre28qvo56U1Ceo/yVolS1/3V/vSYcrsouNy3f0+LJkzdxIbHxPMpSVgELz
	Cmlw5ECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUfP-00Fnko-0W;
	Wed, 13 Dec 2023 19:13:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUfM-00FnjZ-2B
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:13:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d06819a9cbso43278615ad.1
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494785; x=1703099585; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bLQ7DFBgxbMxDjvYWNP8XEjt+7+EJYhkC4hdPmoZ5I=;
        b=b6F1SE0dyCzvhZiRnA70mxqMjfPo/M/c/NO/TGg99EzTpBrop1CElB1PH3TMzOqnAY
         HsY/NwEyK6ZS3qnxVNgQWuDEquSZN7+q31tcs+T+pDO0cLYCzWOmd0woSfKWm1bSed7x
         o+j17LLuRQPjgGrAVm8yM382XEmPO8Y835HMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494785; x=1703099585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bLQ7DFBgxbMxDjvYWNP8XEjt+7+EJYhkC4hdPmoZ5I=;
        b=ZPkTMjE2O6avTo5fDsy2l2HUmNsn3EoYwl1zTPLoJSkmLY0u+Pr2NX+u05lHLaIySx
         VY78OTpwHweBvbpg9DERvNsJE+njbSxFNsKcF4eUKXR74GW/xd+euGq+fQNy3vPrqbwB
         QM1BOfL32o2wm+J39LE0HyrmLLZwCqJT77bCj0cyqurxpRLcqBYZP6tKHuW02KzBaZRf
         I78gj7Z/wlS4h4E3W6imUNTQrB+JZZ1UnOzmoYeDgB6www3bHWvwCuB0DN1I6dCb5cFU
         NtMI/fu9jPo49vvoUSRZuzAnes0ESLCg02VIM8GJ97EkhVvH+/8VkiJajlfyVImcwXzb
         0aWw==
X-Gm-Message-State: AOJu0YyDeDoZ8jD21rhTo0xp+8NZpSZm16nWV2otcINn1qFbdRTLTZWd
	y6om5by7BO2gReLPEzT8hgoZBQ==
X-Google-Smtp-Source: AGHT+IGL9MMpLeGyfBggOyjFOzc4MaMEeL6K7oxPe7D1N49hFYuaaCuEaNAiBmxymSDR4jyxBsYqmA==
X-Received: by 2002:a17:902:704c:b0:1d0:6ffd:ae22 with SMTP id h12-20020a170902704c00b001d06ffdae22mr4435835plt.137.1702494784997;
        Wed, 13 Dec 2023 11:13:04 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001d3485656afsm822977pld.183.2023.12.13.11.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:13:04 -0800 (PST)
Date: Wed, 13 Dec 2023 11:13:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] wifi: ath10k: use flexible array in struct
 wmi_tdls_peer_capabilities
Message-ID: <202312131112.F4A76DD3C@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-5-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-5-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111308_712448_79810766 
X-CRM114-Status: GOOD (  14.66  )
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

On Wed, Dec 13, 2023 at 09:06:43AM -0800, Jeff Johnson wrote:
> Currently struct wmi_tdls_peer_capabilities defines:
> 	struct wmi_channel peer_chan_list[1];
> 
> Per the guidance in [1] this should be a flexible array, and at one
> point Gustavo was trying to fix this [2], but had questions about the
> correct behavior when the associated peer_chan_len is 0.
> 
> I have been unable to determine if firmware requires that at least one
> record be present even if peer_chan_len is 0. But since that is the
> current behavior, follow the example from [3] and replace the
> one-element array with a union that contains both a flexible array and
> a single instance of the array element. This results in a struct that
> has the same footprint as the original, so no other driver changes are
> required.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> [2] https://lore.kernel.org/linux-wireless/626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com/
> [3] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Again, good to keep the struct the same size.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

