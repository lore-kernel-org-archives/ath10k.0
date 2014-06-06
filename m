Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsqA8-0001ZV-6E
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 09:10:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
 <539182F4.1080804@elisanet.fi>
Date: Fri, 6 Jun 2014 12:09:46 +0300
In-Reply-To: <539182F4.1080804@elisanet.fi> (Matti Laakso's message of "Fri,
 06 Jun 2014 10:59:32 +0200")
Message-ID: <8738fimmjp.fsf@kamboji.qca.qualcomm.com>
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
To: Matti Laakso <malaakso@elisanet.fi>
Cc: ath10k@lists.infradead.org

Moro,

Matti Laakso <malaakso@elisanet.fi> writes:

>> Do you see that with all Archer C7 v2 devices or with just one? One
>> possibility is that the calibration data is actually stored outside of
>> QCA9880 board, for example in the host flash or similar. I don't have
>> that AP, can someone else see where the calibration data is stored?
>>
>> I know that ath9k supports this kind of setup, most likely ath10k should
>> as well.
>
> C7 v1 has the AR9550 calibration data in flash in the last 64 kiB,
> likely C7 v2 as well.

Ok, then the chances are that QCA9880 calibration data is stored in the
flash as well.

> Could someone with v2 and OpenWrt use dd to dump the contents of the
> "art" partition (/dev/mtdblock4 IIRC) and upload it somewhere? I think
> it would be easy to see whether there is just the calibration data for
> AR9550 or if there is also data for QCA9880.

Good idea.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
