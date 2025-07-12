Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE2BC83F10
	for <ath10k@archiver.kernel.org>; Sat, 12 Jul 2025 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+SeksEJ/B3oHTmDXitUpaGe7BOdYyJw+AFYp5mL8xg=; b=P+Yn0uL3NPLE5C/Q85k+wpC3h9
	OeItJkP1n9orCUzQDSsbWOmDXFqUxMqizr5zhfv9gFChAE9GmnjL1HNU5a0Ds3Zh+QDPlgwdx4i9k
	qMLtVjlYyN/0Ne67xFqRDO7BqEDXQBmC5NVR0XPL/xfG7kl1u3dzyqsMG5JLQZmDYOHTo/WxfE3QQ
	13X1HNHvokXmC0C14MCsgR6hlYFzpyRnNdx22QqG9HQfMv3dj+JR7Rn2X9gMIFv0vxT860l0/yooH
	YdYJ9PRFn31jHriBrMwkpyTxJXK4255gfvN19jDUi3syd5oE9g8rQl79muEQo41azNEHmu745T8Yp
	4F2j93fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafjq-0000000Gw6c-1NyI;
	Sat, 12 Jul 2025 19:18:22 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafjn-0000000Gw6A-17g4
	for ath10k@lists.infradead.org;
	Sat, 12 Jul 2025 19:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752347895; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nSSMwY6QoRfCv7c8n/fwv9DdtZ4wlMS8DfNS5NGnSynC0A1xa5a+RfN3M6bg7YH/NcW9DHfMDRULO7iOfy7KtOHU+cC8vkyXX21Un5VE840iGe+T/QFqkuAD/DC1xIHKsdcjTFhaD7y5qCwqEPSJqCF5QASW/r/4HrClZW7Kq7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752347895; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9+SeksEJ/B3oHTmDXitUpaGe7BOdYyJw+AFYp5mL8xg=; 
	b=hTazcVIgPz4ZMjQFNIHUI45aKOzeZsobcNxZddBxFSA8IyWMHtF3Ijun4Lar3ficu8npVzFCL64FQKZdXmJDrLZcSIqlDvynY+Q0/RKJb2tqoBoZT+dxxivCavhauJAThG/L/c9gAlOaS3K6Sl4/CrvRvH1wmqM9K1PkAgBj4l4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752347895;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=9+SeksEJ/B3oHTmDXitUpaGe7BOdYyJw+AFYp5mL8xg=;
	b=UULzpoNCpzcKryXoJdv8lA2NrO96lXYnyMIistFO2TbdHr5ZrXZQy7Fszor2gpyR
	ogygrNCplebqedGOC9HywNPS/fMTuGF5fF+sMcrXqUrgJ432meNhee0nEbYr0NH9U43
	oMcZgzZxwYsyOLgS8I0/rs4AU7BLN4e6j8icWj+E=
Received: by mx.zohomail.com with SMTPS id 1752347892628997.4685098189007;
	Sat, 12 Jul 2025 12:18:12 -0700 (PDT)
From: Askar Safin <safinaskar@zohomail.com>
To: bandhanpramanik06.foss@gmail.com
Cc: ath10k@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
Date: Sat, 12 Jul 2025 22:18:05 +0300
Message-Id: <20250712191805.5238-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr0801122753e21b1af32df72693f2c21c0000b81c9656ebead32314845f469649a9d58a1a6645690a316cce:zu08011227d26e261832766660a9590e3e00003488e544a1fbd2c6ea5fa976174713694cc20ba307517d9038:rf0801122c8eb209f952fe2d65418d80310000afa7de5bb988db7dd39c0f1f677807fc98d39697c23099823dfb1141c821:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_121819_729985_8FB2B9EC 
X-CRM114-Status: UNSURE (   6.31  )
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

I saw problems with Atheros on my Dell Inspiron, too.

These instructions helped me to reset the device without reboot:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1730331/comments/40

I used modified script based on the one above (run as root):

set -e
rmmod ath10k_pci 2> /dev/null || :
rmmod ath10k_core 2> /dev/null || :
rmmod ath 2> /dev/null || :
{ echo 1 > /sys/bus/pci/devices/0000\:03\:00.0/remove; } 2> /dev/null || :
sleep 2
echo 1 > /sys/bus/pci/rescan

Try both scripts, one of them should work.

If still doesn't work, try to run original script, then do hibernate, if still doesn't work, run script again.

I finally was able to solve my problem by replacing Wi-Fi adapter. :) Here is my new Wi-Fi adapter:

[    7.136347] iwlwifi 0000:03:00.0: Detected Intel(R) Dual Band Wireless AC 3160, REV=0x164

--
Askar Safin

