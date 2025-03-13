Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42360C282DE
	for <ath10k@archiver.kernel.org>; Thu, 13 Mar 2025 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zG+/el2dfOqyHNdk5GBZ8dqZp7cxAL1w7Fg44Y7tCBs=; b=w5WeniRQsYlzCI2Yo/+QJQWxdn
	VSY6hVK/JU/pTod5nHmYQQIr20A42yBvlyDjwSEx45ajNMsIhdiM+J7jvzxtAzICodONrHEAglQxR
	Yo3LOItECQJN3DFzWTm8kWlRPwW4CQWIv7tNkeIRr/+ucV/zmV4u/9SM3Jpdr56kVGDbHY28EI8uH
	1XJuU4RXlAOKpYTtkHlgmOnqZwHtxPyigOHF7inharTTVlsWL2djC2hcJmK562yPBK612p0ndXvbu
	nXc0SgKtHw+PKuxZ0ceduqQW2+8oFjXLx80Aw9/6hYP7q0ilWvbdaQFXrzKeRm/qMtn8xwxpJd4rz
	ibOFOl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsij6-0000000BOqI-22HL;
	Thu, 13 Mar 2025 13:35:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshkV-0000000BFew-0rTO
	for ath10k@bombadil.infradead.org;
	Thu, 13 Mar 2025 12:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zG+/el2dfOqyHNdk5GBZ8dqZp7cxAL1w7Fg44Y7tCBs=; b=Am+7FUhgtJrGcHxOHPXGwLCEC0
	iz7qCRhX6k79mPPACqrQLIEkm+/2uhMZ5WwhqxzmhS7XMZWAzSHNUkpkrdx3CnSz4mDIfXyxhqspa
	VGhnP5McY6jSZEJ6zbgjPjv75lhF5th3Xk9YSJGAv89Y/xLYFEVM91eKNkRVe/ks8rGhM4pbUSFh8
	Yz8IqNZxpbffCQhekJ/+V3zQmrPGkUABuvcko/uXyhS2b1w2gH1yXkDpT6gc8YjyL0DbTsZ8xwj5k
	ZOvSzulftSgNPUxrNfKLHmFrlanWXzftG1i8twKv9cXpi8ummfx9MH5vvjdivoMIYEKvOoyudyCzi
	SeaCjFaQ==;
Received: from mailout4.zih.tu-dresden.de ([141.30.67.75])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshkR-00000002bqa-3URL
	for ath10k@lists.infradead.org;
	Thu, 13 Mar 2025 12:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mailbox.tu-dresden.de; s=dkim2022; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zG+/el2dfOqyHNdk5GBZ8dqZp7cxAL1w7Fg44Y7tCBs=; b=JNuHKmYv9N9CjTQL0Kxs5JQfb9
	2P4RAhgSyZvP4J+Mvg9iXQg535Ld7aTYERFN5YO/tn77f6omGqiclQbeNoOnV5Dn7BNrmz8Ew1lLc
	7XLT1H3uV8peCPfeSX6FVN1hkgykjdCGLoVGCZtqtWjROKItHCVvDeeXy6Lran2WLhmb6NV/X6riM
	HLVDWM1oQA9ZnDJjnjoP5ed+AFtWXmjaRi3WAeZG9BdlRB4tU2mSQ5Tya1C4iO02cefcD2XYapM9Y
	1wPZdw71je9QffLH7LknrTEnOUjP4T9ZgH9V+FS+PsgIfM7ggAz+TgogK/raBFy/tYxARknTiHw4w
	QWflMcAQ==;
Received: from [172.26.35.139] (helo=msx.tu-dresden.de)
	by mailout4.zih.tu-dresden.de with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <frieder_stefan.hannenheim@mailbox.tu-dresden.de>)
	id 1tshkM-001ar1-IY
	for ath10k@lists.infradead.org; Thu, 13 Mar 2025 13:33:11 +0100
Received: from [192.168.1.101] (141.30.86.223) by
 msx-t422.msx.ad.zih.tu-dresden.de (172.26.35.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 13:33:04 +0100
Message-ID: <e90cbe8a-ceea-46a3-a461-1f3860d1cab6@mailbox.tu-dresden.de>
Date: Thu, 13 Mar 2025 13:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <ath10k@lists.infradead.org>
Content-Language: en-US
From: Frieder Hannenheim <frieder_stefan.hannenheim@mailbox.tu-dresden.de>
Subject: Debugging Wifi Issues on Google Pixel 3a
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MSX-L422.msx.ad.zih.tu-dresden.de (172.26.34.142) To
 msx-t422.msx.ad.zih.tu-dresden.de (172.26.35.139)
X-TUD-Virus-Scanned: mailout4.zih.tu-dresden.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_123316_082734_D662F556 
X-CRM114-Status: UNSURE (   7.84  )
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

Hi All,

I'm having issues with Wifi on a WCN3990 chip. It seems to work fine for people in the US but here in Europe connecting to Wifi networks is hit-or-miss.
I am in Germany and can only connect to a few Wifi networks, with the others failing with authentication issues.

We guessed this was because of the regulatory information not set and indeed the driver always falls back to the default, which is the US.

[ 24.072334] ath: EEPROM regdomain: 0x0
[ 24.072346] ath: EEPROM indicates default country code should be used

But even after patching the default regdomain to be Germany and providing the bdwlan files used by Android
(found here: https://github.com/TheMuppets/proprietary_vendor_google_sargo/tree/lineage-21/proprietary/vendor/firmware)
the connection issues remain. I am now at my wits end and so I am asking here how to best debug this. This is a log excerpt from when the connection fails:
[ 1976.444722] wlan0: authenticate with 04:d9:f5:12:75:b4 (local 
address=5e:00:a8:96:03:48)
[ 1976.444816] wlan0: send auth to 04:d9:f5:12:75:b4 (try 1/3)
[ 1976.451117] wlan0: authenticated
[ 1976.452960] wlan0: associate with 04:d9:f5:12:75:b4 (try 1/3)
[ 1976.455507] wlan0: RX AssocResp from 04:d9:f5:12:75:b4 (capab=0x511 
status=18 aid=284)
[ 1976.455548] wlan0: 04:d9:f5:12:75:b4 denied association (code=18) Here is the PostmarketOS issue for this problem. Maybe there's some useful information there:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/issues/3134

Please let me know on how to further debug this, your help will be greatly appreciated.

Thanks in advance
Frieder Hannenheim


