Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34BEC2BD09
	for <ath10k@archiver.kernel.org>; Fri, 12 Jul 2024 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AkdKHKm/TFTtDmbppb/k1qYEcMnKiahnVrBBOEVc9Pk=; b=GZ8eoMcyqhO6KMrEjSLcJLPmJs
	vw09QiVkWuysf63rcTAS1tBCAaYnLOOnozTc0/Mqsd0f+xqyb9XntAa1UpuzJsScS4juIGnwmwJzw
	qCfBz7bE/7CDMxj5sWu3a1v+CgYvc3zi7DnvCWeVmubROSzpKq+/JdM6LXbye4bFB/jed1yoiauZj
	SNYpXzkL0AyQPQDDuVnVLYZ6pC42PZl/beddU2SMxl0MNQsLp0ngC33L6NN9CRYXq3fEJPSaicREM
	h2TcImjWkzakuNn9sl+Fl1zDFqrLxStnPOoaJtchvGM07OJckdfyWlH/jfQWEHtfQF/UffSf6xVJ/
	7ShCUVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSG48-00000000625-2dzD;
	Fri, 12 Jul 2024 13:12:00 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSG45-0000000061X-2j6q
	for ath10k@lists.infradead.org;
	Fri, 12 Jul 2024 13:11:59 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6b5e0d881a1so23322446d6.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jul 2024 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720789916; x=1721394716; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkdKHKm/TFTtDmbppb/k1qYEcMnKiahnVrBBOEVc9Pk=;
        b=T+ljrakKX9bxKRFzslDOvADHKRcEl7T+WNVBDDcFfOiLHlOkb68o5NnRvgyZJNdUcV
         nIAnpzmqvWEzmNzqMD3RYHDrkJGMu9+86KV91PefE+sHfVbT54KlnFikd/UPy69fM3gk
         ubwWUfyjnoNlE3b0PdsrJP++ErdGX0ZWYmhgrZDunK/wze8CthxisMS2KFcZ7FtPJ7XG
         AMjpWl4hk3683DE5c02IOgNuoPVEq8Xndx3O6mej7/EPOb0xWbtwyVTAGSvZOF0eErbm
         wEeWwkcsPJKgIaGUaqEWt5JZg3BMzX5/w/DmShj1wvtpTjmI6SvqFOMyLoeMd8T9F0lQ
         hcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789916; x=1721394716;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AkdKHKm/TFTtDmbppb/k1qYEcMnKiahnVrBBOEVc9Pk=;
        b=uPYZ0GL5mikhKkgIRO/SJxs61PQ0I608qiNPAakRnyG+xlx9cx23j7BmgRuk3bMvrl
         LV5MR9G3TlBuMIwqfkXt542aLYcGTvW6RzwUc0E5n+tiqva3CQHlGEdM9e95+E+fMFSE
         i2k7MjxEOE6k7r/HUftCRg0jJR03lQWy9eoNNEIS4Y9RzFT12uIuS3nsKx3N3MaZC+QX
         k3cixvaZUwuwR52Q4kX5EBr6R62ElU1vs9btl6e93XH7Wzp7uycdWWVAVXm7HSt6AD2c
         XSHEDBps9WIEuaZBfclerBLnyMwkO6TMP+nZYpyxhLZcTQp4bWa5xE4Fl8kpdcc4DsHr
         RJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVLkn1S6WMnmARMQli4OCoBqVm6sfyGYGultEOfGQTKMQzhuA6v9WKnqVwl1g2LuclUcav7rxfcJH4fOS7G5fEY1OrZloNLkYVBfA==
X-Gm-Message-State: AOJu0YwQZLxDnSdqMc+2DIA+HjnCvD+YZkx/xVvSQF6BPgdPrlqoP28Y
	Sxv0iWxR8k+AnF89Lch0+J7/8EBbDsasjuseUUIuhrc/uCBLtokD
X-Google-Smtp-Source: AGHT+IED307hHiYmeEMqrcIph10nnRSAtmRhbG2CzZsWy9UG6Rr4DImK/4iTZu3mKhjEluoGCu2Frg==
X-Received: by 2002:a05:6214:2a47:b0:6b5:3621:cfde with SMTP id 6a1803df08f44-6b754c33341mr47044466d6.0.1720789915749;
        Fri, 12 Jul 2024 06:11:55 -0700 (PDT)
Received: from [10.102.4.159] ([50.78.19.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61b9fd3acsm35344876d6.56.2024.07.12.06.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:11:53 -0700 (PDT)
Message-ID: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
Date: Fri, 12 Jul 2024 06:11:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
From: James Prestwood <prestwoj@gmail.com>
Subject: ath10k "failed to install key for vdev 0 peer <mac>: -110"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_061157_711033_D3D955F3 
X-CRM114-Status: GOOD (  12.52  )
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

Hi,

I've seen this error mentioned on random forum posts, but its always 
associated with a kernel crash/warning or some very obvious negative 
behavior. I've noticed this occasionally and at one location very 
frequently during FT roaming, specifically just after CMD_ASSOCIATE is 
issued. For our company run networks I'm not seeing any negative 
behavior apart from a 3 second delay in sending the re-association frame 
since the kernel waits for this timeout. But we have some networks our 
clients run on that we do not own (different vendor), and we are seeing 
association timeouts after this error occurs and in some cases the AP is 
sending a deauthentication with reason code 8 instead of replying with a 
reassociation reply and an error status, which is quite odd.

We are chasing down this with the vendor of these APs as well, but the 
behavior always happens after we see this key removal failure/timeout on 
the client side. So it would appear there is potentially a problem on 
both the client and AP. My guess is _something_ about the re-association 
frame changes when this error is encountered, but I cannot see how that 
would be the case. We are working to get PCAPs now, but its through a 
3rd party, so that timing is out of my control.

 From the kernel code this error would appear innocuous, the old key is 
failing to be removed but it gets immediately replaced by the new key. 
And we don't see that addition failing. Am I understanding that logic 
correctly? I.e. this logic:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503

Below are a few kernel logs of the issue happening, some with the deauth 
being sent by the AP, some with just timeouts:

--- No deauth frame sent, just association timeouts after the error ---

Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new 
assoc to <new BSS>
Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key 
for vdev 0 peer <previous BSS>: -110
Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) 
from hardware (-110)
Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
Jul 11 00:05:36 kernel: wlan0: authenticated
Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 
status=0 aid=16)
Jul 11 00:05:36 kernel: wlan0: associated

--- Deauth frame sent amidst the association timeouts ---

Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new 
assoc to <new BSS>
Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key 
for vdev 0 peer <previous BSS>: -110
Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) 
from hardware (-110)
Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while 
associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
Jul 11 00:43:24 kernel: wlan0: authenticated
Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 
status=0 aid=101)
Jul 11 00:43:24 kernel: wlan0: associated


