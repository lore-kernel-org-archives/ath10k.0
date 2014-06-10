Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuGr6-0000Hh-QZ
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 07:52:29 +0000
Received: from port-92-198-130-130.static.qsc.de ([92.198.130.130]
 helo=[10.128.129.30])
 by smtp.eurescom.eu with esmtpsa (TLSv1:DHE-RSA-AES128-SHA:128)
 (Exim 4.80.1) (envelope-from <svens@stackframe.org>)
 id 1WuGqh-0005Yg-2D
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 09:52:03 +0200
Message-ID: <5396B9F9.2070107@stackframe.org>
Date: Tue, 10 Jun 2014 09:55:37 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: fetching calibration data from flash
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi List,

currently ath10k fetches calibration data from the board.bin file
via request_firmware(). Usually HW manufactures are using one
flash partition for the calibration data (see ath9k for example).
So we would end up reading the file from flash, and writing it into
a ramdisk so that ath10k can fetch it.

I would prefer to add support to ath10k to fetch that data directly from
flash. IMHO there are two options to do so:

a) Use platform data, like ath9k does.

b) add a module option to ath10k, and let ath10k fetch the files via mtd 
API.
     Has the downside of requiring MTD (maybe add a config option to 
disable that?),
     but i like that more than the ath9k way of reading an arbitrary 
memory region and
     circumventing the MTD layer.

Any thoughts? I can prepare a patch if needed.

Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
