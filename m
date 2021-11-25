Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC1C433EF
	for <ath10k@archiver.kernel.org>; Thu, 25 Nov 2021 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsvYDsP3cpIfC5evSvVyotCGStg9B6iO973EgWnvfRA=; b=ZXYjrVTaEYScqa
	oXK5hoxTw0Hn5b3MCgEK6MzhwkFKxcTgSHvoqp+ck4OM1LnBd64KcWJ/FmkK61uRAj4fsow9vlOEA
	Qzhx7dyGfiRyj3PYnAzwBWJLUBxvhfUzdBIW+LjgFozNBgAk8LCW2BecVLDE3q3R5zG2A0fJODt8u
	M9Pcd/ukwfDCGjuimNVX8r97xBvajjF9+GC4QBkaQHTudRNV4OHeVt30C/0Pdgtfw6I5Ltgy0qdSm
	PLXaQtRsxETKQn6zTGAJ5sIowNF5PHFOT4qRI0P3cZWP5W4kasXzBQFdNcURu4qZWXtk0yUj3ZS9x
	ci6htRnmLfihGRkWaDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq9FA-006ap2-OW; Thu, 25 Nov 2021 07:32:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq9F7-006anS-4d
 for ath10k@lists.infradead.org; Thu, 25 Nov 2021 07:32:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id a18so9516818wrn.6
 for <ath10k@lists.infradead.org>; Wed, 24 Nov 2021 23:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=0wumoxdwiC2xVkrh3efLAeW5BPOHPs6sn4vBMFf8av4=;
 b=mktYqABrSZu2kyUYkNFaKFx5QxmJT9/Zr1CKE7CX158MekvmelS+X39CotlLzZVUC4
 f2WoCe1IS6QKuVVHb2iOdjx/nDr9JmLxeKkGnFztB2Th3ukBanmlpxG8QQVOXfLJKvco
 oV3Pv8qD8o8ZxhCbkpIT4+LZlQEJ89Q5R5DPqfvA5WpAo8qXwCCUqQZvuDJc/iqNU1Sp
 kJh4ZSHSGntQzdmK8UBlnuPeSKibmX5ghLQUuO2K2kiXt6nJNxXUsAaX/9VUwgT2xaki
 swmNOS0dm5JtwcnJXKeDNJyh7atFIIuVsvUjiZVE1gNnKF951C0qfVHr3ucjlf+CtLbM
 raQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=0wumoxdwiC2xVkrh3efLAeW5BPOHPs6sn4vBMFf8av4=;
 b=Q+9fT046qLz6TzVYwJ0mAZAZcyfiC17o+NkMpYYK+t0ex5C35ptPouOrWOHDv6myBH
 eG5ubb2EG64m2+hmQfm5s6FYQKASds1Xb9ShoGlKL1Bo2XYZUIkL8Pe56UcxZjWFiaUc
 7ovDVmbdPYLw499euqYFZTxvR4MkrTflvqeO8LsdV1pDeyCcs9iwuWJamXuvEQn8eUQt
 etHJXe9MYD4uBCaRFasTYL8RvF4RzkwU7BD7ii5A13gFEhZRwqIBz08I2jX04RZjQQiI
 N/1qqTd7/PTZMMt5HR7hckgzzWR1yGJwTkDZG9TeBfi4F1UxL/7egL5KKQhcf/Pifuzq
 ompw==
X-Gm-Message-State: AOAM530TKOSBmfhYk2T5Qdph8HRPHIRMI9NngxKbmqsyNYZTSqdZ52K/
 YFZlR3F2HCENW3FGcuT6nKw=
X-Google-Smtp-Source: ABdhPJxpZLAM50YbYXZyY4ctZf7s37K7ojfjrwRe8oqZUQIqUoMNHZjCNJSz0yAAg0q8oxdFB5t2KA==
X-Received: by 2002:adf:dc8c:: with SMTP id r12mr4294940wrj.510.1637825546781; 
 Wed, 24 Nov 2021 23:32:26 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:6832:ca58:d1ea:870e?
 (p200300ea8f1a0f006832ca58d1ea870e.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:6832:ca58:d1ea:870e])
 by smtp.googlemail.com with ESMTPSA id o4sm2414434wry.80.2021.11.24.23.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 23:32:26 -0800 (PST)
