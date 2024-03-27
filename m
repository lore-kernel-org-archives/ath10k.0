Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B46C54E67
	for <ath10k@archiver.kernel.org>; Wed, 27 Mar 2024 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHLS+yjkto2+nMleZ8grHPnFghQaTySqd33/PIFTa3E=; b=YpbcTawcsPxNskbi0VF87ybLI8
	YfIeN30oD8kPVMrcih1Qvtcnc7aYb49y1tcnJFs5rA9TYLexHi4lg/JOyan4dhpDWjV14houiM5AH
	yAsRB+UOmsJUbxHTBCu+OnSgnM++DwSr2dVFqdybIdhasTVTpTPoMx59WkliUAAUFhpEgvAy0dvN1
	4KjV+Kj7ict+RaP4Khja65ePu5pgKc0u0IQtYsCp8M7Yf8bDIuGk2DXhgmJY8Ok2izKa8hMf56pRa
	78ivfXGu5zs54rmuo1b0Ckvns4RfMgWp0sJPNKi6urpKCWPaEo+HmFnLCaxYITNNyr31wtBu3Ybmd
	IFz/E2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQG-00000009Wjj-1FCJ;
	Wed, 27 Mar 2024 14:38:36 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUPz-00000009Wad-05w1
	for ath10k@lists.infradead.org;
	Wed, 27 Mar 2024 14:38:32 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515a68d45faso4556609e87.3
        for <ath10k@lists.infradead.org>; Wed, 27 Mar 2024 07:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550288; x=1712155088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHLS+yjkto2+nMleZ8grHPnFghQaTySqd33/PIFTa3E=;
        b=SvyA7eJW9w9nW1uU2ecqyTSee1CbtMAvtiaRHpWBolVcUnSdwVldViWG2CjD69PheB
         x16gnlAJVmoqRi9ZkB9HpuTyN3MZX28bMsr2Sd/l5R/TBFga86WjCEC3O1MdcfHrYLxl
         VE1NXdYxGRcXQh5W1r3ORZabwuc3UAw7zlAWn2ZiPyqJ173Px6/TYBDxy5htuL1jH8Zu
         QAU+Jm2qDMiy2CiXWmqUlgYolqFJbU+gNVFACsbXmv8muAcYjUY3IRbnpIuODA2LoZm/
         X8gXa9thgASLuvD5TDDdLltCqPh0jLYj6m8Q70dU5TZ1V6cwTp0x6FyySDhknIfuZy5R
         cqcw==
X-Forwarded-Encrypted: i=1; AJvYcCWEZ8jO+r9Aou8SczBWEs74ZfJTP6lBm4hu1d2ZP4pAqT2vCYr34F0xWHomSVICFDj8VQUQxsqGPgX5weQ5xTXLpBDMMkBjDbjUaw==
X-Gm-Message-State: AOJu0YwBkg68NLURBpX0JuDXI50xROz2RGv4q4ZxI23J/YjZdfmt/yQF
	vyiTFBtFrIajeurSHngregHvdMWdvXbvbFFk6wW1LIw7C0PxDFNMopM2oZz9
X-Google-Smtp-Source: AGHT+IES0d/otFDGydKDRmqo9wlgMp2zSraYoybu3fR4X81qxCRc+daWncgKBaKZFHeZwGdozoKHlg==
X-Received: by 2002:a05:6512:2e8:b0:515:a417:334 with SMTP id m8-20020a05651202e800b00515a4170334mr1007582lfq.46.1711550288177;
        Wed, 27 Mar 2024 07:38:08 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709067c0200b00a47090964casm2285717ejo.184.2024.03.27.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:38:07 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:38:05 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, keescook@chromium.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <ZgQvTTnMoBn2oG1K@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
 <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
 <20240321072821.59f56757@kernel.org>
 <5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
 <20240321151744.246ce2d0@kernel.org>
 <Zf2ceu2O47lLbKU3@gmail.com>
 <20240322082336.49f110cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322082336.49f110cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073819_170021_8F3EBD98 
X-CRM114-Status: GOOD (  23.19  )
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

Hello Jakub,

On Fri, Mar 22, 2024 at 08:23:36AM -0700, Jakub Kicinski wrote:
> > > Maybe we should add a new helper to "alloc dummy netdev" which can
> > > call alloc_netdev() with right arguments and do necessary init?  
> > 
> > What are the right arguments in this case?
> 
> I'm not sure we have a noop setup() callback today. If you define a
> wrapper to allocate a dummy netdev you can define a new empty function
> next to it and pass that as init? Hope I got the question right.

