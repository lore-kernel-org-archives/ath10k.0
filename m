Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55565C47DD9
	for <ath10k@archiver.kernel.org>; Wed, 27 Mar 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umCFANJ3vs+WOKOw7HufdXJ/lCLwlG1wjS8wimtj5UE=; b=yNWKQSAm7J5+9zbD0JbuRD/urR
	YcpYnOQGXCUflrRDLDkbT2RJ1cAVyUIa3sgnPuXAdYVFH5YAPDyw3WnSHgAIgyv2YPqp1vrCwDEQc
	ICDlpZKSc5zXUi8M8FVIKVVENCDaN5fJ7cKipHNCchnxWtnLLFLuejdAIp0Wtss2kfsOnR2Z6hyC8
	NmLpQpmLoe5WCDOBE//lImop+ATSMl485HCSgrkC6wD1iH9QVp7BO34Qlriwh6LeaCQHCZgUExzXq
	uZn4Vy7SF9sZUiQPMAudkvAY4KLISvs0cOyTaxpxaRW5bKudBLg81JrGxO0Sp0nIeZTBTggWcU4dL
	sI7tTJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUWy-00000009ZYG-209o;
	Wed, 27 Mar 2024 14:45:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUWo-00000009ZSz-0a9v
	for ath10k@lists.infradead.org;
	Wed, 27 Mar 2024 14:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EEF61CE26C2;
	Wed, 27 Mar 2024 14:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B393CC433C7;
	Wed, 27 Mar 2024 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711550718;
	bh=8DwuZaB/v3gjqMP4ZlY0VgdKvdFBfDihBASZIQ2fe/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VGNJNTSEWJNtgs2Hu+M47Xgcqo+VVmjftP3nd/F+C8sRcppBMoJhDWhicoq7pfFOP
	 7S3n/Vx2oHlntat9lLQaNy5iD7AVptqUIZrfY5ejpBq7CnLaFI7lXzIBvfwpQyt1G/
	 QO+HSeuPK/ruT03yWMoUs5mAeNRAHjp+QMWinaYGEqubEXvoJBQ3L/Zya9BS2/aUhS
	 4e6aD9fltwq6wKYJFfNlF4V57xqjJ5tge3uoCKDtBeXU6zIastxUeUGPWEO1JO/qQq
	 6HnJR7p3L2+bhfn6bhHGPZDu8Z8GrvONszFZ+wCvHIjUnOPQmxWMdyzjjkne1m5VHV
	 g90OrfmDS/Htw==
Date: Wed, 27 Mar 2024 07:45:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, keescook@chromium.org, "open
 list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <20240327074516.624b7ecf@kernel.org>
In-Reply-To: <ZgQvTTnMoBn2oG1K@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
	<20240321072821.59f56757@kernel.org>
	<5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
	<20240321151744.246ce2d0@kernel.org>
	<Zf2ceu2O47lLbKU3@gmail.com>
	<20240322082336.49f110cc@kernel.org>
	<ZgQvTTnMoBn2oG1K@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_074522_637330_28F2463D 
X-CRM114-Status: UNSURE (   4.11  )
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

On Wed, 27 Mar 2024 07:38:05 -0700 Breno Leitao wrote:
>   -void init_dummy_netdev(struct net_device *dev)
>   +void init_dummy_netdev_core(struct net_device *dev)

Can init_dummy_netdev_core() be a static function (and no export)?
alloc_netdev_dummy() is probably going to be the only user.

I'd also lean towards squashing the two commits into one.