Message-ID: <1849b7a3-cdfe-f9dc-e4d1-172e8b1667d2@gmail.com>
Date: Thu, 25 Nov 2021 08:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
 Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, ath10k@lists.infradead.org,
 Stephen Hemminger <stephen@networkplumber.org>
References: <20211124144505.31e15716@hermes.local>
 <20211124164648.43c354f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Bug 215129] New: Linux kernel hangs during power down
In-Reply-To: <20211124164648.43c354f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_233229_221144_0BDBCBC8 
X-CRM114-Status: GOOD (  10.57  )
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

On 25.11.2021 01:46, Jakub Kicinski wrote:
> Adding Kalle and Hainer.
> 
> On Wed, 24 Nov 2021 14:45:05 -0800 Stephen Hemminger wrote:
>> Begin forwarded message:
>>
>> Date: Wed, 24 Nov 2021 21:14:53 +0000
>> From: bugzilla-daemon@bugzilla.kernel.org
>> To: stephen@networkplumber.org
>> Subject: [Bug 215129] New: Linux kernel hangs during power down
>>
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215129
>>
>>             Bug ID: 215129
>>            Summary: Linux kernel hangs during power down
>>            Product: Networking
>>            Version: 2.5
>>     Kernel Version: 5.15
>>           Hardware: All
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: normal
>>           Priority: P1
>>          Component: Other
>>           Assignee: stephen@networkplumber.org
>>           Reporter: martin.stolpe@gmail.com
>>         Regression: No
>>
>> Created attachment 299703
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=299703&action=edit    
>> Kernel log after timeout occured
>>
>> On my system the kernel is waiting for a task during shutdown which doesn't
>> complete.
>>
>> The commit which causes this behavior is:
>> [f32a213765739f2a1db319346799f130a3d08820] ethtool: runtime-resume netdev
>> parent before ethtool ioctl ops
>>
>> This bug causes also that the system gets unresponsive after starting Steam:
>> https://steamcommunity.com/app/221410/discussions/2/3194736442566303600/
>>
> 

I think the reference to ath10k_pci is misleading, Kalle isn't needed here.
The actual issue is a RTNL deadlock in igb_resume(). See log snippet:

Nov 24 18:56:19 MartinsPc kernel:  igb_resume+0xff/0x1e0 [igb 21bf6a00cb1f20e9b0e8434f7f8748a0504e93f8]
Nov 24 18:56:19 MartinsPc kernel:  pci_pm_runtime_resume+0xa7/0xd0
Nov 24 18:56:19 MartinsPc kernel:  ? pci_pm_freeze_noirq+0x110/0x110
Nov 24 18:56:19 MartinsPc kernel:  __rpm_callback+0x41/0x120
Nov 24 18:56:19 MartinsPc kernel:  ? pci_pm_freeze_noirq+0x110/0x110
Nov 24 18:56:19 MartinsPc kernel:  rpm_callback+0x35/0x70
Nov 24 18:56:19 MartinsPc kernel:  rpm_resume+0x567/0x810
Nov 24 18:56:19 MartinsPc kernel:  __pm_runtime_resume+0x4a/0x80
Nov 24 18:56:19 MartinsPc kernel:  dev_ethtool+0xd4/0x2d80

We have at least two places in net core where runtime_resume() is called
under RTNL. This conflicts with the current structure in few Intel drivers
that have something like the following in their resume path.

	rtnl_lock();
	if (!err && netif_running(netdev))
		err = __igb_open(netdev, true);

	if (!err)
		netif_device_attach(netdev);
	rtnl_unlock();

Other drivers don't do this, so it's the question whether it's actually
needed here to take RTNL. Some discussion was started [0], but it ended
w/o tangible result and since then it has been surprisingly quiet.

[0] https://www.spinics.net/lists/netdev/msg736880.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
