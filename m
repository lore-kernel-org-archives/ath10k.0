Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs15.mail.saunalahti.fi ([62.142.117.202])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtbeP-0007ZW-Nj
 for ath10k@lists.infradead.org; Sun, 08 Jun 2014 11:52:38 +0000
Received: from vams (localhost [127.0.0.1])
 by vs15.mail.saunalahti.fi (Postfix) with SMTP id 1E40A40046
 for <ath10k@lists.infradead.org>; Sun,  8 Jun 2014 14:52:08 +0300 (EEST)
Received: from gw01.mail.saunalahti.fi (gw01.mail.saunalahti.fi
 [195.197.172.115])
 by vs15.mail.saunalahti.fi (Postfix) with ESMTP id EFBE040046
 for <ath10k@lists.infradead.org>; Sun,  8 Jun 2014 14:52:07 +0300 (EEST)
Received: from [192.168.1.230] (ip-37-24-112-12.unitymediagroup.de
 [37.24.112.12])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by gw01.mail.saunalahti.fi (Postfix) with ESMTPSA id D2B8F40013
 for <ath10k@lists.infradead.org>; Sun,  8 Jun 2014 14:52:05 +0300 (EEST)
Message-ID: <53944E64.9000002@elisanet.fi>
Date: Sun, 08 Jun 2014 13:52:04 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7
 v2
References: <5392AD19.3060103@stackframe.org>
In-Reply-To: <5392AD19.3060103@stackframe.org>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

> ------------------------------------------------------------------------
> Hi Kalle,
>
> Am 07.06.2014 07:36, schrieb Kalle Valo:
> >/ Kamal Koshy <kamal.koshy at gmail.com <http://lists.infradead.org/mailman/listinfo/ath10k>> writes:
> />/
> />>/ Attaching the result of dd if=/dev/mtd4 > ~/mtd4
> />/ Thanks, I'll take a look at that later. But before that, do you know
> />/ what's the mac address of the QCA9880 device with the proprietary
> />/ driver? (_not_ with ath10k) That would help searching for the
> />/ calibration data.
> />/
> /To me it looks like ath9k calibration data starts at 0x1000, and ath10k 
> calibration data
> starts at 0x5000 in that mtd image. That's the same as on my board.
>
> Sven
>

Yeah, that's definitely the case.

I think we need something like this for ath10k:

https://github.com/kvalo/ath/blob/master/include/linux/ath9k_platform.h

which we can then populate in the mach-file.

Matti

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
