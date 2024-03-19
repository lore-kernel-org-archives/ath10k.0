Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B0C6FD1F
	for <ath10k@archiver.kernel.org>; Tue, 19 Mar 2024 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmXgZZ6GaxcwZLA1WFIg0B/+xgHaSvLSd69ytRYOKx4=; b=qv9qM+a9i2Xm+E8vEhNWYUDSkn
	48OEx12T7ZWfvUNAeJUcMJNVWs/OXSMEsHS4RpdtScRNlDz0fbcwQJpc9HhYPvY1GdTFkIytVSanu
	RBVc1GfGaUpxxPhE3/1DXl9Hzt7Zp/U4yMtX5sJY1w8PaOaDxNZYAX8fDl4bZClnUgYJu/jVCeuxI
	kWFjZ6Ll02fc9ddn7OpwclIjp2O3FEgSaozBnf0Es1qHnD2gkqrIcjTA6vHsNhMeIKoF8PurcvfJs
	/ehCOFoIVZmKzIhcb+mAx4rW9lkeBi0zgs+NslNHu1fZmYMMdh/wGItWsai5kN7Yyp1BNcodfHj3H
	ohm5IKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmd3m-0000000DZ6O-1v8L;
	Tue, 19 Mar 2024 17:15:34 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmd3j-0000000DZ55-1qIu
	for ath10k@lists.infradead.org;
	Tue, 19 Mar 2024 17:15:32 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56890b533aaso6613397a12.3
        for <ath10k@lists.infradead.org>; Tue, 19 Mar 2024 10:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710868528; x=1711473328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmXgZZ6GaxcwZLA1WFIg0B/+xgHaSvLSd69ytRYOKx4=;
        b=Cwq8M69Gq0muls3VP+ks7z8mBNdLz8qgPKbehv6ekSbUYMHkUGLdt8eEXZjZFTryVt
         I5Mrd8x8ZewonMl+cFICOZjkfCIRC3k3XFx/4ytCLnQo6MvTexsJfpg+F9tTaRcTHL8r
         2OmqTp+T+kfmdbLg95QFvcEmc793iLHn6LJlf+bMS0KlrhR/yN7f7DSDnC/QorzSy8AA
         jMtAmcdBKaxf5qx8s2A3sQjVK+254QTJeYVpTWh1L4d4Da5eWFX1bwUXuV+wVORk9TX7
         kdMa1ZUQ1AloZBVQKXe5C4c6jItNbsKzwiQWCAzoHvvUx9iEpp9ZHrYe7CrrmeJRDgrV
         4o1g==
X-Forwarded-Encrypted: i=1; AJvYcCXaisZRrLbrk0W3OL3f6X1iLI7B7Rb+uqWxXqmxTCoWjCqmkWCAab6IO2eqiY4Q3rqzoRc74GgyCmBE+ncJPztZHB5ruL9tXoBkHA==
X-Gm-Message-State: AOJu0YxtF5MMcptBsofCiJUem8c7p815yXG9JrtLquCX6DHs9OljBGbR
	g+DxHLlth2ZtNRI+7AVZtXihN6euueqkDn9s94U7lRyaJRHpAxDs
X-Google-Smtp-Source: AGHT+IFm+ZPcuLTEBvsUGrK5gK3tb7P/G5UH9t7dK0EWm87J9RHQQ6XGn0irQ9hNFMsqFrQ7wzLo4g==
X-Received: by 2002:a05:6402:31bb:b0:564:7921:37c3 with SMTP id dj27-20020a05640231bb00b00564792137c3mr1836242edb.19.1710868527534;
        Tue, 19 Mar 2024 10:15:27 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id cb4-20020a0564020b6400b005663b0d7243sm5996664edb.83.2024.03.19.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 10:15:27 -0700 (PDT)
Date: Tue, 19 Mar 2024 10:15:25 -0700
From: Breno Leitao <leitao@debian.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	kuba@kernel.org, keescook@chromium.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <ZfnILSPBiqk8JdJ4@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
 <8771e856-3d9f-41c6-88c8-3c75e77b2aab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8771e856-3d9f-41c6-88c8-3c75e77b2aab@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_101531_701138_1E30D4AE 
X-CRM114-Status: GOOD (  11.46  )
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

On Tue, Mar 19, 2024 at 09:05:24AM -0700, Jeff Johnson wrote:
> On 3/19/2024 3:47 AM, Breno Leitao wrote:
> > @@ -3687,6 +3690,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
> >  
> >  err_free_coredump:
> >  	ath10k_coredump_destroy(ar);
> > +err_free_netdev:
> > +	free_netdev(ar->napi_dev);
> >  err_free_tx_complete:
> >  	destroy_workqueue(ar->workqueue_tx_complete);
> >  err_free_aux_wq:
> > @@ -3708,6 +3713,7 @@ void ath10k_core_destroy(struct ath10k *ar)
> >  
> >  	destroy_workqueue(ar->workqueue_tx_complete);
> >  
> > +	free_netdev(ar->napi_dev);
> >  	ath10k_debug_destroy(ar);
> >  	ath10k_coredump_destroy(ar);
> >  	ath10k_htt_tx_destroy(&ar->htt);
> 
> looks like there is a pre-existing issue that the order of operations in
> _destroy() doesn't match the order of operations in the _create() error path.

Right. I found it weird as well. Basically "ath10k_coredump" and
"ath10k_debug" operations are swapped between ath10k_core_create() and
ath10k_core_destroy().

If you wish, I can submit a patch ordering it properly.

> but the placement of your changes looks ok to me

Right. It is done in-between the workqueues and the coredump/debug
creation/destroy.

Thanks for the review.

