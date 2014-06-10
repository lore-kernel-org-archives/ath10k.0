Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuHQ4-00057C-SU
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 08:28:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org>
Date: Tue, 10 Jun 2014 11:28:07 +0300
In-Reply-To: <5396B9F9.2070107@stackframe.org> (Sven Schnelle's message of
 "Tue, 10 Jun 2014 09:55:37 +0200")
Message-ID: <87ha3tcgo8.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Sven Schnelle <svens@stackframe.org>
Cc: ath10k@lists.infradead.org

Sven Schnelle <svens@stackframe.org> writes:

> currently ath10k fetches calibration data from the board.bin file via
> request_firmware(). Usually HW manufactures are using one flash
> partition for the calibration data (see ath9k for example). So we
> would end up reading the file from flash, and writing it into a
> ramdisk so that ath10k can fetch it.
>
> I would prefer to add support to ath10k to fetch that data directly
> from flash. IMHO there are two options to do so:
>
> a) Use platform data, like ath9k does.

I prefer this option.

> b) add a module option to ath10k, and let ath10k fetch the files via
> mtd API. Has the downside of requiring MTD (maybe add a config option
> to disable that?)

This sounds like a hack to me. How to specify the exact location? Are we
sure devices will only use MTD to store the calibration data?

> but i like that more than the ath9k way of reading an arbitrary memory
> region and circumventing the MTD layer.

Sorry, I didn't quite understand this comment. What do you mean exactly
with an arbitrary region? The memory location should be defined by the
platform data from which ath10k just copies data to the target.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
