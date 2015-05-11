Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yrmlz-0002N4-Nb
 for ath10k@lists.infradead.org; Mon, 11 May 2015 12:25:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k/mac80211: add rawtxrx,
 nohwcrypt module param for raw tx injection, sw crypto support.
References: <CAG5N3qG7090vB6XoUaQSHvQw7GpE+gXvJAbKrv7def3nV0OFJw@mail.gmail.com>
 <873837qo6l.fsf@kamboji.qca.qualcomm.com>
 <554CE438.5000208@candelatech.com>
Date: Mon, 11 May 2015 15:24:52 +0300
In-Reply-To: <554CE438.5000208@candelatech.com> (Ben Greear's message of "Fri, 
 8 May 2015 09:28:40 -0700")
Message-ID: <87wq0fi9nv.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Liu CF/TW <cfliu.tw@gmail.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> Maybe we could have a way to specify both rx and rx mode independently of
> each other to support that use case as well?
>
> Maybe:
>
> txmode=x;  // 0 == native, 1 == raw (and maybe support other tx modes in the future as desired)
> rxmode=x;  // 0 == native, 1 == raw
> nohwcrypt=x; // 0 == standard hw crypt, 0x1 == rx-sw-crypt, 0x2 == tx-sw-crypt, 0x3 == tx/rx-sw-crypt

This looks overly complicated and hard to maintain for a very special
use case, not really excited about this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
