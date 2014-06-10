Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs17.mail.saunalahti.fi ([62.142.117.198])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuHYK-00005C-MC
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 08:37:09 +0000
Received: from vams (localhost [127.0.0.1])
 by vs17.mail.saunalahti.fi (Postfix) with SMTP id 1C4B21000C1
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 11:36:44 +0300 (EEST)
Received: from gw02.mail.saunalahti.fi (gw02.mail.saunalahti.fi
 [195.197.172.116])
 by vs17.mail.saunalahti.fi (Postfix) with ESMTP id 058ED1000C1
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 11:36:44 +0300 (EEST)
Received: from [134.61.10.67] (nbtad04.physik.rwth-aachen.de [134.61.10.67])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by gw02.mail.saunalahti.fi (Postfix) with ESMTPSA id DD23A400A5
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 11:36:42 +0300 (EEST)
Message-ID: <5396C39A.9080402@elisanet.fi>
Date: Tue, 10 Jun 2014 10:36:42 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org>
In-Reply-To: <5396B9F9.2070107@stackframe.org>
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

> Hi List,
>
> currently ath10k fetches calibration data from the board.bin file
> via request_firmware(). Usually HW manufactures are using one
> flash partition for the calibration data (see ath9k for example).
> So we would end up reading the file from flash, and writing it into
> a ramdisk so that ath10k can fetch it.
>
> I would prefer to add support to ath10k to fetch that data directly from
> flash. IMHO there are two options to do so:
>
> a) Use platform data, like ath9k does.
>
> b) add a module option to ath10k, and let ath10k fetch the files via mtd 
> API.
>      Has the downside of requiring MTD (maybe add a config option to 
> disable that?),
>      but i like that more than the ath9k way of reading an arbitrary 
> memory region and
>      circumventing the MTD layer.
>
> Any thoughts? I can prepare a patch if needed.
>
> Sven

There's yet another method: Use platform data to provide only a file
name and then use request_firmware to load it from a file under
/lib/firmware. Then it is up to the platform support code to get the
data there. This is used in OpenWrt by rt2x00 drivers.

Matti

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