Thanks for the explanation, it is clear now. I've been working on it,
and this is what I came up with. This is compile-tested by now, and, if
this is what you had in mind, I will do more extensive testing.

  commit db794d99950f68731884a67d911094d94179c522
  Author: Breno Leitao <leitao@debian.org>
  Date:   Wed Mar 27 07:20:03 2024 -0700
  
      net: Create net_device allocator for dummy
      
      Create a helper to allocate and initialize dummy netdevices. This
      function basically simplify the allocation of dummy devices, by
      allocating and initializing it.
      
      Suggested-by: Jakub Kicinski <kuba@kernel.org>
      Signed-off-by: Breno Leitao <leitao@debian.org>
  
  diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
  index 643d2b469c49..9d1a5383c23f 100644
  --- a/include/linux/netdevice.h
  +++ b/include/linux/netdevice.h
  @@ -4546,6 +4546,9 @@ static inline void netif_addr_unlock_bh(struct net_device *dev)
   
   void ether_setup(struct net_device *dev);
   
  +/* Allocate dummy net_device */
  +struct net_device *alloc_netdev_dummy(int sizeof_priv, const char *name);
  +
   /* Support for loadable net-drivers */
   struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
   				    unsigned char name_assign_type,
  diff --git a/net/core/dev.c b/net/core/dev.c
  index a08d698fe45c..628f35c3cfa2 100644
  --- a/net/core/dev.c
  +++ b/net/core/dev.c
  @@ -10998,6 +10998,13 @@ void free_netdev(struct net_device *dev)
   }
   EXPORT_SYMBOL(free_netdev);
   
  +struct net_device *alloc_netdev_dummy(int sizeof_priv, const char *name)
  +{
  +	return alloc_netdev(sizeof_priv, name, NET_NAME_UNKNOWN,
  +			    init_dummy_netdev_core);
  +}
  +EXPORT_SYMBOL_GPL(alloc_netdev_dummy);
  +
   /**
    *	synchronize_net -  Synchronize with packet receive processing
    *
  
  commit 35500cd6a5db0bbdedbc1067758948769c7ce57e
  Author: Breno Leitao <leitao@debian.org>
  Date:   Wed Mar 27 07:07:40 2024 -0700
  
      net: Split init_dummy_netdev
      
      It is impossible to use init_dummy_netdev together with alloc_netdev()
      as the 'setup' argument.
      
      This is because alloc_netdev() initializes some fields in the net_device
      structure, and later init_dummy_netdev() memzero them all. This casues
      some problems as reported here:
      
              https://lore.kernel.org/all/20240322082336.49f110cc@kernel.org/
      
      Split the function in two. Create a new function called
      init_dummy_netdev_core() that does not memset the net_device structure.
      Then have init_dummy_netdev() memseting and calling
      init_dummy_netdev_core().
      
      init_dummy_netdev_core() will be the function that could be called as
      an argument for alloc_netdev().
      
      Signed-off-by: Breno Leitao <leitao@debian.org>
  
  diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
  index c6f6ac779b34..643d2b469c49 100644
  --- a/include/linux/netdevice.h
  +++ b/include/linux/netdevice.h
  @@ -3119,6 +3119,7 @@ int netdev_refcnt_read(const struct net_device *dev);
   void free_netdev(struct net_device *dev);
   void netdev_freemem(struct net_device *dev);
   void init_dummy_netdev(struct net_device *dev);
  +void init_dummy_netdev_core(struct net_device *dev);
   
   struct net_device *netdev_get_xmit_slave(struct net_device *dev,
   					 struct sk_buff *skb,
  diff --git a/net/core/dev.c b/net/core/dev.c
  index 0766a245816b..a08d698fe45c 100644
  --- a/net/core/dev.c
  +++ b/net/core/dev.c
  @@ -10340,25 +10340,11 @@ int register_netdevice(struct net_device *dev)
   }
   EXPORT_SYMBOL(register_netdevice);
   
  -/**
  - *	init_dummy_netdev	- init a dummy network device for NAPI
  - *	@dev: device to init
  - *
  - *	This takes a network device structure and initialize the minimum
  - *	amount of fields so it can be used to schedule NAPI polls without
  - *	registering a full blown interface. This is to be used by drivers
  - *	that need to tie several hardware interfaces to a single NAPI
  - *	poll scheduler due to HW limitations.
  +/* Same as init_dummy_netdev, but, basically do not call memset.
  + * This is useful if you are calling this function after alloc_netdev()
    */
  -void init_dummy_netdev(struct net_device *dev)
  +void init_dummy_netdev_core(struct net_device *dev)
   {
  -	/* Clear everything. Note we don't initialize spinlocks
  -	 * are they aren't supposed to be taken by any of the
  -	 * NAPI code and this dummy netdev is supposed to be
  -	 * only ever used for NAPI polls
  -	 */
  -	memset(dev, 0, sizeof(struct net_device));
  -
   	/* make sure we BUG if trying to hit standard
   	 * register/unregister code path
   	 */
  @@ -10379,8 +10365,29 @@ void init_dummy_netdev(struct net_device *dev)
   	 * its refcount.
   	 */
   }
  -EXPORT_SYMBOL_GPL(init_dummy_netdev);
  +EXPORT_SYMBOL_GPL(init_dummy_netdev_core);
   
  +/**
  + *	init_dummy_netdev	- init a dummy network device for NAPI
  + *	@dev: device to init
  + *
  + *	This takes a network device structure and initialize the minimum
  + *	amount of fields so it can be used to schedule NAPI polls without
  + *	registering a full blown interface. This is to be used by drivers
  + *	that need to tie several hardware interfaces to a single NAPI
  + *	poll scheduler due to HW limitations.
  + */
  +void init_dummy_netdev(struct net_device *dev)
  +{
  +	/* Clear everything. Note we don't initialize spinlocks
  +	 * are they aren't supposed to be taken by any of the
  +	 * NAPI code and this dummy netdev is supposed to be
  +	 * only ever used for NAPI polls
  +	 */
  +	memset(dev, 0, sizeof(struct net_device));
  +	init_dummy_netdev_core(dev);
  +}
  +EXPORT_SYMBOL_GPL(init_dummy_netdev);
   
   /**
    *	register_netdev	- register a network device
  

